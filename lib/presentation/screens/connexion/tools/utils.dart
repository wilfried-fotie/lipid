//  Container(
//               margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//               child: TextFormField(
//                 onEditingComplete: () {},
//                 style: kLinkSmall.copyWith(
//                     fontWeight: FontWeight.w500, color: Colors.black),
//                 decoration: input.copyWith(labelText: "LabelOne"),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//               child: TextFormField(
//                 initialValue: "lolo",
//                 onChanged: (value) {
//                   testValue = value;
//                 },
//                 style: kLinkSmall.copyWith(
//                     fontWeight: FontWeight.w500, color: Colors.black),
//                 decoration: input.copyWith(
//                   labelText: "Label",
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                         color: testValue != null ? kGreyThree : kGreyOne,
//                         width: 1.0),
//                     borderRadius: BorderRadius.circular(4.0),
//                   ),
//                   suffix: SizedBox(
//                       height: 18,
//                       width: 18,
//                       child: CircularProgressIndicator(
//                           color: kPrimaryColorOne, strokeWidth: 2)),
//                 ),
//               ),
//             ),
//             Image.asset("assets/img/logo.png"),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//               child: TextFormField(
//                 style: kLinkSmall.copyWith(
//                     fontWeight: FontWeight.w500, color: Colors.black),
//                 decoration: input.copyWith(
//                     labelText: "LabelOne",
//                     enabled: false,
//                     labelStyle:
//                         ktextMedium.copyWith(fontSize: 14, color: kGreyTwo)),
//               ),
//             ),
//             customSwitch(sw, (value) {
//               sw = value;
//               setState(() {});
//             }),
//             Checkbox(
//                 value: sw,
//                 activeColor: Colors.white,
//                 onChanged: (value) {
//                   sw = value!;
//                   setState(() {});
//                 }),
//             GestureDetector(
//               onTap: () {
//                 FocusScope.of(context).unfocus();
//               },
//               child: Container(
//                   height: 100,
//                   width: 100,
//                   decoration: BoxDecoration(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     color: Colors.white,
//                     boxShadow: [kShadowThree],
//                   )),
//             ),