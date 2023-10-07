class CommentModel {
  final String userName;
  final String time;
  final String commentBody;
  final String nickName;
  late int likes;
  late bool isLikes;
  late bool isDisLikes;
  CommentModel(
      {required this.userName,
      required this.time,
      required this.nickName,
      required this.commentBody,
      required this.likes,
      required this.isLikes,
      required this.isDisLikes});
}
