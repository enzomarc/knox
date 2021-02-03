class Password {
  String title;
  String category;
  String url;
  String user;
  String password;
  String image;
  bool localImage;

  Password({this.title, this.category, this.url, this.user, this.password, this.image, this.localImage = false});

  Password.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    url = json['url'];
    user = json['user'];
    password = json['password'];
    image = json['image'];
    localImage = json['local_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['category'] = this.category;
    data['url'] = this.url;
    data['user'] = this.user;
    data['password'] = this.password;
    data['image'] = this.image;
    data['local_image'] = this.localImage;

    return data;
  }
}
