import 'package:flutter/cupertino.dart';

class HostelHB2 extends StatelessWidget {
  const HostelHB2({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: HostelHB21(),
    );
  }
}

class HostelHB21 extends StatelessWidget {
  const HostelHB21({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('HB2'),
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