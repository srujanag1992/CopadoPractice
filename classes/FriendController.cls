public class FriendController {
    public static void updateFriendStatus(List<Friend__c> friendList) {
        for (Friend__c friend : friendList) {
            // Your custom logic here
            friend.Status__c = 'Active';
        }
        update friendList;
    }
}