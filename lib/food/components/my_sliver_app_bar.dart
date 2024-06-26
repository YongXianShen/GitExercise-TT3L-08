import 'package:flutter/material.dart';
import 'package:mmusuperapp/food/pages/cart_page.dart';
import 'package:mmusuperapp/food/pages/transaction.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 450,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [

        IconButton(
          onPressed: () {
            //go to cart page
            Navigator.push(context, MaterialPageRoute(builder: (context) =>  TransactionPage(),
            ),);
          }, 
          icon: const Icon(Icons.history),
        ),
        //cart button
        IconButton(
          onPressed: () {
            //go to cart page
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CartPage(),
            ),);
          }, 
          icon: const Icon(Icons.shopping_cart),
        )


      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("MMU Taste Restaurant"),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
        
      ),
      automaticallyImplyLeading: false,
    );
  }
}