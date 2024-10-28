import 'package:flutter/material.dart';
import 'package:project1/components/my_bio.dart';
import 'package:project1/components/my_input_alert_box.dart';
import 'package:project1/models/user.dart';
import 'package:project1/services/auth/auth_service.dart';
import 'package:project1/services/database/database_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  String currentUserId = AuthService().getCurrentUid();
  UserProfile? user; // สร้างตัวแปรเก็บข้อมูลผู้ใช้
  final bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUser(); // โหลดข้อมูลเมื่อเริ่มต้น
  }

  Future<void> loadUser() async {
    user = await databaseProvider.userProfile(widget.uid);
    setState(() {}); // อัปเดต UI
  }

  void _showEditBio() {
    bioController.text = user?.bio ?? ''; // ตั้งค่า textController ให้เป็น bio ปัจจุบัน
    showDialog(
      context: context,
      builder: (context) => MyInputAlertBox(
        hintText: "พยายามให้มันอัพเดทbioแล้วครับ แต่มันหาuidไม่เจอได้ไง T_T",
        textController: bioController,
        onPressed: saveBio,
        onPressedText: "Save",
      ),
    );
  }

  Future<void> saveBio() async {
    await databaseProvider.updateBio(widget.uid,bioController.text);
    await loadUser(); // โหลดข้อมูลใหม่หลังจากอัปเดต
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(user?.name ?? 'Profile'), // ป้องกันการแสดงค่า null
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: user == null // แสดง UI เมื่อ user ยังไม่มีข้อมูล
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  Center(
                    child: Text(
                      '@${user!.name}',
                      style:
                          TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.all(25),
                      child: Icon(Icons.person,
                          size: 70, color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Bio",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary)),
                      GestureDetector(
                          onTap: _showEditBio,
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary),
                          )),
                    ],
                  ),
                  const SizedBox(height: 10),
                  MyBio(text: user!.bio),
                ],
              ),
            ),
    );
  }
}
