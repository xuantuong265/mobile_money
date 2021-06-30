class ServiceItemModel {
  int id;
  String icon;
  String title;
  String color;

  ServiceItemModel({this.id, this.icon, this.title, this.color});

  ServiceItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    icon = json['icon'];
    title = json['title'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['icon'] = this.icon;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}