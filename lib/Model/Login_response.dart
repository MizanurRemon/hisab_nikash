// ignore_for_file: file_names, camel_case_types

class Login_response{
  String? message;
  int? status;

  Login_response({this.message, this.status});

  Login_response.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }*/
}