import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe_bus_project/repositary/Bloc/UserBloc/userbloc_bloc.dart';
import 'package:moovbe_bus_project/ui/Home/HomePage.dart';
import 'package:moovbe_bus_project/ui/Widgets/Colors.dart';
import 'package:moovbe_bus_project/ui/Widgets/TextFieldInput.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({Key? key}) : super(key: key);

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mWidth = MediaQuery.of(context).size.width;
    return BlocListener<UserblocBloc, UserblocState>(
      listener: (context, state) {
        if (state is UserblocLoading) {
          // print("Userbloc loading");
        }
        if (state is UserblocLoaded) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
              (route) => false);
        }
        if (state is UserblocError) {
          // print("Userbloc Error");
        }
        // TODO: implement listener
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryColor,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: mHeight * .35,
                  width: mWidth,
                  color: Colors.black,
                  child: CustomPaint(
                    size: Size(
                        mWidth,
                        (mWidth * 1.6666666666666667)
                            .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                    painter: RPSCustomPainter(),
                  ),
                  // decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("assets/login.png"), fit: BoxFit.fill)),
                  // child: Image.asset(
                  //   "assets/login.png",
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Positioned(
                  top: mHeight * .19,
                  left: mWidth * .08,
                  child: SizedBox(
                    height: mHeight * .1,
                    width: mWidth * .6,
                    // color: Colors.yellow,
                    child: Column(
                      children: [
                        Image.asset("assets/Welcome.png"),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Manage your Bus and Drivers",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SizedBox(
              height: mHeight * .1,
              width: mWidth * .8,
              child: TextFieldInput(
                  textEditingController: _userNameController,
                  hintText: "Enter Username",
                  textInputType: TextInputType.emailAddress),
            ),
            SizedBox(
              height: mHeight * .1,
              width: mWidth * .8,
              child: TextFieldInput(
                  textEditingController: _passwordController,
                  hintText: "Enter Password",
                  textInputType: TextInputType.emailAddress),
            ),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            SizedBox(
              height: mHeight * .3,
            ),
            SizedBox(
              height: mHeight * .07,
              width: mWidth * .8,
              child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<UserblocBloc>(context).add(FetchUser(
                        username: _userNameController.text,
                        password: _passwordController.text));
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    primary: RedColor, //background color of button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: primaryColor),
                  )),
            ),
            SizedBox(
              height: mHeight * .03,
            )
          ],
        ),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color(0xffFC153B)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.1966667, size.height * 0.0500000);
    path0.lineTo(size.width * 0.7900000, size.height * 0.9960000);
    path0.lineTo(size.width, size.height * 0.6220000);
    path0.lineTo(size.width, size.height * 0.0420000);
    path0.lineTo(size.width * 0.1966667, size.height * 0.0380000);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
