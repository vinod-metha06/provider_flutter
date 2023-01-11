class Car {
  String? id;
  String? name;
  String? image;

  Car({required this.id, required this.name, required this.image});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(id: json['id'], name: json['name'], image: json['image']);
  }
}
