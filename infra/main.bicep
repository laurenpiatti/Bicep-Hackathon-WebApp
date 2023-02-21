param location string = resourceGroup().location 
param apiLocation string = 'eastus'

param appServicePlanName string = 'myAppServicePlan'
param appServicePlanAPIName string = 'apiAppServicePlan'
param frontEndAppServiceName string = 'piattiBicepHackathon'
param apiAppServiceName string = 'piattiBicepHackathonAPI'

resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: appServicePlanName
  location: location
  kind: 'Linux'
  sku: {
    name: 'F1'
  }
  properties: {
    reserved: true
  }
}

resource appServicePlanAPI 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanAPIName
  location: apiLocation
  kind: 'linux'
  sku: {
    name: 'F1'
  }
  properties: {
    reserved: true
  }
}

resource frontEndAppService 'Microsoft.Web/sites@2022-03-01' = {
  name: frontEndAppServiceName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
  }
}

resource apiAppService 'Microsoft.Web/sites@2022-03-01' = {
  name: apiAppServiceName
  location: apiLocation
  properties: {
    serverFarmId: appServicePlanAPI.id
  }
}
