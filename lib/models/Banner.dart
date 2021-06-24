class Banners {
  int id;
  String image;
  String title;
  String status;

  Banners({this.id, this.image, this.title, this.status});

  Banners.fromJson(Map<String, dynamic> json) {
    id        = json['id'];
    image     = json['image'];
    title     = json['title'];
    status    = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']      = this.id;
    data['image']   = this.image;
    data['title']   = this.title;
    data['status']  = this.status;
    return data;
  }
}