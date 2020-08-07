/**
*   @Author         :   shivakanth
*   @Date           :   3/7/2015
*   @Description    :   Match User from Other Salesforce instance with this Salesforce.
*
**/
global class AutocreatedRegHandler1457531563479 implements Auth.RegistrationHandler{
     /**
     *  This method is used to match existing user, If not find then we can create new User.
     *  This method will be executed only first time so that Salesforce can relate two users
     */
    global User createUser(Id portalId, Auth.UserData data){
        User u = [SELECT ID FROM User Where other_sfdc_user__c = : data.username];
        return u;
    }

    /**
    *   Once Users are related, after that whenever user will return, this method wil be executed.
    *   If needed, we can perform any information needed.
    *   In this blog , we are not going to perform any operation in this method.
    */
    global void updateUser(Id userId, Id portalId, Auth.UserData data){
       //No Operation
    }
}