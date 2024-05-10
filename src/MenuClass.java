import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MenuClass extends JFrame {

    public MenuClass() {

        setTitle("SQL Menu");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(500, 500);
        setLayout(new GridLayout(10, 1));
        setLocationRelativeTo(null);


        JButton SelectClassButton = new JButton("Start SELECT Mode");
        JButton UpdateClassButton = new JButton("Start UPDATE Mode");
        JButton InsertClassButton = new JButton("Start INSERT Mode");
        JButton DeleteClassButton = new JButton("Start DELETE Mode");


        SelectClassButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                startSelectClass();
            }
        });
        DeleteClassButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                startDeleteClass();
            }
        });

        UpdateClassButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                startUpdateClass();
            }
        });

        InsertClassButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                startInsertClass();
            }
        });




        add(SelectClassButton);
        add(UpdateClassButton);
        add(InsertClassButton);
        add(DeleteClassButton);
    }

    private void startSelectClass() {

        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new SelectClass().setVisible(true);
            }
        });
    }
    private void startDeleteClass() {

        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new DeleteClass().setVisible(true);
            }
        });
    }

    private void startInsertClass() {

        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new InsertClass().setVisible(true);
            }
        });
    }
    private void startUpdateClass() {

        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new UpdateClass().setVisible(true);
            }
        });
    }

    public static void main(String[] args) {

        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                new MenuClass().setVisible(true);
            }
        });
    }
}

