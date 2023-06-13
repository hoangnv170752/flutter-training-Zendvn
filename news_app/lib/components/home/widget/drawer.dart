import 'package:flutter/material.dart';

class NewsDrawer extends StatelessWidget {
  const NewsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.65,
      height: size.height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff005BEA),
            Color(0xff3DA2F2),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ListView(
        children: [
          Container(
            height: size.height * 0.15,
            margin: EdgeInsets.symmetric(vertical: 20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Text(
            'APP TIN TUC',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 32,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.05),
          ListTile(
            title: Text(
              'Trang Chu',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Danh Muc',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Yeu Thich',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(
              'Da Xem',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
