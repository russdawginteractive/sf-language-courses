trigger LanguageCourseTrigger on Language_Course__c (after insert, after update, after delete) {
    // <write your own notification code>
    System.debug('Trigger Fired');
    String[] emailTeam = new String[] {'russell.griffith@goodbabyint.com', 'russell.griffith@gmail.com'};
    List<Language_Course__c> newCourses = Trigger.new;
    for(Language_Course__c newCourse :newCourses) {
        String emailSubject = 'A New Language Course Has Been Added: ' + newCourse.Name; 

        String emailBody = 'Course Id: ' + newCourse.ID;
        Boolean hasEmailBeenSent = EmailManager.sendMail(emailTeam, emailSubject, emailBody, false);
    }
}