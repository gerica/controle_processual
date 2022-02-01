import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:controle_processual/utils/ui_helper.dart';

class AppPagination extends StatelessWidget {
  int count;
  int perPage;
  int page;
  Function changePerPage;
  Function fetchLess;
  Function fetchMore;
  int paginationInitCount;
  int paginationEndCount;
  bool hasMorePage;
  final perPageOptions = [5, 10, 15, 20, 50, 100];

  AppPagination({
    Key? key,
    required this.count,
    required this.perPage,
    required this.page,
    required this.changePerPage,
    required this.fetchLess,
    required this.fetchMore,
    required this.paginationInitCount,
    required this.paginationEndCount,
    required this.hasMorePage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (count == 0) {
      return SizedBox.shrink();
    }
    return Container(
      // color: Colors.blue,
      margin: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('Items per page:'),
          UIHelper.horizontalSpaceExtraTiny,
          DropdownButton<int>(
            value: perPage,
            onChanged: (dynamic newValue) {
              changePerPage(newValue);
            },
            style: Theme.of(context).textTheme.bodyText1,
            selectedItemBuilder: (BuildContext context) {
              return perPageOptions.map<Widget>((int item) {
                return Align(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    '$item',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                );
              }).toList();
            },
            items: perPageOptions.map((int item) {
              return DropdownMenuItem<int>(
                value: item,
                child: Text('$item'),
              );
            }).toList(),
          ),
          UIHelper.horizontalSpaceMega,
          page > 1
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios_outlined),
                  onPressed: () => fetchLess(),
                )
              : SizedBox.shrink(),
          Text('${paginationInitCount}'),
          Text('-'),
          Text('${paginationEndCount}'),
          UIHelper.horizontalSpaceSmall,
          Text('of'),
          UIHelper.horizontalSpaceSmall,
          Text('${count}'),
          hasMorePage
              ? IconButton(
                  icon: const Icon(Icons.arrow_forward_ios_outlined),
                  onPressed: () => fetchMore(),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
