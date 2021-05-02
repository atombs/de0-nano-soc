# de0-nano-soc
Terasic DE0-Nano-SoC VHDL based project

# Overview
This project is based off the "HPS_CONTROL_FPGA_LED" example provided by Terasic for their DE0 Nano SoC development board (also known as "Atlas SoC"). However the example provided by Terasic is in verilog, this project uses VHDL for the user files. 

# Building
1. Clone git repo
2. Open Quartus software (project has been built using Quartus Prime Version 20.1.1 Build 720)
3. Select File->Open Project... on the file chooser dialog, navigate to your local git repo and select the "BASIC_NANO_SOC.qpf"
4. Select Tools->Tcl Scripts... and select the "BASIC_NANO_SOC.tcl" under Project. Then select "Run". This may take around 30s - 60s to complete. Click OK on the completion window and then Close on the Tcl Scripts window
5. Select Tools->Platform Designer. On the Open window select the soc_system.qsys file. Once it has finished openning select Generate HDL... and then click Generate. When the generation has Finished click Close and then click Finish in the Platform Designer window.
6. Back in the main Quartus Prime window select Processing->Start Complilation. Compliation should now take place (the length of time can vary between computers but will be measured in minutes).
7. When the build is complete a suitable programming file (bit steam) can be created by selecting File->Convert Programming Files. On the following window, select the Programming File Type to be "Raw Binary File (rbf)", select the mode to be Passive Parallel x16. Select the SOF Data and then click on Add File... On the following window choose the BASIC_NANO_SOC.sof file. Then select this file and click on Properties and check the Compression tick-box, before OK. Finally click Generate. The file that is geneated can then be copied over the file provided in the SD card image provided by Terasic for the DE0 Nano SoC.


mkimage -A arm -O linux -T script -C none -n boot.scr -d boot.scr boot.scr.uimg

dd if=sdcard_cv.img of=/dev/sdb bs=4M conv=fsync
