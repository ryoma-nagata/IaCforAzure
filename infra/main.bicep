
// targetScope = 'subscription'
targetScope = 'resourceGroup'

// general 
@description('リソースのデプロイリージョン')
@allowed([
  'southcentralus'
  'southeastasia'
  'japaneast'
])
param location string = 'japaneast'

@minLength(3)
@maxLength(7)
@description('リソース名はproject-deployment_id-リソース種類-envとなります')
param project string 
@allowed([
  'demo'
  'poc'
  'dev'
  'test'
  'prod'
  'stg'
  'sand'
])
@description('リソース名はproject-deployment_id-リソース種類-envとなります')
param env string 
@description('リソース名はproject-deployment_id-リソース種類-envとなります')
@maxLength(2)
param deployment_id string = '01'

var prefix  = toLower('${project}-${deployment_id}')


var tags = {
  Environment : env
  Project : project
  Deployment_id : deployment_id
  DeployMethod : 'bicep'
}

module datalakes 'modules/datalakes.bicep' = {
  name: 'datalakes'
  params: {
    env: env
    tags: union(tags ,{Module : 'datalakes'})
    prefix: prefix
    location: location
  }
}
