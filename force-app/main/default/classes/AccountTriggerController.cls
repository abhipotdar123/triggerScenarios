public with sharing class AccountTriggerController {
    public AccountTriggerController() {
    }
	
    public static void beforeDelete(List<Account> lstAccounts) {
        for(Account acc: lstAccounts){
            if(acc.Active__c == 'Yes'){
                System.debug('Account is active cannot be deleted: '+acc);
                acc.addError('You can not delete this Account, As this Account still active');
            }
        }
    }
}