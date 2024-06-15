class User extends Equatable {
  final int id;
  final String name;
  final int age;
  final List<String> imageUrls;
  final String bio;
  final String jobTitle;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.imageUrls,
    required this.bio,
    required this.jobTitle
  });

  List<Object?> get props => [
    id,
    name,
    age,
    imageUrls,
    bio,
    jobTitle
  ];

  static List<User> users = [
    User(
      id: 1,
      name: "Timothy",
      age: 20,
      imageUrls: [
        "lib/hostel/images/man_1.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "Hi! My name is Timothy but you can call me Timmy! I am 20 years old and I current live in HB1 Block B Room 101!"
    ),
    User(
      id: 2,
      name: "Mike",
      age: 19,
      imageUrls: [
        "lib/hostel/images/man_2.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "Hello there! My name is Mike! Nice to meet you all from those who visited my page!"
    ),
    User(
      id: 3,
      name: "Jimmy",
      age: 18,
      imageUrls: [
        "lib/hostel/images/man_3.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "They don't like us, they don't like us, they don't like us....."
    ),
    User(
      id: 4,
      name: "Yuan Xiao Ping",
      age: 18,
      imageUrls: [
        "lib/hostel/images/man_5.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "Hello! If you find me. you will find that I am the most tolerable person on this university!"
    ),
    User(
      id: 5,
      name: "Rahul Thanan",
      age: 19,
      imageUrls: [
        "lib/hostel/images/man_6.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "Some might say that money does not buy happiness, but my high income say otherwise!"
    ),
    User(
      id: 6,
      name: "Daniel",
      age: 21,
      imageUrls: [
        "lib/hostel/images/man_4.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "Look at me! If you want to find the most intelligent person in this university, then you come to the right place..."
    ),
    User(
      id: 7,
      name: "Muhammad Ahmad",
      age: 20,
      imageUrls: [
        "lib/hostel/images/man_7.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg",
        "lib/hostel/images/smiling_face.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "I am very shy, so don't be shy..."
    )
  ];
  
}

class Equatable {}