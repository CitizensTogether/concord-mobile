import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:concord/core/models/user_model.dart';
import 'package:concord/core/models/organization_model.dart';
import 'dart:convert';

final firestoreInstance = Firestore.instance;

// Retrieving a user based on their user ID (retrieved through authentication)
User retrieveUserInfo(userID) {
  var document = Firestore.instance.document('users/' + userID);
  Map userMap = jsonDecode(document.toString());
  return User.fromJson(userMap);
}

// Update a user's info based on the user ID and the new user information
void updateUserInfo(userID, user) {
  firestoreInstance.collection("users").document(userID).updateData(user.toJson());
}

//  Add new user to the database
void createNewUser(user) {
  firestoreInstance.collection("users").add(user.toJson());
}

// Retrieve a list of organizations
List<Organization> getOrganizations() {
  List<Organization> organizations;
  firestoreInstance.collection("organizations").getDocuments().then((querySnapshot) {
    querySnapshot.documents.forEach((document) {
      Map organizationMap = jsonDecode(document.toString());
      organizations.add(Organization.fromJson(organizationMap));
    });
  });
  return organizations;
}