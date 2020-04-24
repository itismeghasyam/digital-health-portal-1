
########################################################################
# Digital Health Portal
# Purpose: To Annotate the Data in MJFF Levodopa Study
# Author: 
# email: meghasyam@sagebase.org
########################################################################
##############
# Notes, Ideas, To-Dos
##############
### Note:
## To successfully run this code, you need write permissions to syn20681023
# 
# Using https://docs.google.com/document/d/19VZ0dWVzFBnWj11xSU0seiFU0pFpVkRK/edit as list of annotations
#
# Did not include annotations for Sample Data files, as these should be excluded from the Portal
# I did add annotations to the individual files in syn20681036, however these should not be indexed
# in the Portal
#


##############
# Required libraries
##############
#library(plyr)
#library(tidyverse)
library(synapser)
synLogin()

##############
# List of tables and related annotations
##############
tables.list = list(
#Metadata of patient onboarding
'syn20681894' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     numberParticipants= 29, 
                     dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                     diagnosis= "Parkinson's Disease", 
                     reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia', 'bradykinesia', 'freezing of gait'),
                     dataType=c('clinical', 'surveyData'), dataSubtype='metadata', metadataType=c('individual', 'sensor'), 
                     dhPortalIndex = 'TRUE', dataDescriptionLocation = 'syn20681023/wiki/594683'),

#Metadata of patient onboarding dictionary
'syn20681895' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     dataType=c('clinical', 'surveyData'), dataSubtype='metadata', metadataType='data dictionary', dhPortalIndex = 'TRUE'),


#UPDRS Response
'syn20681939' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     numberParticipants= 17, 
                     dataCollectionMethod= c('clinical assessment'),
                     diagnosis= "Parkinson's Disease", 
                     reportedOutcome =c('MDS-UPDRS'),
                     dataType=c('clinical'), dataSubtype=c('raw'), dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn20681023/wiki/594683'),

#Sensor Data- Part I
'syn20681931' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     numberParticipants= 29, 
                     dataCollectionMethod= c('active', 'passive'),
                     deviceType = c('handheld', 'wearable'), sensorType = 'accelerometer',
                     devicePlatform = c('GENEActiv', 'Android', 'Pebble OS'), 
                     deviceLocation = c('wrist', 'waist'),
                     diagnosis= "Parkinson's Disease", 
                     digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                     digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                  'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                  'arranging paper','assembling nuts and bolts', 'folding towels'),
                     dataType=c('sensor'), dataSubtype=c('raw', 'metadata'), metadataType='sensor', dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn20681023/wiki/594685'),

#Sensor Data- Part II
'syn20681932' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     numberParticipants= 17, 
                     dataCollectionMethod= c('active', 'passive'),
                     deviceType = c('wearable'), sensorType = 'accelerometer',
                     devicePlatform = c('Shimmer'), 
                     deviceLocation = c('forearm', 'shank', 'back'),
                     diagnosis= "Parkinson's Disease", 
                     reportedOutcome =c('MDS-UPDRS', 'tremor', 'dyskinesia', 'bradykinesia', 'freezing of gait', 'medication report', 'sleep report'),
                     digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                     digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                  'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                  'arranging paper','assembling nuts and bolts', 'folding towels'),
                     dataType=c('sensor'), dataSubtype=c('raw', 'metadata'), metadataType='sensor', dhPortalIndex = 'TRUE',
                     dataDescriptionLocation = 'syn20681023/wiki/594685'),

# Task Scores- Part I
'syn20681937' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     numberParticipants= 29, 
                     dataCollectionMethod= c('clinical assessment'),
                     diagnosis= "Parkinson's Disease", 
                     reportedOutcome =c('tremor', 'dyskinesia', 'bradykinesia'),
                     digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                     digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                  'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                  'arranging paper','assembling nuts and bolts', 'folding towels'),
                     dataType=c('clinical'), dataSubtype=c('raw', 'metadata'), metadataType=c('experiment', 'assessment'), 
                     dhPortalIndex = 'TRUE', dataDescriptionLocation = 'syn20681023/wiki/594685'),

