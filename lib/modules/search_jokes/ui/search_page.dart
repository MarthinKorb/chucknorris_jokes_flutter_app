import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chucknorris_app/modules/search_jokes/ui/bloc/search_joke_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final bloc = Modular.get<SearchJokeBloc>();

  @override
  void initState() {
    bloc.add(() => {});
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chuck Norris Jokes'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Center(
                child: BlocBuilder<SearchJokeBloc, SearchJokeState>(
                  bloc: bloc,
                  builder: (context, state) {
                    if (state is SearchJokeError) {
                      return Text(
                          'The joke is that we could not found the joke...');
                    }
                    if (state is SearchJokeLoading) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 12),
                          Text('Looking for another joke...')
                        ],
                      );
                    }
                    if (state is SearchJokeSuccess) {
                      return Column(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.amber,
                            ),
                            child: Image.asset(
                              'assets/images/chuck-norris.png',
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(12),
                            child: Text(state.joke.value!),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => bloc.add(() => {}),
                            child: Text('Search a new Joke'),
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
