import 'package:flutter/material.dart';
import 'package:futsal/decorations/loading.dart';
import 'package:futsal/services/auth.dart';
import 'package:futsal/decorations/formfields.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authen = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String _email = '';
  String _password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
              title: Text('Sign In'),
              centerTitle: true,
              elevation: 10.0,
              actions: <Widget>[
                FlatButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            body: Stack(
              children: <Widget>[
                new Container(
                  padding: EdgeInsets.all(16.0),
                  child: new Form(
                    key: _formKey,
                    child: new ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        // Logo Starts
                        new Hero(
                          tag: 'hero',
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
                            child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 48.0,
                                child: Image.asset('assets/images/logo.png')),
                          ),
                        ),
                        // Logo Ends
                        SizedBox(height: 70.0),
                        Center(
                          child: Text(
                            error,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        // Email-Input Starts
                        new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                          child: TextFormField(
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: false,
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Email', fillColor: Colors.blue[50]),
                            validator: (value) => value.isEmpty
                                ? 'Email field shouln\'t be empty'
                                : null,
                            onChanged: (value) => _email = value,
                          ),
                        ),
                        // Email-Input Ends
                        // Password-Input Starts
                        new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                          child: TextFormField(
                            maxLines: 1,
                            obscureText: true,
                            autofocus: false,
                            decoration: textInputDecoration.copyWith(
                                icon: Icon(
                                  Icons.security,
                                  color: Colors.green,
                                ),
                                hintText: 'Password',
                                fillColor: Colors.blue[50]),
                            validator: (value) => value.length < 6
                                ? 'Password must be 6+ char long'
                                : null,
                            onChanged: (value) {
                              setState(() => _password = value);
                            },
                          ),
                        ),
                        // Password-Input Ends
                        // Sign-In Starts
                        new Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
                          child: SizedBox(
                            height: 40.0,
                            child: new RaisedButton(
                                elevation: 5.0,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.green,
                                child: new Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    setState(() => loading = true);
                                    dynamic result = await _authen
                                        .signInWithEmailAndPassword(
                                            _email, _password);
                                    if (result == null) {
                                      setState(() {
                                        error =
                                            'Email and Password doesn\'t match.';
                                        loading = false;
                                      });
                                    }
                                    print(_email);
                                    print(_password);
                                  }
                                }),
                          ),
                        ),
                        // Sign-In Ends
                      ],
                    ),
                  ),
                ),
              ],
            ));
  }
}
