class Student {
  int? id;
  String? departmentName;
  String? firstName;
  String? lastName;

  Student(
      {this.id,
      required this.departmentName,
      required this.firstName,
      required this.lastName});

  Map<String, dynamic> toJsonObject() {
    return {
      "id": id,
      "departmentName": departmentName,
      "firstName": firstName,
      "lastName": lastName,
    };
  }

  Student.fromJsonObject(Map<String, dynamic> jsonData) {
    id = jsonData["id"];
    departmentName = jsonData["departmentName"];
    firstName = jsonData["firstName"];
    lastName = jsonData["lastName"];
  }
}
