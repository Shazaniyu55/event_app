import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body:  SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                     GestureDetector(
                      onTap: (){},
                       child: const Icon(
                                           Icons.arrow_back,
                                           size: 20,
                                         ),
                     ),
                  const Text(
                    "Search",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                  GestureDetector(
                      onTap: (){},
                       child: const Icon(
                                           Icons.settings,
                                           size: 20,
                                         ),
                     ),
                ],
              )
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: const EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Colors.grey.shade100)),
                ),
              ),
            ),

            
          ],
        )
      )
    );
  }
}
