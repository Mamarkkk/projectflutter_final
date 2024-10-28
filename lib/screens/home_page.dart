import 'package:flutter/material.dart';
import 'package:project1/components/my_drawer.dart';
import 'package:project1/components/my_input_alert_box.dart';
import 'package:project1/models/post.dart';
import 'package:project1/services/database/database_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  

  late final databaseProvider = Provider.of<DatabaseProvider>(context, listen: false);
  late final listeningProvider = Provider.of<DatabaseProvider>(context, listen: false);

  final _messageController = TextEditingController();


  @override
  void initState(){
    super.initState();

    loadAllPosts();
  }

  Future<void> loadAllPosts() async {
    await databaseProvider.loadAllPosts();
  }


  void _openPostMessageBox() {
    showDialog(
        context: context,
        builder: (context) => MyInputAlertBox(
            hintText: "พยายามให้มันโพสต์ได้แล้วครับ เอาลงไปในfirebaseได้ แต่ดึงกลับมาไม่ได้เหมือน bio เลยครับ T_T",
            textController: _messageController,
            onPressed: ()async {
              await postMessage(_messageController.text);
            },
            onPressedText: "Post"));
  }


  Future<void> postMessage(String message) async {
    await databaseProvider.postMessage(message);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("HOME"),
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openPostMessageBox,
        child: const Icon(Icons.add),
      ),


      body: _buildPostList(listeningProvider.allPosts),




    );
  }

  Widget _buildPostList(List<Post> posts) {
    return posts.isEmpty ? 
    const Center(child: Text("Nothing Here",),
    ) 
    : 
    ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
      final post = posts[index];

      return Container(
        child: Text(post.message),
      );
    },
    );
  }
}
