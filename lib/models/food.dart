class Food {
  final int id;
  final String name;
  final String serving;
  final int calories;

  const Food({
    this.id,
    this.name,
    this.serving,
    this.calories,
  });

  factory Food.fromJson(Map<String, dynamic> json) => Food(
    id: json['id'],
    name: json['Name'],
    serving: json['Serving'],
    calories: json['Calories'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'serving': serving,
    'calories': calories,
  };
}