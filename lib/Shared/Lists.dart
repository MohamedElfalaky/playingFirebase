import 'package:flutter/material.dart';
import 'package:try_firbs/Shared/AuctionItems.dart';

List<AuctionItems> myAuction = [];

List<Widget> allAuction = [
  AuctionItems(
    img:
        "https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*",
    seconds: 70,
  ),
  AuctionItems(
    img: "",
    title: "Falaky car",
    id: "25555",
    model: "2023",
    passenger: "8",
    price: "1000000",
    seconds: 180,
  ),
];
