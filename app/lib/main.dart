import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'models/post.dart';
import 'models/post_mock.dart';
import 'posts_list.dart';
import 'services/auth.dart';
import 'sign_in_fab.dart';

void main() {
  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.black,
      systemNavigationBarIconBrightness: Brightness.dark
    )
  );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birb',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        accentColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Birb'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(widget.title),
        ),
        elevation: 0.0,
      ),
      body: PostsList(_loadPosts(context)),
      floatingActionButton: SignInFab(
        auth: Auth(
          firebaseAuth: FirebaseAuth.instance,
          googleSignIn: GoogleSignIn(),
        ),
      ),
    );
  }

  Stream<List<Post>> _loadPosts(BuildContext context) {
  final List<List<dynamic>> mockSnapshot = <List<dynamic>>[
    List<dynamic>.generate(10, (int index) => mockPostData(index: index))
  ];
  return Stream<List<dynamic>>.fromIterable(mockSnapshot)
      .map(_convertToPosts);
  }

  List<Post> _convertToPosts(List<dynamic> data) {
    return data.map((dynamic item) => Post.fromMap(item)).toList();
  }
}
