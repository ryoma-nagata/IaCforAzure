targetScope = 'resourceGroup'

param location string ='japaneast' 
param env string 
param prefix string
param tags object

var storageName = '${prefix}dls${env}'

var fileSystemNames = [
  '10-landing'
  '20-raw'
  '30-enrich'
  '40-curate'
]

module datalakestorage 'services/storage.bicep' = {
  name: storageName
  params: {
    location: location
    storageName: storageName
    fileSystemNames: fileSystemNames
    isHnsEnabled: true
    storageSKU: 'Standard_LRS'
    tags: tags
  }
}
