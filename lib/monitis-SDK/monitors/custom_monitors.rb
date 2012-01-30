class CustomMonitors < Base
    
  def addMonitor(options = {})
    post("addMonitor", options)
  end

  def editMonitor(options = {})    
    post("editMonitor", options)
  end

  def deleteMonitors(monitorIds)
   options = {:monitorId => monitorIds}   
   post("deleteMonitor",options)    
  end

  def getMonitors(tag)
    options = {:tag => tag}
    get("getMonitors", options)
  end

  def getMonitorInfo(testId, excludeHidden = false)
    options = {:testId => testId, :excludeHidden => excludeHidden}    
    get("testinfo", options)
  end

  def getMonitorResults(testIId, day, month, year, locationIds = nil, timezone = nil)
    options = {
      :testId => testId,
      :day => day,
      :month => month,
      :year => year,
      :locationIds => locationIds,
      :timezone => timezone
    }
    get("testresult", options)
  end

  def addMonitorResult(options = {})	
    post("addResult", :options)	
  end
 
end