import 'package:app_log_in/src/blocs/logic_login.dart';
import 'package:app_log_in/src/resources/home_page.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  logic login = logic();
  bool _showpass = false;

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
            StreamBuilder(
              stream: login.username,
              builder: (context, snapshot) => TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  errorText:
                      snapshot.hasError ? snapshot.error.toString() : null,
                  labelText: 'Nhập email',
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child:
                  Stack(alignment: AlignmentDirectional.centerEnd, children: [
                StreamBuilder(
                  stream: login.password,
                  builder: (context, snapshot) => TextField(
                    controller: _passwordController,
                    obscureText: !_showpass,
                    decoration: InputDecoration(
                      errorText:
                          snapshot.hasError ? snapshot.error.toString() : null,
                      labelText: 'Nhập pass',
                    ),
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
      if (login.isVaildInfo(
          _usernameController.text, _passwordController.text)) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
  }
}
