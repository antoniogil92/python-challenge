# First we'll import the os module
# This will allow us to create file paths across operating systems
import os

# Module for reading CSV files
import csv

#csvpath = OneDrive/Escritorio/LearnPython/Assignment1/accounting.csv
csvpath = "C:/Users/anton/budget_data.csv"

# # Method 1: Plain Reading of CSV files
# with open(csvpath, 'r') as file_handler:
#     lines = file_handler.read()
#     print(lines)
#     print(type(lines))

# Method 2: Improved Reading using CSV module
counter = 0
with open(csvpath, newline='') as csvfile:

  # CSV reader specifies delimiter and variable that holds contents
  csvreader = csv.reader(csvfile, delimiter=',')

  print(csvfile)

  # Read the header row first (skip this step if there is now header)
  csv_header = next(csvreader,None)

  print(csv_header)
  value1 = next(csvreader,None)
  profit = 0
  number_of_months = 1
  prev_net = int(value1 [1])
  net_change = 0
  average_list = []
  month_list = []

  for i in csvreader:
      loss = i[1]
      profit = int(loss) + profit
      number_of_months = number_of_months + 1
      net_change = int(loss) - prev_net
      prev_net = int(loss)
      average_list.append(net_change)
      month_list.append(i[0])



print("Months: " + str(number_of_months))
print("The total is: $ " + str(profit))
print('The average is ' + str(sum(average_list)/len(average_list)))

Max = max(average_list)
month_max = [i for i, j in enumerate(average_list) if j == Max]
Min = min(average_list)
month_min = [i for i, j in enumerate(average_list) if j == Min]
print("Greatest Increase in Profits:", month_list[month_max[0]], max(average_list))
print("Greatest Decrease in Profits:", month_list[month_min[0]], min(average_list))