import 'user_model.dart';

class Post {
  Post({
    this.imageUrl,
    this.author,
    this.title,
    this.location,
    this.likes,
    this.comments,
  });

  final String imageUrl;
  final User author;
  final String title;
  final String location;
  final int likes;
  final int comments;
}
