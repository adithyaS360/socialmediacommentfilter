import java.util.*;

public class CommentManager {
    ArrayList<Comment> comments = new ArrayList<>();

    public void addComment(Comment c) throws InvalidCommentException {

        if (c.userName == null || c.userName.isEmpty()) {
            throw new InvalidCommentException("Username cannot be empty!");
        }

        if (c.getFormattedComment().isEmpty()) {
            throw new InvalidCommentException("Comment cannot be empty!");
        }

        if (c.likes < 0) {
            throw new InvalidCommentException("Likes cannot be negative!");
        }

        comments.add(c);
    }

    public void sortComments() {
        Collections.sort(comments, new CommentComparator());
    }

    public ArrayList<Comment> getComments() {
        return comments;
    }
}