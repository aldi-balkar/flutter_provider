import 'package:flutter/material.dart';
import 'package:flutter_provider/gender_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GenderProvider>(
      create: (context) => GenderProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<GenderProvider>(
                  builder: (context, GenderProvider, _) => Text(
                    'Gender Picker',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: GenderProvider.color,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = true;
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.maleColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/gender/icon_male.png',
                                  height: 80,
                                  color: genderProvider.maleColor,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.maleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    //batas container
                    Expanded(
                      child: Consumer<GenderProvider>(
                        builder: (context, genderProvider, _) =>
                            GestureDetector(
                          onTap: () {
                            genderProvider.isMale = false;
                          },
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: genderProvider.femaleColor,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/gender/icon_female.png',
                                  height: 80,
                                  color: genderProvider.femaleColor,
                                ),
                                Text(
                                  'Female',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: genderProvider.femaleColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
