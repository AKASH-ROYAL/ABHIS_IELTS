// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:back_button_interceptor/back_button_interceptor.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:enarem/AppRouter/app_router_constant.dart';
// import 'package:enarem/Common/app_colour.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:go_router/go_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import '../../../AppRouter/app_router.dart';
// import '../../../FAQ/FAQ question.dart';
// import '../../../ListView/Horizontal List View.dart';
// import '../../Layout/main_layout.dart';
//
// class HomeScreen extends StatefulWidget {
//   final VoidCallback openDrawer;
//
//   const HomeScreen({
//     super.key,
//     required this.openDrawer,
//   });
//
//   @override
//   State<HomeScreen> createState() => HomeScreenState();
// }
//
// class HomeScreenState extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   final CarouselController _carouselController = CarouselController();
//
//   int _currentIndex = 0;
//   bool isShowLocation = true;
//   List<Widget> carouselItems = [];
//   int notificationCount = 0;
//   int cartCount = 0;
//
//   List<Map<String, dynamic>> dataList = [];
//   Map<String, dynamic> currentBookingDetails = {};
//
//   late AnimationController _animationController;
//   late Animation<double> _fadeAnimation;
//
//   Future<void> fetchData() async {
//     try {
//       final response = await http.get(
//         Uri.parse('https://enarem.com/api/store-list'),
//       );
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//
//         if (responseData['status'] == 'success') {
//           final List<dynamic> data = responseData['data'];
//           setState(() {
//             dataList = data.map((item) {
//               Uint8List? imageBytes;
//               if (item['store_image'] != null) {
//                 String base64Image = item['store_image'];
//                 imageBytes = base64Decode(base64Image);
//               }
//
//               return {
//                 'store_id': item['store_id'],
//                 'image': imageBytes ?? '',
//                 'text': item['store_name'],
//                 'rating': item['store_rating'] ?? 0,
//                 'icon': Icons.star,
//                 'avg_rating': item['avg_rating'].toString()
//               };
//             }).toList();
//           });
//         } else {
//           print("API response indicates failure");
//         }
//       } else {
//         print(
//             "Failed to fetch data from the API. Status code: ${response.statusCode}");
//       }
//     } catch (error) {
//       print("Error fetching data from the API: $error");
//     }
//   }
//
//   Future<Map<String, dynamic>> bookStore(String storeId) async {
//     print(
//         'Attempting to book store with store_id: $storeId'); // Print the store_id
//     try {
//       final response = await http.post(
//         Uri.parse('https://enarem.com/api/specific-store-details'),
//         body: {
//           'store_id': storeId,
//         },
//         headers: {
//           'Content-Type': 'application/x-www-form-urlencoded',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//         return responseData;
//       } else {
//         print('Booking failed. Status code: ${response.statusCode}');
//         return {'error': 'Booking failed'};
//       }
//     } catch (error) {
//       print("Error booking store: $error");
//       return {'error': 'Error booking store'};
//     }
//   }
//
//   Future<void> SliderData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? accessToken = prefs.getString('authToken');
//     try {
//       final response = await http
//           .get(Uri.parse('https://enarem.com/api/home-banner'), headers: {
//         "Authorization": "Bearer $accessToken",
//       });
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//
//         if (responseData['status'] == 'success') {
//           final List<dynamic> data = responseData['data'];
//           setState(() {
//             carouselItems = data.map((item) {
//               return SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.12,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Text(
//                         item['title'],
//                         style: TextStyle(
//                           fontFamily: "Playfair",
//                           fontSize: 23,
//                           fontWeight: FontWeight.w700,
//                           color: Colors.black,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             }).toList();
//           });
//         } else {
//           print("API response indicates failure");
//         }
//       } else {
//         print(
//             "Failed to fetch data from the API. Status code: ${response.statusCode}");
//       }
//     } catch (error) {
//       print("Error fetching data from the API: $error");
//     }
//   }
//
//   Future<bool> isAuthenticated() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? authToken = prefs.getString('authToken');
//     return authToken != null && authToken.isNotEmpty;
//   }
//
//   bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
//     print("Back button pressed!");
//     if (context.canPop()) {
//       context.pop();
//
//       return true;
//     } else {
//       MainLayoutState? mainLayoutState = MainLayout.of(context);
//       if (mainLayoutState != null && mainLayoutState.currentIndex == 0) {
//         SystemNavigator.pop();
//         return true;
//       } else {
//         if (mainLayoutState != null) {
//           mainLayoutState.goBranch(0);
//           mainLayoutState.currentIndex = 0;
//         }
//         return true;
//       }
//     }
//   }
//
//   Future<void> NotificationCount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? accessToken = prefs.getString('authToken');
//     try {
//       final response = await http.get(
//           Uri.parse('https://enarem.com/api/notification-count'),
//           headers: {
//             "Authorization": "Bearer $accessToken",
//           });
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> responseData = jsonDecode(response.body);
//
//         if (responseData['status'] == 'success') {
//           print("responseData['data']['count'] : ${responseData['data']['count']}");
//             notificationCount = responseData['data']['count'];
//             setState(() {});
//         } else {
//           print("API response indicates failure");
//         }
//       } else {
//         print(
//             "Failed to fetch data from the API. Status code: ${response.statusCode}");
//       }
//     } catch (error) {
//       print("Error fetching data from the API: $error");
//     }
//   }
//
//   Future<void> CartCount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? accessToken = prefs.getString('authToken');
//     String? temporaryToken = prefs.getString("temporaryToken") ?? "";
//
//     String url = (accessToken?.isNotEmpty ?? false)
//         ? "https://enarem.com/api/total-cart-count"
//         : "https://enarem.com/api/before-login-total-cart-count";
//
//     final response = await http.get(
//       Uri.parse(url),
//       headers: {
//         "Authorization": "Bearer $accessToken",
//         'Temporary-Token': '$temporaryToken'
//       },
//     );
//
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> responseData = jsonDecode(response.body);
//       print('API response: $responseData'); // Debug print
//       if (responseData['status'] == 'success') {
//         int newCartCount = responseData['data']['cart_count'];
//
//         if (newCartCount != cartCount) {
//           print('Updating cart count from $cartCount to $newCartCount');
//           setState(() {
//             cartCount = newCartCount;
//           });
//         } else {
//           print('Cart count unchanged: $cartCount');
//         }
//       } else {
//         print("Failed to get cart count: ${responseData['message']}");
//       }
//     } else {
//       print(
//           "Failed to fetch cart count from API. Status code: ${response.statusCode}");
//     }
//   }
//
//   Widget _buildAnimatedContent(Widget content) {
//     return FadeTransition(opacity: _fadeAnimation, child: content);
//   }
//
//   Widget buildDot(int index) {
//     return GestureDetector(
//       onTap: () {
//         _carouselController.animateToPage(index);
//       },
//       child: Container(
//         width: 18,
//         height: 2,
//         margin: const EdgeInsets.symmetric(horizontal: 4),
//         decoration: BoxDecoration(
//           shape: BoxShape.rectangle,
//           color: _currentIndex == index ? Colors.black : Colors.grey,
//         ),
//       ),
//     );
//   }
//
//   void resetState() {
//     setState(() {
//       isShowLocation = false;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 500));
//     _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
//       CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
//     );
//     fetchData();
//     SliderData();
//     CartCount();
//     NotificationCount();
//     BackButtonInterceptor.add(myInterceptor);
//   }
//
//   void refreshData() {
//       fetchData();
//       SliderData();
//       CartCount();
//       NotificationCount();
//       setState(() {
//       });
//   }
//
//   @override
//   void dispose() {
//     _animationController.dispose();
//     BackButtonInterceptor.remove(myInterceptor);
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         forceMaterialTransparency: true,
//         backgroundColor: AppColor.appBarBgColor,
//         leading: IconButton(
//           onPressed: widget.openDrawer,
//           icon: Icon(
//             Icons.menu,
//             color: AppColor.appBarIconColor,
//             size: 30,
//           ),
//         ),
//         title: Image.asset(
//           "assets/bg5.png",
//           width: 120,
//           height: 20,
//           color: Colors.black,
//         ),
//         actions: [
//           IconButton(
//             icon: Stack(
//               children: <Widget>[
//                 Icon(
//                   Icons.notifications_active,
//                   color: AppColor.appBarIconColor,
//                 ),
//                 if (notificationCount > 0)
//                   Positioned(
//                     right: 0,
//                     child: Container(
//                       padding: EdgeInsets.all(1),
//                       decoration: BoxDecoration(
//                         color: Colors.red,
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       constraints: BoxConstraints(
//                         minWidth: 12,
//                         minHeight: 12,
//                       ),
//                       child: Text(
//                         '$notificationCount',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 8,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//             onPressed: () {
//               GoRouter.of(context).pushNamed(RouteConstant.notification);
//             },
//           ),
//           Stack(
//             children: [
//               IconButton(
//                 onPressed: () {
//                   GoRouter.of(context).pushNamed(RouteConstant.cart);
//                 },
//                 icon: FaIcon(
//                   FontAwesomeIcons.bagShopping,
//                   color: AppColor.appBarIconColor,
//                   size: 18,
//                 ),
//               ),
//               if (cartCount > 0)
//                 Positioned(
//                   right: 11,
//                   top: 11,
//                   child: Container(
//                     padding: const EdgeInsets.all(2),
//                     decoration: BoxDecoration(
//                       color: Colors.red,
//                       borderRadius: BorderRadius.circular(6),
//                     ),
//                     constraints: const BoxConstraints(
//                       minWidth: 14,
//                       minHeight: 14,
//                     ),
//                     child: Text(
//                       '$cartCount',
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 8,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//             ],
//           )
//         ],
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20),
//               child: CarouselSlider(
//                 items: carouselItems,
//                 carouselController: _carouselController,
//                 options: CarouselOptions(
//                   viewportFraction: 1,
//                   height: MediaQuery.of(context).size.height * 0.20,
//                   enlargeCenterPage: true,
//                   autoPlay: true,
//                   autoPlayCurve: Curves.fastLinearToSlowEaseIn,
//                   enableInfiniteScroll: true,
//                   autoPlayAnimationDuration: const Duration(milliseconds: 800),
//                   onPageChanged: (index, reason) {
//                     setState(() {
//                       _currentIndex = index;
//                     });
//                   },
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   carouselItems.length,
//                       (index) => buildDot(index),
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 40),
//               child: HorizontalListView(),
//             ),
//             // const Padding(
//             //   padding: EdgeInsets.only(top: 10, left: 24),
//             //   child: Text(
//             //     "Locations",
//             //     style: TextStyle(
//             //       fontFamily: "Playfair",
//             //       fontSize: 20,
//             //       fontWeight: FontWeight.w700,
//             //       color: Colors.black,
//             //     ),
//             //   ),
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.only(top: 20),
//             //   child: SizedBox(
//             //     height: MediaQuery.of(context).size.height * 0.20,
//             //     child: ListView.builder(
//             //       scrollDirection: Axis.horizontal,
//             //       itemCount: dataList.length,
//             //       itemBuilder: (BuildContext context, int index) {
//             //         Map<String, dynamic> item = dataList[index];
//             //         Widget imageWidget;
//             //         if (item['imageBytes'] != null) {
//             //           imageWidget = Image.memory(item['imageBytes'], fit: BoxFit.cover);
//             //         } else {
//             //           imageWidget = Image.asset('assets/Location/Location 1.jpeg', fit: BoxFit.cover);
//             //         }
//             //         return Padding(
//             //           padding: const EdgeInsets.symmetric(horizontal: 12),
//             //           child: InkWell(
//             //               onTap: () async {
//             //                 final responseData = await bookStore(dataList[index]['store_id'].toString());
//             //                 if (responseData.containsKey('status') && responseData['status'] == 'success') {
//             //                 widget.setAppBarVisibility();
//             //                   widget.navigateToPage(
//             //                   LocationContent(onBack: widget.onBack, navigateToPage: widget.navigateToPage, responseData: responseData),
//             //                   const SizedBox.shrink(),
//             //                   showBottomNavigation: false
//             //                 );
//             //                 } else {
//             //                   print("Failed to book store or error occurred.");
//             //                 }
//             //               },
//             //
//             //             child: SizedBox(
//             //               width:
//             //                   MediaQuery.of(context).size.width * 0.50,
//             //               child: Column(
//             //                 children: [
//             //                   Stack(
//             //                     children: [
//             //                       // ClipRRect(
//             //                       //   borderRadius: const BorderRadius.only(
//             //                       //     topLeft: Radius.circular(8.0),
//             //                       //     topRight: Radius.circular(8.0),
//             //                       //   ),
//             //                       //   child: Container(
//             //                       //     width: double.infinity,
//             //                       //     height: MediaQuery.of(context).size.height * 0.15,
//             //                       //     decoration: BoxDecoration(
//             //                       //       image: DecorationImage(
//             //                       //         // image: AssetImage(
//             //                       //         //     dataList[index]['image']),
//             //                       //         // fit: BoxFit.cover,.
//             //                       //         image: Image.memory(imageBytes, fit: BoxFit.cover),
//             //                       //       ),
//             //                       //     ),
//             //                       //   ),
//             //                       // ),
//             //                       ClipRRect(
//             //                         borderRadius: const BorderRadius.only(
//             //                           topLeft: Radius.circular(8.0),
//             //                           topRight: Radius.circular(8.0),
//             //                         ),
//             //                         child: Container(
//             //                           width: MediaQuery.of(context).size.width * 0.50,
//             //                           height: MediaQuery.of(context).size.height * 0.15,
//             //                           child: imageWidget,
//             //                         ),
//             //                       ),
//             //
//             //                       Positioned(
//             //                         top: 15,
//             //                         right: 14,
//             //                         child: Container(
//             //                           height: MediaQuery.of(context).size.height * 0.029,
//             //                           width: MediaQuery.of(context).size.width * 0.12,
//             //                           decoration: BoxDecoration(
//             //                               color: Colors.white.withOpacity(0.3),
//             //                               borderRadius: BorderRadius.circular(40)),
//             //                           child: Row(
//             //                             mainAxisAlignment: MainAxisAlignment.center,
//             //                             children: [
//             //                               Padding(
//             //                                 padding: const EdgeInsets.only(right: 2.5),
//             //                                 child: Icon(
//             //                                   dataList[index]['icon'],
//             //                                   color: const Color(0xffFFB800),
//             //                                   size: 15,
//             //                                 ),
//             //                               ),
//             //                                Padding(
//             //                                 padding: EdgeInsets.only(left: 2.5 ),
//             //                                 child: Text(
//             //                                   dataList[index]['avg_rating'],
//             //                                   style: TextStyle(
//             //                                       color: Colors.white,
//             //                                       fontWeight:
//             //                                           FontWeight.w600,
//             //                                       fontSize: 12,
//             //                                       fontFamily:
//             //                                           "Inter"),
//             //                                 ),
//             //                               ),
//             //                             ],
//             //                           ),
//             //                         ),
//             //                       ),
//             //                     ],
//             //                   ),
//             //                   Container(
//             //                     width: double.infinity,
//             //                     height:
//             //                         MediaQuery.of(context).size.height *
//             //                             0.05,
//             //                     decoration: BoxDecoration(
//             //                       color: Colors.black,
//             //                       border: Border.all(
//             //                           color: Colors.transparent),
//             //                       borderRadius: const BorderRadius.only(
//             //                         bottomLeft: Radius.circular(8),
//             //                         bottomRight: Radius.circular(8),
//             //                       ),
//             //                     ),
//             //                     child: Center(
//             //                       child: RichText(
//             //                         textAlign: TextAlign.center,
//             //                         text: TextSpan(
//             //                           text: '',
//             //                           children: [
//             //                             TextSpan(
//             //                               text: dataList[index]['text'],
//             //                               style: const TextStyle(
//             //                                 color: Colors.white,
//             //                                 fontWeight: FontWeight.w500,
//             //                                 fontSize: 16,
//             //                                 fontFamily: "Playfair",
//             //                               ),
//             //                             ),
//             //                           ],
//             //                         ),
//             //                       ),
//             //                     ),
//             //                   ),
//             //                 ],
//             //               ),
//             //             ),
//             //           ),
//             //         );
//             //       },
//             //     ),
//             //   ),
//             // ),
//
//             const Padding(
//               padding: EdgeInsets.only(top: 20, left: 24),
//               child: Text(
//                 "FAQ's",
//                 style: TextStyle(
//                   fontFamily: "Playfair",
//                   fontSize: 20,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black,
//                 ),
//               ),
//             ),
//             const Padding(
//               padding: EdgeInsets.only(top: 15, bottom: 30),
//               child: FAQContents(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }