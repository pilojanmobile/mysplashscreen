import 'package:flutter/material.dart';
import 'package:urltotitle/urltotitle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example of urltotitle package',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://www.newssite.com/news/newsoftheday/2021/3/20";

  List<String> urls = [
    "https://www.newssite.com/news/newsoftheday/2020/3/09",
    "https://www.newssite.com/news/newsoftheday/2020/3/04",
    "https://www.newssite.com/news/newsoftheday/2021/3/20"
  ];

  Urltotitle urltotitle;

  @override
  void initState() {
    urltotitle = new Urltotitle(url);
    gettitle();
    super.initState();
  }

  void gettitle() async {
    Urltotitle urltotitle = new Urltotitle(url);

    // This is get a single url title and body
    var title = await urltotitle.getTitle();
    var body = await urltotitle.getbody();

    // This is get a Multiple url title and body

    List<String> listtiles = await urltotitle.getListofTitles(urls);
    List<String> listbody = await urltotitle.getListofBody(urls);

//print all values

    print("Title :: " + title);
    print("Body :: " + body);
    print("listoftitle " + listtiles.toString());
    print("listofbody " + listbody.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
