import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double jam = 50;
    final iconList = <IconData>[
      Icons.brightness_5,
      Icons.brightness_4,
      Icons.brightness_6,
      Icons.brightness_7,
    ];
    var _bottomNavIndex = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(30.0), // here the desired height
          child: AppBar(
            automaticallyImplyLeading: false,
            actions: <Widget>[Container()],
            //hammenu
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 33,
            ),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            centerTitle: true,
            title: Text(
              'RUS GO !',
              style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0)),
            ),
            elevation: 0,
          )),
      body: Column(children: [
        PreferredSize(
          preferredSize: Size.fromHeight(70.0), //
          child: AppBar(
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
              size: 33,
            ),
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            title: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/img/pp.png'),
                  radius: 20,
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 10,
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TyperAnimatedText(
                            'Pelajar',
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 109, 109, 109),
                            ),
                            // duration: const Duration(milliseconds: 6000),
                          ),
                          TyperAnimatedText(
                            '11 PPLG 2',
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 109, 109, 109),
                            ),
                          ),
                          TyperAnimatedText(
                            'Absen 31',
                            textStyle: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 109, 109, 109),
                            ),
                          ),
                        ],
                        repeatForever: true,
                        pause: const Duration(milliseconds: 9000),

                        // onTap: () {
                        //   print("Tap Event");
                        // },
                      ),
                    ),

                    // Text('Pelajar',
                    //     style: GoogleFonts.inter(
                    //       fontSize: 13,
                    //       fontWeight: FontWeight.w600,
                    //       color: Color.fromARGB(255, 109, 109, 109),
                    //     )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        StreamBuilder<User?>(
                            stream: FirebaseAuth.instance.userChanges(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                    '${FirebaseAuth.instance.currentUser!.displayName}',
                                    style: GoogleFonts.inter(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 0, 0, 0)));
                              } else {
                                return Text(
                                  'Rangga Alrasya',
                                  style: GoogleFonts.inter(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(255, 0, 0, 0)),
                                );
                              }
                            }),
                        SizedBox(
                          width: 6,
                        ),
                        StreamBuilder<User?>(
                            stream: FirebaseAuth.instance.userChanges(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                    '${FirebaseAuth.instance.currentUser!.email}',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 109, 109, 109),
                                    ));
                              } else {
                                return Text('(04476)',
                                    style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromARGB(255, 109, 109, 109),
                                    ));
                              }
                            }),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Column(
          children: [
            Container(
              child: Container(
                width: 320,
                height: 185,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.22),
                          offset: Offset(0, 3),
                          blurRadius: 4)
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    )),
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(
                      top: 10,
                    )),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(padding: EdgeInsets.only(left: 8)),
                        Text(
                          'Absen Masuk Pagi',
                          style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        Spacer(),
                        Text(
                          'Senin 22 , April 2023',
                          style: GoogleFonts.inter(
                              fontSize: 9.5,
                              fontWeight: FontWeight.w700,
                              color: Color.fromARGB(255, 109, 109, 109)),
                        ),
                        Padding(padding: EdgeInsets.only(right: 10)),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Padding(padding: EdgeInsets.only(left: 20)),
                        Row(
                          children: [
                            Container(
                                height: jam,
                                width: jam,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.22),
                                          offset: Offset(0, 3),
                                          blurRadius: 4)
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      bottomLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                      bottomRight: Radius.circular(4.0),
                                    )),
                                child: Center(
                                  child: Text('05',
                                      style: GoogleFonts.inter(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 109, 109, 109),
                                      )),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: jam,
                              width: jam,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.22),
                                        offset: Offset(0, 3),
                                        blurRadius: 4)
                                  ],
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    bottomLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                    bottomRight: Radius.circular(4.0),
                                  )),
                              child: Center(
                                child: Text('45',
                                    style: GoogleFonts.inter(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 109, 109, 109),
                                    )),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Icon(
                          CupertinoIcons.minus,
                          size: 40,
                          color: Color.fromARGB(255, 109, 109, 109),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            Container(
                                height: jam,
                                width: jam,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.22),
                                          offset: Offset(0, 3),
                                          blurRadius: 4)
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      bottomLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                      bottomRight: Radius.circular(4.0),
                                    )),
                                child: Center(
                                  child: Text('05',
                                      style: GoogleFonts.inter(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 109, 109, 109),
                                      )),
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                                height: jam,
                                width: jam,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.22),
                                          offset: Offset(0, 3),
                                          blurRadius: 4)
                                    ],
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(4.0),
                                      bottomLeft: Radius.circular(4.0),
                                      topRight: Radius.circular(4.0),
                                      bottomRight: Radius.circular(4.0),
                                    )),
                                child: Center(
                                  child: Text('05',
                                      style: GoogleFonts.inter(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 109, 109, 109),
                                      )),
                                )),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(right: 20)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.time,
                          size: 13,
                        ),
                        SizedBox(width: 3),
                        Text('1 jam 14 Menit',
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 230,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (FirebaseAuth.instance.currentUser == null) {
                            GoogleSignInAccount? account =
                                await GoogleSignIn().signIn();

                            if (account != null) {
                              GoogleSignInAuthentication auth =
                                  await account.authentication;
                              OAuthCredential credential =
                                  GoogleAuthProvider.credential(
                                      accessToken: auth.accessToken,
                                      idToken: auth.idToken);
                              await FirebaseAuth.instance
                                  .signInWithCredential(credential);
                            }
                          } else {
                            GoogleSignIn().signOut();
                            FirebaseAuth.instance.signOut();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5CB65C),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Spacer(),
                              StreamBuilder<User?>(
                                  stream: FirebaseAuth.instance.userChanges(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return const Text('Sign Out');
                                    } else {
                                      return Text('LOGIN TEST',
                                          style: GoogleFonts.inter(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255)));
                                    }
                                  }),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ]),
      //drawer-sidear-navbar
      endDrawer: Drawer(
        elevation: 10.0,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 120,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.grey.shade500),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg',
                      ),
                      radius: 40.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder<User?>(
                            stream: FirebaseAuth.instance.userChanges(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  '${FirebaseAuth.instance.currentUser!.displayName}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 25.0),
                                );
                              } else {
                                return Text(
                                  'Tom Cruise',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 25.0),
                                );
                              }
                            }),
                        SizedBox(height: 10.0),
                        StreamBuilder<User?>(
                            stream: FirebaseAuth.instance.userChanges(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  '${FirebaseAuth.instance.currentUser!.email}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14.0),
                                );
                              } else {
                                return Text(
                                  'Default@gmail.com',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 14.0),
                                );
                              }
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ),
            //menu
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home Page', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            Divider(height: 3.0),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings', style: TextStyle(fontSize: 18)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.close),
              title: Text('Close Drawer', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff5CB65C),
          onPressed: () {},
          child: Container(
              height: 32, child: Image(image: AssetImage('assets/img/qr.png')))
          //params
          ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: iconList,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        //other params
      ),
    );
  }
}
