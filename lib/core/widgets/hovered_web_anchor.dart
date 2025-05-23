import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// Provides an anchor link to web URL.
class HoveredWebAnchor extends StatefulWidget {
  const HoveredWebAnchor({super.key, this.label, required this.url, this.underlined = true});

  /// The label of anchor
  final String? label;

  /// The web URL to open when anchor clicked
  final String url;

  /// Identifies if anchor label will be underlined.
  final bool underlined;

  @override
  HoveredWebAnchorState createState() => HoveredWebAnchorState();
}

class HoveredWebAnchorState extends State<HoveredWebAnchor> {
  /// Current text style
  TextStyle _textStyle = TextStyle(fontFamily: 'JetBrainsMono');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      child: Text(widget.label ?? widget.url, style: _textStyle),
      onHover: (hovered) {
        setState(() {
          if (hovered) {
            _textStyle = TextStyle(fontFamily: 'JetBrainsMono');
            if (widget.underlined) {
              _textStyle = _textStyle.copyWith(decoration: TextDecoration.underline);
            }
          } else {
            _textStyle = TextStyle(fontFamily: 'JetBrainsMono');
          }
        });
      },
      onTap: () async {
        await launchUrlString(widget.url);
      },
    );
  }
}
