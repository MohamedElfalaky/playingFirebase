import 'package:flutter/material.dart';
import 'package:try_firbs/Shared/Lists.dart';
import 'package:try_firbs/helpers/myApplication.dart';

class MyAuctionScreen extends StatefulWidget {
  const MyAuctionScreen({super.key});

  @override
  State<MyAuctionScreen> createState() => _MyAuctionScreenState();
}

class _MyAuctionScreenState extends State<MyAuctionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 225),
      appBar: AppBar(
        title: Text("Your Auctions"),
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // myApplication.navigateToRemove(context, OnBoarding());
              },
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(
              children: myAuction.isEmpty
                  ? [
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.45),
                        child: Center(
                          child: Text(
                              "You have no auctions, try to add one using below button"),
                        ),
                      ),
                    ]
                  : myAuction),
        ),
      ),
    );
  }
}
