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
                       numberParticipants= 20510, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('inclusion survey'),
                       dataType=c('clinical','surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType = c('individual'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # PAR-Q Survey
  'syn16782071' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 22136, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('PAR-Q'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Daily Check Survey
  'syn16782070' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 16593, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('activity report'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType = c('individual'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Activity and Sleep Survey
  'syn16782069' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 21382, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('sleep report', 'activity report'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Risk Factor Survey
  'syn16782068' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 14485, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('medical history', 'demographics survey'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Cardio Diet Survey
  'syn16782067' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 13820, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('diet survey'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Satisfied Survey
  'syn16782066' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 14168, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('quality of life', 'disease risk'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # APH Heart Age Survey
  'syn16782065' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 4569, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c("blood pressure", "fasting glucose",
                                           "cholesterol", "diabetes", "hypertension",
                                           "heart age"),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata', 'processed'),
                       metadataType = c('individual'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Six Minute Walk Activity
  'syn16782064' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 3639, 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'pedometer'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('pocket'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('6-min walk test'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Demographics Survey
  'syn16782063' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 40017, 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = c('demographics survey'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType = c('individual'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # HealthKit Data
  'syn16782062' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 4920, 
                       dataCollectionMethod= c('passive', 'active'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope',
                                      'magnetometer', 'pedometer', 'gps'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'pocket', 'wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       digitalAssessmentDetails = c(''),
                       dataType=c('sensor', 'surveyData'),
                       dataSubtype=c('raw','processed', 'metadata'),
                       metadataType= c('individual', 'assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # HealthKit Sleep
  'syn16782061' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 626, 
                       dataCollectionMethod= c('passive', 'active'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'wrist'),
                       diagnosis= c('control'),  
                       digitalAssessmentCategory= c('sleep'),
                       digitalAssessmentDetails = c(''),
                       dataType=c('sensor', 'surveyData'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # HealthKit Workout
  'syn16782060' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 881, 
                       dataCollectionMethod= c('passive', 'active'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope',
                                      'magnetometer', 'pedometer', 'gps'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'pocket', 'wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       digitalAssessmentDetails = c(''),
                       dataType=c('sensor', 'surveyData'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Motion Tracker
  'syn16782059' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 21382,  # CHECK since it overlaps with 7-day activity and sleep which has 21382 users
                       dataCollectionMethod= c('passive'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'pocket'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       digitalAssessmentDetails = c(''),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn11269541/wiki/485635',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  # Six Minute Walk - Displacement Vectors
  'syn16782058' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= 3639, 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('gps', 'pedometer'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('pocket'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('6-min walk test'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
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