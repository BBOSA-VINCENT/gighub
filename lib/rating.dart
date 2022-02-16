import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:gighub/main_drawer.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => new _TestState();
}

class _TestState extends State {
  double rating = 3.5;
  int starCount = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.teal[200],
          title: new Text("Rating and Review"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
               Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => MainDrawer()),
                     );
            },
          )),
      body: new Column(
        children: [
          new Padding(
            padding: new EdgeInsets.only(
              top: 50.0,
              bottom: 50.0,
            ),
            child: new StarRating(
              size: 25.0,
              rating: rating,
              color: Colors.orange,
              borderColor: Colors.grey,
              starCount: starCount,
              onRatingChanged: (rating) => setState(
                () {
                  this.rating = rating;
                },
              ),
            ),
          ),
          new Text(
            "Your rating is: $rating",
            style: new TextStyle(fontSize: 30.0),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            clipBehavior: Clip.antiAlias,
            color: Colors.grey,
            elevation: 5.0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Write your Review here:",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            hintText: 'your experience with the employee',
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 10.0, bottom: 10.0),
                child: TextButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => MainDrawer()),
                    // );
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
