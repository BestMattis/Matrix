import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
public class FutureCallableExample {
	long[] longs = { 10001L,
			100001L,
			1000001L,
			10000001L,
			100000001L,
			1000000001L,
			10000000001L,
			100000000001L,
			1000000000000000001L,
			1000000000001111111L };

	public static void main(String[] args) {
		try {
			Callable<int[]> myCallable = new MyCallable();
			ExecutorService executor = Executors.newCachedThreadPool();
			Future<int[]> result = executor.submit(myCallable);
			// Do some other stuff ...
			if (!result.isDone()) {
				System.out.println("Not done yet.");
				// Do some other stuff ...
			}
			// Now I need the result in any case. Wait for result.
			int[] resultIntArray = result.get();
			System.out.println(resultIntArray[0]);
			executor.shutdown();
		} catch (InterruptedException e) {
			e.printStackTrace();
		} catch (ExecutionException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Long> getPriemfaktoren(long nr){
		ArrayList<Long> faktoren = new ArrayList<Long>();
        int counter = 2;
        
        while ( counter <= ( int ) Math.sqrt( nr ) && nr > 1 ) {
            if ( nr % counter == 0 ) {
                nr /= counter;
                System.out.printf( "%s %s", counter, nr == 1 ? "" : "* " );
            }
            else {
                counter++;
            }
        }
        if ( nr != 1 ) {
            faktoren.add(nr);
        }
		return null;
	}
}