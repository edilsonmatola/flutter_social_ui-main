import '../core/constants/image_constant.dart';
import '../models/post_model.dart';
import '../models/user_model.dart';

// Posts
final _post0 = Post(
  imageUrl: ImageConstant.post0,
  author: User(),
  title: 'Post 0',
  location: 'Location 0',
  likes: 102,
  comments: 37,
);
final _post1 = Post(
  imageUrl: ImageConstant.post1,
  author: User(),
  title: 'Post 1',
  location: 'Location 1',
  likes: 532,
  comments: 129,
);
final _post2 = Post(
  imageUrl: ImageConstant.post2,
  author: User(),
  title: 'Post 2',
  location: 'Location 2',
  likes: 985,
  comments: 213,
);
final _post3 = Post(
  imageUrl: ImageConstant.post3,
  author: User(),
  title: 'Post 3',
  location: 'Location 3',
  likes: 402,
  comments: 25,
);
final _post4 = Post(
  imageUrl: ImageConstant.post4,
  author: User(),
  title: 'Post 4',
  location: 'Location 4',
  likes: 628,
  comments: 74,
);
final _post5 = Post(
  imageUrl: ImageConstant.post5,
  author: User(),
  title: 'Post 5',
  location: 'Location 5',
  likes: 299,
  comments: 28,
);

final posts = [_post0, _post1, _post2, _post3, _post4, _post5];
final users = [
  User(profileImageUrl: ImageConstant.user0),
  User(profileImageUrl: ImageConstant.user1),
  User(profileImageUrl: ImageConstant.user2),
  User(profileImageUrl: ImageConstant.user3),
  User(profileImageUrl: ImageConstant.user4),
  User(profileImageUrl: ImageConstant.user5),
  User(profileImageUrl: ImageConstant.user6),
];
final _yourPosts = [_post1, _post3, _post5];
final _yourFavorites = [_post0, _post2, _post4];

// Current User
final User currentUser = User(
  profileImageUrl: ImageConstant.currentUser,
  backgroundImageUrl: ImageConstant.currentUserBackgroundImage,
  name: 'Rebecca',
  following: 453,
  followers: 937,
  posts: _yourPosts,
  favorites: _yourFavorites,
);
