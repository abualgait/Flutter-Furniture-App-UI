import 'package:flutter/material.dart';
import 'package:flutter_furniture_app/page_indicator.dart';
import 'Custom_Icons.dart';
import 'data.dart';

class ProductDetails extends StatefulWidget {
  @override
  _ProductDetailsState createState() => new _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _currentIndex = 0;
  PageController _controller;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: currentPage,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTopContainerChild(double height, width) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        PageView.builder(
          itemCount: pageList.length,
          controller: _controller,
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                var page = pageList[index];

                return Stack(children: <Widget>[
                  Positioned(
                    right: 10.0,
                    child: Image.asset(
                      images[index],
                      width: width / 2,
                      height: height,
                    ),
                  ),
                  Positioned(
                    left: 40.0,
                    top: height * .2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(page.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 20.0, fontFamily: "Montserrat-Bold")),
                        Text(page.body,
                            style: TextStyle(
                                fontWeight: FontWeight.w200,
                                fontSize: 12.0,
                                fontFamily: "Montserrat-Medium")),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(page.price,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    fontFamily: "Montserrat-Medium")),
                            Text(" \$",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.0,
                                    fontFamily: "Montserrat-Medium")),
                          ],
                        ),
                      ],
                    ),
                  )
                ]);
              },
            );
          },
        ),
        Positioned(
          left: 40.0,
          top: height * .5,
          child: Container(
              width: 160.0, child: PageIndicator(currentPage, pageList.length)),
        )
      ],
    );
  }

  Widget _buildBottomContainerChild() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Text("Wooden Armchair",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 28.0, fontFamily: "Montserrat-Bold")),
          Padding(
            padding: const EdgeInsets.only(bottom: 36.0),
            child: Text(
                "Lorem IpsemLorem IpsemLorem IpsemLoremIpsemLoremIpsemLoremIpsemLoremIpsemLoremIpsemLoremIpsemLorem IpsemLorem IpsemLorem IpsemLorem IpsemLorem IpsemLorem Ipsem",
                style:
                    TextStyle(fontSize: 12.0, fontFamily: "Montserrat-Medium")),
          )
        ],
      ),
    );
  }

  Widget _buildGradientContainer(double width, double height) {
    return Column(
      children: <Widget>[
        Container(
          child: _buildTopContainerChild(height, width),
          height: height * .8,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(50.0)),
              gradient: LinearGradient(
                  colors: [Colors.grey[400], Colors.white],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 1.0])),
        ),
        Container(
          child: _buildBottomContainerChild(),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 40.0,
      left: 20.0,
      right: 20.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBar(double height) {
    return Positioned(
      bottom: 0.0,
      right: 0.0,
      child: Row(
        children: <Widget>[
          Container(
              child: RawMaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.favorite_border,
                  size: 24.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(15.0)))),
          Container(
              child: RawMaterialButton(
                onPressed: () {},
                child: Icon(
                  Icons.inbox,
                  size: 24.0,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF2a2d3f),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xFFf2f3f8),
      body: LayoutBuilder(
        builder: (context, constraints) {
          var width = constraints.maxWidth;
          var height = constraints.maxHeight;

          return Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.grey[300], Colors.white],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        stops: [0.5, 1.0])),
                child: SingleChildScrollView(
                    child: _buildGradientContainer(width, height)),
              ),
              _buildAppBar(),
              _buildBottomBar(height),
            ],
          );
        },
      ),
    );
  }
}
/* Image.asset(page.imageUrl),
                        Container(
                          margin: EdgeInsets.only(left: 12.0),
                          height: 100.0,
                          child: Stack(
                            children: <Widget>[
                              Opacity(
                                opacity: .10,
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                      colors: pageList[index].titleGradient),
                                  style: TextStyle(
                                      fontSize: 100.0,
                                      fontFamily: "Montserrat-Black",
                                      letterSpacing: 1.0),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.0, left: 22.0),
                                child: GradientText(
                                  page.title,
                                  gradient: LinearGradient(
                                      colors: pageList[index].titleGradient),
                                  style: TextStyle(
                                    fontSize: 70.0,
                                    fontFamily: "Montserrat-Black",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 34.0, top: 12.0),
                          child: Text(
                            page.body,
                            style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: "Montserrat-Medium",
                                color: Color(0xFF9B9B9B)),
                          ),
                        )*/
