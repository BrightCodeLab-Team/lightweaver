class PostModel {
  final String name;
  final String location;
  final String imageUrl;
  final String username;
  final String timeAgo;
  final String caption;
  final int likes;
  final int comments;
  final String userImageUrl;

  PostModel({
    required this.userImageUrl,
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.username,
    required this.timeAgo,
    required this.caption,
    required this.likes,
    required this.comments,
  });
}
