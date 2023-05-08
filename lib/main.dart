import 'package:eos_clock/config/color_service.dart';
import 'package:eos_clock/screens/my_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:eos_clock/view/home_screen.dart';
import 'package:eos_clock/view/login_screen.dart';
import 'package:eos_clock/view/signup_screen.dart';
import 'package:eos_clock/config/color_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: ColorService.createMaterialColor(Color(0xFF1CAF49))),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData) {
              return HomeScreen();
            }
            return LoginScreen();
          },
        ),
        routes: {
            '/signup' : (context) => SignUpScreen(),
            '/login' : (context) => LoginScreen(),
        }
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "first App",
        theme: ThemeData(
            primarySwatch: Colors.lightGreen,
            fontFamily: 'Teko'
        ),
        home: MyHomePage()
    );
  }
}