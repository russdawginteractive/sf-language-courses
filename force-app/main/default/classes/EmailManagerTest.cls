@isTest
private class EmailManagerTest {
@isTest
   static void FailedEmailTestWithException() {
       try{
           Boolean hasEmailBeenSent = EmailManager.sendMail(new String[]{''}, 'Email will fail subject', 'Email body', true);
           System.assertEquals(false, hasEmailBeenSent);
       }
       catch(EmailException exEmail) {
           System.debug(exEmail.getMessage());
           Boolean expectedExceptionThrown = exEmail.getMessage().Contains('INVALID_EMAIL_ADDRESS') ? true: false;
           System.assertEquals(true, expectedExceptionThrown);
       }

   }

@isTest
   static void FailedEmailTest() {
       try{
           Boolean hasEmailBeenSent = EmailManager.sendMail(new String[]{'badexample.com'}, 'Email will fail subject', 'Email body', false);
           System.assertEquals(false, hasEmailBeenSent);
       }
       catch(EmailException exEmail) {
           System.debug(exEmail.getMessage());
           Boolean expectedExceptionThrown = exEmail.getMessage().Contains('INVALID_EMAIL_ADDRESS') ? true: false;
           System.assertEquals(true, expectedExceptionThrown);
       }

   }

@isTest
   static void PassedEmailTest() {
       try{
           Boolean hasEmailBeenSent = EmailManager.sendMail(new String[]{'russell.griffith@goodbabyint.com'}, 'Email will succeed subject', 'Email body', true);
           System.assertEquals(true, hasEmailBeenSent);
       }
       catch(Exception ex) {
           System.debug(ex.getMessage());
           System.assert(false, ex.getMessage());
       }

   }
}
