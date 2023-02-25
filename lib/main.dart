import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovbe_bus_project/repositary/Bloc/DriverList/driverlist_bloc.dart';
import 'package:moovbe_bus_project/repositary/Bloc/UserBloc/userbloc_bloc.dart';
import 'package:moovbe_bus_project/ui/Home/SplashScreen.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => UserblocBloc()),
    BlocProvider(create: (context) => DriverlistBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
