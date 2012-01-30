class LoadAverageMonitors < Base

  def addMonitor(options = {})
    post("addLoadAverageMonitor", options)
  end

  def editMonitor(options = {})
    post("editLoadAverageMonitor", options)
  end

  def getMonitor(agentId)
    options= {:agentId => agentId}
    get("agentLoadAvg", options)
  end

  def getMonitorInfo(monitorId )
    options = {:monitorId => monitorId}
    get("loadAvgInfo", options)
  end

  def getResults(monitorId, day, month, year)
     options = {
       :monitorId => monitorId,
       :day => day,
       :month => month,
       :year => year,
       :timezone => Time.now.gmt_offset / 60
     }
     get("loadAvgResult", options)
   end

  def getTopResults(limit = 10, tag = "Default")    
    options = {
      :limit => limit,
      :tag => tag,
      :timezone => Time.now.gmt_offset / 60
    }
    get("topload1", options)
  end

end