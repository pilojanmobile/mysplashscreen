library mysplashscreen;

import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySplashScreen extends StatefulWidget {
  final String assetimage;
  final String networkimage;
  final double imagesize;
  final String bottomtext;
  final bool loading;
  final Color backcolor;
  final int loadtimeSec;
  final TextStyle bottomtextstyle;
  final Widget nextscreen;
  MySplashScreen(
      {this.assetimage,
      this.networkimage,
      this.imagesize,
      this.bottomtext,
      this.loading,
      this.backcolor,
      this.loadtimeSec,
      this.bottomtextstyle,
      @required this.nextscreen});

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    countStart(widget.loadtimeSec != null ? widget.loadtimeSec : 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          widget.backcolor != null ? widget.backcolor : Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                alignment: Alignment.center,
                child: widget.assetimage == null && widget.networkimage == null
                    ? Center(
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: NetworkImage(
                              'https://thumbs.dreamstime.com/b/close-up-petals-dark-red-roase-rose-garden-141852655.jpg'),
                        ),
                      )
                    : widget.assetimage != null
                        ? Center(
                            child: CircleAvatar(
                                radius: widget.imagesize != null &&
                                        widget.imagesize != 0
                                    ? widget.imagesize
                                    : 70.0,
                                backgroundImage: AssetImage(widget.assetimage)),
                          )
                        : Center(
                            child: CircleAvatar(
                                radius: widget.imagesize != null &&
                                        widget.imagesize != 0
                                    ? widget.imagesize
                                    : 70.0,
                                backgroundImage:
                                    NetworkImage(widget.networkimage)),
                          ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: widget.bottomtext != null
                ? Center(
                    child: Text(
                  
                      widget.bottomtext,
                      textAlign: TextAlign.center,
                      style: widget.bottomtextstyle!=null?widget.bottomtextstyle:
                      TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.black),
                    ),
                  )
                : Center(),
          ),
          Center(
            child: Padding(
                padding: const EdgeInsets.only(
                    right: 10, left: 10, bottom: 20, top: 5),
                child: widget.loading != null
                    ? widget.loading
                        ? Platform.isAndroid
                            ? CircularProgressIndicator()
                            : CupertinoActivityIndicator()
                        : Center()
                    : Center()),
          )
        ],
      ),
    );
  }

  void countStart(int timeload) async {
    var materialPageRoute;
    await Future.delayed(Duration(seconds: timeload)).then((value) {
      if (Platform.isAndroid) {
        materialPageRoute =
            MaterialPageRoute(builder: (context) => widget.nextscreen);
      } else {
        materialPageRoute =
            CupertinoPageRoute(builder: (context) => widget.nextscreen);
      }
      return {Navigator.pushReplacement(context, materialPageRoute)};
    });
  }
}
