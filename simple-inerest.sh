#!/bin/bash
###############################################################################
# Simple Interest Calculator
# Description: Calculates simple interest based on user input
# Formula: SI = (P × R × T) / 100
# Where: P = Principal, R = Rate of Interest, T = Time Period
###############################################################################

echo "======================================"
echo "    Simple Interest Calculator"
echo "======================================"
echo ""

# Get Principal amount from user
echo -n "Enter the Principal amount: "
read principal

# Validate principal input
if ! [[ "$principal" =~ ^[0-9]+\.?[0-9]*$ ]] || [ $(echo "$principal <= 0" | bc) -eq 1 ]; then
    echo "Error: Principal must be a positive number"
    exit 1
fi

# Get Rate of Interest from user
echo -n "Enter the Rate of Interest (% per annum): "
read rate

# Validate rate input
if ! [[ "$rate" =~ ^[0-9]+\.?[0-9]*$ ]] || [ $(echo "$rate <= 0" | bc) -eq 1 ]; then
    echo "Error: Rate must be a positive number"
    exit 1
fi

# Get Time Period from user
echo -n "Enter the Time Period (in years): "
read time

# Validate time input
if ! [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]] || [ $(echo "$time <= 0" | bc) -eq 1 ]; then
    echo "Error: Time must be a positive number"
    exit 1
fi

# Calculate Simple Interest
# Formula: SI = (P × R × T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display results
echo ""
echo "======================================"
echo "  Calculation Results"
echo "======================================"
echo "Principal Amount (P): $principal"
echo "Rate of Interest (R): $rate% per annum"
echo "Time Period (T): $time years"
echo "--------------------------------------"
echo "Simple Interest: $simple_interest"
echo "Total Amount: $total_amount"
echo "======================================"

exit 0
