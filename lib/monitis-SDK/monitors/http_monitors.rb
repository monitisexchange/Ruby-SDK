class HTTPMonitors < Base

  def addMonitor(options = {})
    post("addInternalHttpMonitor", options)
  end

  def editMonitor(options = {})
    post("editInternalHttpMonitor", options)
  end

  def getMonitor(agentId)
    options = {:agentId => agentId}    
    get("agentHttpTests", options)
  end

  def getMonitorInfo(monitorId )
    options = {:monitorId => monitorId}
    get("internalHttpInfo", options)
  end

  def getResults(monitorId, day, month, year)
    options = {
      :monitorId => monitorId,
      :day => day,
      :month => month,
      :year => year,
      :timezone => Time.now.gmt_offset / 60
    }
    get("internalHttpResult", options)
  end

end