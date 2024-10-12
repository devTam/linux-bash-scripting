#!/bin/bash
# Uses List Format for the multiplication table
while true; do
    read -p "Enter a number for the multiplication table: " number
    echo ""
    read -p "Do you want a full table or a partial table? (f/p): " choice
    echo ""

    if [ -z "$number" ]; then
        echo "Number cannot be empty. Please try again."
        echo ""
        continue
    fi

    if ! [[ "$number" =~ ^[0-9]+$ ]]; then
        echo "Invalid input. Please enter a valid number."
        echo ""
        continue
    fi

    if [ "$choice" == "f" ]; then
        for i in {1..10}; do
            echo "$number * $i = $((number * i))"
            echo ""
        done
        break
    elif [ "$choice" == "p" ]; then
        read -p "Enter the starting number: " start
        echo ""
        read -p "Enter the ending number: " end
        echo ""

        if [ $start -gt $end ]; then
            echo "Starting number is greater than ending number. Please try again."
            echo ""
            continue
        else
            echo "The Partial multiplication table for $number from $start to $end:"
            echo ""
            for i in $(seq $start $end); do
                echo "$number * $i = $((number * i))"
                echo ""
            done
            break
        fi
    else
        echo "Invalid choice. Please enter 'f' for full table or 'p' for partial table."
        echo ""
        continue
    fi
done


#Uses C-style format for the multiplication table

for ((i=0; i <=10; i++)); do
    echo "$number * $i = $((number * i))"
    echo ""
done

# for ((i=start; i<=end; i++)); do
    echo "$number * $i = $((number * i))"
    echo ""
done

# For custom ranges, C-style format is easier and more flexible than List Format
