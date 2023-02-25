import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe_bus_project/model/DriverListModel.dart';
import 'package:moovbe_bus_project/repositary/Bloc/DriverList/driverlist_bloc.dart';
import 'package:moovbe_bus_project/ui/Home/AddDriver.dart';
import 'package:moovbe_bus_project/ui/Widgets/Colors.dart';

class DriverList extends StatefulWidget {
  const DriverList({Key? key}) : super(key: key);

  @override
  State<DriverList> createState() => _DriverListState();
}

class _DriverListState extends State<DriverList> {
  @override
  void initState() {
    BlocProvider.of<DriverlistBloc>(context).add(FetchDriver());
    // TODO: implement initState
    super.initState();
  }

  late DriverListModel driverListModel;
  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<DriverlistBloc, DriverlistState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is DriverlistDeleted) {
          BlocProvider.of<DriverlistBloc>(context).add(FetchDriver());
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBar(
                elevation: 0,
                flexibleSpace: const FlexibleSpaceBar(),
                backgroundColor: BlackColor,
                centerTitle: true,
                title: const Text("Driver List")),
          ),
          body: BlocBuilder<DriverlistBloc, DriverlistState>(
              builder: (context, state) {
            if (state is DriverlistLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is DriverlistError) {
              return RefreshIndicator(
                onRefresh: () async {
                  return BlocProvider.of<DriverlistBloc>(context)
                      .add(FetchDriver());
                },
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .9,
                    // color: Colors.red,
                    child: const Center(
                      child: Text("Oops something went wrong"),
                    ),
                  ),
                ),
              );
            }
            if (state is DriverlistLoaded) {
              driverListModel =
                  BlocProvider.of<DriverlistBloc>(context).driverListModel;
              return Column(
                children: [
                  SizedBox(
                    height: mHeight * .02,
                  ),
                  Row(
                    children: const [
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "21 Drivers Found",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(
                    height: mHeight * .02,
                  ),
                  SizedBox(
                    height: mHeight * .73,
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
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            CircleAvatar(
                                              radius: 25,
                                              backgroundImage: AssetImage(
                                                  'assets/driver.png'),
                                            ),
                                          ],
                                        )),
                                    Container(
                                      margin:
                                          EdgeInsets.only(left: mWidth * .06),
                                      height: mHeight * .08,
                                      width: mWidth * .41,
                                      // color: Colors.yellow,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            driverListModel
                                                .driverList![index].name
                                                .toString(),
                                            // style: const TextStyle(fontSize: 20),
                                          ),
                                          Row(
                                            children: [
                                              const Text(
                                                "License no:",
                                                style: TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                              Text(
                                                driverListModel
                                                    .driverList![index]
                                                    .licenseNo
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        BlocProvider.of<DriverlistBloc>(context)
                                            .add(FetchDeleteDriver(
                                                driverId: driverListModel
                                                    .driverList![index].id
                                                    .toString()));
                                      },
                                      child: Container(
                                        // margin: EdgeInsets.only(left: mWidth * .02),
                                        height: mHeight * .04,
                                        width: mWidth * .2,
                                        decoration: BoxDecoration(
                                            color: RedColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: const Center(
                                            child: Text(
                                          "Delete",
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 12),
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
                        itemCount: driverListModel.driverList!.length),
                  ),
                  SizedBox(
                    height: mHeight * .07,
                    width: mWidth * .8,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const AddDriver()));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: RedColor, //background color of button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          "Add Driver",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: primaryColor),
                        )),
                  ),
                ],
              );
            } else {
              return Container();
            }
          })),
    );
  }
}
