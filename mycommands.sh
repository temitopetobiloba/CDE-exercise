pwd
mkdir raw # Create a directory named 'raw'

ls ~/Downloads


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