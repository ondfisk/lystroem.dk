param location string = resourceGroup().location
param webAppName string
param customDomainName string

resource webApp 'Microsoft.Web/staticSites@2021-02-01' = {
  name: webAppName
  location: location
  sku: {
    name: 'Free'
  }
  properties: {}

  resource customDomain 'customDomains' = {
    name: customDomainName
    properties: {}
  }
}

output deploymentToken string = webApp.listSecrets().properties.apiKey
