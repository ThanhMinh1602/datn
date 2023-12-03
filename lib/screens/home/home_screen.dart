import 'package:datn/gen/assets.gen.dart';
import 'package:datn/models/appmodel.dart';
import 'package:datn/screens/home/widgets/speed.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(115, 243, 252, 252),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0)
            .copyWith(top: MediaQuery.of(context).padding.top + 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.car.path,
              width: 300,
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  itemCount: listAppModel.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 250,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20.0),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(255, 158, 158, 158)
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
                              flex: 1,
                              child: Text(
                                listAppModel[index]
                                    .title
                                    .toString()
                                    .toUpperCase(),
                                    textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: listAppModel[index].items ?? Container())
                          ],
                        ));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
