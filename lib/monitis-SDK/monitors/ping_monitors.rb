class PingMonitors

  def  addMonitor(options = {})
     post("addInternalPingMonitor", options)	
  end

  def editMonitor(options = {})
    post("editInternalPingMonitor", options)
  end

  def getMonitor(agentId)
    options = {:agentId => agentId}
    get("agentPingTests", options)
  end

  def getMonitorInfo(monitorId)
    options = {:monitorId => monitorId}
    get("internalPingInfo", options)
  end

  def getResults(monitorId, day, month, year)
    options = {
      :monitorId => monitorId,
      :day => day,
      :month => month,
      :year => year,
      :timezone => Time.now.gmt_offset / 60
    }
    get("internalPingResult", options)
  end

end