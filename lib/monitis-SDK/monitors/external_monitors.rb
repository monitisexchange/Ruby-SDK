class ExternalMonitors < Base
  
  def addMonitor(options = {})
    post("addExternalMonitor", options)
  end

  def editMonitor(options = {})
    post("editExternalMonitor", options)
  end

  def deleteMonitors(testIds)
    options = {:testIds => testIds}
    post("deleteExternalMonitor", options)
  end

  def suspendMonitors(monitorIds)
    options = {:monitorIds => monitorIds}    
    post("suspendExternalMonitor", options)
  end

  def activateMonitors(type, value)
      options = {:type => value}
      post("activateExternalMonitor", options)
  end

  def getLocations
    get("locations")
  end

  def getMonitors
    get("tests")
  end

  def getMonitorInfo(testId)
    options = {:testId => testId}
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

  def getSnapshot(locationIds = nil)
    options = {:locationIds => locationIds}
    get("testsLastValues", options)
  end

  def getTopResults(limit = 10, tag = "Default")
    options = {
      :limit => limit,
      :tag => tag,
      :timezone => Time.now.gmt_offset / 60
    }
    get("topexternal", options)
  end

  def getTags
    get("tags")
  end
 
 def getMonitorsByTags(tag)
    options = {:tag => tag}
    get("tagtests", options)
 end
 
end