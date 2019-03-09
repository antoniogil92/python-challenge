# First we'll import the os module
# This will allow us to create file paths across operating systems
import os

# Module for reading CSV files
import csv
import math

#csvpath = OneDrive/Escritorio/LearnPython/Assignment1/accounting.csv
csvpath = "C:/Users/anton/election_data.csv"

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

    print(csvreader)

    # Read the header row first (skip this step if there is now header)
    csv_header = next(csvreader,None)

    votecount = 0 
    elections = []
    elections1 = []
    elections2 = []
    elections3 = []
    elections4 = []
    maxvotes = 0 
    candidatemax = ""
    for i in csvreader:
        # elections = [ID, County, Candidate]
        id = i[0]
        county = i[1]
        candidate = i[2]
        if candidate.startswith('K'):
            elections1.append(candidate)
        if candidate.startswith('C'):
            elections2.append(candidate)
        if candidate.startswith('L'):
            elections3.append(candidate)
        if candidate.startswith('O'):
            elections4.append(candidate)
        votecount = votecount + 1
        khan = len(elections1)/votecount * 100
        khan1 = math.floor(khan)
        carrey = len(elections2)/votecount * 100
        carrey1 = math.ceil(carrey)
        li = len(elections3)/votecount * 100 
        li1 = math.ceil(li)
        ot = len(elections4)/votecount * 100
        ot1 = math.ceil(ot)
        if maxvotes < len(elections1):
            maxvotes = len(elections1)
            candidatemax = "Khan"
        if maxvotes < len(elections2):
            maxvotes = len(elections2)
            candidatemax = "Carrey"
        if maxvotes < len(elections3):
            maxvotes = len(elections3)
            candidatemax = "Li"
        if maxvotes < len(elections4):
            maxvotes = len(elections4)
            candidatemax = "O'Tooley"
    
print('Election Results')
print('-------------------------------------------------------------------')
print('Total Votes: ' + str(votecount))
print('-------------------------------------------------------------------')

print('Khan: ' + str(khan1) + '%' + ' Votes: ' + str(len(elections1)))
print('Carrey: ' + str(carrey1) + '%' + ' Votes: ' + str(len(elections2)))
print('Li: ' + str(li1) + '%' + ' Votes: ' + str(len(elections3)))
print("O'Tooley: " + str(ot1) + '%' + ' Votes: ' + str(len(elections4)))
print('-------------------------------------------------------------------')
print(candidatemax + ' is the winner')




    


    