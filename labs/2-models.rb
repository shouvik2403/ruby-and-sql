# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.
new_salesperson = Salesperson.new
new_salesperson["first_name"] = "John"
new_salesperson["last_name"] = "Doe"
new_salesperson["email"] = "john.doe@apple.com"
new_salesperson.save

new_salesperson = Salesperson.new
new_salesperson["first_name"] = "Albert"
new_salesperson["last_name"] = "Tucker"
new_salesperson.save

# 3. write code to display how many salespeople rows are in the database
puts "Salespeople: #{Salesperson.all.count}"

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.
person1 = Salesperson.find_by({"first_name" => "Albert", "last_name" => "Tucker"})
person1["email"] = "albert.tucker@amazon.com"
person1.save

# CHALLENGE:
# 5. write code to display each salesperson's full name
salesperson_list = Salesperson.all

for person in salesperson_list
    puts "#{person["first_name"]} #{person["last_name"]}"
end   

# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
