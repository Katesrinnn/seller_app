import 'package:get/get.dart';
import 'package:seller_finalproject/const/const.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // กำหนดจำนวน tabs และ vsync
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: const Text(
          'Reviews',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Shop'),
              Tab(text: 'Product'),
            ],
          ),
        ),
      ),
      body: Expanded(
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _buildReviewShop(context),
            _buildReviewProduct(context)
          ],
        ),
      ),
    );
  }
}

Widget _buildReviewProduct(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        YourWidget(),
        Padding(
          padding: const EdgeInsets.all(5),
          child: _buildReviewHigh(),
        ),
      ],
    ),
  );
}

Widget _botton(BuildContext context) {
  return Container(
      alignment: Alignment.centerRight, // จัดตำแหน่งชิดขวากลาง
      margin:
          const EdgeInsets.only(right: 20.0), // กำหนดระยะห่างจากขวา 20.0 พิกเซล
      child: Container(
        height: 28,
        width: 70,
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: greyColor,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ));
}

Widget _buildReviewShop(BuildContext context) {
  return Column(
    children: <Widget>[
      YourWidget(),
      Padding(
        padding: const EdgeInsets.all(5),
        child: _buildReviewHighlights(),
      ),
    ],
  );
}

Widget _buildReviewHighlights() {
  return Container(
    height: 690,
    child: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return _buildReviewCard();
      },
    ),
  );
}

Widget _buildReviewHigh() {
  return Container(
    height: 680,
    child: ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return _buildReviewProductCard();
      },
    ),
  );
}

Widget _buildReviewCard() {
  return Container(
    width: 200,
    margin: const EdgeInsets.all(5.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: greyColor,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage('your_image_url_here'),
            ),
            SizedBox(width: 10),
            Text('Reviewer Name',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: List.generate(5, (index) {
            return Icon(
              index < 4 ? Icons.star : Icons.star_border,
              color: Colors.amber,
              size: 20,
            );
          }),
        ),
        const Text(
          'The review text goes here...',
          style: TextStyle(fontSize: 14),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

Widget _buildReviewProductCard() {
  return Container(
    height: 142,
    width: 387,
    margin: const EdgeInsets.all(5.0),
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(8),
      boxShadow: const [
        BoxShadow(
          color: greyColor,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Row(
      children: [
        Container(
          height: 122,
          width: 122,
          decoration: BoxDecoration(
            color: greyColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.photo, color: greyColor),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              children: [
                const Text('Reviewer Name',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 20,
                    );
                  }),
                ),
                const SizedBox(height: 10),
                const Text(
                  'The review text goes here...',
                  style: TextStyle(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

class YourWidget extends StatefulWidget {
  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  String buttonText = 'New';

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: greyColor,
          backgroundColor: whiteColor,
          shadowColor: greyColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fixedSize: const Size(110, 28),
        ),
        onPressed: () {
          setState(() {
            buttonText = buttonText == 'New' ? 'Oldest' : 'New';
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              buttonText == 'New' ? Icons.arrow_upward : Icons.arrow_downward,
              size: 16,
              color: greyColor,
            ),
            const SizedBox(width: 4),
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
