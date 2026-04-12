import java.util.Comparator;

public class CommentComparator implements Comparator<Comment> {
    public int compare(Comment c1, Comment c2) {
        return c1.likes - c2.likes;
    }
}