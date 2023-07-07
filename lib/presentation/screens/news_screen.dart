import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarName(
          title: 'Latest News',
          subTitle: 'Portfolio Related',
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                  Text('Sensex, Nifty Trade Near Day\'s Low As Larsen & Toubro, Bajaj Finance And ICICI Bank Drag',
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Stock Market LIVE Update: Benchmark indices are extending losses as we move into the second half of trade and it is fair to say that the Nifty 50\'s eight-day winning streak is well under threat. The Sensex is down over 400 points, while the Nifty 50 is falling towards its first key downside support zone of 19,350 - 19,320. Banking stocks are the bigger underperformers today. '),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network('https://gumlet.assettype.com/bloombergquint%2F2022-12%2F3d471ece-3376-4b3c-8f71-3817ffefaf48%2Fbse_reuters_1.jpg?rect=0%2C0%2C960%2C540&auto=format%2Ccompress&w=400')
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Text('Stock Market LIVE Update: Sensex, Nifty 50 near day\'s low; Liquor stocks decline after Karnataka hikes AED',
                    style: TextStyle(
                        fontSize: 20
                    ),),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Stock Market LIVE Update: Benchmark indices are extending losses as we move into the second half of trade and it is fair to say that the Nifty 50\'s eight-day winning streak is well under threat. The Sensex is down over 400 points, while the Nifty 50 is falling towards its first key downside support zone of 19,350 - 19,320. Banking stocks are the bigger underperformers today. '),
                  SizedBox(
                    height: 10,
                  ),
                  Image.network('https://images.cnbctv18.com/wp-content/uploads/2023/05/Trade-Setup-1019x573.jpeg?impolicy=website&width=600&height=264')
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
