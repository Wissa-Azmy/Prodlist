import 'package:flutter/material.dart';

//import 'products.dart';

class AuthPage extends StatefulWidget {
  bool acceptedTerms = false;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {
    'userName': null,
    'password': null,
    'acceptTerms': null
  };

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_formData['acceptTerms']) {
      return ;
    }

    _formKey.currentState.save();
    Navigator.pushReplacementNamed(context, '/products-list');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), BlendMode.dstATop),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          filled: true,
                          fillColor: Colors.white
                        ),
                        onSaved: (value) {
                          _formData['userName'] = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Username is required';
                          }
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Password',
                            filled: true,
                            fillColor: Colors.white
                        ),
                        onSaved: (value) {
                          _formData['password'] = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password is required';
                          }
                        },
                      ),
                      SwitchListTile(
                        title: Text('Accept Terms'),
                        value: widget.acceptedTerms,
                        onChanged: (value) {
                          setState(() {
                            widget.acceptedTerms = value;
                            _formData['acceptTerms'] = value;
                          });
                        },
                      ),
                      RaisedButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: _submitForm,
                        child: Text('Login'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
