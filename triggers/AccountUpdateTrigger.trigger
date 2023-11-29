trigger AccountUpdateTrigger on Account (before update) {
    List<Account> accountsToUpdate = new List<Account>();

    for (Account acc : Trigger.new) {
        // Check if the Name field is modified
        if (Trigger.oldMap.get(acc.Id).Name != acc.Name) {
            accountsToUpdate.add(acc);
        }
    }

    if (!accountsToUpdate.isEmpty()) {
        AccountUpdateHandler.updateCustomField(accountsToUpdate);
    }
}