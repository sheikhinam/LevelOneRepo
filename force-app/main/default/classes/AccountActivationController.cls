public with sharing class AccountActivationController {
    @AuraEnabled 
    public static Account getActivateAccount(Id accountId, String activationSummary) {
        
        Account acc = [SELECT Id, Name, Active__c, Account_Activation_Summary__c FROM Account WHERE Id = :accountId];
       
        // Update the account fields
        acc.Type='Customer - Channel';
        acc.Active__c = true;
        acc.Account_Activation_Summary__c = activationSummary;
        
        update acc;
        return acc;
    }
}