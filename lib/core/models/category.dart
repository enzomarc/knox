class Category {
  String title;
  String image;
  bool localImage;

  Category({this.title, this.image, this.localImage = false});

  Category.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    localImage = json['local_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['title'] = this.title;
    data['image'] = this.image;
    data['local_image'] = this.localImage;

    return data;
  }
}
