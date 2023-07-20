public class AccountTriggerHandler {

    public static void isCustomerType(list<Account> acclist)
    {
        List<contact> newContactList=new  List<contact>();
        Integer conCount =[select count() from contact where AccountId=:Trigger.new];
        for (Account acc : acclist) {
         if(acc.Type != null && acc.Type.contains('Customer'))
            {    
            if (acc.Active__c==true && conCount==0) {
                    Contact newContact = new Contact();
                    newContact.FirstName = 'Default';
                    newContact.LastName = 'Contact';
                    newContact.AccountId = acc.Id;
                    newContactList.add(newContact);
            }
           
        }
        }
        if (!newContactList.isEmpty()) {
            insert newContactList;
        }
    }
 
}