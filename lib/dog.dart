import 'owner.dart';
class Dog {
  final int id;
  final String name;
  final double weight;
  final String gender;
  final String color;
  final double age;
  final String distance;
  final String imageAsset;
  final String description;
  final Owner owner;

  Dog(this.id, this.name, this.weight, this.gender, this.color, this.age, this.distance,
      this.imageAsset, this.description, this.owner);
}