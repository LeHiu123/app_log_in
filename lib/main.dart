import 'package:app_log_in/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool _showpass = false;
  var _notitk = 'email k hop le';
  var _notipass = 'pass k hop le';
  bool _tkVaild = false;
  bool _mkVaild = false;
  void xemmatkhau() {
    setState(() {
      _showpass = !_showpass;
    });
  }

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: (FlutterLogo()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text(
                'HI\nĐăng nhập',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                errorText: _tkVaild ? _notitk : null,
                labelText: 'Nhập email',
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                TextField(
                  controller: _passwordController,
                  obscureText: !_showpass,
                  decoration: InputDecoration(
                    errorText: _mkVaild ? _notipass : null,
                    labelText: 'Nhập pass',
                  ),
                ),
                GestureDetector(
                    onTap: xemmatkhau,
                    child: Text(!_showpass ? 'xem mật khẩu' : 'ẩn')),
              ]),
            ),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Click(), child: Text('đăng nhập')),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'bạn chưa có tài khoản, đăng kí ',
                ),
                Text('quên mật khẩu')
              ],
            )
          ],
        ),
      ),
    );
  }

  void Click() {
    setState(() {
      if (_usernameController.text.length < 6 ||
          _usernameController.text.contains('@')) {
        _tkVaild = true;
      } else {
        _tkVaild = false;
      }

      if (_passwordController.text.length < 6) {
        _mkVaild = true;
      } else {
        _mkVaild = false;
      }
      if (!_tkVaild && !_mkVaild) {
        Navigator.push(context, MaterialPageRoute(builder: goHomePage));
      }
    });
  }

  Widget goHomePage(BuildContext context) {
    return HomePage();
  }
}
