package dk.cphbusiness.breakingjava;

/**
 * This will throw a runtime exception. Can you find the problem without 
 * running the code? What was the problem?
 * @author jens
 */
public class FixMe2 {
    
    public Integer id;
    //Manger den globale variable
    public void setId(Integer id) {
        //Mangler this, scope
        //this.id = id;
        id = id;
    }
    
    public static void main(String[] args) {
        FixMe2 fixMe = new FixMe2();
        fixMe.setId(100);
        System.out.println(fixMe.id);
    }
    
}
