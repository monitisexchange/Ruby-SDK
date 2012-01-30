class CPUMonitors < Base

  def addMonitor(options = {})
  	options.merge!(@default_options)
  	options[:action] = "addCPUMonitor"
  	pp options
  	res = HTTParty.post("http://www.monitis.com/api", :body => options)
  	Crack::JSON.parse(res)
  end

  def editMonitor(options = {})
    options.merge!(@default_options)
    options[:action] = "editCPUMonitor"
    pp options
    res = HTTParty.post("http://www.monitis.com/api", :body => options)
    Crack::JSON.parse(res)
  end

  def getMonitors(agentId)
    query = @default_options
    query.merge!({
      :action => "agentCPU",
      :agentId => agentId
    })
    options = {:query => query}
    pp query
    HTTParty.get("http://www.monitis.com/api", options)
  end

  def getMonitorInfo(monitorId )
    query = @default_options
    query.merge!({
      :action => "CPUInfo",
      :monitorId => monitorId
    })
    options = {:query => query}
    pp query
    HTTParty.get("http://www.monitis.com/api",options)
  end

  def getResults(monitorId, day, month, year)
    query = @default_options
    query.merge!({
      :action => "cpuResult",
      :monitorId => monitorId,
      :day => day,
      :month => month,
      :year => year,
      :timezone => Time.now.gmt_offset / 60
    })
    options = {:query => query}
    pp query
    HTTParty.get("http://www.monitis.com/api", options)
  end

  def getTopResults(limit = 10, tag = "Default")
    query = @default_options
    query.merge!({
      :action => "topcpu",
      :limit => limit,
      :tag => tag,
      :timezone => Time.now.gmt_offset / 60
    })
    options = {:query => query}
    pp query
    HTTParty.get("http://www.monitis.com/api",options)
  end

end