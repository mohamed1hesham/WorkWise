// Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 15),
//   child: DropdownButtonFormField<String>(
//     value: _countryController,
//     decoration: InputDecoration(
//       border: OutlineInputBorder(),
//       focusedBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.greenAccent),
//         borderRadius: BorderRadius.circular(13),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderSide: BorderSide(color: Colors.brown),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       labelText: "Country",
//       labelStyle: TextStyle(color: Colors.black),
//     ),
//     items: <String>[
//       'Egypt',
//       'Saudi Arabia',
//       'United Arab Emirates',
//       'Iraq',
//       'Jordan',
//       // يمكنك الاستمرار في إضافة المزيد من الدول هنا بنفس التسلسل
//     ].map<DropdownMenuItem<String>>((String value) {
//       return DropdownMenuItem<String>(
//         value: value,
//         child: Text(value),
//       );
//     }).toList(),
//     onChanged: (String? newValue) {
//       setState(() {
//         _countryController.text = newValue!;
//       });
//     },
//     validator: (value) {
//       if (value!.isEmpty) {
//         return 'Please enter your country';
//       }
//       return null;
//     },
//   ),
// ),
