import 'package:concord/core/models/bulletin_model.dart';

class User {
  final String name;
  final String email;
  final String phoneNumber;
  final int hoursDone;
  final List<String> badges;
  final List<String> skills;
  final List<Bulletin> completedRequests;
  final List<Bulletin> postedRequests; 

  User(
    this.name,
    this.email,
    this.phoneNumber,
    this.hoursDone,
    this.badges,
    this.skills,
    this.completedRequests,
    this.postedRequests
  );

  User.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      email = json['email'],
      phoneNumber = json['phoneNumber'],
      hoursDone = json['hoursDone'],
      badges = json['badges'],
      skills = json['skills'],
      completedRequests = json['completedRequests'],
      postedRequests = json['postedRequests']
    ;

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'hoursDone': hoursDone,
      'badges': badges,
      'skills': skills,
      'completedRequests': completedRequests,
      'postedRequests': postedRequests
    };
}
