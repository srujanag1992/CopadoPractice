@isTest
private class FriendControllerTest {
    @isTest
    static void testUpdateFriendStatus() {
        // Test data setup
        List<Friend__c> friendList = new List<Friend__c>();
        for (Integer i = 0; i < 5; i++) {
            friendList.add(new Friend__c(Name = 'Friend ' + i));
        }
        insert friendList;

        // Test the updateFriendStatus method
        FriendController.updateFriendStatus(friendList);

        // Verify that the status is updated to 'Active'
        for (Friend__c friend : [SELECT Status__c FROM Friend__c WHERE Id IN :friendList]) {
            System.assertEquals('Active', friend.Status__c);
        }
    }
}