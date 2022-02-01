import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:controle_processual/utils/app_color_scheme.dart';
import 'package:universal_html/html.dart' as html;

class InteractiveNavItem extends MouseRegion {
  static final appContainer = html.window.document.querySelectorAll('flt-glass-pane')[0];

  InteractiveNavItem({required String text, required String routeName, required bool selected})
      : super(
          onHover: (PointerHoverEvent evt) {
            appContainer.style.cursor = 'pointer';
          },
          onExit: (PointerExitEvent evt) {
            appContainer.style.cursor = 'default';
          },
          child: InteractiveText(
            text: text,
            routeName: routeName,
            selected: selected,
          ),
        );
}

class InteractiveText extends StatefulWidget {
  final String text;
  final String routeName;
  final bool selected;

  const InteractiveText({
    required this.text,
    required this.routeName,
    required this.selected,
  });

  @override
  InteractiveTextState createState() => InteractiveTextState();
}

class InteractiveTextState extends State<InteractiveText> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => _hovered(true),
      onExit: (_) => _hovered(false),
      child: Text(widget.text,
          style: _hovering
              ? Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: AppColorScheme.yellow, decoration: TextDecoration.underline)
              : (widget.selected)
                  ? Theme.of(context).textTheme.bodyText1!.copyWith(color: AppColorScheme.white)
                  : Theme.of(context).textTheme.bodyText1),
    );
  }

  _hovered(bool hovered) {
    setState(() {
      _hovering = hovered;
    });
  }
}

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// import 'package:universal_html/html.dart' as html;
//
// class InteractiveNavItem extends MouseRegion {
//   static final appContainer = html.window.document.querySelectorAll('flt-glass-pane')[0];
//   Widget? child;
//   String text;
//   String routeName;
//   bool selected;
//
//   InteractiveNavItem({required this.text, required this.routeName, required this.selected})
//       : super(
//           onHover: (PointerHoverEvent evt) {
//             appContainer.style.cursor = 'pointer';
//           },
//           onExit: (PointerExitEvent evt) {
//             appContainer.style.cursor = 'default';
//           },
//           child: InteractiveText(
//             text: text,
//             routeName: routeName,
//             selected: selected,
//           ),
//         );
// }
//
// class InteractiveText extends StatefulWidget {
//   final String text;
//   String? routeName;
//   bool selected = false;
//
//   InteractiveText({
//     required this.text,
//     this.routeName,
//     required this.selected,
//   });
//
//   @override
//   InteractiveTextState createState() => InteractiveTextState();
// }
//
// class InteractiveTextState extends State<InteractiveText> {
//   bool _hovering = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       onHover: (_) => _hovered(true),
//       onExit: (_) => _hovered(false),
//       child: Text(widget.text,
//           style: _hovering
//               ? Theme.of(context)
//                   .textTheme
//                   .bodyText1!
//                   .copyWith(color: Colors.indigo, decoration: TextDecoration.underline)
//               : (widget.selected)
//                   ? Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.red)
//                   : Theme.of(context).textTheme.bodyText1),
//     );
//   }
//
//   _hovered(bool hovered) {
//     setState(() {
//       _hovering = hovered;
//     });
//   }
// }
