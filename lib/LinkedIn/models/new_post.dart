class NewPost {
  final String path;
  final String name;

  const NewPost({this.path, this.name});
}

const newPostItems = <NewPost>[
  NewPost(name: 'Image', path: ''),
  NewPost(name: 'Video', path: ''),
  NewPost(name: 'File', path: ''),
  NewPost(name: 'Article', path: ''),
];
