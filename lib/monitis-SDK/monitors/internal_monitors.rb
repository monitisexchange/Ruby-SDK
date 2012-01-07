class InternalMonitors < Base
  
  def deleteMonitors(testIds, type)
    options={:testIds=>testIds,:type=>type}
    post("deleteInternalMonitors",options)      
  end

  def getMonitors(types = nil, tag = nil, tagRegExp = nil)     
    options = {
      :types => types,
      :tag => tag,
      :tagRegExp => tagRegExp
    }
    get("internalMonitors", options)
  end

end  