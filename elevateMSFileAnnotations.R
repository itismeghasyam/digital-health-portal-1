########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in ElevateMS Public Researcher Portal
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn21140362
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

##############
# List of tables and related annotations
##############
tables.annotations = list(
  # Voice-based Digital Symbol Substitution Test
  'syn22007628' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('microphone'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('flat surface', 'hand'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       digitalAssessmentCategory= c('phonation', 'cognition'),
                       digitalAssessmentDetails = c('visual/digit symbol substitution task(vsst/dsst)'),
                       dataType=c('clinical'), #or sensor??
                       dataSubtype=c('processed', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602268',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Triggers Survey
  'syn21962836' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602269',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Symptoms Survey
  'syn21962623' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602277',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Truncated MSIS-29
  'syn21962591' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602278',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Tapping
  'syn21931781' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('touchscreen'),
                       devicePlatform = c('iOS','android'), 
                       deviceLocation = c('flat surface'),
                       diagnosis= c('Multiple Sclerosis', 'Control'),
                       reportedOutcome = c('dyskinesia', 'bradykinesia'),
                       digitalAssessmentCategory= c('tap'),
                       digitalAssessmentDetails = c('tap the screen'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw','metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602279',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Walking
  'syn21930947' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('hand', 'pocket'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c('dyskinesia', 'bradykinesia', 'freezing of gait'),
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('walking (flat)', 'standing'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602280',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Passive Pedometer Data
  'syn21930705' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('passive'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('pocket'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c('step count', 'distance'),
                       digitalAssessmentCategory= c('gait'),
                       digitalAssessmentDetails = c('walking (flat)', 'standing'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602281',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Tremor 
  'syn21930567' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active'),
                       deviceType = c('handheld'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('hand', 'pocket'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c('dyskinesia', 'bradykinesia', 'freezing of gait'),
                       digitalAssessmentCategory= c( 'postural tremor', 'action tremor'),
                       digitalAssessmentDetails = c('finger-to-nose', 'alternating hand movements'),
                       dataType=c('sensor'),
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602282',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Baseline Characteristics
  'syn21930532' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = '',
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       dataType=c(''),
                       dataSubtype=c(''),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602283',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # NeuroQoL-Lower Extremity
  'syn21930530' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602285',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # NeuroQoL-Upper Extremity
  'syn21930529' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602286',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),

  # NeuroQoL-Cognition
  'syn21930522' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602287',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Weather
  'syn21930519' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602288',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # WPAI
  'syn21930484' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602289',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Medication Survey
  'syn21930482' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602290',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Relapses Survey
  'syn21930477' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602292',
                       dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  # Daily Check-In
  'syn21930474' = list(consortium = 'mHealth',
                       study = 'ElevateMS Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis= c('Multiple Sclerosis', 'Control'), 
                       reportedOutcome = c(''),
                       dataType=c('surveyData'), 
                       dataSubtype=c('raw', 'metadata'),
                       metadataType='',
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn21140362/wiki/602298',
                       dataAccessInstructions = 'syn21140362/wiki/602266')

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
## Place Holder, since there aren't any individual files at the moment
