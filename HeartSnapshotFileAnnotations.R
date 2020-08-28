########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Heart Snapshot Project (Cardiorespiratory Fitness)
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
  
  ## spectrocolorimetry - calibration
  'syn22268040' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(124), 
                       dataCollectionMethod= c('active'), # clinician reported outcome? RA is recording
                       deviceType = c('handheld'),
                       sensorType = c('spectrocolorimeter'), 
                       devicePlatform = c('Pantone'), 
                       deviceLocation = c('face', 'finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('skin color'),
                       digitalAssessmentDetails = c('facial skin color',
                                                    'finger skin color'),
                       dataType= c('sensor', 'surveyData'),
                       dataSubtype= c('raw'),
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Baseline and PulseOx - calibration
  'syn22268058' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(124), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('wearable'),
                       sensorType = c('oximeter',  'photosensor'),
                       devicePlatform = c('Windows'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardiovascular'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType= c('individual'),
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Heart Rate Measurement - calibration
  'syn22268054' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(124), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardiovascular'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Fitbit activities
  'syn22254978' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(10), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor', 'accelerometer', 'gyroscope'),
                       devicePlatform = c('Fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       dataType= c('sensor', 'surveyData'),
                       dataSubtype=c('processed', 'metadata'),
                       metadataType= c('assessment'),
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Fitbit Heart rate summary
  'syn22254919' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(108), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('Fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardiovascular'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Fitbit Heart rate intraday
  'syn22254943' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(108), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('Fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardiovascular'),
                       digitalAssessmentDetails = c('heart rate'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Fitbit activities summary
  'syn22254977' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(108), 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('wearable'),
                       sensorType = c('photosensor'),
                       devicePlatform = c('Fitbit'), 
                       deviceLocation = c('wrist'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('physical activity'),
                       digitalAssessmentDetails = c('daily physical activity'),
                       dataType=c('sensor'),
                       dataSubtype=c('processed'),
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## 12-MRT
  'syn22254983' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(98), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardiorespiratory fitness'),
                       digitalAssessmentDetails = c('12-min run test'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType = c('assessment'), 
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Cardio Stress Test
  'syn22119505' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(73), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardiorespiratory fitness'),
                       digitalAssessmentDetails = c('treadmill stresstest'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType= c('assessment'), 
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## Baseline Characteristics - Validation
  'syn22254979' = list(consortium = 'mHealth',
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
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642'),
  
  ## 3-MST
  'syn22254980' = list(consortium = 'mHealth',
                       study = study,
                       studyOrProject = projectlink,
                       numberParticipants= as.integer(98), 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('camera'),
                       devicePlatform = c('iOS', 'Android'), 
                       deviceLocation = c('finger'),
                       diagnosis= c('control'), 
                       digitalAssessmentCategory= c('cardiorespiratory fitness'),
                       digitalAssessmentDetails = c('tecumseh test'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'processed', 'metadata'),
                       metadataType= c('assessment'), 
                       dhPortalIndex = 'FALSE',
                       # dataDescriptionLocation = '',
                       dataAccessInstructions = 'syn22107959/wiki/603642')
  
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