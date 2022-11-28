import 'package:flutter/material.dart';
import 'package:scroll_problem/top.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Problem'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //list view or list view builder
            // for (int i = 0; i < 2; i++) ...{
            //   TopWidget(),
            // },
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 2,
              itemBuilder: (ctx, i) {
                return const TopWidget();
              },
            ),
            DefaultTabController(
              length: 2,
              //XXX scaffold
              child: Scaffold(
                //XXX AppBar
                appBar: AppBar(
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
                      Tab(icon: Icon(Icons.camera_alt), text: "Tab 2")
                    ],
                  ),
                ),
                body: Expanded(
                  //should be in Expanded Widget 
                  child: TabBarView(
                    children: [
                      Container(
                        height: 100,
                        child: Center(
                          child: Text('First tab content with 100 height'),
                        ),
                      ),
                      Container(
                        height: 200,
                        child: Center(
                          child: Text('Second tab content with 200 height'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //list view or list viewbuilder
            for (int i = 0; i < 6; i++) ...{
              TopWidget(),
            },
          ],
        ),
      ),
    );
  }
}
