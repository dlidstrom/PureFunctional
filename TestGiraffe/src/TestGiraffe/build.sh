dotnet restore src
dotnet lambda package \
    --configuration release \
    --framework netcoreapp2.1 \
    --output-package bin/release/netcoreapp2.1/deploy-package.zip