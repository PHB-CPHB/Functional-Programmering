package dk.cphbusiness.breakingjava;

import java.io.IOException;

/**
 * This will throw a runtime exception. Can you find the problem without 
 * running the code? What was the problem?
 * @author jens
 */
public class FixMe3 {
    
    public void sayHi() throws IOException {
        throw new RuntimeException("I'm throwing an exception!");
    }
    //IOException fanger IOException men der er intet der faner RuntimeException
    public static void main(String[] args) {
        FixMe3 fixMe = new FixMe3();
        try {
            fixMe.sayHi();
        } catch (IOException e) {
            System.out.println("All is well");
        }
    }
    
}
