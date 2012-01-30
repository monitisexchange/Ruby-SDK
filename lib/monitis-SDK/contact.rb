class Contact < Base
   
  def addContact(options = {})
    post("addContact", options)
  end

  def editContact(options = {})
    pp post("editContact", options)
    #	confirmContact(options["contactId"],response["data"]["confirmationKey"]) if  response["data"]["confirmationKey"]
  end

  def deleteContact(*args)
    if args.size == 1 
      options = {:contactId => args[0]}
    else
      options = {:account => args[0], :contactType => args[1]}
    end
    post("deleteContact", options)
  end

  def confirmContact(contactId, confirmationKey)
    options = {:contactId => contactId, :confirmationKey => confirmationKey}
    post("confirmContact", options)
  end

  def activateContact(contactId)
  	options = {:contactId => contactId}
    post("contactActivate", options)
  end

  def deactivateContact(contactId)
  	options = {:contactId => contactId}
    post("contactDeactivate",options)
  end

  def getContactGroups
    get("contactGroupList")
  end

  def getRecentAlerts(timezone, startDate, endDate, limit)
    options = {
      :timezone => timezone,
      :startDate => startDate.to_i,
      :endDate => endDate.to_i,
      :limit => limit
    }
    get("recentAlerts",options)
  end
      
end