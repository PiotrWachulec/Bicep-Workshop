param appName string

param location string = resourceGroup().location

@allowed([
  'PROD'
  'DEV'
])
param env string

module myDataModule './data/data.bicep' = {
  name: '${deployment().name}-data'
  params: {
    appName: appName
    env: env
    location: location
  }
}

module appHostingModule 'app/appHosting.bicep' = {
  name: '${deployment().name}-appHosting'
  params: {
    appName: appName
    location: location
  }
}
