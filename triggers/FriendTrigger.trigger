trigger FriendTrigger on Friend__c (after insert) {
    public void updateFriendStatus(List<Friend__c> newFriends) {
        FriendController.updateFriendStatus(newFriends);
    }

    if (Trigger.isAfter && Trigger.isInsert) {
        updateFriendStatus(Trigger.new);
    }
}