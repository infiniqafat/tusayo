import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tusayo/src/widget/button_action.dart';
import 'package:tusayo/src/widget/input_field.dart';
// import 'package:tusayo/src/screen/home.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/img/logo.png'),
      ),
    );

    final email = InputField(
      hintText: 'Email',
      textInputType: TextInputType.emailAddress,
      validator: (input) {
        if (input.isEmpty) {
          return 'Email tidak boleh kosong';
        }
        return '';
      },
      prefixIcon: FontAwesomeIcons.envelope,
      onSaved: (input) => _email = input,
    );

    final password = InputField(
      hintText: 'Password',
      isPassword: true,
      prefixIcon: FontAwesomeIcons.lock,
      validator: (input) {
        if (input.isEmpty) {
          return 'Password tidak boleh kosong';
        }
        return '';
      },
      onSaved: (input) => _password = input,
    );

    final loginButton = ButtonAction(
      label: 'Login',
      onPress: signIn,
    );
    final forgotLabel = SizedBox(
      height: 15.0,
      child: FlatButton(
        child: Container(
          alignment: Alignment.topRight,
          child: Text(
            'Lupa password?',
            style: TextStyle(color: Colors.black54, fontSize: 12.0),
            textAlign: TextAlign.right,
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, 'forgot_password');
        },
      ),
    );
    
    final socialLoginLabel = Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Social Login',
              style: TextStyle(
                fontSize: 12.0,
              )
          ),
        ],
      );
    
    final registerLabel = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Tidak Punya Akun?',
              style: TextStyle(
                fontSize: 12.0,
              )),
          InkWell(
            onTap: () {},
            child: Text('Daftar',
                style: TextStyle(
                  color: Color(0xFF5d74e3),
                )),
          )
        ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  logo,
                  email,
                  password,
                  forgotLabel,
                  SizedBox(height: 8.0),
                  loginButton,
                ],
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            socialLoginLabel,
            SizedBox(
              height: 8.0,
            ),
            socialLogin(),
            SizedBox(
              height: 24.0,
            ),
            registerLabel
          ],
        ),
      ),
    );
  }
  
Widget socialLogin() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.40,
        child: buttonGoogle() ,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.40,
        child: buttonFb() ,
      ),
    ],
  );
}

Widget buttonFb() {
  return SizedBox(
    height: 45.0,
    child: RaisedButton(
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFF102397),
                Color(0xFF187adf),
                Color(0xFF00eaf8),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.facebook),
            SizedBox(
              width: 10.0,
            ),
            new Text('Facebook'.toUpperCase(),
                style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
    ),
  );
}

Widget buttonGoogle() {
  return SizedBox(
    height: 45.0,
    child: RaisedButton(
      onPressed: () {},
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[
                Color(0xFFff4f38),
                Color(0xFFff355d),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.google),
            SizedBox(
              width: 10.0,
            ),
            new Text('Google'.toUpperCase(),
                style: TextStyle(fontSize: 14, color: Colors.white)),
          ],
        ),
      ),
    ),
  );
}


  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print("email: $_email, password: $_password");
      Navigator.pushNamed(context, '/');
    }
  }
}
