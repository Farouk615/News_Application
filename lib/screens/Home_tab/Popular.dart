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
                              padding: const EdgeInsets.only(left: 20 , top: 12),
                              child: Text('The World Global Warming Annual Summit ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25 , left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Michael Adams'),
                                  SizedBox(width: 50,),
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