import 'package:flutter/cupertino.dart';

class HostelHB4 extends StatelessWidget {
  const HostelHB4({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: HostelHB41(),
    );
  }
}

class HostelHB41 extends StatelessWidget {
  const HostelHB41({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('HB4'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              onPressed: () {},
              child: const Text('Block A'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Block B'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {},
              child: const Text('Block C'),
            ),
          ],
        ),
      ),
    );
  }
}