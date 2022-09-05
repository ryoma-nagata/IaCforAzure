param storageName string
param fileSystemNames array
param storageIPWhiteLists array 
param location string 
param isHnsEnabled bool 
param storageSKU string
param virtualNetworkRules array
param tags object
param defaultAccessTier string = 'Hot'

param resourceAccessRules array
var storageNameCleaned = replace(storageName,'-','')



resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageNameCleaned
  location: location
  tags : tags
  identity: {
    type: 'SystemAssigned'
  }
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties: {
    accessTier: defaultAccessTier
    allowBlobPublicAccess: false
    allowSharedKeyAccess: true
    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: true
          keyType: 'Account'
        }
        file: {
          enabled: true
          keyType: 'Account'
        }
        queue: {
          enabled: true
          keyType: 'Service'
        }
        table: {
          enabled: true
          keyType: 'Service'
        }
      }
    }
    isHnsEnabled: isHnsEnabled
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Deny'
      ipRules: storageIPWhiteLists
      virtualNetworkRules: virtualNetworkRules
      resourceAccessRules: resourceAccessRules
    }
    supportsHttpsTrafficOnly: true
  }
}

resource storageBlobServices 'Microsoft.Storage/storageAccounts/blobServices@2021-02-01' = {
  parent: storage
  name: 'default'
  properties: {
  }
}

resource storageFileSystems 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-02-01' = [for fileSystemName in fileSystemNames: {
  parent: storageBlobServices
  name: fileSystemName
  properties: {
    publicAccess: 'None'
    metadata: {}
  }
}]



resource storageManagementPolicies 'Microsoft.Storage/storageAccounts/managementPolicies@2021-02-01' = {
  parent: storage
  name: 'default'
  properties: {
    policy: {
      rules: [
        {
          enabled: true
          name: 'toCool'
          type: 'Lifecycle'
          definition: {
            actions: {
              baseBlob: {
                tierToCool:{
                  // daysAfterLastAccessTimeGreaterThan: 90  // Not available for HNS storage yet
                  daysAfterModificationGreaterThan: 90
                }
              }
            }
            filters: {
              blobTypes: [
                'blockBlob'
              ]
              prefixMatch: []
            }
          }
        }
      ]
    }
  }
}


// Outputs
output storageId string = storage.id
output storageFileSystemIds array = [for fileSystemName in fileSystemNames: {
  storageFileSystemId: resourceId('Microsoft.Storage/storageAccounts/blobServices/containers', storageNameCleaned, 'default', fileSystemName)
}]

output accessRule string = '${resourceGroup().id}/providers/Microsoft.MachineLearningServices/workspaces/*'