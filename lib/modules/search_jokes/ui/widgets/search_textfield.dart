// import 'package:flutter/material.dart';

// class SearchTextField extends StatelessWidget {
//   const SearchTextField({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//               key: _formKey,
//               child: TextFormField(
//                 keyboardType: TextInputType.multiline,
//                 onChanged: (category) {
//                   _value = category;
//                 },
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return 'Oh please...';
//                   }
//                   return null;
//                 },
//                 decoration: InputDecoration(
//                   fillColor: Colors.white,
//                   filled: true,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                     borderSide: BorderSide(color: Colors.white),
//                   ),
//                   suffixIcon: InkWell(
//                     child: Icon(Icons.search_outlined),
//                     onTap: () async {
//                       searchJokeByCategoryBloc.add(_value);
//                     },
//                   ),
//                   hintText: 'Search a joke by category',
//                   floatingLabelBehavior: FloatingLabelBehavior.never,
//                 ),
//               ),
//             );
//   }
// }