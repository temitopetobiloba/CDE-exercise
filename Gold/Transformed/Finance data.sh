git clone https://github.com/temitopetobiloba/CDE-exercise.git

cd CDE-exercise #To navigate into the cloned repository

git status #To check the status of the repository

mkdir raw #To create a new directory called "raw" in the repository

cd raw #To navigate into the "raw" directory

export MY_CSV_URL="https://www.stats.govt.nz/assets/Uploads/Annual-enterprise-survey/Annual-enterprise-survey-2023-financial-year-provisional/Download-data/annual-enterprise-survey-2023-financial-year-provisional.csv"

curl -O $MY_CSV_URL #To download the CSV file from the URL and save it in the current directory

ls #To list the contents of the current directory and verify that the CSV file has been downloaded

cd .. #To navigate back to the root of the repository

mkdir Transformed #To create a new directory called "Transformed" in the repository

# Define the exact file names
INPUT_FILE="raw/annual-enterprise-survey-2023-financial-year-provisional.csv"
OUTPUT_FILE="raw/updated_column_name.csv"

# Run the transformation to rename Variable_code to variable_code and keep all columns
awk -F, 'NR==1 { gsub(/Variable_code/, "variable_code") } { print $0 }' "$INPUT_FILE" > "$OUTPUT_FILE"

echo "Transformation complete! Saved to $OUTPUT_FILE"

awk -F, '{ print $1 "," $5 "," $6 "," $9 }' "$OUTPUT_FILE" > temp.csv && mv temp.csv "$OUTPUT_FILE" #select only required columns

mv "$OUTPUT_FILE" "Transformed/2023_year_finance.csv" #Rename the transformed file and move it to the "Transformed" directory

git add Transformed/2023_year_finance.csv #To stage the transformed file for commit


git status #To check the status of the repository and see the staged changes

cd .. #To navigate back to the root of the repository

mkdir Gold #To create a new directory called "Gold" in the repository

echo "Moving the transformed file to the Gold directory..."

git status #To check the status of the repository and see the staged changes

git add Gold/2023_year_finance.csv #To stage the transformed file for commit in the Gold directory

mv Transformed Gold/ #Move the transformed file to the "Gold" directory

git restore --staged Transformed/2023_year_finance.csv #Unstage the file from the "Transformed" directory

echo "File moved to Gold directory and staged for commit."

git add.. #To stage all changes in the repository

git status #To check the status of the repository and see the staged changes

git commit -m "Transformed and moved the CSV file to Gold directory" #To commit the changes with a message

git add #To stage any additional changes if needed

git push origin main #To push the committed changes to the remote repository on the main branch

git add #To stage any additional changes made to the repository

git push origin main #To push the committed changes to the remote repository on the main branch

move_csv_json.sh #To run script that moves all CSV files to a folder named Json and CSV -- couldnt figure this out