# Task Scores- Part II
'syn20681938' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     numberParticipants= 17, 
                     dataCollectionMethod= c('clinical assessment'),
                     diagnosis= "Parkinson's Disease", 
                     reportedOutcome =c('tremor', 'dyskinesia', 'bradykinesia'),
                     digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                     digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                  'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                  'arranging paper','assembling nuts and bolts', 'folding towels'),
                     dataType=c('clinical'), dataSubtype=c('raw', 'metadata'), metadataType=c('experiment', 'assessment'), 
                     dhPortalIndex = 'TRUE', dataDescriptionLocation = 'syn20681023/wiki/594685'),


# Home Tasks
'syn20681035'  = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                      numberParticipants= 17, 
                      dataCollectionMethod= c('active'),
                      diagnosis= "Parkinson's Disease", 
                      reportedOutcome =c('medication report'),
                      digitalAssessmentCategory= c('Resting tremor', 'active tremor'),
                      digitalAssessmentDetails = c('finger-to-nose', 'sitting', 'alternating hand movements'),
                      dataType=c('surveyData'), dataSubtype=c('raw', 'metadata'), metadataType = c('experiment', 'assessment'), 
                      dhPortalIndex = 'TRUE', dataDescriptionLocation = 'syn20681023/wiki/594685'),

# Metadata of Laboratory Visits
'syn20681892' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     numberParticipants= 29, 
                     dataCollectionMethod= c('patient reported outcome', 'clinical assessment'),
                     diagnosis= "Parkinson's Disease", 
                     reportedOutcome =c('medication report'),
                     dataType=c('clinical', 'surveyData'), dataSubtype='metadata', metadataType='experiment', 
                     dhPortalIndex = 'TRUE', dataDescriptionLocation = 'syn20681023/wiki/594685'),

# Metadata of Laboratory Visits Dictionary
'syn20681893'  = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                      dataType=c('clinical'), dataSubtype='metadata', metadataType='data dictionary', dhPortalIndex = 'TRUE'),


# Task code dictionary
'syn20681936' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                   dataType=c('clinical'), dataSubtype='metadata', metadataType='data dictionary', dhPortalIndex = 'TRUE'),

# Subject Diary
'syn20681934' =  list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                      numberParticipants= 17, 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= "Parkinson's Disease", 
                      reportedOutcome =c('tremor', 'dyskinesia', 'bradykinesia', 'freezing of gait'),
                      dataType=c('surveyData'), dataSubtype=c('raw'), dhPortalIndex = 'TRUE', 
                      dataDescriptionLocation = 'syn20681023/wiki/594684'),

#Subject Diary Data Dictionary
'syn20681935' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                     dataType=c('surveyData'), dataSubtype='metadata', metadataType='data dictionary', dhPortalIndex = 'TRUE'),


#Medication Diary
'syn20681891' =  list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                      numberParticipants= 27, 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= "Parkinson's Disease", 
                      reportedOutcome =c('medication report'),
                      dataType=c('surveyData'), dataSubtype=c('raw'), dhPortalIndex = 'TRUE', 
                      dataDescriptionLocation = 'syn20681023/wiki/594684'),

#Sleep Diary
'syn20681933' =  list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                      numberParticipants= 27, 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= "Parkinson's Disease", 
                      reportedOutcome =c('sleep report'),
                      dataType=c('surveyData'), dataSubtype=c('raw'), dhPortalIndex = 'TRUE', 
                      dataDescriptionLocation = 'syn20681023/wiki/594684'),

#Feedback Survey
'syn20681033' =  list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                      numberParticipants= 27, 
                      dataCollectionMethod= c('patient reported outcome'),
                      diagnosis= "Parkinson's Disease", 
                      reportedOutcome =c('feedback survey'),
                      dataType=c('surveyData'), dataSubtype=c('raw'), dhPortalIndex = 'TRUE',
                      dataDescriptionLocation = 'syn20681023/wiki/594684'),

#Feedback Survey Data Dictionary
'syn20681034' = list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                      dataType=c('surveyData'), dataSubtype='metadata', metadataType='data dictionary', dhPortalIndex = 'TRUE')

)

#################
# Now set annotations
#################
for(proj.id in tables.list){
  proj.syn <- synGet(proj.id)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = tables.annotations[[proj.id]])
  ####
  
  print(proj.id)
  print(tables.annotations[[proj.id]])
}


