import 'package:flutter/material.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import 'package:newsapp/pagemodle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List<PageModel> page;
  ValueNotifier<int> _pageViewNotifier = ValueNotifier(0); //فاليوانتفاير نوع جديد من الداتا عبارة عن كلاس تراقب قمة الانتجر وتقوم بعمل معين عند تغير قيمة الانتجر
  void _addPages() {
    page = List<PageModel>();
    page.add(PageModel(
        "Welcome",
        "1-Making friends is easy as waving your hand back and forth in easy step",
        Icons.ac_unit,
        'assets/images/bg1.png'));
    page.add(PageModel(
        "Open",
        "2-Making friends is easy as waving your hand back and forth in easy step",
        Icons.open_with,
        'assets/images/bg2.png'));
    page.add(PageModel(
        "Alarm",
        "3-Making friends is easy as waving your hand back and forth in easy step",
        Icons.access_alarm,
        'assets/images/bg3.png'));
    page.add(PageModel(
        "Hello",
        "4-Making friends is easy as waving your hand back and forth in easy step",
        Icons.account_balance,
        'assets/images/bg4.png'));
  }

  @override
  Widget build(BuildContext context) {
    _addPages();
    return Stack(
      children: <Widget>[
        Scaffold(
          body: PageView.builder(
            itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      // اضافة تزين
                      image: DecorationImage(
                        //نستخدم ديكوريشن امج حتى يتعلما مع الصورة كانها ديكوريشن امج وليس صور خارجية مستقلة فوق
                        image: ExactAssetImage(
                          page[index].image,
                        ), //اكزات اسست امج تعني هذا اسم الصورة ومسارها
                        fit: BoxFit
                            .cover, //طريقة استعال الصورة و بوكسفت كوفر تعني تغطية الصورة على جميع المساحة
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Transform.translate(
                        child: Icon(
                          page[index].icone,
                          size: 120,
                          color: Colors.white,
                        ),
                        // لتغير الموقع
                        offset: Offset(0, -120), // احداثيات الموقع
                      ),
                      Text(
                        page[index].title,
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 40, right: 40, top: 18),
                        child: Text(
                          page[index].description,
                          style: TextStyle(
                              color: Colors.grey.shade300, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
            itemCount: page.length,
            onPageChanged: (index) {
              _pageViewNotifier.value = index;
            },
          ),
        ),
        Transform.translate(
          offset: Offset(0, 150),
          child: Align(
            alignment: Alignment.center,
            child: _displayPageIndicators(page.length),
          ),
        ),
        Align(
          // للتحكم بموقع البونم وتحريكه من الاعلى الى اسفل الشاشة
          alignment: Alignment.bottomCenter,
          child: Padding(
            // بادنك لصنع فراغ في اسفل البوتن ويمين ويسار
            padding: const EdgeInsets.only(bottom: 25, left: 16, right: 16),
            child: SizedBox(
              width: double.infinity, // لجعل البوتن ياخذ عرض على كل الشاشة
              height: 50,
              child: RaisedButton(
                color: Colors.red.shade800,
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                      color: Colors.white, fontSize: 17, letterSpacing: 1.1),
                ),
                onPressed: () {
                  Navigator.push(// navigator is have all translator screen
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        _updateScreen();
                        return HomeScreen();
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _displayPageIndicators(int length) {
    //بلكن جاهز لعمل بيج انديكيتر للتفاصيل الدرس25 في كورس الدارت والفلاتر  عالم البرمجة
    return PageViewIndicator(
      pageIndexNotifier: _pageViewNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 10.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 12.5,
          color: Colors.red,
        ),
      ),
    );
  }
  void _updateScreen() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);
  }
}
