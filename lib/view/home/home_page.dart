import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keepit/controller/routing.dart';
import 'package:keepit/core/constants/constants.dart';
import 'package:keepit/model/services/google_auth_services.dart';
import 'package:keepit/view/widgets/main_folder.dart';
import 'package:keepit/view/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final email = user!.email;
    final name = email!.substring(0, email.indexOf('@')).toUpperCase();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome $name',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          GestureDetector(
              onTap: () {
                FirebaseAuth.instance.signOut();
                AuthService().signOutGoogle();
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.logout),
              ))
        ],
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            kHeight20,
            const SearchTile(),
            kHeight20,
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 5, left: 10),
              child: Row(
                children: [
                  Text(
                    'Important files',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            kHeight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kWidth10,
                MainFolder(
                    text: 'Aadhar',
                    onTap: () {
                      RoutingPage().folderToAddPage();
                    }),
                kWidth10,
                const MainFolder(text: 'PAN'),
                kWidth10,
                const MainFolder(text: 'License'),
                kWidth10,
              ],
            ),
            kHeight20,
            Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 5, left: 10),
              child: Row(
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const MainFolder(text: 'Images'),
                const MainFolder(text: 'Video'),
                const MainFolder(text: 'PDF'),
              ],
            ),
            kHeight30,
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  const MainFolder(text: 'Music'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
          )),
    );
  }
}