import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:healthapp/screens/home_screen.dart';
// import 'package:healthapp/utils/settings.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:healthapp/screens/edit_profile.dart';
// import 'package:healthapp/authentication/user.dart' as globals;
// import 'package:healthapp/screens/chat_screen.dart';
import 'HomeScreen.dart';
import 'edit_profile.dart';
import 'sign_in.dart';

// import 'home/home_page.dart';
String dateTimeConverter(String date) {
  String year = date.split('-')[0];
  String month = date.split('-')[1];
  String day = date.split('-')[2];

  if (month == "01") month = "January";
  if (month == "02") month = "February";
  if (month == "03") month = "March";
  if (month == "04") month = "April";
  if (month == "05") month = "May";
  if (month == "06") month = "June";
  if (month == "07") month = "July";
  if (month == "08") month = "August";
  if (month == "09") month = "September";
  if (month == "10") month = "October";
  if (month == "11") month = "November";
  if (month == "12") month = "December";

  String formattedDate = day + ' ' + month + ', ' + year;
  return formattedDate;
}

//String type;
String gender = "Female",
    dob = "01/05/2000",
    board = "CBSE",
    grade = "5",
    address = "india",
    name = "anjali",
    email = "anjalisoni@google.com";
String school= "DAV Public School",
    parentEmail = "santoshsoni@gmail.com",
    photo =
        "https://lh4.googleusercontent.com/-RCnjIA8a_UQ/AAAAAAAAAAI/AAAAAAAAAAA/AMZuuclOsTzWvMFBj13crPZh4eYpzJaeOg/s96-c/photo.jpg",
    phone = "6203402847", parentPhone="8271975368";

class UserProfile extends StatefulWidget {
  @override
  static const id = "userProfile_page";

  UserProfileState createState() => UserProfileState();
}

//SharedPreferences prefs;

class UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image(
                      image: NetworkImage(
                          user_imageUrl.substring(0, user_imageUrl.length - 5) +
                              's400-c'),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                _text(user_name, Color(0xFF08134D), FontWeight.w700, 29, 0,
                    TextAlign.center),
                _text(user_email, Color(0xFF08134D), FontWeight.w700, 15, 5,
                    TextAlign.center),
                _text(phone, Color(0xFF08134D), FontWeight.w700, 15, 0,
                    TextAlign.center),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                ),
                _information('Gender', gender),
                _information('Date of Birth', "01/05/2000"),
                _information('Board', board),
                _information('School', school ),
                _information('Grade', grade ),
                _information('Parent\'s phone', parentPhone),
                _information('Parent\'s email', parentEmail),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _information(String category, String value) {
    //  getPatient();
    return Container(
      child: Row(
        children: [
          Expanded(
              child: _text(category, Color(0xFF8F8F8F), FontWeight.w600, 15, 7,
                  TextAlign.left)),
          Spacer(),
          Expanded(
              child: _text(value, Color(0xFF606060), FontWeight.w600, 15, 7,
                  TextAlign.right)),
        ],
      ),
    );
  }

  Widget _text(String text, Color color, FontWeight fontWeight, double fontSize,
      double padding, TextAlign textAlign) {
    //getPatient();
    //  print(name);
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
        textAlign: textAlign,
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    // getPatient();
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        'My Profile',
        // style: GoogleFonts.nunito(
        //   fontWeight: FontWeight.bold,
        //   fontSize: 18,
        //   color: Color(0xFF262626),
        // ),
      ),
      leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, HomeScreen.id);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue[700],
          )),
      actions: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              color: Color(0xFFDFE9F7), borderRadius: BorderRadius.circular(7)),
          child: GestureDetector(
            onTap: () {
              //if doctor clicks on then show the precriptions else edit profile
              Navigator.pushNamed(context, Profile.id);
              print('EditProfile to go to');
            },
            child: Icon(
              Icons.edit,
              size: 24,
              color: Color(0xFF007CC2),
            ),
          ),
        ),
      ],
    );
  }
}
