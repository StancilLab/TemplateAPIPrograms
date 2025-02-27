# TemplateAPIProgram
The file in the respository can be used as a template to follow to automate your pulls from REDCap. The file must be to be modified and will not work otherwise. Guiding comments can be found throughout the code to help users better understand what the code means and what they need to change to utilize it.

The "template_APIprog.R" is an R program file. This is where you will use the REDCap API to pull your data, then clean or reshape your data (if you'd like), and finally export the data (as an excel workbook) to the location of your choice. Within the program, you can repeat the the code to call multiple reports from the same REDCap Project. If you would like to call reports from different projects, I would recommend duplicating the entire program. 

# Lines of Code to Update
The following lines of code must be changed for proper utilization:

Line 13: Add your API token generated through REDCap in the quotation marks.

Line 30: Add a path to the location where you want your .xlsx saved. Make sure to use two \\ in the path and to end the path with the name of your exported data file .xlsx.

Line 33: In the REDCap API playground, change API method to "Export Reports" and select your first report under report ID. At the bottom, select the R tab. Copy the URL in quotes and insert into the quotes on this line.

Line 59: From the same API page, find the line that has the report ID (likely a 5 digit number). Copy this number and paste it in the quotation marks in this line.

# How to run
  `Rscript "C:\Users\Path\To\Program\template_APIprog.R"`

We utilized the task scheduler and a bash file (Windows only) to set a time to call this program to run daily.


Please note, this code was developed by an amateur programmer for research purposes. Feel free to reach out if you have questions, comments, or improvements. 
