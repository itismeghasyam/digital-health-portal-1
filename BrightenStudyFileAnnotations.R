########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in Brighten Study Public Researcher Portal
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn10848316
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
  
  # AUDIT-C
  'syn17021280' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('AUDIT-C'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548736',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # GAD-7
  'syn17022655' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('GAD-7'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548743',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  
  # PHQ-2
  'syn17020855' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('PHQ-2'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548732',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # PHQ-9
  'syn18405275' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('PHQ-9'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548733',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # SDS
  'syn17022658' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('SDS'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548734',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Application Satisfaction
  'syn17025202' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548738',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Baseline Demographics
  'syn17023349' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('demographics survey'),
                       dataType=c('surveyData'), #clincal data? i.e medical history?
                       dataSubtype=c('metadata'), 
                       metadataType = c('individual'), 
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548729',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Health Applications
  'syn17022426' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548740',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Mental Health Screening
  'syn17023316' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548739',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Mental Health Services
  'syn17022660' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548731',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Mood assessment
  'syn17023313' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('mood'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548741',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Sleep Quality
  'syn17022659' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c('sleep report'),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548735',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),

  # Other Mobile Apps Used
  'syn17025058' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/548737',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Passive Features Brighten v1
  'syn17025500' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/587779',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Passive Weather Features Brighten v2
  'syn17061284' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/587778',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Passive Mobility Features Brighten v2
  'syn17114662' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/587778',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Passive Cluster Entries Brighten v2
  'syn17116695' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/587778',
                       dataAccessInstructions = 'syn10848316/wiki/551287'),
  
  # Passive Phone Communication Features Brighten v2
  'syn17060502' = list(consortium = 'mHealth',
                       study = 'Brigten study',
                       numberParticipants= '', 
                       dataCollectionMethod= c('patient reported outcome'),
                       diagnosis=  c('controls'), 
                       reportedOutcome =c(''),
                       dataType=c('surveyData'),
                       dataSubtype=c('raw', 'metadata'),# metadata?
                       metadataType = c(''), # assessment?
                       dhPortalIndex = 'TRUE',
                       dataDescriptionLocation = 'syn10848316/wiki/587778',
                       dataAccessInstructions = 'syn10848316/wiki/551287')
  
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
## NO INDIVIDUAL FILES IN THIS PROJECT ##