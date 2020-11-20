# urltotitle

# autotextchanger

# Usage

This Package use for auto change the unlimited text,Its support both Android and iOS,you can easily use,using cama type long text,you can customize the text change duration and Animated the text.

## Example

# Package

Add this package in your Pubspec.yaml

```yaml
dependencies:
  flutter:
    sdk: flutter
//Add this line
  urltotitle: ^0.0.1
```

```flutter

//import this 

import 'package:urltotitle/urltotitle.dart';

```
 # main screen Example


```flutter

  @override
  void initState() {
    getTitle();
    super.initState();
  }

   
 void getTitle() async {

// define this on top 
    String url="https://www.newssite.com/news/newsoftheday/2021/3/20";

    Urltotitle urltotitle = new Urltotitle(url);


    // This is get a single url title and body 
    var title = await urltotitle.getTitle();
    var body = await urltotitle.getbody();


 // This is get a Multiple url title and body 

     List<String> urls = [
      "https://www.newssite.com/news/newsoftheday/2020/3/09",
       "https://www.newssite.com/news/newsoftheday/2020/3/04",
        "https://www.newssite.com/news/newsoftheday/2021/3/20"
    ];

    List<String> listtiles = await urltotitle.getListofTitles(urls);
    List<String> listbody = await urltotitle.getListofBody(urls);
    

//print all values 

    print("Title :: " + title);
    print("Body :: " + body);
    print("listoftitle " + listtiles.toString());
    print("listofbody " + listbody.toString());
  }

```

[Exmaple Project](https://github.com/pilojanmobile/urltotitleexmaple)

## License
[MIT](https://choosealicense.com/licenses/mit/)
