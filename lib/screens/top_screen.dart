import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Card(
              child: Row(
                children: <Widget>[
                  Image.network(
                      'https://image.tmdb.org/t/p/w154//5KYaB1CTAklQHm846mHTFkozgDN.jpg'),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 15),
                            // height: 50,
                            child: Text(
                              'Godzilla vs. Kong',
                              style: Theme.of(context).textTheme.headline6,
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 15),
                            // height: 20,
                            child: Text(
                              '2021-03-24',
                              style: TextStyle(
                                color: Colors.grey.shade700,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            // height: 60,
                            child: Text(
                              'In a time when monsters walk the Earth, humanity’s...',
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
