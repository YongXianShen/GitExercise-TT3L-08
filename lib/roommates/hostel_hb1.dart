import 'package:flutter/cupertino.dart';

class HostelHB1 extends StatelessWidget {
  const HostelHB1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: HostelHB11(),
    );
  }
}

class HostelHB11 extends StatelessWidget {
  const HostelHB11({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('HB1'),
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