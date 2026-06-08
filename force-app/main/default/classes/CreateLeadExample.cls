
public class CreateLeadExample {

    public void createLeadRecord() {

        // Create a new Lead sObject
        Lead newLead = new Lead(
            FirstName = 'Phil25',
            LastName  = 'Kurt25',
            Company   = 'Kurt25 Industries',
            Email     = 'Kurt25.sh@abc.com',
            Phone     = '123-124-5555',
            Status    = 'Open - Not Contacted'
        );

        try {
            // Use Database.insert with DMLOptions to bypass duplicate detection
            Database.DMLOptions dmlOptions = new Database.DMLOptions();
            dmlOptions.DuplicateRuleHeader.allowSave = true;
            dmlOptions.DuplicateRuleHeader.runAsCurrentUser = true;
            Database.insert(newLead, dmlOptions);
            System.debug('Lead created successfully. New Lead Id: ' + newLead.Id);
        } catch (DmlException e) {
            System.debug('Error while inserting Lead: ' + e.getMessage());
        }
    }
}
