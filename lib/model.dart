class UserModel {
  final String? id;
  final String sn;
  final String dateTime;
  final String location;

  const UserModel({
    this.id,
    required this.sn,
    required this.dateTime,
    required this.location,
  });

  toJson() {
    return {
      "sn": sn,
      "dateTime": dateTime,
      "location": location,
    };
  }
}
