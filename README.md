# IMU-triggered FES
## Rehabilitaion Robotics Project Workshop 
### Group 4
Alice Montelaghi 		992880

Anna Sparapani		994481

Asia Muraca       994303

Elisa Motta 		990589 
Emeline Jacques-Jean 	219560 


> **DISCLAIMER**\ 
> Most of the code you find in this repository has been provided to us by out tutor, Federica Ferrari, we just changed to meet the specific objectives of the project. We uploaded it in the repository just to have an easy way to share, update it and hand it in, but we are not taking credit for any of it. 

Hi! welcome to our Project Workshop code. Here you can find the code we used to develop our IMU - triggered FES system for motor rehabilitation. It consists of
1. a model "train_lstm.py" able to perform the online classification between tasks. It has been trained on our tasks
> **Tasks and IMUs placement**\
> We defined two tasks: (1) "switch the light" task that consists of extending the shoulder as to reachinf for a switch, and (2) "look at your watch" task that consists of flexing the elbow towards the chest as to look for your watch. Both tasks are to be performed from a sitting poition, with the arm resting on the table in front of the subject.\
> We used 4 IMUs from the MTW Awinda system by Xsens and placed them on the hand, forearm, arm and chest. These provide the data the classificator uses to determine which task is being initiated by the subject\
2. code for the xsens acquisition (entirely provided by our tutor)
3. code for the FES stimulation
> **Electrodes placement and stimulation**\
> with this setting we perfom a two-channel stimulation, to the tricep and bicep, to produce shoulder extention and elbow flexion, respectively.
> The stimulation parameters are set in the FES code. We use 
> 1. frequency of 40Hz
> 2. pulse width of 300 $\mu$s
> 3. current amplitude of $\small \begin{cases} 10 mA & \text{tricep stimulation}\\ 15 mA & \text{bicep stimulation}\end{cases}$
