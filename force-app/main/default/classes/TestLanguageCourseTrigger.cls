@isTest
private class TestLanguageCourseTrigger {
    @isTest
    static void SimpleTest() {
        System.debug('Simple Test Run!');
        System.assert(true);
    }
    @isTest
    static void IsCourseCreated() {
        Language_Course_Designer__c designer = [Select Name From Language_Course_Designer__c where Name = 'Jeanine Cooke' Limit 1];
        Language_Course_Instructor__c instructor = [Select Name From Language_Course_Instructor__c where Name = 'Anthony Gaetano' Limit 1];
        Language_Course__c course = new Language_Course__c(
            Name='Redneck Slang',
            Language_Course_Designer__c = designer.Id,
            Language_Course_Instructor__c = instructor.Id
        );
        System.Debug('Inserting Redneck Slang Course');
        // Setup test data
       Test.startTest();
            //insert course;
            Database.SaveResult result = Database.insert(course);
        Test.stopTest();
        System.assert(result.isSuccess());
        System.assert(result.getErrors().size() <= 0);
    }

    @TestSetup
    static void makeData(){
        System.Debug('Creating Test Data');
        Language_Course_Designer__c designer = new Language_Course_Designer__c(Name='Jeanine Cooke');
        System.Debug('Inserting New Designer');
        insert designer;

        Language_Course_Instructor__c instructor = new Language_Course_Instructor__c(Name='Anthony Gaetano');
        System.Debug('Inserting New Instructor');
        insert instructor;
        System.Debug('Test Setup Complete');
    }
}
