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
        "https://images.app.goo.gl/iRLmaQzvhUmAtZ3e7",
        "https://images.app.goo.gl/iRLmaQzvhUmAtZ3e7",
        "https://images.app.goo.gl/iRLmaQzvhUmAtZ3e7",
        "https://images.app.goo.gl/iRLmaQzvhUmAtZ3e7",
        "https://images.app.goo.gl/iRLmaQzvhUmAtZ3e7"
      ],
      jobTitle: "Job Title Here",
      bio: "Hi! My name is Timothy but you can call me Timmy! I am 20 years old and I current live in HB1 Block B Room 101!"
    ),
    User(
      id: 2,
      name: "Mike",
      age: 19,
      imageUrls: [
        "https://negativespace.co/wp-content/uploads/2021/05/negative-space-smiling-young-male-adult-2048x1365.jpg",
        "https://negativespace.co/wp-content/uploads/2021/05/negative-space-smiling-young-male-adult-2048x1365.jpg",
        "https://negativespace.co/wp-content/uploads/2021/05/negative-space-smiling-young-male-adult-2048x1365.jpg",
        "https://negativespace.co/wp-content/uploads/2021/05/negative-space-smiling-young-male-adult-2048x1365.jpg",
        "https://negativespace.co/wp-content/uploads/2021/05/negative-space-smiling-young-male-adult-2048x1365.jpg"
      ],
      jobTitle: "Job Title Here",
      bio: "Hello there! My name is Mike! Nice to meet you all from those who visited my page!"
    ),
    User(
      id: 3,
      name: "Jimmy",
      age: 18,
      imageUrls: [
        "https://images.app.goo.gl/VZm6cKe1oJLQJYz59",
        "https://images.app.goo.gl/VZm6cKe1oJLQJYz59",
        "https://images.app.goo.gl/VZm6cKe1oJLQJYz59",
        "https://images.app.goo.gl/VZm6cKe1oJLQJYz59",
        "https://images.app.goo.gl/VZm6cKe1oJLQJYz59"
      ],
      jobTitle: "Job Title Here",
      bio: "They don't like us, they don't like us, they don't like us....."
    ),
    User(
      id: 4,
      name: "Yuan Xiao Ping",
      age: 18,
      imageUrls: [
        "https://images.app.goo.gl/c7n8mjQQatvresFv8",
        "https://images.app.goo.gl/c7n8mjQQatvresFv8",
        "https://images.app.goo.gl/c7n8mjQQatvresFv8",
        "https://images.app.goo.gl/c7n8mjQQatvresFv8",
        "https://images.app.goo.gl/c7n8mjQQatvresFv8"
      ],
      jobTitle: "Job Title Here",
      bio: "Hello! If you find me. you will find that I am the most tolerable person on this university!"
    ),
    User(
      id: 5,
      name: "Rahul Thanan",
      age: 19,
      imageUrls: [
        "https://images.app.goo.gl/DnQ3LGvq1h1idM6k6",
        "https://images.app.goo.gl/DnQ3LGvq1h1idM6k6",
        "https://images.app.goo.gl/DnQ3LGvq1h1idM6k6",
        "https://images.app.goo.gl/DnQ3LGvq1h1idM6k6",
        "https://images.app.goo.gl/DnQ3LGvq1h1idM6k6"
      ],
      jobTitle: "Job Title Here",
      bio: "Some might say that money does not buy happiness, but my high income say otherwise!"
    ),
    User(
      id: 6,
      name: "Daniel",
      age: 21,
      imageUrls: [
        "https://images.app.goo.gl/XXZVVb43npqEMd6r6",
        "https://images.app.goo.gl/XXZVVb43npqEMd6r6",
        "https://images.app.goo.gl/XXZVVb43npqEMd6r6",
        "https://images.app.goo.gl/XXZVVb43npqEMd6r6",
        "https://images.app.goo.gl/XXZVVb43npqEMd6r6"
      ],
      jobTitle: "Job Title Here",
      bio: "Look at me! If you want to find the most intelligent person in this university, then you come to the right place..."
    ),
    User(
      id: 7,
      name: "Muhammad Ahmad",
      age: 20,
      imageUrls: [
        "https://images.app.goo.gl/76Tp4whLqWdX9XSd9",
        "https://images.app.goo.gl/76Tp4whLqWdX9XSd9",
        "https://images.app.goo.gl/76Tp4whLqWdX9XSd9",
        "https://images.app.goo.gl/76Tp4whLqWdX9XSd9",
        "https://images.app.goo.gl/76Tp4whLqWdX9XSd9"
      ],
      jobTitle: "Job Title Here",
      bio: "I am very shy, so don't be shy..."
    )
  ];
  
}

class Equatable {
}