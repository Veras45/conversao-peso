FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
WORKDIR /app
COPY . . 
CMD ["ConversaoPeso.sln"]

FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /app
ENTRYPOINT ["dotnet", "aspnetapp.dll"]