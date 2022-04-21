
targetScope = 'subscription'

// general params
param location string ='japaneast' 

param project string = ''
@allowed([
  'demo'
  'poc'
  'dev'
  'test'
  'prod'
])
param env string ='demo'
param deployment_id string ='001'
param userId string 

var prefix = '${project}-${deployment_id}'

var tags = {
  Environment : env
  Project : project
}

var rg_name = '${prefix}---${env}'
