({
    activateAccount: function (component, event, helper) {
        var accountRecordId = component.get("v.recordId");
        var activationSummary = component.find("summaryInput").get("v.value");
	   
        if (!activationSummary) {
            alert("Please enter the Account Activation Summary."+accountRecordId);
            return;
        }

        var action = component.get('c.getActivateAccount');
        
        action.setParams({
            'accountId': accountRecordId,
            'activationSummary': activationSummary
        });

        action.setCallback(this,function(response) {
            var state = response.getState();
         
            if (state === "SUCCESS") {
           		var returnValue=response.getReturnValue();
                alert('data comming -- '+returnValue);
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title : 'Success',
                        message: 'Account is Activated '+accountRecordId,
                        type: 'success'
                    });
                    toastEvent.fire();
                
            } else if (state === "ERROR") {
            
                var errors = response.getError();
                if (errors) {
                   alert(error);
                }
            }
        });

        $A.enqueueAction(action);
         
    }
})