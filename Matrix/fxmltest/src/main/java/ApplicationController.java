import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.scene.Node;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.AnchorPane;
import javafx.scene.layout.Background;
import javafx.scene.layout.BackgroundFill;
import javafx.scene.text.Font;

public class ApplicationController {
	@FXML
	Label label;
	
	@FXML 
	Button button;
	
	@FXML
	AnchorPane anchor;
	
	public void initialize() {
		label.setText("Hier könnte ihre Werbung stehen!");
		label.setFont(Font.font("Calibri",25));
		anchor.getStylesheets().add("application.css");
		
		button.setText("Buy NOW !!!");
	}
}
