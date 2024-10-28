import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project1/models/post.dart';
import 'package:project1/models/user.dart';
import 'package:project1/services/auth/auth_service.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  //save user info
  Future<void> saveUserInfoInFirebase({required String name, email}) async {
    String uid = _auth.currentUser!.uid;

    String usernname = email.split('@')[0];

    UserProfile user = UserProfile(
      uid: uid,
      name: name,
      email: email,
      username: usernname,
      bio: '',
    );

    final userMap = user.toMap();

    await _db.collection("Users").doc(uid).set(userMap);
  }

  //get user info
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      DocumentSnapshot userDoc = await _db.collection("Users").doc(uid).get();
      return UserProfile.fromDocument(userDoc);
    } catch (e) {
      print(e);
      return null;
    }
  }

  //update user bio
  Future<void> updateUserBioInFirebases(String uid, String bio) async {
    DocumentReference userDoc =
        FirebaseFirestore.instance.collection('User').doc(uid);

    await userDoc.update({'bio': bio}).catchError((error) {
      print('Error updating bio: $error');
    });
  }

  //post message
  Future<void> postMessageInFirebase(String message) async {
    try{
      String uid = _auth.currentUser!.uid;

      UserProfile? user = await getUserFromFirebase(uid);

      Post newPost = Post(
        id: '', 
        uid: uid, 
        name: user!.name, 
        username: user.username, 
        message: message, 
        timestamp: Timestamp.now(), 
        likeCount: 0, 
        likedBy: []
      );

      Map<String, dynamic> newPostMap = newPost.toMap();

      await _db.collection("Posts").add(newPostMap);
    }
    catch(e){
      print(e);
    }

  }

  Future<List<Post>> getAllPostsFromFirebase() async{
    try{
      QuerySnapshot snapshot = await _db.collection("Posts").orderBy('timestamp', descending: true).get();

      return snapshot.docs.map((doc) => Post.fromDocument(doc)).toList();
    }catch (e){
      return [];
    }
  }


  Future<void> deleteUserInfoFromFirebase (String uid) async {

    WriteBatch batch = _db.batch();

    DocumentReference userDoc = _db.collection("Users").doc(uid);
    batch.delete(userDoc);
    
    QuerySnapshot userPosts = await _db.collection("Posts").where('uid', isEqualTo: uid).get();
    for (var post in userPosts.docs) {
      batch.delete(post.reference);
    }

    await batch.commit();
  }







}
