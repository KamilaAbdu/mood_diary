import 'package:flutter/material.dart';
import 'package:mood_diary/core/constants/app_dimens.dart';
import 'package:mood_diary/features/data/mood_buttons_data.dart';
import 'package:mood_diary/features/presentation/widgets/mood_selection.dart';
import 'package:mood_diary/features/presentation/widgets/notes_field.dart';
import 'package:mood_diary/features/presentation/widgets/save_button.dart';
import 'package:mood_diary/features/presentation/widgets/slider_section.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  int selectedIndex = -1;
  int expandedIndex = -1;
  String? selectedSubLabel; 
  double stressLevel = 0.5;
  double selfEsteem = 0.5;
  TextEditingController notesController = TextEditingController();

  Future<void> _saveData() async {
    if (_isFormValid()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('mood', selectedSubLabel ?? '');
      await prefs.setDouble('stressLevel', stressLevel);
      await prefs.setDouble('selfEsteem', selfEsteem);
      await prefs.setString('notes', notesController.text);
      _showSuccessDialog();
    } else {
      _showErrorDialog();
    }
  }

  bool _isFormValid() {
    return selectedSubLabel != null && selectedSubLabel!.isNotEmpty && notesController.text.isNotEmpty;
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Успех'),
          content: const Text('Все данные успешно сохранены!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ОК'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Ошибка'),
          content: const Text('Все поля обязательны для заполнения!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('ОК'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.mainHorizontalPadding),
      child: ListView(
        children: [
          MoodSelection(
            selectedIndex: selectedIndex,
            expandedIndex: expandedIndex,
            buttonLabels: buttonLabels,
            buttonIcons: buttonIcons,
            subButtonLabels: subButtonLabels,
            onMoodButtonSelected: (index) {
              setState(() {
                if (selectedIndex == index) {
                  expandedIndex = expandedIndex == index ? -1 : index;
                } else {
                  selectedIndex = index;
                  expandedIndex = index;
                }
                selectedSubLabel = null;
              });
            },
            onSubButtonTap: (label) {
              setState(() {
                selectedSubLabel = label;
              });
            },
          ),
          SliderSection(
            stressLevel: stressLevel,
            selfEsteem: selfEsteem,
            onStressLevelChanged: (value) {
              setState(() {
                stressLevel = value;
              });
            },
            onSelfEsteemChanged: (value) {
              setState(() {
                selfEsteem = value;
              });
            },
          ),
          NotesField(notesController: notesController),
          const SizedBox(height: AppDimens.largeVerticalPadding),
          SaveButton(onSave: _saveData),
        ],
      ),
    );
  }
}
