import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UserDetailView extends StatelessWidget {
  final String firstName;
  final String email;
  final String avatar;
  final String lastName;
  final String ID;

  UserDetailView(
      this.firstName, this.email, this.avatar, this.lastName, this.ID,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User Detail View",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'SFPro',
            color: Color(0XFF4C4C4C),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/app_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 0.0, bottom: 56, left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Stack(children: [
                    Card(
                      margin: EdgeInsets.only(top: 56),
                      elevation: 16.0,
                      color: Color(0XFF3e1fdc),
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.horizontal(
                              right: Radius.circular(16),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 56.0, bottom: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "User ID: $ID",
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'SFPro',
                                  color: Color(0XFF4C4C4C),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                firstName + " " + lastName,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'SFPro',
                                  color: Colors.teal,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                email,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'SFPro',
                                  color: Color(0XFF797979),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          //border
                          radius: 45,
                          backgroundColor: Color(0XFFff4491),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(avatar),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
          Positioned(
            left: -200,
            top: -100,
            child: Opacity(
              opacity: 0.7,
              child: LottieBuilder.asset(
                "assets/lottie/blast_anim.json",
                reverse: true,
                options: LottieOptions(enableApplyingOpacityToLayers: true),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
