import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  final void Function() onPressDetail;

  const UserProfile({
    super.key,
    required this.onPressDetail,
  });

  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const AutoSizeText(
        'roses_are_rosie',
        style: TextStyle(fontSize: 18, color: Color(0xFFCA7979)),
      ),
      accountEmail: const AutoSizeText(
        'roses_are_rosie@gmail.com',
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      currentAccountPicture: const CircleAvatar(
        backgroundImage: AssetImage('assets/icons/로제.png'),
      ),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      onDetailsPressed: onPressDetail,
      otherAccountsPictures: [
        GestureDetector(
          child: Image.network(
            'https://image-comic.pstatic.net/webtoon/776255/thumbnail/thumbnail_IMAG21_4121980471072928565.jpg',
            headers: const {
              "User-Agent":
                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
            },
          ),
        ),
        GestureDetector(
          child: Image.network(
            'https://image-comic.pstatic.net/webtoon/131385/thumbnail/thumbnail_IMAG21_1d44dd99-4fef-48b5-81f0-083e83b6c048.jpg',
            headers: const {
              "User-Agent":
                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
            },
          ),
        ),
        GestureDetector(
          child: Image.network(
            'https://image-comic.pstatic.net/webtoon/746857/thumbnail/thumbnail_IMAG21_fb7d7fcd-19f1-49eb-9cc8-aae9622cdd04.jpg',
            headers: const {
              "User-Agent":
                  "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",
            },
          ),
        ),
      ],
    );
  }
}
