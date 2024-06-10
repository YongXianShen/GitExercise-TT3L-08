class CarpoolRequest {
  final String name;
  final int age;
  final String gender;
  final String carModel;
  final String carColor;
  final String carPlate;
  final String pickupPoint;

  CarpoolRequest({
    required this.name,
    required this.age,
    required this.gender,
    required this.carModel,
    required this.carColor,
    required this.carPlate,
    required this.pickupPoint,
  });
}

List<CarpoolRequest> carpoolRequests = [];
