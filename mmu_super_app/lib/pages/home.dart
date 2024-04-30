import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mmu_super_app/models/features_model.dart'; // Assuming this is the correct path

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<FeaturesModel> features = []; // Initialize with empty list

  @override
  void initState() {
    super.initState();
    _getFeatures(); // Call _getFeatures() in initState
  }

  void _getFeatures() async {
    // Assuming getFeatures() is asynchronous, add async
    features.addAll(await FeaturesModel.getFeatures()); // Update state with features
    setState(() {}); // Notify UI of changes
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MMU Student App',
          style: TextStyle(
            color: Colors.orange,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 100.0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40, left: 20, right: 20),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xff1D1617).withOpacity(0.15),
                  blurRadius: 40,
                  spreadRadius: 0.0,
                )
              ],
            ),
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.all(15),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset('assets/icons/Search.svg'),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                    ), // Remove unnecessary padding for suffixIcon
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  height: 120,
                  color: Colors.green,
                  child: ListView.builder(
                    itemCount: features.length, 
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(
                      Left:20,
                      right: 20
                    ),
                    seperatorBuilder: (context, index) => SizedBox(width: 25,),// Use features.length
                    itemBuilder: (context, index) {
                      return Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: features[index].boxColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(16)// Access boxColor property
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width:50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(features[index].iconPath),
                              ),
                            ),
                           Text(
                            features[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14
                            ),
                           )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


