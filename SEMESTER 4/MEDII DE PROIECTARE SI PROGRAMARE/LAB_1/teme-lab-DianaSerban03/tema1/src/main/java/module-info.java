module com.example.tema1 {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.tema1 to javafx.fxml;
    exports com.example.tema1;
}