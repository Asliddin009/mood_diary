import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/app/ui_kit/components/app_container.dart';
import 'package:mood_diary/app/ui_kit/components/app_text_button.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/emotion/emotion_cubit.dart';
import 'package:mood_diary/features/mood_diary/domain/cubit/mood_diary/mood_diary_cubit.dart';
import 'package:mood_diary/features/mood_diary/ui/components/mood_slider.dart';
import 'package:mood_diary/features/mood_diary/ui/components/emotion_widget.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({super.key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _controller = TextEditingController();
  double? selfEsteemLevel;
  double? stressLevel;
  bool isDisabledSaveButton = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodDiaryCubit, MoodDiaryState>(
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                EmotionWidget(
                  validate: () {
                    _validate(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Уровень стресса',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      CustomSlider(
                        leftText: 'Низкий',
                        rightText: 'Высокий',
                        onSwitched: (double value) {
                          selfEsteemLevel = value;
                          _validate(context);
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Самооценка',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      CustomSlider(
                        leftText: 'Неуверенность',
                        rightText: 'Уверенность',
                        onSwitched: (double value) {
                          stressLevel = value;
                          _validate(context);
                        },
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'Заметки',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      AppContainer(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          controller: _controller,
                          onChanged: (value) {
                            _validate(context);
                          },
                          decoration:
                              const InputDecoration(border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AppTextButton(
                    loading: state is MoodDiaryLoadingForm,
                    onPressed: () {
                      if (state is MoodDiaryLoadingForm) {
                        return;
                      }
                      final emotions =
                          context.read<EmotionCubit>().getEmotions();
                      if (emotions.isEmpty || _controller.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Вы не выбрали ни одну эмоцию'),
                          ),
                        );
                        return;
                      }
                      context
                          .read<MoodDiaryCubit>()
                          .saveForm(
                            emotions: emotions,
                            stressLevel: stressLevel!,
                            selfEsteemLevel: selfEsteemLevel!,
                            notes: _controller.text,
                          )
                          .then((value) {
                        // ignore: inference_failure_on_function_invocation
                        showAdaptiveDialog(
                          context: context,
                          builder: (context) => Align(
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              width: 150,
                              child: const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 40,
                                    ),
                                    SizedBox(height: 10),
                                    Text('Данные сохранены'),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                    text: 'Сохранить',
                    isDisabled: isDisabledSaveButton,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _validate(BuildContext context) {
    if (stressLevel != null &&
        selfEsteemLevel != null &&
        _controller.text.isNotEmpty) {
      isDisabledSaveButton = false;
      setState(() {});
    }
  }
}
