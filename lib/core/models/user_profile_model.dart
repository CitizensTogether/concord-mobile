import 'package:stacked/stacked.dart';
import 'dart:convert';

/// Data used to provide user profile details screen functionality.
class UserProfileModel extends BaseViewModel {
  String _name = 'First Last';
  String get name => '$_name';

  String _email = 'email@email.com';
  String get email => '$_email';

  String _phoneNumber = '555-555-5555';
  String get phoneNumber => '$_phoneNumber';

  int _hoursDone = 50;
  int get hoursDone => _hoursDone;

  int _requestsDone = 500;
  int get requestsDone => _requestsDone;

  String _profilePicture = 'https://i.imgur.com/Gaw4Tpn.jpg';
  String get profilePicture => '$_profilePicture';

  List<String> _skills = ["skill 1", "skill 2", "skill 3", "skill 4"];
  List<String> get skills => _skills;

  List<String> _badges = ["badge 1", "badge 2", "badge 3", "badge 4"];
  List<String> get badges => _badges;

  List<dynamic> _completedRequests =
      jsonDecode('[{"title":"hi","description":"yes"}]');
  List<dynamic> get completedRequests => _completedRequests;

  List<dynamic> _postedRequests =
      jsonDecode('[{"title":"hi","description":"yes"}]');
  List<dynamic> get postedRequests => _postedRequests;
}
