import 'package:demo_signin/loggedin.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Flutter Tutorial',
      home: TutorialHome(),
    ),
  );
}

class TutorialHome extends StatelessWidget {
  const TutorialHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
        // appBar: AppBar(
        //   leading: const IconButton(
        //     icon: Icon(Icons.menu),
        //     tooltip: 'Navigation Bar',
        //     onPressed: null,
        //   ),
        //   title: const Text('Example title'),
        //   actions: const [
        //     IconButton(
        //       icon: Icon(Icons.search),
        //       tooltip: 'Search',
        //       onPressed: null,
        //     ),
        //   ],
        // ),
        // body is the majority of the screen.
        body: ListView(children: [
      Column(children: [
        Container(
          height: 300.0,

          decoration: BoxDecoration(
            image: const DecorationImage(
                image: NetworkImage(
                  'https://img.freepik.com/premium-vector/closed-padlock-digital-background-cyber-security_42077-12247.jpg?w=360',
                ),
                fit: BoxFit.fill),
            color: Colors.indigo.shade800,
            // boxShadow: const [BoxShadow(blurRadius: 30.0)],
            borderRadius: BorderRadius.vertical(
                bottom: Radius.elliptical(
                    MediaQuery.of(context).size.width, 100.0)),
          ),
          // child: Text('Hello, world!'),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 170,
              width: 500,
              // child: Image.network(
              //   'https://thumbs.dreamstime.com/b/glossy-violet-ampersand-symbol-matte-background-d-rendered-type-161350905.jpg',
              // ))
            )
          ]),
        ),
        Container(
          height: 350.0,
          width: 400,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  // validator: Validators.compose([
                  //   Validators.patternString(
                  //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                  //       'Invalid Password')
                  // ]),
                ),
              ),
              TextButton(
                onPressed: () {
                  //forgot password screen
                },
                child: const Text(
                  'Forgot Password',
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      // print(nameController.text);
                      // print(passwordController.text);
                      // String pattern =
                      //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                      // RegExp regExp = new RegExp(pattern);
                      // regExp.hasMatch(value);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoggedIn()));
                    },
                  )),
              Row(children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ])
            ],
          ),
        )

        // floatingActionButton: const FloatingActionButton(
        //   tooltip: 'Add', // used by assistive technologies
        //   onPressed: null,
        //   child: Icon(Icons.add),
        // ),
      ]),
    ]));
  }
}
