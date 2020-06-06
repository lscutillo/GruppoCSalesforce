public with sharing class ConferenceController {
   
    @AuraEnabled
    public static List<Conferenza__c> getLuoghi(){
        return [select Name
         from Conferenza__c];
    }


    @AuraEnabled
    public static List<Conferenza__c> getConferenzePerManifestazione(Id id){
        return [select Name
        from Conferenza__c where Manifestazione__r.Id =:id];
    }
}