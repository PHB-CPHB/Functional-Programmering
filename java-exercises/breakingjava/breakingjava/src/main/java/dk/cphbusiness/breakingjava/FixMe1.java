package dk.cphbusiness.breakingjava;

/**
 * This will throw a runtime exception. Can you find the problem without 
 * running the code? What was the problem?
 * @author jens
 */
public class FixMe1 {
    
    private String name;
    
    public FixMe1() {}
    
    public FixMe1(String name) {
        this.name = name;
    }
    
    @Override public String toString() {
        return String.format("Hello %s with length %d", name, name.length());
    }
    
    //Mangler værdi
    
    public static void main(String[] args) {
        FixMe1 fixMe = new FixMe1();
        //FixMe1 fixMe = new FixMe1("Phillip");
        System.out.println(fixMe.toString());
    }
    
}