##################
#
# Set annotations of individual files
#
##################

# GENEActiv folder syn20681037

geneactiveannot <- list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                        dataCollectionMethod = c('active', 'passive'), deviceType = 'wearable',
                        sensorType = 'accelerometer', devicePlatform = 'GENEActiv',
                        deviceLocation='wrist', diagnosis = "Parkinson's Disease",
                        digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                        digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                     'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                     'arranging paper','assembling nuts and bolts', 'folding towels'),
                        dataType = 'sensor', dataSubtype = 'raw', dhPortalIndex = 'FALSE')
geneactiveannotpassive <- geneactiveannot
geneactiveannotpassive$dataCollectionMethod<-'passive'

filesAndFolders <- synGetChildren('syn20681037')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  # Day 1
  synid <- filesAndFolders$id[grep("ay1", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = geneactiveannot)
  ####
  
  # Day 4
  synid <- filesAndFolders$id[grep("ay4", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = geneactiveannot)
  ####  
  
  # Day 2
  synid <- filesAndFolders$id[grep("ay2", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = geneactiveannotpassive)
  ####
  
  # Day 3
  synid <- filesAndFolders$id[grep("ay3", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = geneactiveannotpassive)
  ####
}


# Pebble folder syn20681180

pebbleannot <- list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                        dataCollectionMethod = c('active', 'passive'), deviceType = 'wearable',
                        sensorType = 'accelerometer', devicePlatform = 'Pebble OS',
                        deviceLocation='wrist', diagnosis = "Parkinson's Disease",
                        digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                        digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                     'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                     'arranging paper','assembling nuts and bolts', 'folding towels'),
                        dataType = 'sensor', dataSubtype = 'raw', dhPortalIndex = 'FALSE')
pebbleannotpassive <- pebbleannot
pebbleannotpassive$dataCollectionMethod<-'passive'

filesAndFolders <- synGetChildren('syn20681180')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  # Day 1
  synid <- filesAndFolders$id[grep("ay1", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = pebbleannot)
  ####
  
  # Day 4
  synid <- filesAndFolders$id[grep("ay4", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = pebbleannot)
  ####  
  
  # Day 2
  synid <- filesAndFolders$id[grep("ay2", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = pebbleannotpassive)
  ####
  
  # Day 3
  synid <- filesAndFolders$id[grep("ay3", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = pebbleannotpassive)
  ####
}


# Phone folder syn20681318

phoneannot <- list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                    dataCollectionMethod = c('active', 'passive'), deviceType = 'handheld',
                    sensorType = 'accelerometer', devicePlatform = 'Android',
                    deviceLocation='waist', diagnosis = "Parkinson's Disease",
                    digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                    digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                 'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                 'arranging paper','assembling nuts and bolts', 'folding towels'),
                    dataType = 'sensor', dataSubtype = 'raw', dhPortalIndex = 'FALSE')
phoneannotpassive <- phoneannot
phoneannotpassive$dataCollectionMethod<-'passive'

filesAndFolders <- synGetChildren('syn20681318')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  # Day 1
  synid <- filesAndFolders$id[grep("ay1", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = phoneannot)
  ####
  
  # Day 4
  synid <- filesAndFolders$id[grep("ay4", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = phoneannot)
  ####  
  
  # Day 2
  synid <- filesAndFolders$id[grep("ay2", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = phoneannotpassive)
  ####
  
  # Day 3
  synid <- filesAndFolders$id[grep("ay3", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = phoneannotpassive)
  ####
}


# Shimmer back folder syn20681458

shimmerbackannot <- list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                   dataCollectionMethod = c('active', 'passive'), deviceType = 'wearable',
                   sensorType = 'accelerometer', devicePlatform = 'Shimmer',
                   deviceLocation='back', diagnosis = "Parkinson's Disease",
                   digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                   digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                'arranging paper','assembling nuts and bolts', 'folding towels'),
                   dataType = 'sensor', dataSubtype = 'raw', dhPortalIndex = 'FALSE')
shimmerbackannotpassive <- shimmerbackannot
shimmerbackannotpassive$dataCollectionMethod<-'passive'

filesAndFolders <- synGetChildren('syn20681458')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  # Day 1
  synid <- filesAndFolders$id[grep("ay1", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = shimmerbackannot)
  ####
  
  # Day 4
  synid <- filesAndFolders$id[grep("ay4", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = shimmerbackannot)
  ####  
  
  # Day 2
  synid <- filesAndFolders$id[grep("ay2", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = shimmerbackannotpassive)
  ####
  
  # Day 3
  synid <- filesAndFolders$id[grep("ay3", filesAndFolders$name)]
  proj.syn <- synGet(synid)
  
  #### Uncomment this before updating for real
  # synSetAnnotations(proj.syn, annotations = shimmerbackannotpassive)
  ####
}



# Shimmer forearm folder syn20681630 & syn20681805

shimmerarmannot <- list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                         dataCollectionMethod = c('active', 'passive'), deviceType = 'wearable',
                         sensorType = 'accelerometer', devicePlatform = 'Shimmer',
                         deviceLocation='forearm', diagnosis = "Parkinson's Disease",
                         digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                         digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                      'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                      'arranging paper','assembling nuts and bolts', 'folding towels'),
                         dataType = 'sensor', dataSubtype = 'raw', dhPortalIndex = 'FALSE')


# Folder syn20681630
filesAndFolders <- synGetChildren('syn20681630')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  for(synid in filesAndFolders$id){
    proj.syn <- synGet(synid)
    
    #### Uncomment this before updating for real
    # synSetAnnotations(proj.syn, annotations = shimmerarmannot)
    ####
    
  }
}

#Folder syn20681805
filesAndFolders <- synGetChildren('syn20681805')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  for(synid in filesAndFolders$id){
    proj.syn <- synGet(synid)
    
    #### Uncomment this before updating for real
    # synSetAnnotations(proj.syn, annotations = shimmerarmannot)
    ####
    
  }
}


# Shimmer shank folder syn20681544 & syn20681717

shimmerlegannot <- list(consortium = 'mHealth', study = 'MJFF Levodopa Response Study',
                        dataCollectionMethod = c('active', 'passive'), deviceType = 'wearable',
                        sensorType = 'accelerometer', devicePlatform = 'Shimmer',
                        deviceLocation='shank', diagnosis = "Parkinson's Disease",
                        digitalAssessmentCategory= c('Resting tremor', 'postural tremor', 'active tremor', 'gait'),
                        digitalAssessmentDetails = c('finger-to-nose', 'walking (flat)', 'walking (stairs)', 'standing', 'sitting', 
                                                     'alternating hand movements', 'drawing', 'typing', 'opening a water bottle and pouring', 
                                                     'arranging paper','assembling nuts and bolts', 'folding towels'),
                        dataType = 'sensor', dataSubtype = 'raw', dhPortalIndex = 'FALSE')

# Folder syn20681544
filesAndFolders <- synGetChildren('syn20681544')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  for(synid in filesAndFolders$id){
    proj.syn <- synGet(synid)
    
    #### Uncomment this before updating for real
    # synSetAnnotations(proj.syn, annotations = shimmerlegannot)
    ####
    
  }
}

# Folder syn20681717
filesAndFolders <- synGetChildren('syn20681717')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
    
  for(synid in filesAndFolders$id){
    proj.syn <- synGet(synid)
      
    #### Uncomment this before updating for real
    # synSetAnnotations(proj.syn, annotations = shimmerlegannot)
    ####
      
  }
}



# Dummy data folder syn20681025

dummyannot <- list(dhPortalIndex = 'FALSE')
dummyannotpassive <- dummyannot
dummyannotpassive$dataCollectionMethod<-'passive'

filesAndFolders <- synGetChildren('syn20681025')
filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
Folders <- filesAndFolders[grep("Folder", filesAndFolders$type),]
for(fold in Folders$id){
  filesAndFolders <- synGetChildren(fold)
  filesAndFolders <-data.frame(do.call('rbind', lapply(as.list(filesAndFolders), unlist)), stringsAsFactors = F) 
  
  for(synid in filesAndFolders$id){
    proj.syn <- synGet(synid)
  
    #### Uncomment this before updating for real
    # synSetAnnotations(proj.syn, annotations = dummyannot)
    ####
  
  }
}







