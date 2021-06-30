class HistoryModel {
  int id;
  String idSend;
  String idReceiver;
  String price;
  String content;
  String date;
  String description;
  String addressSend;
  String addressReceiver;

  HistoryModel(
      {this.id,
        this.idSend,
        this.idReceiver,
        this.price,
        this.content,
        this.date,
        this.description,
        this.addressSend,
        this.addressReceiver,});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSend = json['id_send'];
    idReceiver = json['id_receiver'];
    price = json['price'];
    content = json['content'];
    date = json['date'];
    description = json['description'];
    addressSend = json['address_send'];
    addressReceiver = json['address_receiver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_send'] = this.idSend;
    data['id_receiver'] = this.idReceiver;
    data['price'] = this.price;
    data['content'] = this.content;
    data['date'] = this.date;
    data['description'] = this.description;
    data['address_send'] = this.addressSend;
    data['address_receiver'] = this.addressReceiver;
    return data;
  }
}