import 'package:flutter/material.dart';

class AuthenticationForm extends StatefulWidget {
  //const AuthenticationForm({Key? key}) : super(key: key);
  AuthenticationForm(this.submitFn, this.isLoading);

  final bool isLoading;
  final void Function(
    String email,
    String password,
    String username,
    String phoneNumber,
    bool isLogin,
    BuildContext context,
  ) submitFn;
  @override
  _AuthenticationFormState createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = true;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  var _phoneNumber = '';

  void _trySubmit() {
    final _isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (_isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail,
        _userPassword,
        _userName,
        _phoneNumber,
        _isLogin,
        context,
      );
      //Navigator.of(context).pushReplacementNamed(TrendsScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      // maxRadius: 30,
                      radius: 30,
                      foregroundImage: AssetImage('assets/logo/logo.png'),
                    ),
                  ),
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(labelText: 'Email address'),
                    onSaved: (value) {
                      _userEmail = value!;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value!.isEmpty || value.length < 4) {
                          return 'Please enter atleast 4 characters';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(labelText: 'Username'),
                      onSaved: (value) {
                        _userName = value!;
                      },
                    ),
                  if (!_isLogin)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: Text('+254'),
                        ),
                        Expanded(
                          child: TextFormField(
                            key: const ValueKey('phoneNumber'),
                            validator: (value) {
                              if (value!.isEmpty || value.length == 4) {
                                return 'Invalid phone number';
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                labelText: 'Phone number'),
                            onSaved: (value) {
                              _phoneNumber = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 7) {
                        return 'Password should be atleast 7 characters';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    onSaved: (value) {
                      _userPassword = value!;
                    },
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  if (widget.isLoading) const CircularProgressIndicator(),
                  if (!widget.isLoading)
                    ElevatedButton(
                      onPressed: _trySubmit,
                      child: Text(_isLogin ? 'Log In' : 'Sign Up'),
                    ),
                  if (!widget.isLoading)
                    TextButton(
                        onPressed: () {
                          setState(() {
                            _isLogin = !_isLogin;
                          });
                        },
                        child: Text(
                          _isLogin
                              ? 'Create New Account'
                              : 'I already have an account',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
