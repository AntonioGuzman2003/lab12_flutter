import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isAndroid) {
      debugPrint("Android");
      // Return Cupertino login for Android
      return const CupertinoApp(
        home: CupertinoLoginPage(),
      );
    } else if (UniversalPlatform.isWeb) {
      debugPrint("Web");
      // Return Material login for Web
      return const MaterialApp(
        home: MaterialLoginPage(),
      );
    } else {
      return Container();
    }
  }
}

class CupertinoLoginPage extends StatelessWidget {
  const CupertinoLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Login - Cupertino'),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/5087/5087579.png',
              width: 200,
              height: 150,
            ),
            SizedBox(height: 50),
            CupertinoFormSection(
              header: Text('Login'),
              children: [
                CupertinoTextFormFieldRow(
                  placeholder: 'Username',
                  prefix: Icon(Icons.person),
                ),
                SizedBox(height: 16),
                CupertinoTextFormFieldRow(
                  placeholder: 'Password',
                  prefix: Icon(Icons.lock),
                  obscureText: true,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Forgot Password',
              style: TextStyle(
                  color: Color.fromARGB(255, 74, 168, 245), fontSize: 15),
            ),
            SizedBox(height: 16),
            CupertinoButton.filled(
              child: Text('Login'),
              onPressed: () {},
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 100,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('New User? Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MaterialLoginPage extends StatelessWidget {
  const MaterialLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login - Material'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              'https://png.pngtree.com/svg/20170827/people_106508.png',
              width: 200,
              height: 150,
            ),
            SizedBox(height: 50),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 110),
            Text(
              'Forgot Password',
              style: TextStyle(
                color: Color.fromARGB(255, 58, 161, 27),
                fontSize: 15,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 120,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text('New User? Create Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
