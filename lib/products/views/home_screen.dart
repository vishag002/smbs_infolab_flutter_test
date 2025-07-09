import 'package:flutter/material.dart';
import 'package:smbs_infolab_flutter_test/auth/views/login_screen.dart';
import 'package:smbs_infolab_flutter_test/products/models/product_model.dart';
import 'package:smbs_infolab_flutter_test/products/service/product_api_service.dart';
import 'package:smbs_infolab_flutter_test/products/views/product_detail_screen.dart';
import 'package:smbs_infolab_flutter_test/products/widgets/product_card.dart';
import 'package:smbs_infolab_flutter_test/utilis/token_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ProductModel>> _itemsList;
  final TextEditingController searchController = TextEditingController();
  final ProductApiService apiService = ProductApiService();

  @override
  void initState() {
    super.initState();
    _itemsList = ProductApiService().getItems();
  }

  //
  void searchFun(String query) {
    setState(() {
      if (query.isEmpty) {
        _itemsList = apiService.getItems();
      } else {
        _itemsList = apiService.searchItems(query);
      }
    });
  }

  //logout function
  Future<void> logoutFun() async {
    await TokenHelper.clearToken();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Shopping App"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              logoutFun();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SizedBox(
                height: 65,
                width: double.infinity,
                //color: Colors.grey,
                child: SearchBar(
                  controller: searchController,
                  onSubmitted: searchFun,
                  hintText: "Search products...",
                  onTap: () {
                    searchController.clear();
                    searchFun('');
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            // Container(
            //   height: MediaQuery.of(context).size.height * 0.2,
            //   width: MediaQuery.of(context).size.width,
            //   margin: const EdgeInsets.all(10),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(30),
            //     image: DecorationImage(
            //       image: NetworkImage(
            //         "https://static.vecteezy.com/system/resources/thumbnails/003/240/364/small/shopping-online-on-phone-paper-art-modern-pink-background-gifts-box-free-vector.jpg",
            //       ),
            //       fit: BoxFit.fill,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16.0), // Add left space
              child: Text(
                "Featured Products",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<ProductModel>>(
              future: _itemsList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No products found'));
                } else {
                  final items = snapshot.data;
                  return GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .6,
                        ),
                    itemCount: items!.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailScreen(id: items[index].id),
                            ),
                          );
                        },
                        child: productCard(
                          context: context,
                          imageUrl: items[index].imageUrl,
                          productName: items[index].title,
                          productPrice: "\$${items[index].price}", // fix here
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
