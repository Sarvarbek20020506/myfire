class Post{
  int? id;
  String? title;
  String? body;
  String? img_url;
  int? userId;
  Post({this.id,this.body,this.userId,this.title,this.img_url});


  Post.fromJson(Map<String,dynamic> json):
      id = json ['id'],
  body = json ['body'],
  userId = json ['userId'],
  title = json ['title'],
  img_url = json ['img_url'];

  Map<String,dynamic > toJson() => {
    'id': id,
    'body': body,
    "userId": userId,
    "title" : title,
    "img_url" : img_url,
  };
}