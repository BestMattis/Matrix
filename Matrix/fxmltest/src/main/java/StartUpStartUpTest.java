
public class StartUpStartUpTest {
    public static void main(String[] args) {
        new Thread() {
            @Override
            public void run() {
                javafx.application.Application.launch(LiveRiskApp.class);
            }
        }.start();
    }
}