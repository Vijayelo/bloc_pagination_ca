import 'package:flutter/material.dart';

class UserItem extends StatelessWidget {
  final String firstName;
  final String email;
  final String avatar;

  const UserItem(this.firstName, this.email, this.avatar, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 6.0,
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
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            firstName,
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
