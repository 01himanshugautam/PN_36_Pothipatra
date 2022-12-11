class ResponceModal {
  bool? success;
  String? errorMessage;
  String? message;

  ResponceModal({this.success, this.errorMessage, this.message});

  ResponceModal.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMessage = json['errorMessage'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = success;
    data['errorMessage'] = errorMessage;
    data['message'] = message;
    return data;
  }
}