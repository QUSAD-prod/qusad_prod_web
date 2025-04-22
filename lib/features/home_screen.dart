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
    // debugPrint(_position.pixels.toString());
    if (_position.pixels >= 0 && _position.pixels < 70.h) {
      setState(() {
        _logoOpacity = 1 - _position.pixels / 70.h;
      });
    } else if (_position.pixels > 70.h) {
      setState(() {
        _logoOpacity = 0;
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
                    padding: EdgeInsets.only(top: kToolbarHeight + 28, left: 16, right: 16),
                    child: content(),
                  ),
                ),
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
                Text(
                  'Middle Flutter Developer',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w100,
                    fontSize: 24,
                    height: 0.5,
                  ),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('assets/images/avatar.jpeg', width: 128, height: 128),
        ),
        const SizedBox(height: 20),
        Text(
          'Dmitriy Ostrovskiy',
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          'Middle Flutter Developer',
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontSize: 18),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HoveredWebAnchor(url: 'https://github.com/QUSAD-prod'),
            Text(' | ', style: GoogleFonts.jetBrainsMono()),
            HoveredWebAnchor(label: 'qusad.prod@gmail.com', url: 'mailto:qusad.prod@gmail.com'),
          ],
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
