
########################################################################
# Digital Health Portal
# Purpose: To Annotate the Digital Health Projects
# Author: Solly Sieberts
# email: solly.sieberts@sagebase.org
########################################################################
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
##############
# Notes, Ideas, To-Dos
##############
### Note:
## Projects are analyses of one or more studies. Studies are annotated in
# projectStudyLevelAnnotations.R.
## To successfully run this code, you need write permissions to all the following
# mhealth projects
## All projects have a template annotation list assigned. Any annotation classes 
# from that list can be edited/removed. 

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

## Projects covered (with their studyOrProject URLs)
## Studies
mjffurl=paste('[MJFF Levodopa Response Study](/Explore/Studies/DetailsPage?study=',
              URLencode('MJFF Levodopa Response Study',  reserved = FALSE, repeated = FALSE),
              ')', sep="")

mpowerurl=paste('[mPower Mobile Parkinson Disease Study](/Explore/Studies/DetailsPage?study=',
                URLencode('mPower Mobile Parkinson Disease Study', reserved = FALSE, repeated = FALSE),
                ')', sep = "")

asthmaurl=paste('[Asthma Mobile Health Study](/Explore/Studies/DetailsPage?study=',
                URLencode('Asthma Mobile Health Study', reserved = FALSE, repeated = FALSE),
                ')', sep = "")
elevatemsurl=paste('[elevateMS Study](/Explore/Studies/DetailsPage?study=',
                   URLencode('elevateMS Study', reserved = FALSE, repeated = FALSE),
                   ')', sep = "")
myhearturl=paste('[MyHeart Counts Cardiovascular Health Study](/Explore/Studies/DetailsPage?study=',
                 URLencode('MyHeart Counts Cardiovascular Health Study', reserved = FALSE, repeated = FALSE),
                 ')', sep = "")
brightenurl=paste('[Brighten Study](/Explore/Studies/DetailsPage?study=',
                  URLencode('Brighten Study', reserved = FALSE, repeated = FALSE),
                  ')', sep = "")
sleepurl=paste('[SleepHealth](/Explore/Studies/DetailsPage?study=',
               URLencode('SleepHealth', reserved = FALSE, repeated = FALSE),
               ')', sep = "")

molemapperurl = paste('[Mole Mapper Study](/Explore/Studies/DetailsPage?study=',
                      URLencode('Mole Mapper Study', reserved = FALSE, repeated = FALSE),
                      ')', sep = "")

heartsnapshoturl = paste('[Heart Snapshot Study](/Explore/Studies/DetailsPage?study=',
                         URLencode('Heart Snapshot Study', reserved = FALSE, repeated = FALSE),
                         ')', sep = "")

## Projects
participantretentionurl = paste('[Participant Retention in Digital Health Studies](/Explore/Projects/DetailsPage?study=',
                                URLencode('Participant Retention in Digital Health Studies', reserved = FALSE, repeated = FALSE),
                                ')', sep = "")

pddbdreamurl = paste('[Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge](/Explore/Projects/DetailsPage?study=',
                     URLencode('Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge', reserved = FALSE, repeated = FALSE),
                     ')', sep = "")

##############
# List of projects and related annotations
##############
# Project Synapse ID vs annotations needed
projects.annotations <- list(
## Parkinsons Disease Digital Biomarker DREAM Challenge 
'syn8717496' = list(consortium = 'mHealth',
                    study = 'Parkinsons Disease Digital Biomarker (PDDB) DREAM Challenge',
                    dataCollectionMethod= c('active', 'patient reported outcome', 'clinical assessment'),
                    deviceType = c('handheld', 'wearable'),
                    sensorType = c('accelerometer', 'gyroscope'),
                    devicePlatform = c('GENEActiv', 'Pebble OS', 'iOS'), 
                    deviceLocation = c('wrist', 'pocket'),
                    diagnosis=  c("Parkinson's Disease", "control"), 
                    reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia', 'bradykinesia',
                                      'medication report'),
                    digitalAssessmentCategory= c('resting tremor', 'action tremor', 'gait'),
                    digitalAssessmentDetails = c('walking (flat)', 
                                                 'standing', 'alternating hand movements', 
                                                 'opening a water bottle and pouring', 
                                                 'arranging paper','assembling nuts and bolts',
                                                 'folding towels'),
                    investigator= '',
                    resourceType = c('analysis', 'challenge'),
                    keywords = c('neurodegeneration', 'neurology', "Parkinson's", 'DREAM Challenge'),
                    dhPortalIndex = 'TRUE', # Change after filling annotations
                    studyDescriptionLocation = 'syn22017473', 
#                    dataUsed = c('syn20681023', 'syn4993293'),
                    #MJFF l-dopa & mPower
                    dataUsed = c(mjffurl, mpowerurl),
                    studyDescription = "The Parkinson’s Disease Digital Biomarker DREAM Challenge was a first of it's kind challenge, designed to benchmark methods for the processing of sensor data for development of digital signatures reflective of Parkinson's Disease.",
                    dataAccessInstructions = '',
                    isDHProject='TRUE'),

## Participant Retention in Digital Health Studies
'syn20715364' = list(consortium = 'mHealth',
                    study = 'Participant Retention in Digital Health Studies',
                    dataCollectionMethod= c('active', 'passive', 'patient reported outcome'),
                    deviceType = c('handheld'),
                    sensorType = '',
                    devicePlatform = c('iOS', 'Android'), 
                    deviceLocation = '',
                    diagnosis=  c('depression', 'endometriosis', 'multiple sclerosis', "Parkinson's disease", 'sleep related disorder', "control"), 
                    reportedOutcome ='',
                    digitalAssessmentCategory= c('participant engagement'),
                    digitalAssessmentDetails = c(''),
                    investigator= 'Sage Bionetworks',
                    resourceType = c('analysis'),
                    keywords = c('participant engagement', 'remote studies'),
                    dhPortalIndex = 'TRUE', # Change after filling annotations
                    studyDescriptionLocation = 'syn22123360', 
                    #dataUsed = c('syn4993293', 'syn8361748', 'syn21140362', 'syn11269541', 'syn10848316', 'syn18492837'), 
                    # syn21140362 = unknown
                    dataUsed = c(mpowerurl, asthmaurl, elevatemsurl, myhearturl, brightenurl, sleepurl,
                                 '[Phendo](http://citizenendo.org/phendo/)', '[START](https://www.goodrx.com/)'
                    ),
#                    externalDataUsed = c('[Phendo](http://citizenendo.org/phendo/)', '[START](https://www.goodrx.com/)'),
                    studyDescription = "Analysis of participant engagement from 8 remote, app-based studies including more than 100,000 participants.",
                    dataAccessInstructions = 'syn20715364/wiki/596144',
                    isDHProject='TRUE')
)



##############
# Create Entity and set Annotations in Synapse
##############  
# Update annotations

for(projects in names(projects.annotations)){
  
    #### Uncomment this before updating for real
    synSetAnnotations(projects, annotations = projects.annotations[[projects]])
    ####
    
    print(projects)
    print(projects.annotations[[projects]])
}

