import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'members.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: heightR(40, context),
          ),
          Image(
            image: AssetImage("assets/logo/logo11.png"),
            width: widthR(150, context),
            height: heightR(150, context),
          ),
          ContactInformation(
              click: () => _launchURL("uswahhasanah1724@outlook.com"),
              icon: Bootstrap.microsoft,
              Title: "Outlook Email",
              SubTitle: 'uswahhasanah1724@outlook.com'),
          ContactInformation(
              click: () => showModalActionSheet(
                  context: context,
                  title: "أسوه حسنه",
                  message:
                      "أسوه حسنه هو تطبيق إسلامي يجمع بين العديد من الخدمات الدينية الأساسية مثل القرآن الكريم بتلاوات متنوعة، الأذكار، ومواقيت الصلاة. يتميز التطبيق بتصميم مريح وجذاب يسهل على المستخدمين الوصول إلى المحتوى بسلاسة.\n\n الميزة البارزة في أسوه حسنه هي الشات بوت المتقدم، الذي يعتمد على تقنيات الذكاء الاصطناعي ومعالجة اللغة الطبيعية لتقديم إجابات دقيقة ومفيدة عن الأسئلة الدينية. يتميز الشات بوت بقدرته على استخدام معلومات دينية موثوقة من الأزهر الشريف، مما يجعله مرشداً موثوقاً ومفيداً للمستخدمين في رحلتهم الدينية والتعليمية.\n\n بفضل هذه الميزات، يعتبر أسوه حسنه خياراً مثالياً لأولئك الذين يبحثون عن تطبيق إسلامي شامل يلبي احتياجاتهم الدينية بكفاءة وسهولة.\n"),
              icon: Iconsax.information_outline,
              Title: "what is Uswah Hasanah",
              SubTitle: ''),
          ContactInformation(
              click: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Members(),
                    ),
                  ),
              icon: Icons.person,
              Title: "Team",
              SubTitle: "The Members of the Developers")
        ],
      ),
    );
  }

  Widget ContactInformation({
    VoidCallback? click,
    required IconData icon,
    required String Title,
    required String SubTitle,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(icon),
        title: Text(Title),
        subtitle: Text(SubTitle),
        tileColor: Colors.white,
        onTap: click,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  Future<void> _launchURL(String email) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $email');
    }
  }
}
