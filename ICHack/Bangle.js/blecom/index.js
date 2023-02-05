//Continiously send accelerometer data over BLE 

Bangle.on('accel',function(a) {
    var d = [Math.round(a.x*100), Math.round(a.y*100), Math.round(a.z*100)];
    Bluetooth.println(d.join(","));
  })

//Seizure Detection

// Import the required packages
const { collectAccelerationSample } = d;
const { fft } = require('fft.js').fft;



// Function to collect the accelerator data at a specified sample rate for 5 seconds
const collectAccelerationData = (sampleRate, duration) => {
  let numSamples = sampleRate * duration;
  let accelerationData = [];
  for (let i = 0; i < numSamples; i++) {
    let sample = collectAccelerationSample();
    accelerationData.push(sample);
  }
  return accelerationData;
};

// Function to perform the FFT and calculate the ROI power and power ratio
const detectSeizure = (accelerationData, roiStart, roiEnd, roiPowerThreshold, powerRatioThreshold) => {
  let spectrum = fft(accelerationData);

  let roiPower = 0;
  for (let i = roiStart; i <= roiEnd; i++) {
    roiPower += spectrum[i].real ** 2 + spectrum[i].imag ** 2;
  }
  roiPower /= (roiEnd - roiStart + 1);

  let spectrumPower = 0;
  for (let i = 0; i < spectrum.length; i++) {
    spectrumPower += spectrum[i].real ** 2 + spectrum[i].imag ** 2;
  }
  let powerRatio = roiPower / spectrumPower;

  return roiPower > roiPowerThreshold && powerRatio > powerRatioThreshold;
};

// Call the functions to collect the acceleration data and detect a seizure
let sampleRate = 50;
let duration = 5;
let accelerationData = collectAccelerationData(sampleRate, duration);

let roiStart = 5;
let roiEnd = 20;
let roiPowerThreshold = 100;
let powerRatioThreshold = 0.5;
let seizureDetected = detectSeizure(accelerationData, roiStart, roiEnd, roiPowerThreshold, powerRatioThreshold);

// Raise a warning if a seizure is detected for 5 seconds
if (seizureDetected) {
  console.log("Seizure detected, raising warning for 5 seconds.");
  setTimeout(() => {
    console.log("Warning duration ended.");
  }, 5000);
}

// Raise an alarm if a seizure is detected for another 5 seconds
if (seizureDetected) {
  console.log("Seizure detected, raising alarm for 5 seconds.");
  setTimeout(() => {
    console.log("Alarm duration ended.");
  }, 5000);
}
