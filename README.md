# Multiplication Table Generator

This Bash script generates multiplication tables based on user input. It allows users to create either full tables (1-10) or partial tables with a custom range.

## Script Overview

The script (`multiplication-table.sh`) follows these main steps:

1. **Start an infinite loop**
   ```bash
   while true; do
       # ... code inside the loop ...
   done
   ```

2. **Prompt for user input**
   ```bash
   read -p "Enter a number for the multiplication table: " number
   read -p "Do you want a full table or a partial table? (f/p): " choice
   ```

3. **Validate input**
   ```bash
   if [ -z "$number" ]; then
       echo "Number cannot be empty. Please try again."
       continue
   fi

   if ! [[ "$number" =~ ^[0-9]+$ ]]; then
       echo "Invalid input. Please enter a valid number."
       continue
   fi
   ```

4. **Process full table option**
   ```bash
   if [ "$choice" == "f" ]; then
       for i in {1..10}; do
           echo "$number * $i = $((number * i))"
       done
       break
   ```

5. **Process partial table option**
   ```bash
   elif [ "$choice" == "p" ]; then
       read -p "Enter the starting number: " start
       read -p "Enter the ending number: " end

       if [ $start -gt $end ]; then
           echo "Starting number is greater than ending number. Please try again."
           continue
       else
           echo "The Partial multiplication table for $number from $start to $end:"
           for i in $(seq $start $end); do
               echo "$number * $i = $((number * i))"
           done
           break
       fi
   ```

6. **Handle invalid choice**
   ```bash
   else
       echo "Invalid choice. Please enter 'f' for full table or 'p' for partial table."
       continue
   fi
   ```

## Key Features

- Uses a `while true` loop for continuous prompting until valid input is provided
- Validates user input for the number and table choice
- Generates full tables using a simple `for` loop from 1 to 10
- Creates partial tables using the `seq` command for custom ranges
- Utilizes arithmetic expansion `$((number * i))` for calculations
- Employs `break` to exit the loop after generating a valid table
- Uses `continue` to restart the loop if invalid input is detected

This interactive script provides an easy way for users to generate multiplication tables for any given number, with the flexibility to choose between full and partial tables.

