
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.*;

public class ExampleReadWriteLock {

	private static int DATA = 0;
	private final static ReentrantReadWriteLock lock = new ReentrantReadWriteLock();
	private final static Lock readLock = lock.readLock();
	private final static Lock writeLock = lock.writeLock();

	public static void main(String[] args) {

		class Leser implements Runnable {
			public void run() {
				while (true) {
					readLock.lock();
					try {
						try {
							TimeUnit.SECONDS.sleep(2);
						} catch (InterruptedException e) {
							e.printStackTrace();
						}
						System.out.println("read data " + DATA);
					} finally {
						readLock.unlock();
					}
				}
			}
		}

		class Schreiber implements Runnable {
			public void run() {
				while (true) {
					writeLock.lock();
					try {
						DATA += 15;
					} finally {
						writeLock.unlock();
					}
				}
			}
		}

		// Einige Leser und Schreiber:
		new Thread(new Leser()).start();
		new Thread(new Leser()).start();
		new Thread(new Schreiber()).start();
		new Thread(new Schreiber()).start();
	}
}
