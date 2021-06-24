class Category {
  String id;
  String name;
  String description;
  String url;
  String img;

  Category({this.id, this.name, this.description, this.url, this.img});

  Category.fromJson(Map<String, dynamic> json) {
    id           = json['id'];
    name         = json['name'];
    description  = json['description'];
    url          = json['url'];
    img          = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']           = this.id;
    data['name']         = this.name;
    data['description']  = this.description;
    data['url']          = this.url;
    data['image']        = this.img;
    return data;
  }
}