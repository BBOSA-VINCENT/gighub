import 'package:flutter/material.dart';

class Payments extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = ThemeData();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(primary: Colors.teal[600]),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Payments'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(24),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Gig ID'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Date'),
                      keyboardType: TextInputType.datetime,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Gig'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Amount(UGX)'),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      child: Text(
                        'Pay',
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(60.0),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
