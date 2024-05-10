import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.*;
import java.util.Vector;

public class DeleteClass extends JFrame {
    public Label executeButton;
    private JTable[] tables;
    private String[] tableNames = { "patients", "doctors", "machines", "medicine", "randevu", "patient_medicine" };
    JTextField deleteField;
    JTextField whereField;
    private JTextField groupbyField;
    private JTextField orderbyField;
    JCheckBox orderByCheckbox;
    JCheckBox groupByCheckbox;
    private JTextArea resultArea;

    public DeleteClass() {

        setTitle("Delete Mode");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1200, 600);

        tables = new JTable[6];

        JLabel[] labels = new JLabel[6];
        for (int i = 0; i < 6; i++) {
            labels[i] = new JLabel(tableNames[i]);
        }

        JPanel tablePanel = new JPanel(new GridLayout(2, 3));

        for (int i = 0; i < 6; i++) {

            JScrollPane scrollPane = new JScrollPane(createTable(i));

            JPanel individualTablePanel = new JPanel(new BorderLayout());
            individualTablePanel.add(labels[i], BorderLayout.NORTH);
            individualTablePanel.add(scrollPane, BorderLayout.CENTER);

            tablePanel.add(individualTablePanel);
        }

        deleteField = createSmallTextField();
        whereField = createSmallTextField();

        JButton executeButton = new JButton("Execute");
        executeButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                executeQuery();
            }
        });

        resultArea = new JTextArea();
        resultArea.setEditable(false);

        JPanel queryInputPanel = new JPanel(new GridLayout(12, 12));
        queryInputPanel.add(new JLabel("DELETE FROM:"));
        queryInputPanel.add(deleteField);
        queryInputPanel.add(new JLabel("WHERE:"));
        queryInputPanel.add(whereField);

        JPanel buttonPanel = new JPanel(new FlowLayout());
        buttonPanel.add(executeButton);

        JPanel resultPanel = new JPanel(new BorderLayout());
        resultPanel.add(new JLabel("Query Result:"), BorderLayout.NORTH);
        resultPanel.add(new JScrollPane(resultArea), BorderLayout.CENTER);

        JSplitPane queryTableSplitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, queryInputPanel, tablePanel);
        queryTableSplitPane.setResizeWeight(0.5);

        JSplitPane mainSplitPane = new JSplitPane(JSplitPane.HORIZONTAL_SPLIT, queryTableSplitPane, resultPanel);
        mainSplitPane.setResizeWeight(0.5);

        getContentPane().add(mainSplitPane, BorderLayout.CENTER);
        getContentPane().add(buttonPanel, BorderLayout.SOUTH);

        for (int i = 0; i < 6; i++) {
            populateTable(tables[i], "SELECT * FROM " + tableNames[i]);
        }

        setVisible(true);
    }

    private JTextField createSmallTextField() {
        JTextField textField = new JTextField();
        textField.setPreferredSize(new Dimension(100, 20));
        return textField;
    }

    private JTable createTable(int index) {
        tables[index] = new JTable();
        return tables[index];
    }

    private void populateTable(JTable table, String query) {
        String url = "***";
        String user = "***";
        String password = "***";

        try (Connection connection = DriverManager.getConnection(url, user, password)) {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            java.sql.ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            Vector<Vector<Object>> data = new Vector<>();

            while (resultSet.next()) {
                Vector<Object> row = new Vector<>();
                for (int i = 1; i <= columnCount; i++) {
                    row.add(resultSet.getObject(i));
                }
                data.add(row);
            }

            Vector<String> columnNames = new Vector<>();
            for (int i = 1; i <= columnCount; i++) {
                columnNames.add(metaData.getColumnName(i));
            }

            table.setModel(new DefaultTableModel(data, columnNames));

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void executeQuery() {
        String delete = deleteField.getText();
        String where = whereField.getText();

        StringBuilder queryBuilder = new StringBuilder("DELETE FROM " + delete + " WHERE " + where);

        String query = queryBuilder.toString();

        try (Connection connection = DriverManager.getConnection("***", "***",
                "***")) {
            Statement statement = connection.createStatement();

            int rowsAffected = statement.executeUpdate(query);

            resultArea.setText("Rows updated: " + rowsAffected);

        } catch (Exception e) {
            e.printStackTrace();
            resultArea.setText("Error executing query.");
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            new DeleteClass();
        });
    }
}
