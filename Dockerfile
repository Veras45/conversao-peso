FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /app

#Copy csproj And Restore as distinct layers 
COPY *.csproj ./ 
RUN dotnet restore

# copy everything else and build app
COPY . ./ 
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "ConversaoPeso.Web.dll"]
