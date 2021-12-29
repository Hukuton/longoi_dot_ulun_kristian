import 'package:flutter/material.dart';
import 'package:flutter_font_picker/flutter_font_picker.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/provider/theme_provider.dart';
import 'package:longoi_dot_ulun_kristian/utility/fonts_theme.dart';
import 'package:longoi_dot_ulun_kristian/utility/prefs.dart';
import 'package:longoi_dot_ulun_kristian/widgets/app_bar_painter.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const id = 'settings_screen';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _selectedFont = "Roboto";
  late ThemeProvider _themeProvider;

  @override
  Widget build(BuildContext context) {
    _themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        toolbarHeight: 65.0,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColorLight.withOpacity(.08),
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Theme',
                  style: TextStyle(fontSize: 25.0),
                ),
                SizedBox(
                  height: 10,
                  child: Divider(
                    height: 1,
                    thickness: 1.0,
                    indent: 20,
                    endIndent: 20,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                ListTile(
                  leading:
                      Icon(Icons.dark_mode, color: IconTheme.of(context).color),
                  title: const Text('Dark Mode'),
                  trailing: Switch(
                    value: _themeProvider.isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        _themeProvider.isDarkMode = value;
                      });
                    },
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.color_lens_rounded,
                      color: IconTheme.of(context).color,
                    ),
                    title: const Text('Custom Theme'),
                    trailing: ElevatedButton(
                      child: const Text('Color'),
                      onPressed: _openColorPicker,
                    )),
                const SizedBox(height: 10),
                const Text('Text', style: TextStyle(fontSize: 25.0)),
                SizedBox(
                  height: 10,
                  child: Divider(
                    height: 1,
                    thickness: 1.0,
                    indent: 20,
                    endIndent: 20,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.font_download,
                      color: IconTheme.of(context).color),
                  title: const Text('Select Font'),
                  subtitle: Text(
                    'Requires internet & restart',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontSize: 11.0),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      _showFontPicker(context);
                    },
                    child: const Text('Font'),
                  ),
                ),
                ListTile(
                    leading: Icon(Icons.format_size,
                        color: IconTheme.of(context).color),
                    title: const Text(
                      'List Textsize',
                    ),
                    trailing: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton(
                        value: _selectedSizes,
                        onChanged: (value) {
                          setState(() {
                            _selectedSizes = int.parse(value.toString());
                            Provider.of<ListTextSizeProvider>(context,
                                    listen: false)
                                .updateTextSize(_selectedSizes);
                          });
                        },
                        items: _sizes.map((size) {
                          return DropdownMenuItem(
                            child: Text(size.toString()),
                            value: size,
                          );
                        }).toList(),
                      ),
                    )),
                const SizedBox(height: 10),
                const Text('Display', style: TextStyle(fontSize: 25.0)),
                SizedBox(
                  height: 10,
                  child: Divider(
                    height: 1,
                    thickness: 1.0,
                    indent: 20,
                    endIndent: 20,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.settings_display,
                      color: IconTheme.of(context).color),
                  title: const Text('Always Awake'),
                  subtitle: Text('Screen always on while in App',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          ?.copyWith(fontSize: 11.0)),
                  trailing: Switch(
                    value:
                        Provider.of<AlwaysAwakeProvider>(context).alwaysAwake,
                    onChanged: (value) {
                      setState(() {
                        Provider.of<AlwaysAwakeProvider>(context, listen: false)
                            .setAlwaysAwake(value);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          CustomPaint(
            painter: AppBarPainter(color: Theme.of(context).primaryColor),
            child: Container(height: 0),
          ),
        ],
      ),
    );
  }

  final List<int> _sizes = [
    10,
    15,
    16,
    17,
    18,
    19,
    20,
    25,
    30,
    35,
    40
  ]; // Option 2
  int _selectedSizes =
      SharedPrefs.getInt(ListTextSizeProvider.sizeKey) ?? 17; // Option 2

  _showFontPicker(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: SingleChildScrollView(
            child: SizedBox(
              width: double.maxFinite,
              child: FontPicker(
                  showFontInfo: true,
                  showInDialog: true,
                  onFontChanged: (font) {
                    setState(() {
                      _selectedFont = font.fontFamily;
                      _themeProvider.setFontFamily(_selectedFont);
                    });
                  },
                  googleFonts: FontsTheme.myGoogleFonts),
            ),
          ));
        });
  }

  late Color _tempShadeColor;
  Color? _shadeColor = Colors.blue[800];

  void _openDialog(String title, Widget content) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(6.0),
          title: Text(title),
          content: content,
          actions: [
            TextButton(
              child: const Text('CANCEL'),
              onPressed: Navigator.of(context).pop,
            ),
            TextButton(
              child: const Text('SUBMIT'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _shadeColor = _tempShadeColor);
              },
            ),
          ],
        );
      },
    );
  }

  void _openColorPicker() async {
    _openDialog(
      "Color picker",
      MaterialColorPicker(
        selectedColor: _shadeColor,
        onColorChange: (color) {
          _themeProvider.isDarkMode = false;
          setState(() {
            _tempShadeColor = color;
            print(_tempShadeColor.value);
          });
          _themeProvider.setPrimarySwatch(color);
        },
      ),
    );
  }
}
