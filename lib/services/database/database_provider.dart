import 'package:flutter/material.dart';
import 'package:project1/models/post.dart';
import 'package:project1/models/user.dart';
import 'package:project1/services/database/database_service.dart';

class DatabaseProvider extends ChangeNotifier{

  
  final _db = DatabaseService();


  Future<UserProfile?> userProfile(String uid) => _db.getUserFromFirebase(uid);

  Future<void> updateBio(String uid, String bio) => _db.updateUserBioInFirebases(uid, bio);

  List<Post> _allPosts = [];

  List<Post> get allPosts => _allPosts;

  Future<void> postMessage(String message) async {
    await _db.postMessageInFirebase(message);
    await loadAllPosts();
  }

  Future<void> loadAllPosts() async{
    final allPosts = await _db.getAllPostsFromFirebase();

    _allPosts = allPosts;

    notifyListeners();

  }



}