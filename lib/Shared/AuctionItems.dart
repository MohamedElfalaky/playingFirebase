import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/index.dart';
import 'package:flutter_svg/svg.dart';
import 'package:try_firbs/Shared/Button.dart';
import 'package:try_firbs/helpers/myApplication.dart';

class AuctionItems extends StatefulWidget {
  final String? img;
  final String? title;
  final String? id;
  final String? model;
  final String? passenger;
  final String? price;
  final int? seconds;
  final owner;

  AuctionItems(
      {super.key,
      this.img,
      this.title,
      this.id,
      this.model,
      this.passenger,
      this.price,
      this.owner,
      this.seconds = 172800});

  @override
  State<AuctionItems> createState() => _AuctionItemsState();
}

class _AuctionItemsState extends State<AuctionItems> {
  late CountdownTimerController controller;
  late num newPrice;

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    controller = CountdownTimerController(
      endTime: DateTime.now().millisecondsSinceEpoch + 1000 * widget.seconds!,
      onEnd: () {
        print(controller.isRunning.toString());
        print("controller.isRunning");
        Future.delayed(Duration(milliseconds: 1), () {
          setState(() {});
        });
      },
    );

    newPrice = num.parse(widget.price ?? "20000");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    controller.start();
  }

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      // height: 380,
      // width: 330,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.img == null || widget.img == ""
                          ? ""
                          : widget.img!),
                      fit: BoxFit.fill),
                  // color: Colors.green,
                ),
                height: myApplication.hightClc(context, 176),
              ),
            ],
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title ?? "Verna Marcides ",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.insert_drive_file,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(widget.id ?? "12548")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.timelapse_outlined,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(widget.model ?? "2020")
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.people,
                          size: 30,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(widget.passenger ?? "6")
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(
                        top: 12,
                      ),
                      child: Text(
                        newPrice != null ? "${newPrice} \$" : "20000 \$",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 34, 2, 195)),
                        // overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                Column(
                  // mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: controller.isRunning == true
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          controller.isRunning == true ? "Open" : "Closed",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 3,
                              color: const Color.fromARGB(255, 255, 55, 0))),
                      child: CountdownTimer(
                        controller: controller,
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        endWidget: const Text(
                          "00:00:00",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 0, 0),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    widget.owner == 0
                        ? Text("You can't participae in your own Auction")
                        : widget.owner == 1
                            ? SizedBox()
                            : SizedBox(
                                width: 220,
                                child: myButton(
                                  btnClr: controller.isRunning == true
                                      ? null
                                      : Colors.grey,
                                  () {
                                    controller.isRunning == true
                                        ? setState(() {
                                            newPrice = newPrice + 100;
                                          })
                                        : null;
                                  },
                                  "Increase Price",
                                  btnIcon: Icon(Icons.arrow_circle_up),
                                ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
