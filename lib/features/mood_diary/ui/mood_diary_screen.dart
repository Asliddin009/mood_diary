import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/utils/color_hex.dart';
import 'package:mood_diary/features/calendary/ui/calendary_screen.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/emotion/emotion_cubit.dart';
import 'package:mood_diary/features/mood_diary/ui/components/app_bar_title_date.dart';
import 'package:mood_diary/features/mood_diary/ui/components/mood_slide_switcher.dart';
import 'package:mood_diary/features/mood_diary/ui/form_widget.dart';
import 'package:mood_diary/features/mood_diary/ui/mood_statistics.dart';

class MoodDiaryScreen extends StatefulWidget {
  const MoodDiaryScreen({super.key});

  @override
  State<MoodDiaryScreen> createState() => _MoodDiaryScreenState();
}

class _MoodDiaryScreenState extends State<MoodDiaryScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<EmotionCubit>().getMainEmotions();
    super.initState();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor.fromHex('#FFFDFC'),
      appBar: AppBar(
        backgroundColor: HexColor.fromHex('#FFFDFC'),
        title: const AppBarTitleDate(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                // ignore: inference_failure_on_instance_creation
                MaterialPageRoute(
                  builder: (context) => const CalendarScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.calendar_month,
              color: HexColor.fromHex('#BCBCBF'),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          MoodSlideSwitcher(
            onSwitched: (int index) {
              this.index = index;
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          if (index == 0) const FormWidget() else const MoodStatistics(),
        ],
      ),
    );
  }
}
