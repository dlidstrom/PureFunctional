using Amazon.Lambda.Core;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;

[assembly:LambdaSerializer(typeof(Amazon.Lambda.Serialization.Json.JsonSerializer))]

namespace AwsDotnetCsharp
{
    public class Handler
    {
       public Response Hello(Request request)
       {
           return new Response{
               Body = "Go Serverless v1.0! Your function executed successfully!",
               Headers = new Dictionary<string, string> {},
               StatusCode = 200
               };
       }
    }
    public class Response
    {
        [JsonProperty("statusCode")]
        public int StatusCode { get; set; }
        [JsonProperty("headers")]
        public Dictionary<string, string> Headers { get; set; }
        [JsonProperty("body")]
        public string Body { get; set; }
    }

    //     public class Response
    // {
    //   public string Message {get; set;}
    //   public Request Request {get; set;}

    //   public Response(string message, Request request){
    //     Message = message;
    //     Request = request;
    //   }
    // }

    public class Request
    {
      public string Key1 {get; set;}
      public string Key2 {get; set;}
      public string Key3 {get; set;}

      public Request(string key1, string key2, string key3){
        Key1 = key1;
        Key2 = key2;
        Key3 = key3;
      }
    }
}
