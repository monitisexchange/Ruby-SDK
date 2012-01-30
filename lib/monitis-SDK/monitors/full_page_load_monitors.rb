class FullPageLoadMonitors < Base

  def suspendMonitors(tag)
    options = {:tag => tag}
    post("suspendFullPageLoadMonitor", options)
  end

  def suspendMonitors(monitorIds)
    options = {:monitorIds => monitorIds}
    post("suspendFullPageLoadMonitor", options)
  end

  def activateMonitors(tag)
    options = {:tag => tag}	
    post("suspendFullPageLoadMonitor", options)    
  end

  def activateMonitors(monitorIds )
    options = {:monitorIds => monitorIds}    
    post("suspendFullPageLoadMonitor", options)
  end

end