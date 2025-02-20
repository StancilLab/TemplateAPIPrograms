# TemplateAPIPrograms
The two files in the respository are files that you can use as a template to follow to automate your pulls from REDCap. These files are supposed to be modified and will not work they are not. Guiding comments can be found throughout the code to help users better understand what the code means and what they need to change to utilize it.

The "template_APIprog.R" is the actual program file (in R) that will run. This is where you will use the REDCap API to pull your data, then clean or reshape your data (if you'd like), and finally export the data (as an excel workbook) to the location of your choice. Within the program, you can repeat the the code to call multiple reports from the same REDCap Project. If you would like to call reports from different projects, I would recommend duplicating the entire program. 

The "template_API.bat" is the file that calls the program to be run. You will add the paths to the program(s) that you want to run. I used the "task scheduler" that is built into my Windows computer to run this .bat file, which in turn runs each of the .R programs.

This code was developed by an amateur programmer for research purposes. Feel free to reach out if you have questions, comments, or improvements. 
