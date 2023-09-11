import 'package:flutter/material.dart';

class HomepageView extends StatelessWidget {
  const HomepageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 50),
            child: IconButton.filled(
              disabledColor: Colors.deepPurple,
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const Center(
            child: Text(
              'Homepage View',
            ),
          ),
        ],
      ),
    );
  }
}
