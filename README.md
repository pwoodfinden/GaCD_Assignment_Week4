==================================================================
tidydata file for the original dataset:

Human Activity Recognition Using Smartphones Dataset
Version 1.0
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
https://urldefense.com/v3/__http://www.smartlab.ws__;!dEgXJxch11IPYA!XlAv1N3bg-pefQq3yet3m_KlqPVCLmBxW8hjRAUWc5l_2HpMcf71nAakhLr6x27LahaCGQ$ 
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
==================================================================

tidydata.txt contains mean and standard deviation averages per subject (volunteer) for each of the 6 activities.

A full list of variables is contained in the codebook:
codebook_tidydata.Rmd

Both tidydata.txt and codebook_tidydata.Rmd were created using the R script:
run_analysis.R 

Please set working directory in R to the UCI HAR Dataset folder before running.
==================================================================




