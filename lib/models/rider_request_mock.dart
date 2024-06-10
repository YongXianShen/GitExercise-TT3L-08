class CarpoolRequest {
  final String name;
  final int age;
  final String gender;
  final String destination;
  CarpoolRequest({
    required this.name,
    required this.age,
    required this.gender,
    required this.destination,
  });
}

List<CarpoolRequest> carpoolRequests = [
  CarpoolRequest(
    name: 'John Doe',
    age: 30,
    gender: 'Male',
    destination: 'MMU',

  ),
];
