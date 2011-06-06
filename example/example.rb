require File.join('..','lib','monitis-SDK')
puts "Welcome to sample monitis App"
puts "Enter your API key"
apikey=gets.chomp!
puts "Enter your secret key"
secretkey=gets.chomp!
puts "Enter the operation you want to perform "
puts "1. Contact"
puts "2. External Monitor"
puts "Enter your choice"
choice_1=gets.chomp!
if(choice_1.eql?"1")
  contact = Contact.new(apikey,secretkey)
  while true
  puts("1. Add a contact")
  puts("2. Confirm a contact")
  puts("3. Activate a contact")
  puts("4. DeActivate a contact")
  puts("5. Get Contact Groups")
  puts("6. Get RecentAlerts")
  puts("Enter q to exit")
  puts("Enter your choice")
  choice_2 = gets.chomp!
  break  if choice_2.eql?("q")
  if choice_2.eql?"1"
    puts "Add Contact"
    puts "Enter First Name"
    firstname=gets.chomp!
    puts "Enter Last Name"
    lastname=gets.chomp!
    puts "Enter the group"
    group= gets.chomp!
    puts "Enter the account"
    account=gets.chomp!
    puts "Enter contact type"
    type=gets.chomp!
    puts "Enter timezone"
    timezone=gets.chomp!
    puts "Send Daily Report"
    sendDailyReport=gets.chomp!
    puts "Send Weekly Report"
    sendWeeklyReport = gets.chomp!
    puts "Send Monthly Report"
    sendMonthlyReport = gets.chomp!
    res=contact.addContact(:group=>group,:firstName=>firstname,:lastName=>lastname,:group=>group,:account=>account,
    :contactType=>type,:timezone=>timezone,:sendDailyReport=>sendDailyReport,:sendWeeklyReport=>sendWeeklyReport,:sendMonthlyReport=>sendMonthlyReport)  
    pp    contactId=res.fetch('data').fetch('contactId')
    pp   confirmationKey=res.fetch('data').fetch('confirmationKey')
  elsif choice_2.eql?"2"
    puts("Confirm contact")
    puts "Enter ContactId"
    contactId = gets.chomp!
    puts "Enter Confirmation Key"
    confirmationKey=gets.chomp!
    pp  contact.confirmContact(contactId,confirmationKey)
    puts "Contact Confirmed"
  elsif choice_2.eql?"3"  
    puts("Activate Contact ")
    puts "Enter ContactId"
    contactId = gets.chomp!
    pp    contact.activateContact(contactId)
    puts "Contact Activated"
   elsif choice_2.eql?"4"  
    puts("Deactivate Contact ")
    puts "Enter ContactId"
    contactId = gets.chomp!
    pp    contact.deactivateContact(contactId)
    puts "Contact Deactivated"
  end
end
elsif(choice_1.eql?"2")
  ext = ExternalMonitors.new(apikey,secretkey)
  while true
  puts("1. Add an external monitor")
  puts("2. Activate an external monitor")
  puts("3. Suspend an external monitor")
  puts("4. Get Monitors")
  puts("5. Get Monitor Info")
  puts("6. Get Monitor Results")
  puts("7. Get Snapshot")
  puts("8. Get Locations")
  puts("Enter q to exit")
  puts("Enter your choice")
  choice_2 = gets.chomp!
  break  if choice_2.eql?("q")
  if choice_2.eql?"1"
    puts "Add External monitor"
    puts "Enter Type"
    type=gets.chomp!
    puts "Enter Detailed Test Type "
    detailedTestType =gets.chomp!
    puts "Enter name "
    name = gets.chomp!
    puts "Enter url "
    url =gets.chomp!
    puts "Enter interval "
    interval =gets.chomp!
    puts "Enter timeout "
    timeout =gets.chomp!
    puts "Enter locationIds "
    locationIds =gets.chomp!
    puts "tag "
    tag = gets.chomp!
    puts "overSSL"
    overSSL = gets.chomp!
    res= ext.addMonitor(:type=>type,:detailedTestType =>detailedTestType,:name =>name,:url=>url,:interval=>interval,:timeout=>timeout,
    :locationIds=>locationIds,:tag=>tag,:overSSL=>overSSL) 
    pp    testId=res.fetch('data').fetch('testId')
  elsif choice_2.eql?"2"
    puts(" Activate an external monitor")
    puts "Enter TestIds"
    testId = gets.chomp!
    pp  ext.activateMonitors(:monitorIds,testId)
    puts "Tests Activated"
  elsif choice_2.eql?"3"  
    puts("Suspend Monitor ")
     puts "Enter TestIds"
    testId = gets.chomp!
    pp  ext.suspendMonitors(testId)
    puts "Tests Suspended"
   elsif choice_2.eql?"4"  
    puts("Get Monitors ")
    pp    ext.getMonitors
   elsif choice_2.eql?"5"  
    puts("Get Monitor Info ")
    puts "Enter testId"
    testId=gets.chomp!
    pp    ext.getMonitorInfo(testId)
  elsif choice_2.eql?"6"
    puts "Get Monitor Results"
    puts "Enter TestId"
    testId=gets.chomp!
    puts "Enter Day "
    day =gets.chomp!
    puts "Enter Month "
    month = gets.chomp!
    puts "Enter year "
    year =gets.chomp!
    puts "Enter timezone "
    timezone =gets.chomp!
    puts "Enter locationIds "
    locationIds =gets.chomp!
    res= ext.getMonitorResults(:testId=>testId,:day =>day,:month =>month,:year=>year,:timezonw=>timezone,
    :locationIds=>locationIds) 
   elsif choice_2.eql?"7"  
    puts("Get Snapshot ")
    puts "Enter locationIds"
    locationIds=gets.chomp!
    pp    ext.getSnapshot(locationIds)
   elsif choice_2.eql?"8"  
    puts("Get Locations ")
    pp    ext.getLocations
  end
end

end