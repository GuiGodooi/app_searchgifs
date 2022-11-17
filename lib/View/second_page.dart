import 'package:flutter/material.dart';
import '../model/gif_model.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gif gif = ModalRoute.of(context)!.settings.arguments as Gif;

    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Container(
              color: Colors.grey[900],
            ),
          ),
          Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: SizedBox(
                    height: 380,
                    width: 280,
                    child: Card(
                      color: Colors.black38,
                      elevation: 40,
                      shadowColor: Colors.white24,
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                gif.images?.downsized?.url ?? '',
                                alignment: Alignment.center,
                                fit: BoxFit.fill,
                                height: 240,
                                width: 230,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            heightFactor: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 3),
                              child: Text(
                                ' Name: \n ${gif.title}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, right: 40, left: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.amber,
                          elevation: 15,
                          padding: EdgeInsets.all(10),
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/home');
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.greenAccent,
                          elevation: 15,
                          padding: EdgeInsets.all(5),
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: CircleAvatar(
                          child: Image.network(
                            'https://logodownload.org/wp-content/uploads/2015/04/whatsapp-logo-1.png',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.white,
                          elevation: 15,
                          padding: EdgeInsets.all(5),
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onPressed: () {},
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                            'https://logodownload.org/wp-content/uploads/2014/09/twitter-logo-8.png',
                          ),
                        ),
                      ),
                    ],
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
