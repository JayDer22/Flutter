import 'package:flutter/material.dart';

class InfiniteList extends StatefulWidget {
  const InfiniteList({super.key});

  @override
  State<InfiniteList> createState() => _InfiniteListState();
}

class _InfiniteListState extends State<InfiniteList> {
  List<int> items = List.generate(20, (index) => index);

  final ScrollController controller = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.pixels ==
          controller.position.maxScrollExtent &&
          !isLoading) {
        loadMore();
      }
    });
  }

  Future<void> loadMore() async {
    isLoading = true;

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      items.addAll(
        List.generate(10, (index) => items.length + index),
      );

      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: controller,
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index < items.length) {
            return ListTile(
              title: Text("Item ${items[index]}"),
            );
          } else {
            return isLoading
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : const SizedBox();
          }
        },
      ),
    );
  }
}