import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Stack(
        alignment: Alignment.topCenter,
        children: const [
          Parallax(),
        ],
      ));
}

class Parallax extends StatefulWidget {
  const Parallax({Key? key}) : super(key: key);

  @override
  _ParallaxState createState() => _ParallaxState();
}

class _ParallaxState extends State<Parallax> {
  final _currentPageNotifier = ValueNotifier<int>(0);
  final int pageCount = 4;
  late PageController _pageController;
  late double _pageOffset;

  @override
  void initState() {
    super.initState();
    _pageOffset = 0;
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(
      () => setState(() => _pageOffset = _pageController.page ?? 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(
          pageCount: 6,
          screenSize: MediaQuery.of(context).size,
          offset: _pageOffset,
        ),
        PageView(
          onPageChanged: (int index) {
            _currentPageNotifier.value = index;
          },
          controller: _pageController,
          children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text("OKKAY SOME TEXT!",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ]),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text("OKKAY SOME TEXT2!",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ]),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text("OKKAY SOME TEXT3!",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ]),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text("OKKAY SOME TEXT4!",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ]),
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 8,
                    ),
                    const Text("OKKAY SOME TEXT5!",
                        style: TextStyle(color: Colors.white, fontSize: 15)),
                  ]),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class BackgroundImage extends StatelessWidget {
  BackgroundImage({
    Key? key,
    required this.pageCount,
    required this.screenSize,
    required this.offset,
  }) : super(key: key);

  /// Size of page
  final Size screenSize;

  /// Number of pages
  final int pageCount;

  /// Currnet page position
  final double offset;

  @override
  Widget build(BuildContext context) {
    // Image aligment goes from -1 to 1.
    // We convert page number range, 0..6 into the image alignment range -1..1
    int lastPageIdx = pageCount - 1;
    int firstPageIdx = 0;
    int alignmentMax = 1;
    int alignmentMin = -1;
    int pageRange = (lastPageIdx - firstPageIdx) - 1;
    int alignmentRange = (alignmentMax - alignmentMin);
    double alignment =
        (((offset - firstPageIdx) * alignmentRange) / pageRange) + alignmentMin;

    return Container(
      height: screenSize.height,
      width: screenSize.width,
      child: Image(
        image: const AssetImage('assets/images/tabs_bg.webp'),
        alignment: Alignment(alignment, 0),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class Screen {
  const Screen({required this.title, required this.body});
  final String title;
  final String body;
}

const List<Screen> screens = [
  Screen(title: 'test', body: 'test'),
  Screen(title: 'test', body: 'test'),
  Screen(title: 'test', body: 'test'),
  Screen(title: 'test', body: 'test'),
];
