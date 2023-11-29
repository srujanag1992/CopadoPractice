@isTest
private class AccountUpdateHandlerTest {

    @isTest
    static void testUpdateCustomField() {
        // Create test data
        Account testAccount1 = new Account(Name = 'Test Account 1');
        Account testAccount2 = new Account(Name = 'Another Account');

        insert new List<Account>{testAccount1, testAccount2};

        // Invoke the method to be tested
        List<Account> accountsToUpdate = [SELECT Id, Name, Custom_Field__c FROM Account];
        AccountUpdateHandler.updateCustomField(accountsToUpdate);

        // Verify the results
        testAccount1 = [SELECT Id, Custom_Field__c FROM Account WHERE Id = :testAccount1.Id];
        testAccount2 = [SELECT Id, Custom_Field__c FROM Account WHERE Id = :testAccount2.Id];

        System.assertEquals('Updated', testAccount1.Custom_Field__c);
        System.assertEquals(null, testAccount2.Custom_Field__c); // No update expected for this account
    }
}