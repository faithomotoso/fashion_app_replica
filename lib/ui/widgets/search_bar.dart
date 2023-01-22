import 'package:fashion_app_replica/core/providers/search_icon_mode_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: "Search",
                fillColor: Colors.blueGrey.withOpacity(0.2),
                filled: true,
                border: InputBorder.none),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        IconButton(
            onPressed: () {
              ref.read(searchModeProvider.notifier).changeMode(SearchMode.hide);
            },
            icon: const Icon(Icons.close_rounded))
      ],
    );
  }
}
