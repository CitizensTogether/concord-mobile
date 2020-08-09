class Bulletin {
  final String title;
  final String description;
  final String organization;
  final int helpersRequired;
  final String location;
  final DateTime expirationDate;
  final DateTime expirationTime;
  final int timeToComplete; 
  final List<String> skills;
  final List<String> images;  // TODO: change

  Bulletin(
    this.title,
    this.description, 
    this.organization,
    this.helpersRequired, 
    this.location,
    this.expirationDate, 
    this.expirationTime,
    this.timeToComplete,
    this.skills,
    this.images
  );

  Bulletin.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      description = json['description'],
      organization = json['organization'],
      helpersRequired = json['helpersRequired'],
      location = json['location'],
      expirationDate = json['expirationDate'],
      expirationTime = json['expirationTime'],
      timeToComplete = json['timeToComplete'],
      skills = json['skills'],
      images = json['images']
    ;

  Map<String, dynamic> toJson() =>
    {
      'title': title,
      'description': description,
      'organization': organization,
      'helpersRequired': helpersRequired,
      'location': location,
      'expirationDate': expirationDate,
      'expirationTime': expirationTime,
      'timeToComplete': timeToComplete,
      'skills': skills,
      'images': images
    };
}
