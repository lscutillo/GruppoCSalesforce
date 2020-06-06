public with sharing class ConferenceController {
   
    @AuraEnabled
    public static List<Conferenza__c> getLuoghi(){
        return [select Name,Luogo__r.Name ,Luogo__r.Citta__c,Luogo__r.Indirizzo__c,Luogo__r.Stato__c
         from Conferenza__c];
    }


    @AuraEnabled
    public static List<Conferenza__c> getConferenzePerManifestazione(Id id){
        return [select Name, Luogo__r.Name ,Luogo__r.Citta__c,Luogo__r.Indirizzo__c,Luogo__r.Stato__c
        from Conferenza__c where Manifestazione__r.Id =:id];
    }
}