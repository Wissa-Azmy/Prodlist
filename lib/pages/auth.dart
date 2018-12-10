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

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyList'),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3),
                  BlendMode.dstATop
              ),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'User Name', filled: true, fillColor: Colors.white),
                    ),
                    SizedBox(height: 10.0,),
                    TextField(
                      decoration: InputDecoration(labelText: 'Password', filled: true, fillColor: Colors.white),
                    ),
                    SwitchListTile(
                      title: Text('Accept Terms'),
                      value: widget.acceptedTerms,
                      onChanged: (value) {
                        setState(() {
                          widget.acceptedTerms = value;
                        });
                      },
                    ),
                    RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/products-list');
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),

        ),
    );
  }
}
