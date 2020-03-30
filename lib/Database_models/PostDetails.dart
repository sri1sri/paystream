
import 'package:cloud_firestore/cloud_firestore.dart';
class PostDetails{
  PostDetails({
    this.postIsDeleted,
    this.postAddedDate,
    this.postAddedByUid,
    this.postAddedByPhoneNumber,
    this.postImagePath,
    this.postLocation,
    this.postTitle,
    this.postUrl,
    this.empty,
    this.postDescription,
    this.postType,
    this.postViewCount,
    this.postVisitedCount,
    this.postID,
    this.reactedCorrect,
    this.reactedWrong,
    this.reported,
    this.reactedIDs,
  });

  final bool postIsDeleted;
  final Timestamp postAddedDate;
  final String postAddedByUid;
  final String postAddedByPhoneNumber;
  final String postImagePath;
  final GeoPoint postLocation;
  final String postTitle;
  final String postDescription;
  final String postUrl;
  final int postType;
  final int postViewCount;
  final int postVisitedCount;

  var reactedCorrect =[];
  var reactedWrong=[];
  var reported=[];
  var reactedIDs=[];


  final String postID;
  final Null empty;



  factory PostDetails.fromMap(Map<String, dynamic> data, String documentID){
    if(data == null){
      return null;
    }
    final String postID = documentID;

    final bool postIsDeleted = data['post_is_deleted'];
    final Timestamp postAddedDate = data['post_added_date'];
    final String postAddedByUid = data['post_added_by_uid'];
    final String postAddedByPhoneNumber = data['post_added_by_phone_number'];
    final String postImagePath = data['post_image_path'];
    final GeoPoint postLocation = data['post_location'];
    final String postTitle = data['post_title'];
    final String postDescription = data['post_description'];
    final String postUrl = data['post_url'];
    final int postType = data['post_type'];
    final int postViewCount = data['post_view_count'];
    final int postVisitedCount = data['post_visited_count'];
    final Null empty = data['empty'];

    final reactedCorrect = data['reacted_correct'];
    final reactedWrong = data['reacted_wrong'];
    final reported = data['reported'];
    final reactedIDs = data['reacted_ids'];


    return PostDetails(
      postIsDeleted: postIsDeleted,
      postAddedDate: postAddedDate,
      postAddedByUid: postAddedByUid,
      postAddedByPhoneNumber: postAddedByPhoneNumber,
      postImagePath: postImagePath,
      postLocation: postLocation,
      postTitle: postTitle,
      postDescription: postDescription,
      postUrl: postUrl,
      postType: postType,
      postViewCount: postViewCount,
      postVisitedCount: postVisitedCount,
      postID: postID,
      reactedCorrect:reactedCorrect,
      reactedWrong:reactedWrong,
      reported:reported,
      reactedIDs:reactedIDs,
      empty: empty,

    );
  }

  Map<String, dynamic> toMap(){
    return {
      postIsDeleted != null ? 'post_is_deleted': 'empty' : postIsDeleted,
      postAddedDate != null ? 'post_added_date':'empty' :  postAddedDate,
      postAddedByUid != null ? 'post_added_by_uid': 'empty' : postAddedByUid,
      postAddedByPhoneNumber != null ? 'post_added_by_phone_number': 'empty' : postAddedByPhoneNumber,
      postImagePath != null ? 'post_image_path': 'empty' : postImagePath,
      postLocation != null ? 'post_location': 'empty' : postLocation,
      postTitle != null ? 'post_title': 'empty' : postTitle,
      postDescription != null ? 'post_description': 'empty' : postDescription,
      postUrl != null ? 'post_url': 'empty' : postUrl,
      postType != null ? 'post_type': 'empty' : postType,
      postViewCount != null ? 'post_view_count': 'empty' : postViewCount,
      postVisitedCount != null ? 'post_visited_count': 'empty' : postVisitedCount,
      reactedIDs != null ? 'reacted_ids': 'empty' : reactedIDs,
      reactedCorrect != null ? 'reacted_correct': 'empty' : reactedCorrect,
      reactedWrong != null ? 'reacted_wrong': 'empty' : reactedWrong,
      reported != null ? 'reported': 'empty' : reported,



    };
  }
}