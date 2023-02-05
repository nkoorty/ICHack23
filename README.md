# EpiSensor - ICHack23 powered by Terra API

EpiSensor is an iOS mobile application that detects if you are having a convulsive epileptic seizure through an intelligent algorithms which analyses accelerometer data and harnesses the power of Terra API to integrate with wearable technologies. Following the detection of a seizure, the app runs a countdown for an adjustable amount of time in which the alarm can be deactivated, in case of a false positive. If the alarm is not deactivated the app automatically send your emergency contacts both a text message and your current geolocation.

The motivation for this project was to provide a mobile app that is free to use, include the most essential features for a patient who is self-managing their own epilepsy whilst providing a healthcare collaboration feature which we found to be an underdeveloped area in the current epilepsy app market. 

The seizure detection system consists of two parts: fall detection and seizure detection algorithm. The system uses an accelerometer to track movement and applies a Fourier transform to analyze the frequency spectrum of the movement. It focuses on movements within a specific frequency band that are characteristic of seizures and not normal movements. If the acceleration in the frequency band exceeds a certain threshold, a timer starts. If the acceleration remains above the threshold for a set duration, a warning beep is triggered. If it remains high for an extended time, the device emits a continuous alarm tone.

