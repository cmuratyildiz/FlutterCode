class Product {
  String id;
  String category_id;
  String product_name;
  String product_code;
  String code2;
  String slug;
  String size;
  String description;
  String meta_title;
  String meta_description;
  String price;
  String dicount_price;
  String sales_price;
  String kdv;
  String discount_rate;
  String stock;
  String weight;
  String image;
  String feature_item;
  String status;
  String showcase;
  String created_at;
  String update_at;

  Product({
    this.id,
    this.category_id,
    this.product_name,
    this.product_code,
    this.code2,
    this.slug,
    this.size,
    this.description,
    this.meta_title,
    this.meta_description,
    this.price,
    this.dicount_price,
    this.sales_price,
    this.kdv,
    this.discount_rate,
    this.stock,
    this.weight,
    this.image,
    this.feature_item,
    this.status,
    this.showcase,
    this.created_at,
    this.update_at,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category_id = json['category_id'];
    product_name = json['product_name'];
    product_code = json['product_code'];
    code2 = json['code2'];
    slug = json['slug'];
    size = json['size'];
    description = json['description'];
    meta_title = json['meta_title'];
    meta_description = json['meta_description'];
    price = json['price'];
    dicount_price = json['dicount_price'];
    sales_price = json['sales_price'];
    kdv = json['kdv'];
    discount_rate = json['discount_rate'];
    stock = json['stock'];
    weight = json['weight'];
    image = json['image'];
    feature_item = json['feature_item'];
    status = json['status'];
    showcase = json['showcase'];
    created_at = json['created_at'];
    update_at = json['update_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['category_id'] = this.category_id;
    data['product_name'] = this.product_name;
    data['product_code'] = this.product_code;
    data['code2'] = this.code2;
    data['slug'] = this.slug;
    data['size'] = this.size;
    data['description'] = this.description;
    data['meta_title'] = this.meta_title;
    data['meta_description'] = this.meta_description;
    data['price'] = this.price;
    data['dicount_price'] = this.dicount_price;
    data['sales_price'] = this.sales_price;
    data['kdv'] = this.kdv;
    data['discount_rate'] = this.discount_rate;
    data['stock'] = this.stock;
    data['weight'] = this.weight;
    data['image'] = this.image;
    data['feature_item'] = this.feature_item;
    data['status'] = this.status;
    data['showcase'] = this.showcase;
    data['created_at'] = this.created_at;
    data['update_at'] = this.update_at;

    return data;
  }
}
