import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:touritouri/models/onboard/onboard_model.dart';
import 'package:touritouri/screens/index.dart';
import 'package:touritouri/utils/constant.dart';

class Onboard extends StatefulWidget {
  const Onboard({Key? key}) : super(key: key);

  @override
  _OnboardState createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  int currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController=PageController(initialPage: 0);
    super.initState();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async{
    int isViewed =0;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt("onBoard", isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentIndex %2 == 0 ? Kwhite : Kblue,
      appBar: AppBar(
        backgroundColor: currentIndex %2 == 0 ? Kwhite : Kblue,
        elevation: 0,
        actions: [
          TextButton(onPressed: () async {
            await _storeOnboardInfo();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Index()));

          }, child: Text("Passer",style:TextStyle(
            color: currentIndex %2 == 0 ? Kblack : Kwhite,
          ),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: PageView.builder(
          itemCount: screens.length,
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(screens[index].image),
                SizedBox(
                    height: 10.0,
                    child: ListView.builder(
                      itemCount: screens.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 3.0),
                              width: currentIndex == index ? 25.0 : 8.0,
                              height: 8.0,
                              decoration: BoxDecoration(
                                color: currentIndex == index ? Kbrown : Kbrown300,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )
                          ],
                        );
                      },
                    )
                ),
                Text(
                    screens[index].text,
                    textAlign: TextAlign.center,
                    style:TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.bold,
                      color: index %2 == 0 ? Kblack : Kwhite,
                    )
                ),
                Text(
                  screens[index].description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: index %2 == 0 ? Kblack : Kwhite,
                  ),
                ),
                InkWell(
                  onTap: () async{
                    if (index == screens.length - 1){
                      await _storeOnboardInfo();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) =>const Index())
                      );
                    }

                    _pageController.nextPage(duration: const Duration(milliseconds: 300),
                        curve: Curves.decelerate);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10.0
                    ),
                    decoration: BoxDecoration(
                        color: index %2 == 0 ? Kblue : Kwhite,
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Suivant",
                          style: TextStyle(
                              fontSize: 16.0,
                              color:  index %2 == 0 ? Kwhite : Kblue
                          ),
                        ),
                        const SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: index %2 == 0 ? Kwhite : Kblue,
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },),
      ),
    );
  }
}
