import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initstate() {
    super.initState();

    Future.microtask(() {
      _updateUi(1);
    });
  }

  Future<void> _updateUi(int page) async {
    final viewModel = context.read<HomeViewModel>();
    viewModel.fetch(page);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: viewModel.isLoading
          ? const CircularProgressIndicator()
          : ListView(
              children: viewModel.posts.map((e) => Text('${e.id}')).toList(),
            ),
    );
  }
}
