namespace OrderTaking.Domain
    open System
    type Undefined = exn // built-in abbreviation for Exception type

    type WidgetCode = WidgetCode of string
    type GizmoCode = GizmoCode of string
    type ProductCode =
        | Widget of WidgetCode
        | Gizmo of GizmoCode

    type UnitQuantity = private UnitQuantity of int
    module UnitQuantity =
        let create qty =
            if qty < 1 then
                Error "UnitQuantity can not be negative"
            else if qty > 1000 then
                Error "UnitQuantity can not be more than 1000"
            else
                Ok (UnitQuantity qty)

        let value (UnitQuantity qty) = qty

    type KilogramQuantity = KilogramQuantity of decimal
    type OrderQuantity =
        | Unit of UnitQuantity
        | Kilogram of KilogramQuantity

    type OrderId = Undefined
    type OrderLineId = Undefined
    type CustomerId = Undefined

    type EmailAddress = EmailAddress of string
    type VerifiedEmailAddress = EmailAddress of string
    type CustomerEmail =
        | Unverified of EmailAddress
        | Verified of VerifiedEmailAddress
    // type CustomerEmail = {
    //     EmailAddress: EmailAddress
    //     IsVerified: bool
    // }

    type CustomerInfo = Undefined
    type ShippingAddress = Undefined
    type BillingAddress = Undefined
    type Price = Undefined
    type BillingAmount = Undefined

    type OrderLine = {
        Id: OrderLineId
        OrderId: OrderId
        ProductCode: ProductCode
        OrderQuantity: OrderQuantity
        Price: Price
    }

    type NonEmptyList<'a> = {
        First: 'a
        Rest: 'a list
    }

    type Order = {
        Id: OrderId
        CustomerId: CustomerId
        ShippingAddress: ShippingAddress
        BillingAddress: BillingAddress
        OrderLines: NonEmptyList<OrderLine>
        AmountToBill: BillingAmount
    }

    type UnvalidatedCustomerInfo = {
        Info: Undefined
    }

    type UnvalidatedShippingAddress = {
        Info: Undefined
    }

    type UnvalidatedOrder = {
        OrderId: string
        CustomerInfo: UnvalidatedCustomerInfo
        ShippingAddress: UnvalidatedShippingAddress
    }

    type ValidatedOrder = Unknown
    type ValidationError = {
        FieldName: string
        ErrorDescription: string
    }
    type ValidationResponse<'a> = Async<Result<'a, ValidationError list>>
    type ValidateOrder = UnvalidatedOrder -> ValidationResponse<ValidatedOrder>

    type AcknowledgmentSent = Unknown
    type OrderPlaced = Unknown
    type BillableOrderPlaced = Unknown
    type PlaceOrderEvents = {
        AcknowledgmentSent: AcknowledgmentSent
        OrderPlaced: OrderPlaced
        BillableOrderPlaced: BillableOrderPlaced
    }
    type PlaceOrderError =
        | ValidationError of ValidationError list

    type Command<'data> = {
        Data: 'data
        Timestamp: DateTime
        UserId: string
    }

    type PlaceOrder = Command<UnvalidatedOrder>
    type ChangeOrder = Command<UnvalidatedOrder>
    type CancelOrder = Command<UnvalidatedOrder>

    type OrderTakingCommand =
        | Place of PlaceOrder
        | Change of ChangeOrder
        | Cancel of CancelOrder

    //type PlaceOrder = UnvalidatedOrder -> Result<PlaceOrderEvents, PlaceOrderError>

    type EnvelopeContents = EnvelopeContents of string

    type QuoteForm = Unknown
    type OrderForm = Unknown
    type CategorizedMail =
        | Quote of QuoteForm
        | Order of OrderForm

    type CategorizeInboundMail = EnvelopeContents -> CategorizedMail

    type ProductCatalog = Unknown
    type PricedOrder = Unknown
    type CalculatePrizes = OrderForm -> ProductCatalog -> PricedOrder
