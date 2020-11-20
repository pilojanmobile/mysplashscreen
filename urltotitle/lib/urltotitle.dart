library urltotitle;

import 'package:http/http.dart' as http;

class Urltotitle {
  String url;
  Function getdetails;
  Urltotitle(this.url);

  Future<String> _urltoTitle(url) async {
    Map<String, String> headers = {'Content-Type': 'text/html;charset=utf-8'};
    var response = await http.get(url, headers: headers);
    //If the http request is successful the statusCode will be 200
    if (response.statusCode == 200) {
      String html = response.body;
      return html.toString();
    } else {
      return null;
    }
  }

  Future<String> getTitle() async {
    var html = await _urltoTitle(url);
    if (html.contains('<title>')) {
      try {
        html = html.substring(html.indexOf('<title>'));
        html = html.substring(7, html.indexOf('</title>'));

        return html.toString();
      } on Exception {
        return null;
      }
    } else {
      return null;
    }
  }
 Future<String> _getTitles(String hello) async {
    var html = await _urltoTitle(hello);
    if (html.contains('<title>')) {
      try {
        html = html.substring(html.indexOf('<title>'));
        html = html.substring(7, html.indexOf('</title>'));

        return html.toString();
      } on Exception {
        return null;
      }
    } else {
      return null;
    }
  }
    Future<String> _getbodys(String url) async {
    var html = await _urltoTitle(url);
    if (html.contains('description" content=')) {
      try {
        html = html.substring(html.indexOf('description" content='));
        html = html.substring(21, html.indexOf('>'));
        html = html.replaceAll('"', '');
        html = html.replaceAll('/', '');
        return html.toString();
      } on Exception {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<String> getbody() async {
    var html = await _urltoTitle(url);
    if (html.contains('description" content=')) {
      try {
        html = html.substring(html.indexOf('description" content='));
        html = html.substring(21, html.indexOf('>'));
        html = html.replaceAll('"', '');
        html = html.replaceAll('/', '');
        return html.toString();
      } on Exception {
        return null;
      }
    } else {
      return null;
    }
  }

  Future<List<String>> getListofTitles(List<String> hello) async {
    List<String> sharetitles = List();
    for (int t = 0; t < hello.length; t++) {
      var result = await _getTitles(hello[t]);
      sharetitles.add(result);
    }
    return sharetitles;
  }

    Future<List<String>> getListofBody(List<String> hello) async {
    List<String> sharetitles = List();
    for (int t = 0; t < hello.length; t++) {
      var result = await _getbodys(hello[t]);
      sharetitles.add(result);
    }
    return sharetitles;
  }
}
