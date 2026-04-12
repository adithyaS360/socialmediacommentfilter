import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class MainUI {
    public static void main(String[] args) {

        JFrame frame = new JFrame("Social Media Comment Filter System");
        frame.setSize(600, 500);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        
        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(4, 2, 10, 10));
        panel.setBorder(BorderFactory.createEmptyBorder(20, 20, 10, 20));

        
        JLabel userLabel = new JLabel("Username:");
        JLabel commentLabel = new JLabel("Comment:");
        JLabel likesLabel = new JLabel("Likes:");

        
        JTextField userField = new JTextField();
        JTextField commentField = new JTextField();
        JTextField likesField = new JTextField();

        
        JButton addButton = new JButton("Add Comment");
        JButton sortButton = new JButton("Sort");

    
        panel.add(userLabel);
        panel.add(userField);

        panel.add(commentLabel);
        panel.add(commentField);

        panel.add(likesLabel);
        panel.add(likesField);

        panel.add(addButton);
        panel.add(sortButton);

    
        JTextArea display = new JTextArea();
        display.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(display);

        
        frame.setLayout(new BorderLayout());
        frame.add(panel, BorderLayout.NORTH);
        frame.add(scrollPane, BorderLayout.CENTER);

        
        CommentManager manager = new CommentManager();

        addButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    String user = userField.getText();
                    String text = commentField.getText();

                    if (user.trim().isEmpty()) {
                        throw new InvalidCommentException("Username required!");
                    }

                    if (text.trim().isEmpty()) {
                        throw new InvalidCommentException("Comment required!");
                    }

                    int likes = Integer.parseInt(likesField.getText());

                    Comment c = new Comment(user, text, likes);
                    manager.addComment(c);

                    
                    display.append(c.toString() + "\n");

                    
                    userField.setText("");
                    commentField.setText("");
                    likesField.setText("");

                } catch (InvalidCommentException ex) {
                    JOptionPane.showMessageDialog(frame, ex.getMessage());
                } catch (NumberFormatException ex) {
                    JOptionPane.showMessageDialog(frame, "Likes must be a number!");
                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(frame, "Unexpected Error!");
                }
            }
        });

        
        sortButton.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    manager.sortComments();  // uses ascending comparator
                    display.setText("");

                    for (Comment c : manager.getComments()) {
                        display.append(c.toString() + "\n");
                    }

                } catch (Exception ex) {
                    JOptionPane.showMessageDialog(frame, "Sorting Error!");
                }
            }
        });

        frame.setVisible(true);
    }
}