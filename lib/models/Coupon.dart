class Coupon {
  int id;
  String coupon_code;
  String amount;
  String amount_type;
  String expiry_date;
  String status;

  Coupon({this.id, this.coupon_code, this.amount,this.amount_type,this.expiry_date,this.status});

  Coupon.fromJson(Map<String, dynamic> json) {
    id   = json['id'];
    coupon_code = json['coupon_code'];
    amount  = json['amount'];
    amount_type  = json['amount_type'];
    expiry_date  = json['expiry_date'];
    status  = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']   = this.id;
    data['coupon_code'] = this.coupon_code;
    data['amount']  = this.amount;
    data['amount_type']  = this.amount_type;
    data['expiry_date']  = this.expiry_date;
    data['status']  = this.status;
    return data;
  }
}