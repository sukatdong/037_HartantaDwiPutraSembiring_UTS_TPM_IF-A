import 'package:flutter/material.dart';
import 'package:uts_tpm/home_page.dart';

String username = "";
String password = "";
bool isLoginSuccess = true;
bool isHidden = true;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: Column(children: [
          SizedBox(height: 200),
          _usernameField(),
          _passwordField(),
          SizedBox(height: 20),
          _loginButton(context),
        ]),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                  color: (isLoginSuccess) ? Colors.green : Colors.red),
            ),
            suffixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          obscureText: isHidden,
          enabled: true,
          onChanged: (value) {
            password = value;
          },
          decoration: InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                  color: (isLoginSuccess) ? Colors.green : Colors.red),
            ),
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  isHidden = !isHidden;
                });
              },
              child: Icon((isHidden) ? Icons.lock : Icons.lock_open_outlined),
            ),
          ),
        ));
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.orange : Colors.red,
          onPrimary: Colors.black,
        ),
        onPressed: () {
          String text = "";
          if (username == "123200037" && password == "hartanta") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });

            Route route = MaterialPageRoute(builder: (context) => HomePage());
            Navigator.push(context, route);
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
            backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }
}
