# Steps

    dotnet new sln -o FSNetCore
    dotnet new lib -lang F# -o src/Library
    dotnet add src/Library/Library.fsproj package Newtonsoft.Json
    dotnet sln add src/Library/Library.fsproj
    dotnet new console -lang F# -o src/App
    dotnet add src/App/App.fsproj reference src/Library/Library.fsproj
    dotnet sln add src/App/App.fsproj
    dotnet build
    cd src/App
    dotnet run Hello World
