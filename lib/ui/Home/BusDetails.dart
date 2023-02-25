import 'package:flutter/material.dart';
import 'package:moovbe_bus_project/ui/Widgets/Colors.dart';

class BusDetails extends StatefulWidget {
  const BusDetails({Key? key}) : super(key: key);

  @override
  State<BusDetails> createState() => _BusDetailsState();
}

class _BusDetailsState extends State<BusDetails> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            elevation: 0,
            flexibleSpace: const FlexibleSpaceBar(),
            backgroundColor: BlackColor,
            centerTitle: true,
            title: const Text("KSRTC Swift Scania P-​series")),
      ),
      body: Column(
        children: [
          SizedBox(
            height: mHeight * .02,
          ),
          Center(
            child: Container(
              height: mHeight * .15,
              width: mWidth * .9,
              decoration: BoxDecoration(
                  color: BlackColor, borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    height: mHeight * .1,
                    width: mWidth * .5,
                    // color: Colors.yellow,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Rohit Sharma",
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: const [
                            Text(
                              "License no:",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              "23524262646",
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, top: 20),
                    height: mHeight * .3,
                    width: mWidth * .25,
                    // color: Colors.red,
                    child: Image.asset("assets/man.png"),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            height: mHeight * .65,
            width: mWidth * .75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xffDCDCDC),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: mHeight * .05),
                  height: mHeight * .55,
                  width: mWidth * .6,
                  child: Image.asset(
                    "assets/seat.png",
                    height: 20,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
