class TransactionMonitors < Base
  
  def suspendMonitors(tag)
    options = {:tag => tag}
    post("suspendTransactionMonitor", options)
  end

  def suspendMonitors(monitorIds)
    options = {:monitorIds => monitorIds}
    post("suspendTransactionMonitor", options)    
  end

  def activateMonitors(tag)
    options = {:tag => tag}
    post("suspendTransactionMonitor", options)
  end

  def activateMonitors(monitorIds)
    options = {:monitorIds => monitorIds}  
    post("suspendTransactionMonitor", options)    
  end

  def getMonitors
     get("tests")
  end

  def getMonitorResults(testId, day, month, year, locationIds = nil, timezone = nil)
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

  def getMonitorInfo(testId)
    options = {:testId => testId}
    get("testinfo", options)
  end

end