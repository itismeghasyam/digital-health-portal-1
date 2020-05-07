########################################################################
# Digital Health Portal
# Purpose: To Annotate the Digital Health Projects
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to all the following
# mhealth projects
## Not considering gravity as a sensor, as it is a derived measures
## All projects have a template annotation list assigned. Any annotation classes 
# from that list can be edited/removed. Any new annotation class will be added
# to the overall template of all relevant projects (project vs study eg., PDDB)

### To-Dos(continous update):
## Keep the Excel sheet of all metadata possibilities for each metadata type
# For eg., sensor - accelerometer, PPG, gyroscope, camera, touchscreen etc.,

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
library(githubr)
synLogin()

##############
# List of projects and related annotations
##############
# Project Synapse ID vs annotations needed
projects.annotations <- list(
  
  ## mPower 1.0 (check anno - Larsson)
  'syn4993293' = list(consortium = 'mHealth',
                      study = 'mPower mobile Parkinson Disease study',
                      numberParticipants= '', 
                      dataCollectionMethod= c(''),
                      deviceType = c(''),
                      sensorType = c(''),
                      devicePlatform = c(''), 
                      deviceLocation = c(''),
                      diagnosis=  c(''), 
                      reportedOutcome =c(''),
                      digitalAssessmentCategory= c(''),
                      digitalAssessmentDetails = c(''),
                      sensorDataType = '',
                      investigator= c(''),
                      resourceType = '',
                      intervention = '',
                      keywords = c(''),
                      dhPortalIndex = 'FALSE', # Change after filling annotations
                      studyDescriptionLocation = 'syn4993293', 
                      studyDataDescriptionLocation = 'syn4993293/wiki/247861',
                      studyDescription = '',
                      dataAccessInstructions = 'syn4993293/wiki/247860'),
  
  ## MoleMapper Public Researcher Portal (check anno - Dan)
  'syn5576734' = list(consortium = 'mHealth',
                      study = 'Mole Mapper Study',
                      numberParticipants= '', 
                      dataCollectionMethod= c(''),
                      deviceType = c(''),
                      sensorType = c(''),
                      devicePlatform = c(''), 
                      deviceLocation = c(''),
                      diagnosis=  c(''), 
                      reportedOutcome =c(''),
                      digitalAssessmentCategory= c(''),
                      digitalAssessmentDetails = c(''),
                      sensorDataType = '',
                      investigator= c(''),
                      resourceType = '',
                      intervention = '',
                      keywords = c(''),
                      dhPortalIndex = 'FALSE', # Change after filling annotations
                      studyDescriptionLocation = 'syn5576734', 
                      studyDataDescriptionLocation = 'syn5576734/wiki/406009',
                      studyDescription = '',
                      dataAccessInstructions = 'syn5576734/wiki/391119'),
  
  ## Asthma Health Public Researcher Portal (check anno - Larsson)
  'syn8361748' = list(consortium = 'mHealth',
                      study = 'Asthma Mobile Health Study',
                      numberParticipants= '', 
                      dataCollectionMethod= c(''),
                      deviceType = c(''),
                      sensorType = c(''),
                      devicePlatform = c(''), 
                      deviceLocation = c(''),
                      diagnosis=  c(''), 
                      reportedOutcome =c(''),
                      digitalAssessmentCategory= c(''),
                      digitalAssessmentDetails = c(''),
                      sensorDataType = '',
                      investigator= c(''),
                      resourceType = '',
                      intervention = '',
                      keywords = c(''),
                      dhPortalIndex = 'FALSE', # Change after filling annotations
                      studyDescriptionLocation = 'syn8361748', 
                      studyDataDescriptionLocation = 'syn8361748/wiki/415365',
                      studyDescription = '',
                      dataAccessInstructions = 'syn8361748/wiki/415364'),
  
  ## elevateMS (check anno - Abhi)
  'syn21140362' = list(consortium = 'mHealth',
                      study = 'elevateMS Study',
                      numberParticipants= '', 
                      dataCollectionMethod= c(''),
                      deviceType = c(''),
                      sensorType = c(''),
                      devicePlatform = c(''), 
                      deviceLocation = c(''),
                      diagnosis=  c(''), 
                      reportedOutcome =c(''),
                      digitalAssessmentCategory= c(''),
                      digitalAssessmentDetails = c(''),
                      sensorDataType = '',
                      investigator= c(''),
                      resourceType = '',
                      intervention = '',
                      keywords = c(''),
                      dhPortalIndex = 'FALSE', # Change after filling annotations
                      studyDescriptionLocation = 'syn21140362', 
                      studyDataDescriptionLocation = 'syn21140362/wiki/602267',
                      studyDescription = '',
                      dataAccessInstructions = 'syn21140362/wiki/602266'),
  
  ## Parkinsons Disease Digital Biomarker DREAM Challenge (check anno - Solly)
  ## This will be a Project, rather than a study on the portal
  'syn8717496' = list(consortium = 'mHealth',
                      study = 'Parkinsons Disease Digital Biomarker DREAM Challenge',
                      numberParticipants= '', 
                      dataCollectionMethod= c(''),
                      deviceType = c(''),
                      sensorType = c(''),
                      devicePlatform = c(''), 
                      deviceLocation = c(''),
                      diagnosis=  c(''), 
                      reportedOutcome =c(''),
                      digitalAssessmentCategory= c(''),
                      digitalAssessmentDetails = c(''),
                      sensorDataType = '',
                      investigator= c(''),
                      resourceType = '',
                      intervention = '',
                      keywords = c(''),
                      dhPortalIndex = 'FALSE', # Change after filling annotations
                      studyDescriptionLocation = 'syn8717496', 
                      studyDataDescriptionLocation = '',
                      studyDescription = '',
                      dataAccessInstructions = ''),
  
  ## CRF Module (check anno - Dan/Megha)
  'syn10837149' = list(consortium = 'mHealth',
                       study = 'Heart Snapshot',
                       numberParticipants= '', 
                       dataCollectionMethod= c('active', 'passive', 'patient reported outcome',
                                               'clinical assessment'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType =  c('accelerometer', 'gyroscope', 'magnetometer',
                                       'fitbit', 'oximeter', 'polar'),
                       devicePlatform = c('iOS', 'android'), 
                       deviceLocation = c('hand', 'pocket', 'chest'),
                       diagnosis=  c('control'), 
                       reportedOutcome =c('vo2max'),
                       digitalAssessmentCategory= c('heartrate'),
                       digitalAssessmentDetails = c('12-min run, 3-min step test'),
                       sensorDataType = 'raw',
                       investigator= c('Scripps', 'Sage Bionetworks'),
                       resourceType = 'curatedData',
                       intervention = '',
                       keywords = c(''),
                       dhPortalIndex = 'FALSE', # Change after filling annotations
                       studyDescriptionLocation = '', 
                       studyDataDescriptionLocation = '',
                       studyDescription = '',
                       dataAccessInstructions = ''),
  
  ## MyHeart Counts Public Researcher Portal (check anno - Larsson)
  'syn11269541' = list(consortium = 'mHealth',
                       study = 'MyHeart Counts Cardiovascular Health Study',
                       numberParticipants= '', 
                       dataCollectionMethod= c(''),
                       deviceType = c(''),
                       sensorType = c(''),
                       devicePlatform = c(''), 
                       deviceLocation = c(''),
                       diagnosis=  c(''), 
                       reportedOutcome =c(''),
                       digitalAssessmentCategory= c(''),
                       digitalAssessmentDetails = c(''),
                       sensorDataType = '',
                       investigator= c(''),
                       resourceType = '',
                       intervention = '',
                       keywords = c(''),
                       dhPortalIndex = 'FALSE', # Change after filling annotations
                       studyDescriptionLocation = 'syn11269541', 
                       studyDataDescriptionLocation = 'syn11269541/wiki/485635',
                       studyDescription = '',
                       dataAccessInstructions = 'syn11269541/wiki/485634'),
  
  ## PKU Study Project (check anno - Dan/Megha)
  'syn20486872' = list(consortium = 'mHealth',
                       study = 'BioMarin PKU Study',
                       numberParticipants= 18, # recruitment ongoing 
                       dataCollectionMethod= c('active', 'passive', 'patient reported outcome',
                                               'clinical assessment'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = c('accelerometer', 'gyroscope', 'magnetometer',
                                      'fitbit'),
                       devicePlatform = c('iOS'), 
                       deviceLocation = c('hand', 'wrist', 'pocket'),
                       diagnosis=  c('phenylketonuria', 'control'), 
                       reportedOutcome =c('tremor'),
                       digitalAssessmentCategory= c('Resting tremor', 'kinetic tremor',
                                                    'cognition',  'sleep', 'heartrate'),
                       digitalAssessmentDetails = c('tap', 'hand-in-lap', 'finger-to-nose',
                                                    'alternating hand movements', 'drawing',
                                                    'typing', 'opening a water bottle and pouring', 
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       sensorDataType = 'raw',
                       investigator= c('BioMarin', 'Sage Bionetworks'),
                       resourceType = 'curatedData',
                       intervention = '',
                       keywords = c('Phenylketonuria', 'PKU', 'rare disease'),
                       dhPortalIndex = 'FALSE', # Change after filling annotations
                       studyDescriptionLocation = '', # syn ID of the public facing project
                       studyDataDescriptionLocation = '',
                       studyDescription = '',
                       dataAccessInstructions = ''),

  ## MJFF Levodopa Response Study (check anno - solly)
  'syn20681023' = list(consortium = 'mHealth',
                       study = 'MJFF Levodopa Response Study',
                       numberParticipants= 29, 
                       dataCollectionMethod= c('active', 'passive', 'patient reported outcome',
                                               'clinical assessment'),
                       deviceType = c('handheld', 'wearable'),
                       sensorType = 'accelerometer',
                       devicePlatform = c('Shimmer', 'GENEActiv', 'Android', 'Pebble OS'), 
                       deviceLocation = c('wrist', 'waist', 'forearm', 'shank', 'back'),
                       diagnosis= "Parkinson's Disease", 
                       reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia', 'bradykinesia',
                                          'freezing of gait', 'medication report', 'sleep report'),
                       digitalAssessmentCategory= c('resting tremor', 'action tremor', 'gait'),
                       digitalAssessmentDetails = c('walking (flat)', 'walking (stairs)',
                                                    'standing', 'sitting', 
                                                    'alternating hand movements', 'drawing',
                                                    'typing', 'opening a water bottle and pouring', 
                                                    'arranging paper','assembling nuts and bolts',
                                                    'folding towels'),
                       # standing, walking in a straight line for 30s, walking in a straight line for 30s while counting backwards, 
                       # walking upstairs, walking down stairs, walking through a narrow corridor, finger-to-nose for 15s (twice with each arm), 
                       # alternating hand movements for 15s (twice with each arm), drawing, typing on a keyboard for 30s, 
                       # opening a bottle and pouring water (three times), arranging sheets of paper in a folder (twice), 
                       # assembling nuts and bolts for 30s, folding a towel three times, and sitting
                       sensorDataType = 'raw',
                       investigator= c('MJFF', 'Bonato'),
                       resourceType = 'experimentalData',
                       intervention = 'levodopa',
                       keywords = c('neurodegeneration', 'neurology', "Parkinson's"),
                       dhPortalIndex = 'TRUE',
                       studyDescriptionLocation = 'syn20681023',
                       studyDataDescriptionLocation = 'syn20681023/wiki/594680',
                       studyDescription = 'The Levodopa Response Study was supported by the Michael J. Fox Foundation to collect wearable sensor data from individuals with Parkinson’s Disease (PD). The purpose of the study was to understand the feasibility of at-home monitoring of PD symptoms and motor fluctuations. Subjects were recruited from two clinical sites, and were monitored both in-clinic, while performing a battery of standard activities, and at home while performing their daily activities.',
                       dataAccessInstructions = 'syn20681023/wiki/594679')
)
  
##############
# Update Annotations in Synapse
##############  
# Update annotations
projects.list <- names(projects.annotations) 
for(proj.id in projects.list){

  #### Uncomment this before updating for real
  # synSetAnnotations(proj.id, annotations = projects.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(projects.annotations[[proj.id]])
}

##############
# Update list of Annotations (key-value pairs) in Synapse
##############  
# initialization
annotations.key.value.list <- NULL

# Run through all possible annotations to generate a key-value pair  
for(proj.id in projects.list){
  
  current.annotation <- projects.annotations[[proj.id]]
  
  for(key in names(current.annotation)){
    if(is.null(annotations.key.value.list[[key]])){
      annotations.key.value.list[[key]] <- current.annotation[[key]] %>% unique() %>% as.list()
    }else{
      annotations.key.value.list[[key]] <- c(annotations.key.value.list[[key]],
                                             current.annotation[[key]]) %>% unique()
    }
    print(key)
  }
}

# Merge a list of values for a given key into a string
for(key in names(annotations.key.value.list)){
  annotations.key.value.list[[key]] <- as.data.frame(annotations.key.value.list[[key]]) %>%
    t() %>% as.data.frame()
}

# Make a table out of the previous list
annotations.key.value.tbl <- annotations.key.value.list %>% 
  data.table::rbindlist(use.names = T, idcol = T, fill = T) %>% 
  `colnames<-`(c('key','val')) %>% 
  dplyr::filter(!val == '') # remove empty fields

# Upload to Synapse
# Github link
gtToken = 'github_token.txt';
githubr::setGithubToken(as.character(read.table(gtToken)$V1))
thisFileName <- 'projectStudyLevelAnnotations.R'
thisRepo <- getRepo(repository = "itismeghasyam/digital-health-portal", ref="branch", refName='master')
thisFile <- getPermlink(repository = thisRepo, repositoryPath=thisFileName)

# Write to Synapse
write.csv(annotations.key.value.tbl,file = paste0('annotation_key_value_pairs','.csv'),na="")
obj = File(paste0('annotation_key_value_pairs','.csv'),
           name = paste0('annotation_key_value_pairs','.csv'),
           parentId = 'syn21574434')
obj = synStore(obj, executed = thisFile)
