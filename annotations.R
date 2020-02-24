########################################################################
# Digital Health Portal
# Purpose: To Annotate the tables
# Author: Meghasyam Tummalacherla
# email: meghasyam@sagebase.org
########################################################################

##############
# Required libraries
##############
library(plyr)
library(tidyverse)
library(synapser)
synapser::synLogin()

##############
# Synapse data
##############

# Project Synapse ID vs annotations needed
projects.annotations <- list(
  # mPower 1.0 (check anno - Larsson)
  'syn4993293' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity'),
                      'Device location' = c('pocket', 'hand'),
                      'Diagnosis' = c('parkinsons', 'control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  # MoleMapper Public Researcher Portal (check anno - Dan)
  'syn5576734' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity'),
                      'Device location' = c('pocket', 'wrist'),
                      'Diagnosis' = c('control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  # Asthma Health Public Researcher Portal (check anno - Larsson)
  'syn8361748' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity'),
                      'Device location' = c('pocket', 'wrist'),
                      'Diagnosis' = c('asthma', 'control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  # elevateMS (check anno - Abhi)
  'syn9746170' = list('Data collection method' = c('active', 'passive', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity'),
                      'Device location' = c('pocket', 'hand'),
                      'Diagnosis' = c('multiple sclerosis', 'control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice', 'vsst')),
  
  # Parkinsons Disease Digital Biomarker DREAM Challenge (check anno - Solly)
  'syn8717496' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity'),
                      'Device location' = c('pocket', 'hand'),
                      'Diagnosis' = c('parkinsons', 'control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  # CRF Module (check anno - Dan/Megha)
  'syn10837149' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone', 'wearable'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer',
                                        'gravity', 'camera', 'gps', 'fitbit', 'nonin'),
                      'Device location' = c('hand'),
                      'Diagnosis' = c('control'),
                      'Assay' = c('heartrate', 'walking')),
  
  # MyHeart Counts Public Researcher Portal (check anno - Larsson)
  'syn11269541' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity'),
                      'Device location' = c('pocket', 'wrist'),
                      'Diagnosis' = c('control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')),
  
  # PKU Study Project (check anno - Dan/Megha)
  'syn20486872' = list('Data collection method' = c('active', 'passive', 'survey'),
                      'Device type' = c('phone', 'wearable'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity',
                                        'fitbit'),
                      'Device location' = c('pocket', 'wrist'),
                      'Diagnosis' = c('phenylketonuria', 'control'),
                      'Assay' = c('tremor', 'tap', 'sleep', 'heartrate')),
  
  # MJFF Levodopa Response Study (check anno - solly)
  'syn20681023' = list('Data collection method' = c('active', 'survey'),
                      'Device type' = c('phone'),
                      'Sensor type' = c('accelerometer', 'gyroscope', 'magnetometer', 'gravity'),
                      'Device location' = c('pocket', 'wrist'),
                      'Diagnosis' = c('parkinsons', 'control'),
                      'Assay' = c('tremor', 'walking', 'tap', 'voice')))
  
  
#############



# Download digital health view table
digital.health.view.id <- 'syn21585666'
digital.health.view.syn <- synTableQuery(paste('select * from', digital.health.view.id))
digital.health.view <- digital.health.view.syn$asDataFrame()



### TEST

# Get list of projects from table
projects.list <- digital.health.view$projectId %>% unique()

# update annotations
proj.syn <- synGet('syn21636821')
synapser::synSetAnnotations(proj.syn, annotations = list(anno1 = c('tester','lll'),
                                                         projtype = 'sample'))


