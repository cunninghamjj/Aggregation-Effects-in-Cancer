# Aggregation-Effects-in-Cancer
Aggregation Effects and Population-based dynamics as a source of therapy resistance in cancer

Software for simulations in manuscript and user's manual.

Created by Jessica Reynolds (jessica.reynolds at moffitt.org) in the department of Imaging at the Moffitt Cancer Research Institute, Tampa, FL.

Publication: In review.
Table of Contents
Matlab Setup to run simulation

    System requirements
    Downloading simulation
    Matlab path requirements

Running simulation

    Setting parameters
    Choosing prefabricated or creating original parameters
    Plotting
    Saving workspaces

Examining data from manuscript

    Loading data

Copyright and disclaimer
Acknowledgements


Matlab Setup to run simulatiom
1. System requirements
To setup and run the simulation you will need a computer running version Matlab 2010a or higher. No special toolboxes are required.

2. Downloading simulation
Download the ZIP of all contents from https://github.com/cunninghamjj/Aggregation-Effects-in-Cancer into a folder of your choice. Once downloaded, unzip the contents and discard the .zip file.

3. Matlab path requirements
Open Matlab and change path the folder with the downloaded files. Then go to File -> Set Path -> Add with Subfolders and select the folder with the downloaded files. This will allow access to plotting functions.

Running Simulation
1. Setting parameters
This simulation has a multitude of parameters to define the specific simulation to run. Below is the explaination of each of the individual parameters.
maxSimTime: The number of generations the evolutionary dynamics will simulate for the tumor population. In the manuscript, simulations were run 10000 generations to ESS.
speed: A scale factor that changes the rate at which the dynamics change from generation to generation. In order to observe the dynamics well this is set to 0.001. 
r: Population growth rate. The value used in the manuscript is 0.1.
Kmax: Maximum carrying capacity of the population. The value used in the manuscript is 100.
sigmaK: Cost of resistance. The cost of resistance used here come as a penalty to the populations maximum carrying capacity. The Gaussian rate of decline of the carrying capacity is defined by sigmaK. Large values of sigmaK result in small penalties and vice versa. Sigmak is set to 1 in the simulations for the manuscript, which is a relatively large penalty. 
b: Resistance efficacy. The value defines how well the resistance strategy actually confers resistance. Low values mean that the resistance strategy is not very effective at minimizing cell death. b is set to 5 in the manuscript.
k: Lethality of drug. k represents the effectiveness of the simulated drug. k is set to 0.1 in the manuscript simulations.
m: Drug dosage. This is set to 0.1 in the manuscript simulations. 


2. Choosing prefabricated or creating original parameters
There are two instances where the user can either use prefabricated parameters used within the manuscript or allow the code to create original parameters.
a. The first is where the neighborhood size is defined. To load one of the five predefined neighborhood sizes the user can uncomment the corresponding line. If the user would like to define a new neighborhood size that is not one of the predefined neighborhood sizes, comment all of the five predefined lines and add the desired value as a string. Please ensure to have only one of these options uncommented in order to ensure the user is running the simulation they intend.

b. The second instance is where the aggregation effect is defined. To choose one of the eight effects discussed in the paper, uncomment the corresponding line. If the user would like to manually enter a value for alpha and beta, uncomment the manual lines and enter the desired values. If manually entering it is unecessary to run the 'setAggregationEffects' script and it should be commented out. Again, please ensure to have only one of these options uncommented in order to ensure the user is running the simulation they intend.

3. Plotting

There are two plot functions included. plotESSLandscape plots the G-function landscape at the ESS along with a datatip showing the ESS resistance strategy and the neighborhood size. ExploratoryFigure plots many of the dynamic variables over time for analysis. Both of these figures are also saved using the modelName* at the end of each run. 

4. Saving Workspaces
At the end of each run of the simulation, a condensed version of the workspace is saved. If the user would like to keep the entire working workspace, please comment out the 'cleanWorkspace' script. This will keep all indeces, values, and intermediate variables available. The workspaces are saved according to the model name. The name is the combination of the aggregation effect or value chosen and the neighborhood size. 

Examining data from manuscript
1. Loading data

To load workspaces from previously run simulations use File -> Open in Matlab and choose the modelName*.mat of your choice. This will load the entire workspace saved after the simulation was run. Data analysis can then be performed.

COPYRIGHT AND DISCLAIMER

This software and documentation contained with it are copyright © 2015 by Jessica Reynolds and the Moffitt Cancer Research Institute. All rights are reserved.

This software is supplied 'as is' without any warranty or guarantee of support. The Moffitt Cancer Research Institute is not responsible for its use, misuse, or functionality. In no event shall the authors or copyright holders be liable for any claim, damages, or other liability arising from, out of, or in connection with this software.
ACKNOWLEDGEMENTS

Thanks to both Joel Brown and Robert Gatenby for their patience and support through the many iterations of this simulation. 
