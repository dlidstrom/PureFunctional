namespace AwsDotnetFsharp
open Amazon.Lambda.Core
open Newtonsoft.Json
open System.Collections.Generic

[<assembly:LambdaSerializer(typeof<Amazon.Lambda.Serialization.Json.JsonSerializer>)>]
do ()

type Request = { Key1 : string; Key2 : string; Key3 : string }
type Response = {
    [<JsonProperty("body")>]
    Body: string
    [<JsonProperty("statusCode")>]
    StatusCode: int
    [<JsonProperty("headers")>]
    Headers: Dictionary<string, string>
}

module Handler =

    let hello(request:Request) =
        {
            Body = "Go Serverless v1.0! Your function executed successfully!"
            StatusCode = 200
            Headers = new Dictionary<string, string>()
        }
