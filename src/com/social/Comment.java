package com.social;

public class Comment {
    String userName;
    StringBuffer commentText;
    int likes;

    public Comment(String userName, String text, int likes) {
        this.userName = userName;
        this.commentText = new StringBuffer(text);
        this.likes = likes;
    }

    public String getFormattedComment() {
        return commentText.toString().trim();
    }

    public String getHashtag() {
        try {
            String text = commentText.toString();
            int index = text.indexOf("#");

            if (index != -1 && index < text.length()) {
                return text.substring(index);
            } else {
                return "No Hashtag";
            }
        } catch (Exception e) {
            return "Error";
        }
    }

    public String getUserName() {
        return userName;
    }

    public int getLikes() {
        return likes;
    }
}