class Brands {
  int brand_id;
  String brand_name;
  String brand_slug;
  String status;

  Brands({this.brand_id, this.brand_name, this.brand_slug, this.status});

  Brands.fromJson(Map<String, dynamic> json) {
    brand_id    = json['brand_id'];
    brand_name  = json['brand_name'];
    brand_slug  = json['brand_slug'];
    status      = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id']     = this.brand_id;
    data['brand_name']   = this.brand_name;
    data['brand_slug']   = this.brand_slug;
    data['status']       = this.status;
    return data;
  }
}