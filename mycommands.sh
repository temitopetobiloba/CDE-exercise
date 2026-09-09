pwd
mkdir raw # Create a directory named 'raw'

ls ~/Downloads

cd raw # Change the current directory to 'raw'

curl -O https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv

nano annual-enterprise-survey-2023-financial-year-provisional.csv # Open the CSV file in nano editor for review

awk -F, 'NR==1 { gsub(/Variable_code/, "variable_code") } { print $0 }' annual-enterprise-survey-2023-financial-year-provisional.csv > temp.csv && mv temp.csv annual-enterprise-survey-2023-financial-year-provisional.csv

git 

mv ~/Downloads/annual-enterprise-survey-2023-financial-year-provisional.csv raw/ # Move the CSV file to the 'raw' directory

git status # Check the status of the git repository

git add raw/annual-enterprise-survey-2023-financial-year-provisional.csv # Stage the CSV file for commit

git status #To confirm status of tracked file

git commit -m "Add annual enterprise survey 2023 financial year provisional data" # Commit the changes with a message

nano raw/annual-enterprise-survey-2023-financial-year-provisional.csv # Open the CSV file in nano editor for review

pwd # Print the current working directory
mkdir Transformed # Create a folder named 'Transformed'
# used RBQL console to create new table called 2023_year_finance.csv selcting year, Value, Units, variable_code
mv 2023_year_finance.csv Transformed/ # Move the new file 2023_year_finance.csv to the 'Transformed' folder
git status # Check the status of the git repository
git add Transformed/2023_year_finance.csv # Stage the new file for commit
ls Transformed/ # List the contents of the 'Transformed' directory
git commit -m "Add transformed data 2023 _year_finance data" # Commit the changes with a message
git add . # Stage all changes in the current directory for commit 
git status # Check the status of the git repository
git push # Push the committed changes to the remote repository
mkdir Gold # Create a folder named 'Gold'
git status # Check the status of the git repository
mv /Transformed 2023_year_finance.csv Gold/ # Move the transformed file to the 'Gold' directory
git status # Check the status of the git repository
git add Gold/2023_year_finance.csv # Stage the file in the 'Gold'
ls Gold/ # List the contents of the 'Gold' directory to confirm the file is moved here
git add . # Stage all changes in the current directory for commit
git status # Check the status of the git repository
git commit -m "Add Gold data 2023_year_finance data" # Commit the changes with a message
git push # Push the committed changes to the remote repository
pwd # Print the current working directory to verify the location

crontab -e # Open the crontab editor to schedule tasks
# Add the following line to schedule the script to run at 2 AM every day

0 0 * * * export Transformed/2023_year_finance.csv ="/Users/Tootees/Desktop/CDE-exercise/Gold/Transformed/2023_year_finance.csv" && bash /Users/Tootees/Desktop/CDE-exercise/clean_data.sh >> /Users/Tootees/Desktop/CDE-exercise/daily_run.log 2>&1

git status # Check the status of the git repository

git add . # Stage all changes in the current directory for commit

git commit -m "Add cron job for daily data processing" # Commit the changes with a message

crontab -l # List the current cron jobs to verify the new job is added

echo "0 0 * * * export 2023_year_finance.csv=\"/Users/tootees/Desktop/CDE-exercise/Gold/Transformed/2023_year_finance.csv\" && bash /Users/tootees/Desktop/CDE-exercise/clean_data.sh >> /Users/tootees/Desktop/CDE-exercise/daily_run.log 2>&1" > my_cron_job.txt
