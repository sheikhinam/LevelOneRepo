public with sharing class AccountActivationController {
    @AuraEnabled
    public static void activateAccount(Id accountId, String activationSummary) {
    
        Account acc = [SELECT Id, Name, Active__c, Account_Activation_Summary__c FROM Account WHERE Id = :accountId];

        // Update the account fields
        acc.Active__c = True;
        acc.Account_Activation_Summary__c = activationSummary;
       
        update acc;
        
    }
}