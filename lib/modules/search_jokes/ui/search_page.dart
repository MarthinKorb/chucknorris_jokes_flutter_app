import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/ui/search_joke_bloc/search_joke_bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/ui/search_joke_by_category_bloc/search_joke_by_category_bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/ui/utils/categories.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final searchJokeBloc = Modular.get<SearchJokeBloc>();
  final searchJokeByCategoryBloc = Modular.get<SearchJokeByCategoryBloc>();

  final _formKey = GlobalKey<FormState>();

  String? _value;

  @override
  void initState() {
    searchJokeBloc.add(() => {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    searchJokeBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Jokes'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                key: _formKey,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  onChanged: (category) {
                    _value = category;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Oh please...';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    suffixIcon: InkWell(
                      child: Icon(Icons.search_outlined),
                      onTap: () async {
                        searchJokeByCategoryBloc.add(_value!);
                      },
                    ),
                    hintText: 'Search a joke by category',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: Categories.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        searchJokeByCategoryBloc
                            .add(Categories.categories[index]);
                        _value = Categories.categories[index];
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(2),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.brown,
                        ),
                        child: Text(
                          Categories.categories[index],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 12),
              Expanded(
                flex: 12,
                child: Center(
                  child: BlocBuilder<SearchJokeByCategoryBloc,
                      SearchJokeByCategoryState>(
                    bloc: searchJokeByCategoryBloc,
                    builder: (context, state) {
                      if (state is SearchJokeByCategoryInitial) {
                        return Center(
                          child: AnimatedContainer(
                            duration: Duration(seconds: 3),
                            child: Column(
                              children: [
                                Text('Let me tell you some...',
                                    style: TextStyle(fontSize: 24)),
                                SizedBox(height: 12),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(150),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.brown.withOpacity(0.7),
                                          blurRadius: 30,
                                        )
                                      ]),
                                  child: Image.asset(
                                      'assets/images/chuck-norris.png'),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      if (state is SearchJokeByCategoryError) {
                        return Column(
                          children: [
                            Image.asset(
                              'assets/images/sad-chuck.jpg',
                              height: MediaQuery.of(context).size.width * 0.8,
                            ),
                            SizedBox(height: 12),
                            Text(
                              'We could not found jokes for this category...',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        );
                      }

                      if (state is SearchJokeByCategoryLoading) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 12),
                            Text(
                                'Hold on man, we\'re looking for another joke...')
                          ],
                        );
                      }

                      if (state is SearchJokeByCategorySuccess) {
                        return Column(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.amber,
                              ),
                              child:
                                  Image.asset('assets/images/chuck-norris.png'),
                            ),
                            Container(
                              padding: EdgeInsets.all(12),
                              child: Text(
                                state.jokeByCategory.value!,
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            SizedBox(height: 12),
                            // ElevatedButton(
                            // onPressed: () => searchJokeBloc.add(() => {}),
                            //   child: Text('Search a new Joke'),
                            // ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),
              ),
              // Expanded(
              //   child: Center(
              //     child: BlocBuilder<SearchJokeBloc, SearchJokeState>(
              //       bloc: searchJokeBloc,
              //       builder: (context, state) {
              //         if (state is SearchJokeError) {
              //           return Text(
              //               'The joke is that we could not found the joke...');
              //         }
              //         if (state is SearchJokeLoading) {
              //           return Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               CircularProgressIndicator(),
              //               SizedBox(height: 12),
              //               Text('Looking for another joke...')
              //             ],
              //           );
              //         }
              //         if (state is SearchJokeSuccess) {
              //           return Column(
              //             children: [
              //               Container(
              //                 height: MediaQuery.of(context).size.height * 0.4,
              //                 decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(50),
              //                   color: Colors.amber,
              //                 ),
              //                 child: Image.asset(
              //                   'assets/images/chuck-norris.png',
              //                 ),
              //               ),
              //               Container(
              //                 padding: EdgeInsets.all(12),
              //                 child: Text(state.joke.value!),
              //               ),
              //               SizedBox(height: 12),
              //               ElevatedButton(
              //                 onPressed: () => searchJokeBloc.add(() => {}),
              //                 child: Text('Search a new Joke'),
              //               ),
              //             ],
              //           );
              //         }
              //         return Container();
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
