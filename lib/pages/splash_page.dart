import 'package:business_directory/pages/get_started_page.dart';
import 'package:business_directory/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FlutterSecureStorage().read(key: "jwtToken"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError || snapshot.data == null) {
            return GetStartedPage();
          }
          return HomePage();
        },
      ),
    );
  }
}
