import 'package:flutter/material.dart';
import 'package:huskar/cores/configs/theme.dart';
import 'package:huskar/cores/constants/assets_path.dart';

/// Creates Slider Home Screen
class SliderHomeScreen extends StatefulWidget {
  final BoxConstraints constraints;
  const SliderHomeScreen({super.key, required this.constraints});

  @override
  State<SliderHomeScreen> createState() => _SliderHomeScreenState();
}

class _SliderHomeScreenState extends State<SliderHomeScreen> {
  final PageController pageController =
      PageController(initialPage: 0, keepPage: true);
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      changePage();
      
    });
  }
  void changePage(){
    if(pageController.page == null){
      setState(() {
        _currentPage.value = 0;
      });
      return;
    }
    var modResult = pageController.page! % 1;
    if(modResult >= 0.5){
      setState(() {
        _currentPage.value = pageController.page!.ceil();
      });
      return;
    } else{
      setState(() {
        _currentPage.value = pageController.page!.floor();
      });
      return;
    }
  }

  List<Widget> get sliderItems {
    return [
      sliderHomeItemOneWidget,
      sliderHomeItemOneWidget,
    ];
  }

  @override
  Widget build(BuildContext context) {
    var outerWidth = widget.constraints.maxWidth;
    return SizedBox(
      height: 160,
      width: outerWidth,
      child: Stack(
        children: [
          // slider background
          Positioned(
            top: 29,
            left: 20,
            right: 20,
            child: Container(
              height: 131,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [AppTheme.of(context).buttonShadowPrimary],
                  gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      tileMode: TileMode.clamp,
                      stops: [
                        0.5,
                        1
                      ],
                      colors: [
                        Color(0xfffAFAFA),
                        Color(0xffDAE9F9),
                      ])),
            ),
          ),
          // slider content
          Positioned(
            top: 0,
            left: 20,
            right: 20,
            child: sliderItemBuilder(
              BoxConstraints(maxWidth: outerWidth - 40, maxHeight: 160),
            ),
          ),
          Positioned(
              bottom: 15,
              right: 20,
              child: indicatorBuilder(BoxConstraints(
                  maxWidth: (outerWidth - 40) * 0.4, maxHeight: 10))),
        ],
      ),
    );
  }

  Widget indicatorBuilder(BoxConstraints constraints) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentPage,
      builder: (context, value, child) {
        return Container(
            width: constraints.maxWidth,
            padding: const EdgeInsets.only(right: 30),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(sliderItems.length, (index) {
                  return indicator(index == value);
                })));
      },
    );
  }

  Widget indicator(bool isSelected) {
    return Container(
      width: isSelected ? 40 : 8,
      height: 8,
      margin: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: Colors.white),
    );
  }

  Widget sliderItemBuilder(BoxConstraints constraints) {
    return ConstrainedBox(
      constraints: constraints,
      child: PageView.builder(
        controller: pageController,
        itemCount: sliderItems.length,
        itemBuilder: (context, index) {
          return sliderItems[index];
        },
      ),
    );
  }

  Widget get sliderHomeItemOneWidget {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 37),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(builder: (context) {
                    var style = Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontFamily: "Gilroy",
                            letterSpacing: -0.3,
                            color: AppTheme.of(context).textPrimaryColor,
                            fontSize: 18);
                    return Text.rich(
                      TextSpan(text: "Solusi, ", children: [
                        TextSpan(
                            text: "Kesehatan Anda",
                            style: style?.copyWith(
                              fontWeight: FontWeight.w800,
                            ))
                      ]),
                      style: style,
                    );
                  }),
                  Text(
                    "Update informasi seputar kesehatan semua bisa disini !",
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Proxima-Nova"),
                  ),
                  Container(
                    height: 32,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [AppTheme.of(context).buttonShadowPrimary]),
                    child: FilledButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            fixedSize:
                                MaterialStatePropertyAll(Size.fromHeight(32)),
                            backgroundColor: MaterialStatePropertyAll(
                                AppTheme.of(context).textPrimaryColor),
                            shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            )),
                        child: Text(
                          "Selengkapnya",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary),
                        )),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 101,
              height: 101,
              child: Image.asset(AssetPath.homeCalendarAsset),
            ),
          ),
        ],
      ),
    );
  }
}
