import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:healthapp/authentication/user.dart' as globals;
//import 'package:healthapp/utils/settings.dart';
//import 'package:healthapp/widgets/app_bar.dart';
//import 'package:shared_preferences/shared_preferences.dart';
//import 'package:healthapp/screens/upload_photo.dart';

//SharedPreferences prefs;
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
List<Color> _textColor = [
  Color(0xFF8F8F8F),
  Color(0xFF8F8F8F),
  Color(0xFF8F8F8F),
];
List<Color> _bodyColor = [
  Color(0xFFFFFFFF),
  Color(0xFFFFFFFF),
  Color(0xFFFFFFFF),
];
List<String> _category = ['Male', 'Female', 'Other'];
DateTime selectedDate;
String dropdownValue = '1';

String name = '';
String email = '';
String photo = '';
String gender = '';
String address = '';

String phone = '';
String dob = '${selectedDate.toLocal()}'.split(' ')[0];
String school = '';
String board = '';
String grade= '1';
String parentEmail = '';
String parentPhone = '';

String validatePincode(String pincode) {
  Pattern pattern = r'[.,|_]';
  RegExp regex = RegExp(pattern);
  if (pincode.isEmpty) {
    return 'This field cannot be empty';
  } else {
    if (regex.hasMatch(pincode)) {
      return 'Please enter a valid mobile number';
    } else {
      int pin = int.parse(pincode);
      if (pin > 1000000000 && pin < 9999999999) {
        return null;
      } else
        return 'Please enter a valid mobile number';
    }
  }
}

String validateAge(String age) {
  Pattern pattern = r'[.,|_]';
  RegExp regex = RegExp(pattern);
  if (age.isEmpty) {
    return 'This field cannot be empty';
  } else {
    if (regex.hasMatch(age)) {
      return 'Please enter a valid phone no.';
    } else {
      int num = int.parse(age);
      if (num > 0 && num < 100) {
        return null;
      } else
        return 'Please enter a valid age';
    }
  }
}

String validatePhone(String phone) {
  Pattern pattern = r'[.,|_]';
  RegExp regex = RegExp(pattern);
  if (phone.isEmpty) {
    return 'This field cannot be empty';
  } else {
    if (regex.hasMatch(phone)) {
      return 'Please enter a valid phone no.';
    } else {
      int num = int.parse(phone);
      if (num > 1000000000 && num < 9999999999) {
        return null;
      } else
        return 'Please enter a valid phone no.';
    }
  }
}

String validateAddress(String value) {
  if (value.isEmpty) {
    return 'This Field cannot be empty';
  } else if (value.contains(RegExp(r'[A-Z]')) ||
      value.contains(RegExp(r'[a-z]')) ||
      value.contains(RegExp(r'-,/\\()'))) {
    return null;
  } else {
    return 'Please enter a valid address';
  }
}

String validateEmail(String value) {
  if (value.isEmpty) {
    return 'This Field cannot be empty';
  } else if (value.contains(RegExp(r'[A-Z]')) ||
      value.contains(RegExp(r'[a-z]')) ||
      value.contains(RegExp(r'-,/\\()'))) {
    return null;
  } else {
    return 'Please enter a valid email';
  }
}

String validateName(String value) {
  if (value.isEmpty) {
    return 'This Field cannot be empty';
  } else if (value.contains(RegExp(r'[A-Z]')) ||
      value.contains(RegExp(r'[a-z]'))) {
    return null;
  } else {
    return 'Please enter a valid name';
  }
}

String validateGender(String value) {
  if (value.isEmpty) {
    return 'This Field cannot be empty';
  } else if (value == 'M' || value == 'F' || value == 'O') {
    return null;
  } else {
    return 'Please enter a valid gender';
  }
}

// Widget for getting , validating and storing User Address
class UserForm extends StatefulWidget {
  static const id = "user";
  final String currentUserId;

