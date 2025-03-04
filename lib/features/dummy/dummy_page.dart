import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:talker/talker.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            ElevatedButton(
              onPressed: () {
                final talker = Talker();
                talker.log('test');
              },
              child: Text('Logger'),
            ),
            ElevatedButton(
              onPressed: () {
                final talker = Talker();
                talker.handle('test');
              },
              child: Text('Error'),
            ),
            OutlinedButton(
              child: const Text('Click me!'),
              onPressed: () async {
                const channel = MethodChannel('crashy-custom-channel');
                await channel.invokeMethod('blah');
              },
            )
          ],
        ),
      ),
    );
  }
}
