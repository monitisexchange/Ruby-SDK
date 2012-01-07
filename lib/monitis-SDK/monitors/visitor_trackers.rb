class TransactionMonitor < Base

  def getVisitorTrackers
    get("visitorTrackingTests")
  end
    
  def getVisitorTrackerInfo(siteId)
    options = {:siteId => siteId}
    get("visitorTrackingInfo", options)
  end

end