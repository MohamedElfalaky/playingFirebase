import 'package:flutter/material.dart';
import 'package:try_firbs/Shared/Lists.dart';

class AllAuctionScreen extends StatefulWidget {
  const AllAuctionScreen({super.key});

  @override
  State<AllAuctionScreen> createState() => _AllAuctionScreenState();
}

class _AllAuctionScreenState extends State<AllAuctionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 225),
      appBar: AppBar(
        title: Text("All Users Auctions"),
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // MyApplication.navigateToRemove(context, OnBoarding());
              },
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        margin: EdgeInsets.only(top: 12, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Column(children: allAuction),
        ),
      ),
    );
  }
}
