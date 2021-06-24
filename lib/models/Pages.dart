class Pages {
  int id;
  String title;
  String title_en;
  String description;
  String url;
  String meta_title;
  String meta_description;
  String meta_keywords;
  String col_status;
  String status;
  String created_at;
  String updated_at;

  Pages({
    this.id,
    this.title,
    this.title_en,
    this.description,
    this.url,
    this.meta_title,
    this.meta_description,
    this.meta_keywords,
    this.col_status,
    this.status,
    this.created_at,
    this.updated_at,
  });

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    title_en = json['title_en'];
    description = json['description'];
    url = json['url'];
    meta_title = json['meta_title'];
    meta_description = json['meta_description'];
    meta_keywords = json['meta_keywords'];
    col_status = json['col_status'];
    status = json['status'];
    created_at = json['created_at'];
    updated_at = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['title'] = this.title;
    data['title_en'] = this.title_en;
    data['description'] = this.description;
    data['url'] = this.url;
    data['meta_title'] = this.meta_title;
    data['meta_description'] = this.meta_description;
    data['meta_keywords'] = this.meta_keywords;
    data['col_status'] = this.col_status;
    data['status'] = this.status;
    data['created_at'] = this.created_at;
    data['updated_at'] = this.updated_at;
    return data;
  }
}
