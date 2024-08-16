Given a directory of MEG files (in this case a .fif and .txt file per person) containing all participants, this PowerShell script will create a folder based on the participant ID, and move .fif and .txt files into their corresponding participant folder.

**The current functionality of this script assumes four things:**

1- Each participant has one .fif MEG file, and one .txt log file. 

2- Each participant has a unique ID that is located at the beginning of both the .fif and the log file names.

3- All files (.fif and log) are currently located in the same directory.

4- You want each participant to have their own folder named with their participant ID that contains only their .fif and log file
