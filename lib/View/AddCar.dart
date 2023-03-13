import 'package:flutter/material.dart';
import 'package:try_firbs/View/AppMain.dart';
import 'package:try_firbs/Shared/AuctionItems.dart';
import 'package:try_firbs/Shared/Button.dart';
import 'package:try_firbs/Shared/Lists.dart';
import 'package:try_firbs/helpers/myApplication.dart';

class AddCar extends StatefulWidget {
  const AddCar({super.key});

  @override
  State<AddCar> createState() => _AddCarState();
}

TextEditingController priceController = TextEditingController();

class _AddCarState extends State<AddCar> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _titleController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _passengersController = TextEditingController();
  TextEditingController _imgController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // _titleController.clear();
    // _idController.clear();
    // _yearController.clear();
    // _passengersController.clear();
    // _priceController.clear();
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Form(
        key: _formKey,
        child: Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: myButton(() {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  myAuction.insert(
                      0,
                      AuctionItems(
                        img: _imgController.text,
                        title: _titleController.text,
                        id: _idController.text,
                        model: _yearController.text,
                        passenger: _passengersController.text,
                        price: priceController.text,
                        owner: 1,
                      ));

                  allAuction.insert(
                      0,
                      AuctionItems(
                        img: _imgController.text,
                        title: _titleController.text,
                        id: _idController.text,
                        model: _yearController.text,
                        passenger: _passengersController.text,
                        price: priceController.text,
                        owner: 0,
                      ));
                  Future.delayed(Duration(milliseconds: 1000), () {
                    myApplication.navigateToRemove(context, AppMain());
                  });
                });
              }
            }, "Add to Auction"),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            title: const Text("Add Car"),
          ),
          body: Container(
            margin: const EdgeInsets.only(
              // top: 8,
              left: 12,
              right: 12,
            ),
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Enter your Auction title",
                    ),
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Please Enter your Auction title";
                      },
                      controller: _titleController,
                      decoration: myDecoration(
                          lable: "Title",
                          hint: "Ex: Used Toyota with very good engine")),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 20),
                    child: Text(
                      "Enter your Car Id",
                    ),
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) return "Please Enter your Car ID";
                      },
                      controller: _idController,
                      keyboardType: TextInputType.number,
                      decoration: myDecoration(lable: "Id", hint: "Ex: 16728")),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 20),
                    child: Text(
                      "Enter car model year",
                    ),
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Please Enter your Car model year";
                      },
                      controller: _yearController,
                      keyboardType: TextInputType.number,
                      decoration:
                          myDecoration(lable: "Model year", hint: "Ex: 2022")),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 20),
                    child: Text(
                      "Enter No. of Passengers",
                    ),
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Please Enter your Car capacity";
                      },
                      controller: _passengersController,
                      keyboardType: TextInputType.number,
                      decoration: myDecoration(
                          lable: "No. of passengers", hint: "Ex: 6")),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 20),
                    child: Text(
                      "Enter Car Price",
                    ),
                  ),
                  TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty)
                          return "Please Enter The start price";
                      },
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: myDecoration(
                          lable: "Price in Dollar", hint: "100000 \$")),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0, top: 20),
                    child: Text(
                      "Add your car image URL",
                    ),
                  ),
                  TextFormField(
                      controller: _imgController,
                      keyboardType: TextInputType.number,
                      decoration: myDecoration(
                          lable: "Image URL",
                          hint:
                              "https://hips.hearstapps.com/hmg-prod/images/2023-mclaren-artura-101-1655218102.jpg?crop=1.00xw:0.847xh;0,0.153xh&resize=1200:*")),
                  const SizedBox(
                    height: 70,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration myDecoration({String? lable, String? hint}) {
    return InputDecoration(
      label: Text(lable ?? ""),
      fillColor: const Color(0XFFFFF7E999),
      filled: true,
      hintText: hint,
      hintStyle: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
      border: const OutlineInputBorder(), // square border
      enabledBorder: OutlineInputBorder(
          //rounded borders
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color.fromRGBO(5, 5, 5, 0.333),
          )),

      focusedBorder: OutlineInputBorder(
          //rounded borders
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Color.fromRGBO(0, 0, 0, 1),
          )),
      contentPadding: const EdgeInsets.only(
        left: 16,
        bottom: 12,
        top: 12,
        right: 16,
      ),
    );
  }
}
