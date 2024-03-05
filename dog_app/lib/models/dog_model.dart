class Dog {
  final String id;
  final String name;
  final String description;
  final bool hypoallergenic;

  Dog({
    required this.id,
    required this.name,
    required this.description,
    required this.hypoallergenic,
  });

  factory Dog.fromJson(Map<String, dynamic> json) {
    return Dog(
      id: json['id'],
      name: json['attributes']['name'],
      description: json['attributes']['description'],
      hypoallergenic: json['attributes']['hypoallergenic'],
    );
  }
}