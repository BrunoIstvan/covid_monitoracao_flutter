class ResponseModel {
  int value;
  String detail;

  ResponseModel({this.value, this.detail});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    detail = json['detail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['detail'] = this.detail;
    return data;
  }
}
