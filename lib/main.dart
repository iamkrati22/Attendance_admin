import 'package:attendance_admin/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var name = preferences.getString('name');
  print(name);
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: name == null ? const Login() : const MyHomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon buticon = const Icon(Icons.bluetooth);
  String button = 'Start';
  String name = '';
  String text = 'Caution! Ask all the students to switch on Bluetooth first';
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  onClick() {
    setState(() {
      buticon = const Icon(Icons.bluetooth_connected);
      button = 'Collecting';
      text = 'Collecting Attendance Data, please wait';
    });
  }

  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('name');
    prefs.remove('email');
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext ctx) => const Login()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Track Attendance',
            style: GoogleFonts.montserrat(fontSize: size.width * 0.05),
          ),
          actions: [
            MaterialButton(
              onPressed: logout,
              child: Row(children: [
                Icon(Icons.logout),
                SizedBox(width: size.width * 0.03),
                Text(
                  'Logout',
                  style: GoogleFonts.montserrat(fontSize: size.width * 0.04),
                )
              ]),
            )
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: Text('Welcome, ',
                    style: GoogleFonts.montserrat(fontSize: size.width * 0.05)),
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: const Text(
                    'Click the button below to start collecting Attendance'),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              MaterialButton(
                onPressed: onClick,
                child: Container(
                    decoration: BoxDecoration(color: Colors.grey.shade800),
                    width: size.width * 0.35,
                    child: Padding(
                      padding: EdgeInsets.all(size.width * 0.03),
                      child: Row(children: [
                        buticon,
                        SizedBox(
                          width: size.width * 0.03,
                        ),
                        Text(button)
                      ]),
                    )),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              Padding(
                padding: EdgeInsets.all(size.width * 0.03),
                child: Text(text),
              ),
            ]),
          ),
        ));
  }
}
