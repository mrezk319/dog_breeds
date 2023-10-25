class RandomImageModel {
  RandomImageModel({
    required this.message,
    required this.status,
  });
  late var message;
  late final String status;

  RandomImageModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
