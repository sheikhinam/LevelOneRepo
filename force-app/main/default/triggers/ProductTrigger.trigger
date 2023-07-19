trigger ProductTrigger on Product__c (before insert ,after update) {
  // all the Account Ids associated with the Products
    Set<Id> accountIds = new Set<Id>();
    for (Product__c prod : Trigger.new) {
        if (prod.Account__c != null) {
            accountIds.add(prod.Account__c);
        }
    }
    
    // Retrieve the Account records associated with the Products
    Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id FROM Account WHERE Id IN :accountIds]);
    List<Product__c> prodList=new List<Product__c>();
    for (Product__c prod : Trigger.new) {
        if (prod.Account__c != null && accountsMap.containsKey(prod.Account__c)) {
            prod.Email__c = accountsMap.get(prod.Account__c).Company_Email__c;
            prod.Phone__c= accountsMap.get(prod.Account__c).Phone;
            prod.Name=accountsMap.get(prod.Account__c).Name;
            prod.Last_Name__c='Customer Representative';
        }
        prodList.add(prod);
    }
    if(!prodList.isEmpty())
    {
        update prodList;
    }
        
}