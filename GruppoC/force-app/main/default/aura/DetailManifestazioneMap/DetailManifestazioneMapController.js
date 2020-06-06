({
    loadMap : function(component, event, helper) {
        var locationList = []
        var action = component.get("c.getConferenzePerManifestazione")
        action.setParams(
            {
                id : component.get("v.recordId")
            }
        )
        action.setCallback(this, function(response){
            if(response.getState() === "SUCCESS"){
                response.getReturnValue().forEach(conf =>{
                    var luogo = conf.Luogo__r
                    locationList.push({
                        location: {
                            Street: luogo.Indirizzo__c,
                            City: luogo.Citta__c,
                            State: luogo.Stato__c,
                        },
            
                        title: conf.Name,
                        description:
                            '',
                    })
                })
                console.log(locationList)
                if(locationList.length === 0){
                    component.set("v.messageIfListEmpty","Nessuna conferenza per la Manifestazione")
                    component.set("v.showMap",false)
                }
                else{
                component.set("v.mapMarkers",locationList) 
                }
            }
        })
         $A.enqueueAction(action)
            }  
})