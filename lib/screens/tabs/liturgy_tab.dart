import 'package:flutter/material.dart';
import 'package:longoi_dot_ulun_kristian/database/daos_notifier/liturgies_notifier.dart';
import 'package:longoi_dot_ulun_kristian/models/models_notifier/active_list_provider.dart';
import 'package:longoi_dot_ulun_kristian/widgets/likeable_grid_view.dart';
import 'package:longoi_dot_ulun_kristian/widgets/likeable_list_view.dart';
import 'package:provider/provider.dart';

class LiturgyTab extends StatelessWidget {
  const LiturgyTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isList = Provider.of<ListGridProvider>(context, listen: true).isList;
    return _isList
        ? LikeableListView(
            booksProvider: Provider.of<LiturgiesProvider>(context),
            //key: UniqueKey(),
          )
        : LikeAbleGridView(
            booksProvider: Provider.of<LiturgiesProvider>(context),
          );
  }
}
