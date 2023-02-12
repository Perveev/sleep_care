class Comment {
  final int stars;
  final String commentText;
  final String userName;

  Comment(this.stars, this.commentText, this.userName);

  factory Comment.test() {
    return Comment(5, 'commentText', 'Daria');
  }
}
