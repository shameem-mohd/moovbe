import 'package:flutter/material.dart';
import 'package:moovbe_bus_project/ui/Home/BusDetails.dart';
import 'package:moovbe_bus_project/ui/Home/DriverList.dart';
import 'package:moovbe_bus_project/ui/Widgets/Colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          elevation: 0,
          flexibleSpace: const FlexibleSpaceBar(),
          backgroundColor: BlackColor,
          centerTitle: true,
          title: Container(
            height: mHeight * .055,
            width: mWidth * .35,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/moovbe.png"), fit: BoxFit.fill)),
          ),
        ),
      ),
      body: Column(
        children: [
          // SizedBox(
          //   height: mHeight * .02,
          // ),
          Flexible(
            flex: 2,
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const BusDetails()));
                },
                child: Container(
                  height: mHeight * .23,
                  width: mWidth * .44,
                  decoration: BoxDecoration(
                      color: RedColor, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: mHeight * .05,
                        width: mWidth * .35,
                        // color: Colors.yellow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Bus",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "Manage Your Bus",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10, left: 30),
                          height: mHeight * .15,
                          width: mWidth * .35,
                          child: Image.asset('assets/bus.png')),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const DriverList()));
                },
                child: Container(
                  height: mHeight * .23,
                  width: mWidth * .44,
                  decoration: BoxDecoration(
                      color: BlackColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        height: mHeight * .05,
                        width: mWidth * .35,
                        // color: Colors.yellow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Driver",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              "Manage Your Driver",
                              style:
                                  TextStyle(color: primaryColor, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 10, left: 30),
                          height: mHeight * .15,
                          width: mWidth * .35,
                          child: Image.asset('assets/man.png')),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              SizedBox(
                width: 15,
              ),
              Text(
                "21 Buses Found",
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
          SizedBox(
            height: mHeight * .594,
            // color: Colors.yellow,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      Container(
                        height: mHeight * .09,
                        width: mWidth * .93,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: const Color(0xffEEEEEE),
                            )),
                        child: Row(
                          children: [
                            Container(
                              // margin: EdgeInsets.only(left: mWidth * .02),
                              height: mHeight,
                              width: mWidth * .2,
                              color: const Color(0xffF3F3F3),
                              child: Image.asset(
                                "assets/bus2.png",
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: mWidth * .07),
                              height: mHeight * .08,
                              width: mWidth * .41,
                              // color: Colors.yellow,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "KSRTC",
                                    // style:  TextStyle(fontSize: 20),
                                  ),
                                  Text(
                                    "Swift Scania P-series",
                                    // style:  TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => const BusDetails()));
                              },
                              child: Container(
                                // margin: EdgeInsets.only(left: mWidth * .02),
                                height: mHeight * .04,
                                width: mWidth * .2,
                                decoration: BoxDecoration(
                                    color: RedColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                    child: Text(
                                  "Manage",
                                  style: TextStyle(
                                      color: primaryColor, fontSize: 12),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (ctx, index) {
                  return SizedBox(
                    height: mHeight * .03,
                  );
                },
                itemCount: 6),
          )
        ],
      ),
    );
  }
}
