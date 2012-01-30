class Agents < Base 
  
  def getAgents(key)
    options = {:keyRegExp => key}
    get("agents", key)
  end
  
  def getAgentInfo(agentId, loadTests)
    options = {:agentId => agentId, :loadTests => loadTests}
    get("agentInfo",options)
  end
  
  def getAllAgentsSnapshot(platform = nil, tag = nil)
    options = {:platform => platform, :tag => tag, :timezone => Time.now.gmt_offset / 60}
    get("allAgentsSnapshot", options)
  end
  
  def getAgentSnapshot(agentKey)
    options = {:agentKey => agentKey, :timezone => Time.now.gmt_offset / 60}
    get("agentSnapshot", options)    
  end
  
  def deleteAgents(agentIds, keyRegExp)
    options = {:agentIds => agentIds, :keyRegExp => keyRegExp}
    post("deleteAgents",options)
  end
  
end