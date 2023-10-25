class ListOfModel {
  ListOfModel({
    required this.message,
    required this.status,
  });
  late final List<String> message;
  late final String status;

  ListOfModel.fromJson(Map<String, dynamic> json) {
    message = List.castFrom<dynamic, String>(json['message']);
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
