trigger CaseTrigger on Case (before insert) {
    
    List<Case> listCase=(List<Case>)Trigger.New;
    Group grpData=[Select ID From Group where DeveloperName='Australia_Finance_Dept'];
    String queueId=grpData.Id;
    for(Case caserec:listCase)
    {
        if(caserec.Type=='Fianace'  && caserec.Country__C=='Australia')
        {
            caserec.OwnerId=queueId;
        }
    }
    
}