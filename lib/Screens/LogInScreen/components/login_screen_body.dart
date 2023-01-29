import 'package:flutter/material.dart';
import 'package:news_app/Screens/LogInScreen/components/login_tab.dart';
import 'package:news_app/Screens/LogInScreen/components/signup_tab.dart';

class LoginScreenBody extends StatefulWidget {
  const LoginScreenBody({super.key});

  @override
  State<LoginScreenBody> createState() => _LoginScreenBodyState();
}

class _LoginScreenBodyState extends State<LoginScreenBody>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Social X'),
          backgroundColor: Colors.red,
          bottom: TabBar(
            controller: tabController,
            tabs: const <Widget>[
              Tab(
                child: Text("LOGIN"),
              ),
              Tab(
                child: Text("SIGN UP"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const <Widget>[
            Center(
              child: LoginTab(),
            ),
            Center(
              child: SignupTab(),
            ),
          ],
        ),
      ),
    );
  }
}
