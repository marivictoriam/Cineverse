import 'package:cineverse/presentation/widgets/shared/poster.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Masonry extends StatefulWidget {
  final List<dynamic> list;
  final VoidCallback? loadNextPage;
  final bool infinityScroll;
  final bool isMovie;

  const Masonry({
    super.key,
    required this.list,
    this.loadNextPage,
    required this.infinityScroll,
    required this.isMovie,
  });

  @override
  State<Masonry> createState() => _MasonryState();
}

class _MasonryState extends State<Masonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    if (widget.infinityScroll) {
      //scrollController = ScrollController();

      scrollController.addListener(() {
        if (widget.loadNextPage == null) return;

        if ((scrollController.position.pixels + 100) >=
            scrollController.position.maxScrollExtent) {
          widget.loadNextPage!();
        }
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemCount: widget.list.length,
        itemBuilder: (context, index) {
          if (index == 1) {
            return Column(
              children: [
                const SizedBox(height: 20),
                Poster(
                  info: widget.list[index],
                  isMovie: widget.isMovie,
                ),
              ],
            );
          }

          return Poster(info: widget.list[index], isMovie: widget.isMovie);
        },
      ),
    );
  }
}
