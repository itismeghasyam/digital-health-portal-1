########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Heart Snapshot Project (Cardio Respiratory Fitness)
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn10837149
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

study = 'Heart Snapshot Study'
projectlink = paste("[", study, "](/Explore/Studies/DetailsPage?study=",
                    URLencode(study,  reserved = FALSE, repeated = FALSE), 
                    ")", sep = "")

##############
# List of tables and related annotations
##############
tables.annotations = list(
  
  ## spectrocolorimetry
  'syn22123894' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(124), 
                       dataCollectionMethod= c('active'), # clinician reported outcome? RA is recording
                       deviceType = c('handheld'),
                       sensorType = c('spectrocolorimeter'), 
                       devicePlatform = c('pantone'), 
                       deviceLocation = c('face', 'finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('skintone'),
                       digitalAssessmentDetails = c('facial skin color',
                                                    'finger skin color'),
                       dataType= c('sensor', 'surveyData'),
                       dataSubtype= c('raw'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## CRF_HR_validation
  'syn22123905' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(124), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('pulse oximeter'),
                       sensorType = c('photodetector'),
                       devicePlatform = c('windows'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heart rate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType= c('individual'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Heart Rate Measurement
  'syn22124385' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(124), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heart rate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.activities
  'syn22119579' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(10), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor', 'accelerometer', 'gyroscope'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       dataType= c('sensor', 'surveyData'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart
  'syn22119590' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(108), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heart rate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## HeartRate.activities.heart-intraday
  'syn22123686' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(108), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('heart rate'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## DailyActivitiesSummary.summary
  'syn22119575' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(108), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       digitalAssessmentDetails = c('daily physical activity'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio 12MT
  'syn22119312' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(98), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardio respitatory fitness'),
                       digitalAssessmentDetails = c('12-Min Run test'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType = c('assessment'), 
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio Stress Test
  'syn22119505' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(73), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardio respiratory fitness'),
                       digitalAssessmentDetails = c('treadmill stresstest'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType= c('assessment'), 
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Background Survey
  'syn22125202' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(115), 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('control'), 
                       reportedOutcome = '',
                       dataType=c('surveyData'),
                       dataSubtype=c('metadata'),
                       metadataType= c('individual'),
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = ''),
  
  ## Cardio Stair Step
  'syn22119475' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(98), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardio respiratory fitness'),
                       digitalAssessmentDetails = c('tecumseh test'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType= c('assessment'), 
                       dhPortalIndex = 'FALSE',
                       dataDescriptionLocation = '',
                       dataAccessInstructions = '')
  
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
# Should we include the following?
# - Analysis?
# - Features?