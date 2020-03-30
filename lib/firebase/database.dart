
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:paystream/Database_models/PostDetails.dart';
import 'package:paystream/Database_models/UserDetails.dart';
import 'package:paystream/common_variables/app_functions.dart';
import 'package:meta/meta.dart';

import 'api_path.dart';
import 'firestore_service.dart';

abstract class Database{

  Stream<UserDetails> readUser(String employeeID);
  Future<void> setPostEntry(PostDetails postEntry, String postID);
  Stream<List<PostDetails>> readPosts(String queryKey1, queryValue1, String queryKey2, queryValue2, bool isQuerying);
  Stream<List<PostDetails>> readSubQueryPosts(String queryKey1, queryValue1);
  Future<void> updatePostEntry(PostDetails postEntry, String postID);
  Future<void> updateUserDetails(UserDetails userDetails, String postID);

}

class FirestoreDatabase implements Database {

  FirestoreDatabase({@required this.uid}) : assert (uid != null);
  final String uid;

  final _service = FirestoreService.instance;

  @override
  Stream<UserDetails> readUser(String employeeID) => _service.documentStream(
    path: APIPath.userDetails(employeeID),
    builder: (data, documentId) => UserDetails.fromMap(data, documentId),

  );

  @override
  Future<void> setPostEntry(PostDetails postEntry, String postID) async => await _service.setData(
    path: APIPath.postDetails(postID),
    data: postEntry.toMap(),
  );

  @override
  Stream<List<PostDetails>> readPosts(String queryKey1, queryValue1, String queryKey2, queryValue2, bool isQuerying) => _service.collectionStream(
    type: 0,
    path: APIPath.readPosts(),
    builder: (data, documentId) => PostDetails.fromMap(data, documentId),
    queryBuilder: (query) => !isQuerying ? query.where(queryKey1, isEqualTo: queryValue1).where('post_is_deleted', isEqualTo: false): query.where(queryKey1, isEqualTo: queryValue1).where(queryKey2, isEqualTo: queryValue2).where('post_is_deleted', isEqualTo: false),
  );

  @override
  Future<void> updatePostEntry(PostDetails postEntry, String postID) async => await _service.updateData(
    path: APIPath.postDetails(postID),
    data: postEntry.toMap(),
  );

  @override
  Future<void> updateUserDetails(UserDetails userDetails, String postID) async => await _service.updateData(
    path: APIPath.userDetails(postID),
    data: userDetails.toMap(),
  );

  @override
  Stream<List<PostDetails>> readSubQueryPosts(String queryKey1, queryValue1) => _service.collectionStream(
      type: 0,
      path: APIPath.readPosts(),
    builder: (data, documentId) => PostDetails.fromMap(data, documentId),
    queryBuilder: (query) => query.where(queryKey1, arrayContains: queryValue1).where('post_is_deleted', isEqualTo: false),
  );

}