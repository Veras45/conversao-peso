#FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
#WORKDIR /app
#COPY . . 
#CMD ["ConversaoPeso.sln"]

#FROM mcr.microsoft.com/dotnet/aspnet:3.1
#WORKDIR /app
#ENTRYPOINT ["dotnet", "aspnetapp.dll"]

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