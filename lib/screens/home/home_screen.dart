import 'package:datn/gen/assets.gen.dart';
import 'package:datn/models/appmodel.dart';
import 'package:datn/screens/login/login_screen.dart';
import 'package:datn/services/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    NotificationService.requestNotificationPermission();
    // TODO: implement initState
    super.initState();
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isLoggedIn', false); // Đặt trạng thái đăng nhập về false
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 243, 252, 252),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0)
                .copyWith(top: MediaQuery.of(context).padding.top + 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.images.car.path,
                  width: 300,
                ),
                Expanded(
                  child: ListView(
                    children: [
                      GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          itemCount: listAppModel.length - 1,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisExtent: 250,
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  crossAxisCount: 2),
                          itemBuilder: (context, index) {
                            return Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20.0)
                                    .copyWith(top: 10.0),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 158, 158, 158)
                                            .withOpacity(0.5),
                                        offset: const Offset(0, 2),
                                        blurRadius: 4,
                                        spreadRadius: 0,
                                      )
                                    ],
                                    color: const Color.fromARGB(
                                        115, 221, 233, 233),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: Column(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        listAppModel[index]
                                            .title
                                            .toString()
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 7,
                                        child: listAppModel[index].items ??
                                            Container())
                                  ],
                                ));
                          }),
                      Container(
                          width: double.infinity,
                          height: 120.0,
                          alignment: Alignment.center,
                          padding:
                              const EdgeInsets.all(20.0).copyWith(top: 10.0),
                          margin: const EdgeInsets.only(bottom: 20.0),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 158, 158, 158)
                                          .withOpacity(0.5),
                                  offset: const Offset(0, 2),
                                  blurRadius: 4,
                                  spreadRadius: 0,
                                )
                              ],
                              color: const Color.fromARGB(115, 221, 233, 233),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  listAppModel[4]
                                      .title
                                      .toString()
                                      .toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Expanded(
                                  flex: 7,
                                  child: listAppModel[4].items ?? Container())
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: GestureDetector(
                onTap: () => _logout,
                child: Container(
                    alignment: Alignment.center,
                    width: 40.0,
                    height: 40.0,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: const Icon(Icons.logout_sharp))),
          ),
        ],
      ),
    );
  }
}
