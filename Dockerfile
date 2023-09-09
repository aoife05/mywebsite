# FROM mcr.microsoft.com/dotnet/sdk:7.0 as build-env
# WORKDIR /mywebsite
# COPY mywebsite.csproj .
# RUN dotnet restore
# COPY . .
# RUN dotnet publish -c Release -o /publish

# FROM mcr.microsoft.com/dotnet/aspnet:7.0 as runtime
# WORKDIR /publish
# COPY --from=build-env /publish .
# EXPOSE 80
# ENTRYPOINT ["dotnet", "mywebsite.dll"]


FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY mywebsite.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "mywebsite.dll"]
