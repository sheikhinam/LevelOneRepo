@isTest
public class AccountTriggerTest {
    @isTest
    static void testAccountTrigger() {
        // Create a new Account
        Account acc = new Account();
        acc.Name = 'Test Account';
        acc.Type = 'Customer';
        acc.Active__c = true;
        acc.Account_Activation_Summary__c = 'demo summary';    

        // Insert the Account into the database
        insert acc;

        // Retrieve the Account from the database
        Account insertedAccount = [SELECT Id, Name, Type, Active__c, Account_Activation_Summary__c FROM Account WHERE Id = :acc.Id];

       
        System.assertEquals('Test Account', insertedAccount.Name, 'Account Name should match');
     }
}