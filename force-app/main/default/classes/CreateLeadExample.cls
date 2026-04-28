public class CreateLeadExample {

    public void createLeadRecord() {

        // Create a new Lead sObject
        Lead newLead = new Lead(
            FirstName = 'Phil',
            LastName  = 'Kurt1',
            Company   = 'Kurt Industries',
            Email     = 'Kurt.sh@abc.com',
            Phone     = '123-123-5555',
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