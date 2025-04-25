import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qusad_prod_web/core/widgets/hovered_web_anchor.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _controller;
  late ScrollPosition _position;

  double _logoOpacity = 1;
  double _aboutOpacity = 0;
  double _basicInfoOffset = -1;
  double _linksOffset = 1;

  @override
  void initState() {
    _controller = ScrollController()..addListener(scrollListenner);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(scrollListenner);
    _controller.dispose();
    super.dispose();
  }

  void scrollListenner() {
    _position = _controller.position;
    if (_position.pixels >= 0 && _position.pixels < 70.h) {
      setState(() {
        _logoOpacity = 1 - _position.pixels / 70.h;
      });
    } else if (_position.pixels > 70.h) {
      setState(() {
        _logoOpacity = 0;
      });
    }

    if (_position.pixels <= 90.h) {
      setState(() {
        _aboutOpacity = _position.pixels / 90.h;
        _basicInfoOffset = -1 + (_position.pixels / 90.h);
        _linksOffset = 1 - (_position.pixels / 90.h);
      });
    } else if (_position.pixels > 90.h) {
      setState(() {
        _aboutOpacity = 1;
        _basicInfoOffset = 0;
        _linksOffset = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(context),
      body: Stack(
        children: [
          Opacity(
            opacity: _logoOpacity,
            child: SizedBox(width: 100.w, height: 100.h, child: logo()),
          ),
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                  child: Align(alignment: Alignment.bottomCenter, child: downArrow()),
                ),
                Opacity(
                  opacity: 1 - _logoOpacity,
                  child: Container(
                    width: 100.w,
                    padding: EdgeInsets.only(top: kToolbarHeight + 28, left: 32, right: 32),
                    child: content(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Divider(height: 0.2, thickness: 0.2),
                ),
                SizedBox(height: 96),
              ],
            ),
          ),
          upArrow(),
        ],
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: Theme.of(context).colorScheme.primary.withValues(alpha: 1 - _logoOpacity),
      centerTitle: true,
      title: Text('QUSAD.prod', style: GoogleFonts.raleway(fontWeight: FontWeight.w100)),
      automaticallyImplyLeading: false,
      elevation: 0,
    );
  }

  Widget logo() {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'QUSAD.prod',
                  style: GoogleFonts.raleway(fontWeight: FontWeight.w200, fontSize: 64),
                ),
                AnimatedTextKit(
                  repeatForever: true,
                  pause: Duration(seconds: 3),
                  animatedTexts: [
                    TypewriterAnimatedText(
                      "Middle Flutter Developer",
                      textStyle: GoogleFonts.raleway(
                        fontWeight: FontWeight.w100,
                        fontSize: 24,
                        height: 0.5,
                      ),
                      speed: Duration(milliseconds: 100),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Opacity downArrow() {
    return Opacity(
      opacity: _logoOpacity * _logoOpacity,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12),
        child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap:
              _logoOpacity > 0.9
                  ? () => _controller.animateTo(
                    100.h,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  )
                  : null,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.arrow_downward_rounded, size: 24 * _logoOpacity * _logoOpacity),
          ),
        ),
      ),
    );
  }

  Widget upArrow() {
    return Align(
      alignment: Alignment.bottomRight,
      child: Opacity(
        opacity: 1 - _logoOpacity * _logoOpacity,
        child: Padding(
          padding: EdgeInsets.only(bottom: 12, right: 2.w),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap:
                () => _controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.arrow_upward_rounded, size: 24 * (1 - _logoOpacity * _logoOpacity)),
            ),
          ),
        ),
      ),
    );
  }

  Widget content() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            'About me',
            style: GoogleFonts.raleway(fontWeight: FontWeight.w100, fontSize: 64),
          ),
        ),
        SizedBox(height: 32),
        Transform.translate(
          offset: Offset(_basicInfoOffset * 100.w, 0),
          child: Opacity(
            opacity: _aboutOpacity,
            child: Align(alignment: Alignment.topLeft, child: basicInfoWidget()),
          ),
        ),
        SizedBox(height: 24),
        Transform.translate(
          offset: Offset(_linksOffset * 100.w, 0),
          child: Opacity(
            opacity: _aboutOpacity,
            child: Align(alignment: Alignment.topRight, child: linksWidget()),
          ),
        ),
        SizedBox(height: 32),
        Center(
          child: Text(
            'Skills',
            style: GoogleFonts.raleway(fontWeight: FontWeight.w100, fontSize: 64),
          ),
        ),
        SizedBox(height: 32),
        SizedBox(
          width: 512,
          child: Text(
            'Dart Flutter (High level)\nJava Android (Intermediate level)\nPython (Intermediate level)\nHTML / CSS (Basic level)\nC++ (Basic level)\nGithub (Intermediate level)\nFigma (High level)\n\nClean architecture, Firebase, OneSignal, Google AdMob, Hive, Bloc, GetIt, GoRouter, AutoRoute, Dio, Talker, OpenVpn\n\nRussian (C2)\nEnglish (A2-B1)',
            textAlign: TextAlign.start,
            style: GoogleFonts.jetBrainsMono(),
          ),
        ),
      ],
    );
  }

  Widget linksWidget() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(16),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 0.2),
      ),
      constraints: BoxConstraints(maxWidth: 100.w - 64),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Links', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w200)),
          const SizedBox(height: 8),
          Table(
            defaultColumnWidth: FixedColumnWidth(100.w > 100.h ? 20.w : 50.w - 44),
            children: [
              TableRow(
                children: [
                  HoveredWebAnchor(label: "• GitHub", url: 'https://github.com/QUSAD-prod'),
                  HoveredWebAnchor(
                    label: '• Linkedin',
                    url: 'https://www.linkedin.com/in/dmitriy-ostrovskiy-ab6615355/',
                  ),
                ],
              ),
              TableRow(
                children: [
                  HoveredWebAnchor(label: '• Telegram', url: 'https://t.me/prodbyqusad'),
                  HoveredWebAnchor(label: '• E-mail', url: 'mailto:qusad.prod@gmail.com'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget basicInfoWidget() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withAlpha(16),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white, width: 0.2),
      ),
      constraints: BoxConstraints(
        minWidth: 100.w > 100.h ? 50.w : 100.w - 64,
        maxWidth: 100.w - 64,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset('assets/images/avatar.jpeg', width: 128, height: 128),
          ),
          const SizedBox(width: 16),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 128, maxHeight: 256, maxWidth: 100.w - 232.4),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Dmitriy Ostrovskiy',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(fontSize: 36, fontWeight: FontWeight.bold, height: 1),
                  maxLines: 2,
                ),
                SizedBox(height: 12),
                Text(
                  'Middle Flutter Developer (3+ years of flutter experience)',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 16),
                  maxLines: 2,
                ),
                SizedBox(height: 4),
                Text(
                  '19 y.o. | Russian Federation, Ryazan',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.jetBrainsMono(),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
