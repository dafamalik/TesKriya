class ProductModel {
  int userId;
  int id;
  String title;
  bool completed;
  int qty;

  ProductModel({this.userId, this.id, this.title, this.completed, this.qty});

  ProductModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
    qty = json['Qty'] == null ? 0 : json['Qty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    data['Qty'] = this.qty;
    return data;
  }
}