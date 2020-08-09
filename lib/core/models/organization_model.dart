import 'package:concord/core/models/bulletin_model.dart';

class Organization {
  final String name;
  final String image;
  final String description;
  final List<Bulletin> bulletins;

  Organization(
    this.name,
    this.image,
    this.description,
    this.bulletins
  );

  Organization.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      image = json['image'],
      description = json['description'],
      bulletins = json['bulletins']
    ;

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'image': image,
      'description': description,
      'bulletins': bulletins
    };
}
