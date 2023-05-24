import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged<String> onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;

  const AnimatedToggle({
    super.key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = const Color(0xFFe7e7e8),
    this.buttonColor = const Color(0xFFFFFFFF),
    this.textColor = const Color(0xFF000000),
  });

  @override
  State<AnimatedToggle> createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);

  late final List<GlobalKey> _keysItem =
      List.generate(widget.values.length, (index) {
    return GlobalKey();
  });
  double opacity = 1;
  final GlobalKey _backgroundKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      waitRender();
      waitBackgroundRender();
    });
  }

  void waitRender() {
    if (isItemNotRendered) {
      return waitRender();
    }
    setState(() {});
    return;
  }

  waitBackgroundRender() {
    if (isBackgroundNotRendered) {
      return waitBackgroundRender();
    }
    setState(() {});
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _backgroundKey,
      child: Stack(
        children: <Widget>[
          Container(
            height: 34,
            margin: const EdgeInsets.only(top: 22, bottom: 12),
            decoration: ShapeDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                shadows: [
                  AppTheme.of(context).textFormFieldShadow,
                ]),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                widget.values.length,
                (index) => Material(
                  borderRadius: BorderRadius.circular(20),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      setState(() {
                        selectedIndex.value = index;
                        opacity = 0;
                      });
                      widget.onToggleCallback(widget.values[index]);
                      Future.delayed(const Duration(milliseconds: 100), () {
                        setState(() {
                          opacity = 1;
                        });
                      });
                      return;
                    },
                    child: Container(
                      key: _keysItem[index],
                      padding: const EdgeInsets.only(
                          top: 8, left: 16, bottom: 8, right: 16),
                      child: Text(
                        widget.values[index],
                        style: TextStyle(
                          fontFamily: AppTheme.proximaNovaFontFamily,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppTheme.of(context).textPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Builder(builder: (context) {
            if (isItemNotRendered || isBackgroundNotRendered) {
              return const SizedBox();
            }
            return ValueListenableBuilder<int>(
                valueListenable: selectedIndex,
                builder: (context, v, _) {
                  var offset = getPositionOfSelectedIndex(v);
                  var size = getSizeOfSelectedIndex(v);
                  return AnimatedPositioned(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.decelerate,
                    top: 22 + 3,
                    bottom: 12 + 3,
                    left: offset.dx + 3,
                    width: size.width - 6,
                    child: Container(
                      width: size.width,
                      height: size.height,
                      decoration: ShapeDecoration(
                        color: const Color(0xff00D9D5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      alignment: Alignment.center,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.decelerate,
                        opacity: opacity,
                        child: Text(
                          widget.values[v],
                          style: TextStyle(
                            fontFamily: AppTheme.proximaNovaFontFamily,
                            color: AppTheme.of(context).textPrimaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
        ],
      ),
    );
  }

  bool get isBackgroundNotRendered {
    RenderBox? box =
        _backgroundKey.currentContext?.findRenderObject() as RenderBox?;

    if (box == null) {
      return true;
    }
    if (!box.hasSize) {
      return true;
    }
    return false;
  }

  bool get isItemNotRendered {
    for (var i = 0; i < _keysItem.length; i++) {
      RenderBox? box =
          _keysItem[i].currentContext?.findRenderObject() as RenderBox?;

      if (box == null) {
        return true;
      }
      if (!box.hasSize) {
        return true;
      }
    }
    return false;
  }

  Offset getOffsetWidget(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;

    if (box == null) {
      return Offset.zero;
    }

    return box.localToGlobal(Offset.zero);
  }

  Size getSizeWidget(GlobalKey key) {
    RenderBox? box = key.currentContext?.findRenderObject() as RenderBox?;
    if (box == null) {
      return Size.zero;
    }

    return box.size;
  }

  Offset getPositionOfSelectedIndex(int index) {
    var offsetBackground = getOffsetWidget(_backgroundKey);
    var itemOffset = getOffsetWidget(_keysItem[index]);
    var r = itemOffset-offsetBackground;
    debugPrint("offsetBackground : $offsetBackground, itemOffset: $itemOffset");
    return r;
  }

  Size getSizeOfSelectedIndex(int index) {
    return getSizeWidget(_keysItem[index]);
  }
}