  UserForm({Key key, this.currentUserId}) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextStyle textStyle1 = TextStyle(
      color: Color(0xFF8F8F8F), fontSize: 15, fontWeight: FontWeight.w600);
  TextStyle textStyle2 = TextStyle(
      color: Color(0xFF606060), fontSize: 15, fontWeight: FontWeight.w600);
  InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(7)),
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(7)),
    disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(7)),
  );

  Widget _buildName() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Your full name', style: textStyle1),
          ),
          TextFormField(
              decoration: inputDecoration,
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
              style: textStyle2,
              validator: validateName,
              onSaved: (String value) {
                name = value;
              }),
        ],
      ),
    );
  }

  Widget _buildEmail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Email Address', style: textStyle1),
          ),
          TextFormField(
              decoration: inputDecoration,
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
              style: textStyle2,
              validator: validateEmail,
              onSaved: (String value) {
                email = value;
              }),
        ],
      ),
    );
  }
Widget _buildBoard() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Board', style: textStyle1),
          ),
          TextFormField(
              decoration: inputDecoration,
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
              style: textStyle2,
              validator: validateEmail,
              onSaved: (String value) {
                board = value;
              }),
        ],
      ),
    );
  }

  Widget _buildGender() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Gender', style: textStyle1),
          ),
          Row(
            children: [
              _customButton('Male', 18, 0, 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
              ),
              _customButton('Female', 18, 1, 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
              ),
              _customButton('Other', 18, 2, 20),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDOB(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Date of Birth', style: textStyle1),
          ),
          _getDateTime(context),
        ],
      ),
    );
  }

  Widget _buildGrade() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Grade', style: textStyle1),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              isExpanded: true,
              underline: SizedBox(),
              style: TextStyle(
                  color: Color(0xFF606060),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  grade = dropdownValue;
                });
              },
              items: <String>['1', '2', '3', '4', '5', '6', '7', '8', '9','10','11','12']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentEmail() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Parent\'s email address', style: textStyle1),
          ),
          TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
              
                hintStyle: TextStyle(
                    color: Color(0x6F8F8F8F),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
            
              style: textStyle2,
              onSaved: (String value) {
                parentEmail = value;
              }),
        ],
      ),
    );
  }

  Widget _buildParentPhone() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Parent\s Phone Number', style: textStyle1),
          ),
          TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(7)),
               
                hintStyle: TextStyle(
                    color: Color(0x6F8F8F8F),
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
              keyboardType: TextInputType.number,
              style: textStyle2,
              onSaved: (String value) {
                parentPhone = value;
              }),
        ],
      ),
    );
  }

  Widget _buildAddress() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Address', style: textStyle1),
          ),
          TextFormField(
              decoration: inputDecoration,
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
              style: textStyle2,
              onSaved: (String value) {
                address = value;
              }),
        ],
      ),
    );
  }

  Widget _buildPhone() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('Mobile number', style: textStyle1),
          ),
          TextFormField(
              decoration: inputDecoration,
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
              style: textStyle2,
              keyboardType: TextInputType.number,
              validator: validatePhone,
              onSaved: (String value) {
                phone = value;
              }),
        ],
      ),
    );
  }

  Widget _buildSchool() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text('School', style: textStyle1),
          ),
          TextFormField(
              decoration: inputDecoration,
              cursorColor: Color(0xFF8F8F8F),
              cursorRadius: Radius.circular(10),
              cursorWidth: 0.5,
              style: textStyle2,
              onSaved: (String value) {
                school = value;
              }),
        ],
      ),
    );
  }

  Widget _customButton(String text, double tSize, int index, double padding) {
    return Expanded(
      child: RaisedButton(
        elevation: 0,
        padding: EdgeInsets.all(padding),
        color: _bodyColor[index],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: _getText(text, tSize, _textColor[index]),
        onPressed: () {
          gender = _category[index];
          print(gender);
          setState(() {
            if (_bodyColor[index] == Color(0xFFFFFFFF)) {
              _bodyColor[index] = Color(0xFFDFE9F7);
              _textColor[index] = Color(0xFF408AEB);
              int i = 0, j = 1;
              if (index == 0) {
                i = 1;
                j = 2;
              } else if (index == 1) {
                i = 0;
                j = 2;
              }
              _bodyColor[i] = Color(0xFFFFFFFF);
              _bodyColor[j] = Color(0xFFFFFFFF);
              _textColor[i] = Color(0xFF8F8F8F);
              _textColor[j] = Color(0xFF8F8F8F);
            } else {
              _bodyColor[index] = Color(0xFFFFFFFF);
              _textColor[index] = Color(0xFF8F8F8F);
            }
          });
        },
      ),
    );
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate == null ? DateTime.now() : selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2050),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light().copyWith(
            //textTheme: GoogleFonts.nunitoTextTheme(),
            colorScheme: ColorScheme.light(
              primary: Color(0xFF408AEB),
            ),
          ),
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dob = '${selectedDate.toLocal()}'.split(' ')[0];
      });
  }

  Widget _getDateTime(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
        print(dob);
      },
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: (selectedDate == null) ? Colors.white : Color(0xFFDFE9F7),
        ),
        child: Row(
          children: [
            (selectedDate == null)
                ? _getText('yyyy-mm-dd', 15, Color(0xFF8F8F8F))
                : _getText(
                    dateTimeConverter(
                        '${selectedDate.toLocal()}'.split(' ')[0]),
                    15,
                    Color(0xFF408AEB)),
            Spacer(),
            Icon(Icons.calendar_today,
                color: (selectedDate == null)
                    ? Color(0xFF8F8F8F)
                    : Color(0xFF408AEB),
                size: 20),
          ],
        ),
      ),
    );
  }

  Widget _getText(String text, double size, Color color) {
    return Text(
      text,
      style:
          TextStyle(fontSize: size, color: color, fontWeight: FontWeight.w600),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
     
      body: Material(
        color: Color(0xFFF8F8F8),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          color: Color(0xFFF8F8F8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Hello there!',
                  style: TextStyle(
                    fontSize: 29,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF08134D),
                  ),
                ),
                Text(
                  'Let\'s get your account set up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF8F8F8F),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildName(),
                      _buildDOB(context),
                       _buildAddress(),
                       _buildEmail(),
                      _buildPhone(),
                      _buildGender(),
                      
                      _buildParentEmail(),
                      _buildParentPhone(),
                      _buildSchool(),
                      _buildBoard(),
                     
                      _buildGrade(),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 50, bottom: 250),
                  child: Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          key: Key('Submit'),
                          elevation: 10,
                          color: Colors.blue,
                          padding: EdgeInsets.all(15),
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            // If the form is valid , all the values are saved in respective variables
                            _formKey.currentState.save();
                         //   FirebaseUser user =
                           //     await FirebaseAuth.instance.currentUser();
                           // email = user.email;
                            print(name);
                            print(email);
                            print(phone);
                            print(gender);
                            print(address);
                            print(dob);
                            print(board);
                            print(school);
                            print(parentEmail);
                            print(parentPhone);

                          //  prefs = await SharedPreferences.getInstance();
                            // final doc = await Firestore.instance
                            //     .collection('user_details')
                            //     .where('email', isEqualTo: email)
                            //     .getDocuments();
                            // if (true) {
                            //   await globals.uploadUserDetails(
                            //     name: name,
                            //     email: email,
                            //     gender: gender,
                            //     address: address,
                            //     dob: dob,
                            //     blood: blood,
                            //     height: height,
                            //     weight: weight,
                            //     marital: marital,
                            //     phone: phone,
                            //   );
final _firestore = Firestore.instance;
  final _id = _firestore.collection('user_details').document().documentID;
  print('userdetailsId:$_id');
  await Firestore.instance
      .collection('user_details')
      .document(_id)
      .setData(
    {
      'name': name??"anjali",
      'email': email??"anjali@google.com",
      'gender': gender??'Male',
      'dob': dob??'dd/mm/yyyy',
      'address': 'some address',
      'board': board??'some board',
      'school': school??"Some School",
      'grade': grade??'some grade',
      'parentEmail': parentEmail??'parentsemail@com',
      'parentPhone': parentPhone??'1234567890',
      'Phone': phone??'1234567890',

    },
  );
                            //   await prefs.setString('email', email);
                            //   await prefs.setString('gender', gender);
                            //   await prefs.setString('dob', dob);
                            //   await prefs.setString('gender', gender);
                            //   await prefs.setString('dob', dob);
                            //   await prefs.setString('blood', blood);
                            //   await prefs.setString(
                            //       'height', height.toString());
                            //   await prefs.setString(
                            //       'weight', weight.toString());
                            //   await prefs.setString('marital', marital);
                            //   await prefs.setString('address', address);
                            //   await prefs.setString('phone', phone.toString());
                            // }
                            // globals.user.phone = phone;
                            // Navigator.pushNamed(context, UploadPhoto.id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen(
                                     )));
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(7)),
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}