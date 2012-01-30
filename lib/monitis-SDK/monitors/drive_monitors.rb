class DriveMonitors < Base

  def addMonitor(options = {})
  	post("addDriveMonitor", options)
  end

  def editMonitor(options = {})
    post("editDriveMonitor", options)
  end

  def getMonitors(agentId)
    options = {:agentId => agentId}
    get("agentDrive", options)
  end

  def getMonitorInfo(monitorId )
    options = {:monitorId => monitorId}
    get("getMonitorInfo", options)
  end

  def getResults(monitorId, day, month, year)
      options = {
        :monitorId => monitorId,
        :day => day,
        :month => month,
        :year => year,
        :timezone => Time.now.gmt_offset / 60
      }
      get("driveResult", options)
  end

  def getTopResults(limit = 10, tag = "Default")
    options = {
      :limit => limit,
      :tag => tag,
      :timezone => Time.now.gmt_offset / 60
    }
    get("topdrive", options)
  end
 
end