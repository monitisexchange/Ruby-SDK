class CloudInstances < Base

   def getCloudInstances    
    options = {:timezoneoffset => Time.now.abs.gmtoff / 60}
    get("cloudInstances", options)
   end

   def getCloudInstanceInfo(instanceId)
     options = {:instanceId => instanceId, :timezoneoffset => Time.now.abs.gmtoff / 60}
     get("cloudInstanceInfo", options)
   end

end