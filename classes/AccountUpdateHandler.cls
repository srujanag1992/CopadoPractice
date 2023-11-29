public class AccountUpdateHandler {

    public static void updateCustomField(List<Account> accountsToUpdate) {
        for (Account acc : accountsToUpdate) {
            // Update the custom field based on some condition (e.g., set it to 'Updated' if the Name contains 'Test')
            if (acc.Name != null && acc.Name.contains('Test')) {
                acc.Custom_Field__c = 'Updated';
            }
        }
        // Update the modified accounts
        update accountsToUpdate;
    }
}