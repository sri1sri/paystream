import 'package:cloud_firestore/cloud_firestore.dart';
class UserDetails{
  UserDetails({
    this.username,
    this.phoneNumber,
    this.dateOfBirth,
    this.gender,
    this.joinedDate,
    this.latitude,
    this.longitude,
    this.userID,
    this.empty,
    this.userImagePath,
    this.totalLinks,
    this.totalMedia,
    this.totalReactions,

  });

  final String username;
  final String phoneNumber;
  final String gender;
  final Timestamp dateOfBirth;
  final Timestamp joinedDate;
  final String latitude;
  final String longitude;
  final String userImagePath;
  final String userID;
  final Null empty;
  final int totalLinks;
  final int totalMedia;
  final int totalReactions;


  factory UserDetails.fromMap(Map<String, dynamic> data, String documentID){
    if(data == null){
      return null;
    }
    final String userID = documentID;

    final String username = data['user_name'];
    final String phoneNumber = data['user_contact_number'];
    final String gender = data['user_gender'];
    final Timestamp dateOfBirth = data['user_date_of_birth'];
    final Timestamp joinedDate = data['user_join_date'];
    final String latitude = data['user_latitude'];
    final String longitude = data['user_longitude'];
    final String userImagePath = data['user_image_path'];
    final int totalLinks = data['total_links'];
    final int totalMedia = data['total_media'];
    final int totalReactions = data['total_reactions'];

    final Null empty = data['empty'];


    return UserDetails(
      username: username,
      phoneNumber: phoneNumber,
      gender: gender,
      dateOfBirth: dateOfBirth,
      joinedDate: joinedDate,
      latitude: latitude,
      longitude: longitude,
      userID: userID,
      userImagePath: userImagePath,
      totalLinks:totalLinks,
      totalMedia:totalMedia,
      totalReactions:totalReactions,
      empty: empty,

    );
  }

  Map<String, dynamic> toMap(){
    return {
      username != null ? 'user_name': 'empty' : username,
      phoneNumber != null ? 'user_contact_number':'empty' :  phoneNumber,
      gender != null ? 'user_gender': 'empty' : gender,
      dateOfBirth != null ? 'user_date_of_birth': 'empty' : dateOfBirth,
      joinedDate != null ? 'user_join_date': 'empty' : joinedDate,
      latitude != null ? 'user_latitude': 'empty' : latitude,
      longitude != null ? 'user_longitude': 'empty' : longitude,
      userImagePath != null ? 'user_image_path': 'empty' : userImagePath,
      totalLinks != null ? 'total_links': 'empty' : totalLinks,
      totalMedia != null ? 'total_media': 'empty' : totalMedia,
      totalReactions != null ? 'total_reactions': 'empty' : totalReactions,
    };
  }
}