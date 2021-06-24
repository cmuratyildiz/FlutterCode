class User {
  int id;
  String name;
  String lastname;
  String address;
  String city;
  String state;
  String country;
  String mobile;
  String email;
  String status;
  String created_at;

  User({
    this.id,
    this.name,
    this.lastname,
    this.address,
    this.city,
    this.state,
    this.country,
    this.mobile,
    this.email,
    this.status,
    this.created_at,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    address = json['address'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    mobile = json['mobile'];
    email = json['email'];
    status = json['status'];
    created_at = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id'] = this.id;
    data['name'] = this.name;
    data['lastname'] = this.lastname;
    data['address'] = this.address;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['status'] = this.status;
    data['created_at'] = this.created_at;


    return data;
  }
}
