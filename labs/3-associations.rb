# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

contact1 = Contact.find_by({"first_name" => "Tim", "last_name" => "Cook"})
contact2 = Contact.find_by({"first_name" => "Jeff", "last_name" => "Bezos"})
salesperson = Salesperson.find_by({"first_name" => "John", "last_name" => "Doe"})
company1 = Company.find_by({"name" => "Apple"})
company2 = Company.find_by({"name" => "Amazon"})

new_activity = Activity.new
new_activity["contact_id"] = contact1["id"]
new_activity["salesperson_id"] = salesperson["id"]
new_activity["company_id"] = company1["id"]
new_activity["notes"] = "Quick checkin over Facetime"
new_activity.save

new_activity = Activity.new
new_activity["contact_id"] = contact1["id"]
new_activity["salesperson_id"] = salesperson["id"]
new_activity["company_id"] = company1["id"]
new_activity["notes"] = "Met at Cupertino"
new_activity.save

new_activity = Activity.new
new_activity["contact_id"] = contact2["id"]
new_activity["salesperson_id"] = salesperson["id"]
new_activity["company_id"] = company2["id"]
new_activity["notes"] = "met at Blue Origin HQ"
new_activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

activity_log = Activity.where({"salesperson_id" => salesperson["id"], "contact_id" => contact1["id"]})

puts "Activities between #{salesperson["first_name"]} and #{contact1["first_name"]} #{contact1["last_name"]}"
for activity in activity_log
    puts "- #{activity["notes"]}"
end

# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

activity_log = Activity.where({"salesperson_id" => salesperson["id"]})

puts "-------------------------------------------"
puts "#{salesperson["first_name"]}'s Activities:"
for activity in activity_log
    #retrieve contact name from contact id
    first_name = Contact.find_by({"id" => activity["contact_id"]})["first_name"]
    last_name = Contact.find_by({"id" => activity["contact_id"]})["last_name"]
   
    puts "#{first_name} #{last_name} - #{activity["notes"]}"
end

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

puts "-------------------------------------------"
puts "#{salesperson["first_name"]}'s Activities:"
for activity in activity_log
    
    #retrieve contact name from contact id
    first_name = Contact.find_by({"id" => activity["contact_id"]})["first_name"]
    last_name = Contact.find_by({"id" => activity["contact_id"]})["last_name"]
    #retreive company name
    company_name = Company.find_by({"id" => activity["company_id"]})["name"]

    puts "#{first_name} #{last_name} (#{company_name}) - #{activity["notes"]}"
end


# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

puts "-------------------------------------------"
salesperson_list = Salesperson.all
activity_log = Activity.all

for people in salesperson_list
    count_activity = 0
    for activity in activity_log
        if people["id"] == activity["salesperson_id"]
            count_activity = count_activity + 1
        end  
    end
    puts "#{people["first_name"]} #{people["last_name"]}: #{count_activity} activities" 
end

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
