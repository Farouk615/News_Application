import 'package:flutter/material.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return _drawTopStoriesCard();
    },
      itemCount: 20,);
  }
  Widget _drawTopStoriesCard(){
    return Container(
      color: Color(0xfafafa),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.1,
                          child: Image(
                              image: ExactAssetImage('assets/images/back.jpg'), fit: BoxFit.fill
                          ),

                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text('The World Global Warming Annual Summit ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 200),
                                    child: Text('Michael Adams'),
                                  ),
                                  Icon(Icons.timer),
                                  Text('15 min'),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _drawLineBreaker(),
        ],
      ),

    );
  }
  Widget _drawLineBreaker(){
    return Container(
      height: 1,
      color: Colors.black,
    );
  }
}