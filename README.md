# EpiSensor - ICHack23 powered by Terra API

EpiSensor is an iOS mobile application that detects if you are having a convulsive epileptic seizure through an intelligent algorithms which analyses accelerometer data and harnesses the power of Terra API to integrate with wearable technologies. Following the detection of a seizure, the app runs a countdown for an adjustable amount of time in which the alarm can be deactivated, in case of a false positive. If the alarm is not deactivated the app automatically send your emergency contacts both a text message and your current geolocation.

The motivation for this project was to provide a mobile app that is free to use, include the most essential features for a patient who is self-managing their own epilepsy whilst providing a healthcare collaboration feature which we found to be an underdeveloped area in the current epilepsy app market. 

# iOS Frontend
The frontend of the mobile application is built using UIKit and SwiftUI. The app leverages TerraiOS, SwiftUICharts in order to visualise data beautifully, and an HTTP Server in order to retrieve further data. The app acts as a hub for overall health data but also, based on a fall detection algorithm, detects whether you are having a seizure. The internal backend calculation of whether a fall/seizure occursed is sent to the mobile app and a real-time graph indicated the likelihood of it being a seizure. The cut-off threshold for a seizure warning message is 90% and the user is prompted with a pop-up request where he has to verify that he no seizure has occured - otherwise the emergency services will be called. 

## iOS Screenshots
<img src="https://user-images.githubusercontent.com/80065244/216813691-52db8851-34e2-45e7-a528-a71fd8beeb05.png" width="230" height="500"> |
<img src="https://user-images.githubusercontent.com/80065244/216813697-c46101d1-6b56-458c-877d-ad4d9f490b73.png" width="230" height="500"> | 
<img src="https://user-images.githubusercontent.com/80065244/216813702-d8fcb8e9-202c-4627-beaf-945f20976c3b.png" width="230" height="500">

# JavaScript Backend
The seizure detection system consists of two parts: fall detection and seizure detection algorithm. The system uses an accelerometer to track movement and applies a Fourier transform to analyze the frequency spectrum of the movement. It focuses on movements within a specific frequency band that are characteristic of seizures and not normal movements. If the acceleration in the frequency band exceeds a certain threshold, a timer starts. If the acceleration remains above the threshold for a set duration, a warning beep is triggered. If it remains high for an extended time, the device emits a continuous alarm tone.
