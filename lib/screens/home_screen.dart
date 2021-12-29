import 'package:auto_size_text/auto_size_text.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/constants/hymn_icon.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/provider/theme_provider.dart';
import 'package:longoi_dot_ulun_kristian/screens/settings_screen.dart';
import 'package:longoi_dot_ulun_kristian/screens/tabs/hymn_tab.dart';
import 'package:longoi_dot_ulun_kristian/screens/tabs/liturgy_tab.dart';
import 'package:longoi_dot_ulun_kristian/screens/tabs/other_tab.dart';
import 'package:longoi_dot_ulun_kristian/screens/tabs/prayer_tab.dart';
import 'package:longoi_dot_ulun_kristian/screens/tabs/psalm_tab.dart';
import 'package:longoi_dot_ulun_kristian/utility/connectivity_service.dart';
import 'package:longoi_dot_ulun_kristian/utility/prefs.dart';
import 'package:longoi_dot_ulun_kristian/widgets/app_bar_painter.dart';
import 'package:longoi_dot_ulun_kristian/widgets/like_toggle.dart';
import 'package:provider/provider.dart';

import 'about_screen.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchTextController = TextEditingController();
  bool _isSearching = false;
  bool _isList = true; //otherwise is grid

  @override
  void initState() {
    super.initState();
    _isList = SharedPrefs.getBool(ListGridProvider.viewKey) ?? true;
    _searchTextController.addListener(() {
      Provider.of<FilteredOnlyProvider>(context, listen: false).searchString =
          _searchTextController.text.toLowerCase();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //init connectivity status
    Provider.of<ConnectivityStatus>(context);
    bool isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    return DefaultTabController(
      length: 5,
      initialIndex: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 65.0,
          elevation: 0.0,
          title: _isSearching
              ? TextField(
                  controller: _searchTextController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    // enabledBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white),
                    // ),
                    // focusedBorder: UnderlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.white),
                    // ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              : const AutoSizeText(
                  'Longoi Dot Ulun Kristian',
                  maxLines: 1,
                ),
          actions: [
            IconButton(
              icon: _isSearching
                  ? const Icon(Icons.close)
                  : const Icon(
                      Icons.search,
                    ),
              //padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {
                //show all list
                Provider.of<FavoritesOnlyProvider>(context, listen: false)
                    .showFavoritesOnly(false);
                setState(() {
                  _searchTextController.clear();
                  _isSearching = !_isSearching;
                });
                Provider.of<FilteredOnlyProvider>(context, listen: false)
                    .showFilteredOnly(_isSearching);
              },
            ),
            Visibility(
              visible: !_isSearching,
              child: LikeToggle(
                //activeColor: Colors.red,
                //inactiveColor: Colors.white,
                inactiveIcon: Icons.favorite_outline,
                value: Provider.of<FavoritesOnlyProvider>(context)
                    .isShowingFavoritesOnly,
                onChanged: (value) {
                  Provider.of<FavoritesOnlyProvider>(context, listen: false)
                      .showFavoritesOnly(value);
                },
              ),
            ),
            Visibility(
              visible: !_isSearching,
              child: PopupMenuButton(
                onSelected: (value) {
                  if (value == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsScreen()),
                    );
                  } else if (value == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutScreen()),
                    );
                  }
                },
                itemBuilder: (_context) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        _isList = !_isList;
                        Provider.of<ListGridProvider>(context, listen: false)
                            .changeView(_isList);
                      },
                      child: ListTile(
                        leading: _isList
                            ? Icon(
                                Icons.grid_view_rounded,
                                color: IconTheme.of(context).color,
                              )
                            : Icon(Icons.list,
                                color: IconTheme.of(context).color),
                        title: Text(_isList ? 'Grid' : 'List'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 0,
                      child: ListTile(
                        leading: Icon(Icons.settings,
                            color: IconTheme.of(context).color),
                        title: const Text('Settings'),
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        leading: Icon(Icons.info,
                            color: IconTheme.of(context).color),
                        title: const Text('About'),
                      ),
                    ),
                  ];
                },
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            const TabBarView(
              children: [
                PrayerTab(),
                PsalmTab(),
                HymnTab(),
                LiturgyTab(),
                OtherTab(),
              ],
            ),
            CustomPaint(
              painter: AppBarPainter(color: Theme.of(context).primaryColor),
              child: Container(height: 0),
            ),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          top: -20.0,
          elevation: 10.0,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          activeColor: isDark
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).primaryColor,
          color: isDark
              ? Theme.of(context).primaryColorLight
              : Theme.of(context).primaryColor,
          style: TabStyle.flip,
          items: const [
            TabItem(title: 'Doa', icon: Icon(HymnIcon.prayer)),
            TabItem(title: 'Zabur', icon: Icon(HymnIcon.psalm)),
            TabItem(title: 'Longoi', icon: Icon(HymnIcon.hymn)),
            TabItem(title: 'Hoturan', icon: Icon(HymnIcon.liturgy)),
            TabItem(title: 'Vokon', icon: Icon(HymnIcon.book)),
          ],
        ),
      ),
    );
  }
}
