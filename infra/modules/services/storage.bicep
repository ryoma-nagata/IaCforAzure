param storageName string
param fileSystemNames array
param location string 
param storageSKU string
param tags object
param isHnsEnabled bool

var storageNameCleaned = replace(storageName,'-','')

resource storage 'Microsoft.Storage/storageAccounts@2021-02-01' = {
  name: storageNameCleaned
  location: location
  tags: tags
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties:{
    isHnsEnabled: isHnsEnabled
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


// Outputs
output storageId string = storage.id
output storageFileSystemIds array = [for fileSystemName in fileSystemNames: {
  storageFileSystemId: resourceId('Microsoft.Storage/storageAccounts/blobServices/containers', storageNameCleaned, 'default', fileSystemName)
}]

