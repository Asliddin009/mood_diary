import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mood_diary/app/utils/color_hex.dart';

class MoodSlideSwitcher extends StatefulWidget {
  const MoodSlideSwitcher({required this.onSwitched, super.key});
  final Function(int index) onSwitched;
  @override
  State<MoodSlideSwitcher> createState() => _MoodSlideSwitcherState();
}

class _MoodSlideSwitcherState extends State<MoodSlideSwitcher> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 22, right: 22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: HexColor.fromHex('F2F2F2'),
      ),
      constraints: const BoxConstraints(minWidth: 100),
      height: 40,
      child: Stack(
        children: [
          AnimatedAlign(
            curve: Curves.easeInOut,
            alignment:
                isSelected[0] ? Alignment.centerLeft : Alignment.centerRight,
            duration: const Duration(milliseconds: 250),
            child: Container(
              width: isSelected[0]
                  ? 185
                  : MediaQuery.of(context).size.width * (2 / 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.orange,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    setState(() {
                      isSelected[0] = true;
                      isSelected[1] = false;
                    });
                    widget.onSwitched(0);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                    ),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/mood.svg',
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            isSelected[0]
                                ? Colors.white
                                : HexColor.fromHex('#BCBCBF'),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Дневник Настроения',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 12,
                                    color: isSelected[0]
                                        ? Colors.white
                                        : HexColor.fromHex('#BCBCBF'),
                                  ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    setState(() {
                      isSelected[0] = false;
                      isSelected[1] = true;
                    });
                    widget.onSwitched(1);
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      // ignore: lines_longer_than_80_chars
                      //color: isSelected[1] ? Colors.orange : Colors.transparent,
                    ),
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/static.svg',
                          height: 20,
                          colorFilter: ColorFilter.mode(
                            isSelected[1]
                                ? Colors.white
                                : HexColor.fromHex('#BCBCBF'),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          'Статистика',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 12,
                                    color: isSelected[1]
                                        ? Colors.white
                                        : HexColor.fromHex('#BCBCBF'),
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
