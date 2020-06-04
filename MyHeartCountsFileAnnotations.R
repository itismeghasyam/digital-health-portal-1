########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in MyHeart Counts Public Researcher Portal
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn11269541
#
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
##

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synLogin()

study = 'MyHeart Counts Cardiovascular Health Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  # Day One Survey
  'syn16782072' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # PAR-Q Survey
  'syn16782071' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Daily Check Survey
  'syn16782070' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Activity and Sleep Survey
  'syn16782069' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Risk Factor Survey
  'syn16782068' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Cardio Diet Survey
  'syn16782067' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Satisfied Survey
  'syn16782066' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # APH Heart Age Survey
  'syn16782065' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Six Minute Walk Activity
  'syn16782064' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Demographics Survey
  'syn16782063' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # HealthKit Data
  'syn16782062' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # HealthKit Sleep
  'syn16782061' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # HealthKit Workout
  'syn16782060' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Motion Tracker
  'syn16782059' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Six Minute Walk - Displacement Vectors
  'syn16782058' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634')
)

#################
# Now set annotations
#################
projects.list =  names(tables.annotations)
for(proj.id in projects.list){
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.id, annotations = tables.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}


##################
# Set annotations of individual files
##################
## There are NO INDIVIDUAL FILES in this study