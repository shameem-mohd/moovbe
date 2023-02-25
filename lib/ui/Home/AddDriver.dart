import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe_bus_project/repositary/Bloc/DriverList/driverlist_bloc.dart';
import 'package:moovbe_bus_project/ui/Widgets/Colors.dart';
import 'package:moovbe_bus_project/ui/Widgets/TextFieldInput.dart';

import 'DriverList.dart';

class AddDriver extends StatefulWidget {
  const AddDriver({Key? key}) : super(key: key);

  @override
  State<AddDriver> createState() => _AddDriverState();
}

class _AddDriverState extends State<AddDriver> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _licNoController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _licNoController.dispose();
    _mobileController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<DriverlistBloc, DriverlistState>(
      listener: (context, state) {
        if (state is DriverlistLoading) {
          print("Driverlist loading");
        }
        if (state is DriverlistAdded) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const DriverList()));
        }
        if (state is DriverlistError) {
          print("Driverlist Error");
        }
        // TODO: implement listener
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
              elevation: 0,
              flexibleSpace: const FlexibleSpaceBar(),
              backgroundColor: BlackColor,
              centerTitle: true,
              title: const Text("Add Driver")),
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
            SizedBox(
              height: mHeight * .1,
              width: mWidth * .8,
              child: TextFieldInput(
                  textEditingController: _nameController,
                  hintText: "Enter Name",
                  textInputType: TextInputType.emailAddress),
            ),
            SizedBox(
              height: mHeight * .1,
              width: mWidth * .8,
              child: TextFieldInput(
                  textEditingController: _mobileController,
                  hintText: "Enter mobile",
                  textInputType: TextInputType.emailAddress),
            ),
            SizedBox(
              height: mHeight * .1,
              width: mWidth * .8,
              child: TextFieldInput(
                  textEditingController: _licNoController,
                  hintText: "Enter License Number",
                  textInputType: TextInputType.emailAddress),
            ),
            SizedBox(
              height: mHeight * .45,
            ),
            SizedBox(
              height: mHeight * .07,
              width: mWidth * .8,
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<DriverlistBloc>(context).add(FetchAddDriver(
                        name: _nameController.text,
                        licenseNo: _licNoController.text,
                        mobile: _mobileController.text));
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
            SizedBox(
              height: mHeight * .03,
            ),
          ],
        ),
      ),
    );
  }
}
