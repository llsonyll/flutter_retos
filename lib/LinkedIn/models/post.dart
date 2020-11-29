import 'package:flutter_retos/LinkedIn/models/user.dart';

class Post {
  final User user;
  final String title;
  final String timeAgo;
  final String description;
  final String photo;
  final int like;
  final int comment;
  final bool isLikeMe;

  const Post({
    this.user,
    this.title,
    this.timeAgo,
    this.description,
    this.photo,
    this.like,
    this.comment,
    this.isLikeMe = false,
  });
}
