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
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: <Widget>[
                            Text('Godzilla vs. Kong'),
                            Text('2021-03-24'),
                            Text(
                                'In a time when monsters walk the Earth, humanity’s...'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
