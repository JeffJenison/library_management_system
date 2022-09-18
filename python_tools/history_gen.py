################# HISTORY GENERATOR ###################

import pandas as pd
import random
import time

### SET VARIABLES ###

# Set Start Date for Data Set
date_start = "1/1/2008 1:30 PM"
# Set Start Date for Data Set
date_end = "1/1/2009 4:50 AM"

# List for book wieght choices
book_list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
book_weights = [1, 1, 3, 1, 2, 4, 1, 1, 1, 2, 1, 1, 3, 1, 1, 4, 1, 2, 2, 1]

book_total_list = [0, 1, 2, 3, 4]
book_total_weight = [10, 6, 2, 1, 1]


### CREATE FUNCTIONS FOR RANDOM EVENTS ###

def str_time_prop(start, end, time_format, prop):

    stime = time.mktime(time.strptime(start, time_format))
    etime = time.mktime(time.strptime(end, time_format))

    ptime = stime + prop * (etime - stime)

    return time.strftime(time_format, time.localtime(ptime))


def random_date(start, end, prop):
    return str_time_prop(start, end, '%m/%d/%Y %I:%M %p', prop)
    
def emp():
    return random.randint(1, 3)

def cust():
    return random.randint(1, 15)

def book():
    b_choice = random.choices(book_list, weights= book_weights)
    return book_list[b_choice[0]]

def bookTotals():
    bt_choice = random.choices(book_total_list, weights= book_total_weight)
    return book_total_list[bt_choice[0]]


# Create dataframe
dict = {'visit_id':[],
        'trans_date':[],
        'cust_id':[],
        'emp_id':[],
        'book_id':[]
       }

pd.set_option('precision', 0)
df = pd.DataFrame(dict)

i = 1
# Create Records
while i <= 60:
    transaction = i
    employee = emp()
    customer = cust()
    book_count = bookTotals()
    date = random_date(date_start, date_end, random.random())
    b = 0

    while b < book_count:
        books = book()
        df.loc[len(df.index)] = [transaction, date, customer, employee, books]
        b += 1
    
    i += 1


df.to_csv("./files/output.csv", index = True)