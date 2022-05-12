# IEC-61850-to-OCPP-and-SIMULINK
This application is a virtual commissioning tool for operation in the field of electric vehicle charging (EV). The designed application takes the IEC61850 system configuration file of the electrical system (the file has the ".scd" extension). As the output, the application generates a MATLAB script for generation of the uploaded electrical system SIMULINK model (that file has a ".m" extension) and 2 python scripts (client and server, that both have a ".py extension") used for communication purposes according to OCPP protocol (Open Charge Point Protocol). In a paradigm of OCPP server called "CMS" (Central Management Station) and client is a "CP" (Charging Point). Python code of the "CP" application has an access to MATLAB/SIMULINK model through the "matlab.engine" library. Therefore, it is possible to send commands and receive feedback from "CMS" through the "CP" directly into the MATLAB/SIMULINK model of charging station. By generating a SIMULINK model, it is possible to validate the physical parameters of the charging process, whenever the autogenerated "CMS" and "CP" applications can be used for validation of a communication channel between the charging station and management system.   

# Prerequisites:
Two applications should be installed before:
1. MATLAB  version 2015 or later (with the SIMULINK extensions included)
2. Python ver 3.8 (or lower)

# List of preinstalled Python libraries:
1. websockets ( pip install websockets ) 
2. ocpp ( pip install ocpp )
3. inputimeout ( pip install inputimeout )

# Short Instruction about how to use the designed application
https://www.youtube.com/watch?v=mNwVgZl6sdM

# IMPORTANT
Before starting work with the designed application, the MATLAB Engine API should be installed for Python. The instruction on how to do it see here:
https://www.mathworks.com/help/matlab/matlab_external/install-the-matlab-engine-for-python.html


# APPLICATION LIMITATIONS
1. The MATLAB script has limitations in SIMULINK object positioning. Currently, they are placed in matrice with 3 columns and a conditionally unlimited number of rows. Therefore, all components in autogenerated SIMULINK model should be aligned manually in order to make this model more understandable, and comfortable to use.
2. Not all components of the IEC61850 standard are parsed by the designed application. The entire code is publically available and all other people who are interesting are welcome to contribute.
