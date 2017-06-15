package dk.cphbusiness.breakingjava;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * This will (sometime) throw a runtime exception. Can you find the problem 
 * without running the code? What was the problem?
 * @author jens
 */
public class FixMe4 {
    
    private List<Integer> myList = new ArrayList<>();

    public FixMe4() {
        myList.addAll(Arrays.asList(4, 10, 28, 3, 29, 17, 3, 10));
    }
    
    private void removeLastElement() {
        final Iterator<Integer> iterator = myList.iterator();
        while(iterator.hasNext()) {
            // Wait until last element
            iterator.next();
        }
        iterator.remove();
    }
    
    public static void main(String[] args) throws InterruptedException {
        FixMe4 fixMe = new FixMe4();
        Runnable runnable = () -> fixMe.removeLastElement();
        Thread t1 = new Thread(runnable);
        Thread t2 = new Thread(runnable);
        Thread t3 = new Thread(runnable);
        Thread t4 = new Thread(runnable);
        t1.start();
        t2.start();
        t3.start();
        t4.start();
        t1.join();
        t2.join();
        t3.join();
        t4.join();
    }
    
}
