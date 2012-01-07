class ProcessMonitors < Base
     
  def addMonitor(options = {})
     post("addProcessMonitor", options)
  end

  def editMonitor(options = {})
    post("editProcessMonitor", options)
  end

  def getMonitor(agentId)
    options = {:agentId => agentId}
    get("agentProcesses", options)
  end

  def getMonitorInfo(monitorId)
    options = {:monitorId => monitorId}
    get("processInfo", options)
  end

  def getResults(monitorId, day, month, year)
    options = {
      :monitorId => monitorId,
      :day => day,
      :month => month,
      :year => year,
      :timezone => Time.now.gmt_offset / 60
    }
    get("processResult", options)
  end
 
end