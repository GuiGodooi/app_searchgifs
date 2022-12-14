import 'package:app_searchgifs/presenter/gif_presenter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../presenter/presnt.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ChangeNotifier {
  late GifPresenter presenter;
  //late GifPresent present;

  @override
  void initState() {
    presenter = context.read<GifPresenter>();
    presenter.getGif();

    // present = context.read<GifPresent>();
    // present.getListAPI();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        //Personalizando borda para appbar;
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 30,
        backgroundColor: Colors.black,
        title: Image.network(
          'https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  style: const TextStyle(
                    fontSize: 18,
                    letterSpacing: 2,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white24,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      color: Colors.amberAccent,
                      splashColor: Colors.white10,
                      splashRadius: 20,
                      onPressed: () {},
                    ),
                    hintText: 'Procure aqui...',
                    hintStyle: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 35,
                  right: 35,
                ),
                child: Divider(
                  height: 10,
                  thickness: 0.5,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Consumer<GifPresenter>(
                    //p contexto e w widget;
                    builder: (_, presenter, w) {
                      if (presenter.gifs.isEmpty) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: Colors.amber,
                        ));
                      }
                      return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: presenter.gifs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  shadowColor: Colors.grey,
                                  color: Colors.black38,
                                  elevation: 10,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pushNamed(
                                                '/gif-page',
                                                arguments:
                                                    presenter.gifs[index]);
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              presenter.gifs[index].images!
                                                      .downsized!.url ??
                                                  '',
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                return loadingProgress == null
                                                    ? child
                                                    : Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.black,
                                                          color: Colors.amber
                                                              .withOpacity(0.5),
                                                        ),
                                                      );
                                              },
                                              alignment: Alignment.center,
                                              fit: BoxFit.fill,
                                              height: 300,
                                              width: 300,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
