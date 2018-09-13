dotnet restore
rm -r -f bin/release
dotnet lambda package \
    --configuration release \
    --framework netcoreapp2.1 \
    --output-package bin/release/netcoreapp2.1/deploy-package.zip
