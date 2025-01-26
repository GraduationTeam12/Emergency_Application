import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ContactWithAdmin extends StatefulWidget {
  const ContactWithAdmin({super.key});

  @override
  State<ContactWithAdmin> createState() => _ContactWithAdminState();
}

class _ContactWithAdminState extends State<ContactWithAdmin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
          appBar: AppBar(
          title: Text(
            "Contact with admin",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
          ),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back)),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
      
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You can contact technical support to find a solution for your issue",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 22,
                      color: Color.fromRGBO(92, 88, 88, 1)),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Contact With Admin",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4.0,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(222, 119, 28, 1),
                          width: 1.3,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(222, 119, 28, 1),
                          width: 1.7,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Message",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        offset: Offset(0, 4),
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: TextField(
                      maxLines: 8,
                      decoration: InputDecoration(
                        hintText: 'Enter your message here',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(222, 119, 28, 1),
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(222, 119, 28, 1),
                            width: 1.7,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      )),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white, 
                        borderRadius:
                            BorderRadius.circular(10.0), 
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, 4),
                            blurRadius: 4.0,
                            spreadRadius: 0
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (kDebugMode) {
                            print("Send button pressed");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(61, 100, 152, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 24),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: MediaQuery.of(context).size.width * 0.2 ,  vertical: 4),
                          child: Text(
                            "Send",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
