module Domain where

import Data.Either
import Prelude
import Data.Maybe as Maybe

type Undefined = Maybe.Nothing

type WidgetCode = WidgetCode of string
type GizmoCode = GizmoCode of string
type ProductCode =
    | Widget of WidgetCode
    | Gizmo of GizmoCode

type UnitQuantity = UnitQuantity of int
type KilogramQuantity = KilogramQuantity of decimal
type OrderQuantity =
    | Unit of UnitQuantity
    | Kilogram of KilogramQuantity

type CustomerInfo = Undefined
type ShippingAddress = Undefined
type BillingAddress = Undefined
type OrderLine = Undefined
type BillingAmount = Undefined

type Order = {
    CustomerInfo: CustomerInfo
    ShippingAddress: ShippingAddress
    BillingAddress: BillingAddress
    OrderLines: OrderLine list
    AmountToBill: BillingAmount
}

type UnvalidatedOrder = Unknown
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

type PlaceOrder = UnvalidatedOrder -> PlaceOrderEvents

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
