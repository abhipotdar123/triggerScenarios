public with sharing class ContactTriggerHandler {
    public ContactTriggerHandler() {

    }

    public static void beforeDelete(List<contact> lstContacts) {
        Set<ID> accountIds = new Set<ID>();
        Map<Id, Account> accountMap = new Map<Id, Account>();

        for (contact con : lstContacts) {
            accountIds.add(con.accountId);
        }

        List<Account> parentAccounts = [SELECT Id, Name, Active__c FROM Account WHERE Id=: accountIds];
        accountMap.putAll(parentAccounts);

        for(contact con: lstContacts){
            Account parentAccount = accountMap.get(con.accountId);
            if(con.accountId != null && parentAccount.Active__c == 'Yes'){
                con.addError('This contact having Active Account so cannot be deleted');
            }
        }
    }
}