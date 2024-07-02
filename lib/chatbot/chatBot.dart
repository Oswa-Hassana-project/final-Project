import 'package:finalproject/widgets/constsnts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ikchatbot/ikchatbot.dart';
///////////////////////old tutorial
class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> keywords = [
      'أنا بحلم بكوابيس و أحلام وحشه',
      'كوابيس',
    ];

    final List<String> responses = [
      'صَحَّ عَنْهُ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ: ( «الرُّؤْيَا الصَّالِحَةُ مِنَ اللَّهِ، وَالْحُلْمُ مِنَ الشَّيْطَانِ، فَمَنْ رَأَى رُؤْيَا يَكْرَهُ مِنْهَا شَيْئًا، فَلْيَنْفُثْ عَنْ يَسَارِهِ ثَلَاثًا، وَلْيَتَعَوَّذْ بِاللَّهِ مِنَ الشَّيْطَانِ فَإِنَّهَا لَا تَضُرُّهُ وَلَا يُخْبِرْ بِهَا أَحَدًا. وَإِنْ رَأَى رُؤْيَا حَسَنَةً، فَلْيَسْتَبْشِرْ، وَلَا يُخْبِرْ بِهَا إِلَّا مَنْ يُحِبُّ» ) . ( «وَأَمَرَ مَنْ رَأَى مَا يَكْرَهُهُ أَنْ يَتَحَوَّلَ عَنْ جَنْبِهِ الَّذِي كَانَ عَلَيْهِ، وَأَمَرَهُ أَنْ يُصَلِّيَ» ) فَأَمَرَهُ بِخَمْسَةِ أَشْيَاءَ: أَنْ يَنْفُثَ عَنْ يَسَارِهِ، وَأَنْ يَسْتَعِيذَ بِاللَّهِ مِنَ الشَّيْطَانِ، وَأَنْ لَا يُخْبِرَ بِهَا أَحَدًا، وَأَنْ يَتَحَوَّلَ عَنْ جَنْبِهِ الَّذِي كَانَ عَلَيْهِ، وَأَنْ يَقُومَ يُصَلِّي، وَمَتَى فَعَلَ ذَلِكَ لَمْ تَضُرَّهُ الرُّؤْيَا الْمَكْرُوهَةُ، بَلْ هَذَا يَدْفَعُ شَرَّهَا. وَقَالَ: ( «الرُّؤْيَا عَلَى رِجْلِ طَائِرٍ مَا لَمْ تُعَبَّرْ، فَإِذَا عُبِّرَتْ وَقَعَتْ وَلَا يَقُصُّهَا إِلَّا عَلَى وَادٍّ أَوْ ذِي رَأْيٍ» ) .',
      'ممكن قصدك انك بتحلم بكوابيس \nصَحَّ عَنْهُ صَلَّى اللَّهُ عَلَيْهِ وَسَلَّمَ: ( «الرُّؤْيَا الصَّالِحَةُ مِنَ اللَّهِ، وَالْحُلْمُ مِنَ الشَّيْطَانِ، فَمَنْ رَأَى رُؤْيَا يَكْرَهُ مِنْهَا شَيْئًا، فَلْيَنْفُثْ عَنْ يَسَارِهِ ثَلَاثًا، وَلْيَتَعَوَّذْ بِاللَّهِ مِنَ الشَّيْطَانِ فَإِنَّهَا لَا تَضُرُّهُ وَلَا يُخْبِرْ بِهَا أَحَدًا. وَإِنْ رَأَى رُؤْيَا حَسَنَةً، فَلْيَسْتَبْشِرْ، وَلَا يُخْبِرْ بِهَا إِلَّا مَنْ يُحِبُّ» ) . ( «وَأَمَرَ مَنْ رَأَى مَا يَكْرَهُهُ أَنْ يَتَحَوَّلَ عَنْ جَنْبِهِ الَّذِي كَانَ عَلَيْهِ، وَأَمَرَهُ أَنْ يُصَلِّيَ» ) فَأَمَرَهُ بِخَمْسَةِ أَشْيَاءَ: أَنْ يَنْفُثَ عَنْ يَسَارِهِ، وَأَنْ يَسْتَعِيذَ بِاللَّهِ مِنَ الشَّيْطَانِ، وَأَنْ لَا يُخْبِرَ بِهَا أَحَدًا، وَأَنْ يَتَحَوَّلَ عَنْ جَنْبِهِ الَّذِي كَانَ عَلَيْهِ، وَأَنْ يَقُومَ يُصَلِّي، وَمَتَى فَعَلَ ذَلِكَ لَمْ تَضُرَّهُ الرُّؤْيَا الْمَكْرُوهَةُ، بَلْ هَذَا يَدْفَعُ شَرَّهَا. وَقَالَ: ( «الرُّؤْيَا عَلَى رِجْلِ طَائِرٍ مَا لَمْ تُعَبَّرْ، فَإِذَا عُبِّرَتْ وَقَعَتْ وَلَا يَقُصُّهَا إِلَّا عَلَى وَادٍّ أَوْ ذِي رَأْيٍ» )  .',
    ];
    final chatBotConfig = IkChatBotConfig(
      //SMTP Rating to your mail Settings
      ratingIconYes: const Icon(Icons.star),
      ratingIconNo: const Icon(Icons.star_border),
      ratingIconColor: Colors.black,
      ratingBackgroundColor: Colors.white,
      ratingButtonText: 'Submit Rating',
      thankyouText: 'Thanks for your rating!',
      ratingText: 'Rate your experience:',
      ratingTitle: 'Thank you for using the chatbot!',
      body: 'This is a test email sent from Flutter and Dart.',
      subject: 'Test Rating',
      recipient: 'recipient@example.com',
      isSecure: true,
      senderName: 'Your Name',
      smtpUsername: 'Your Email',
      smtpPassword: 'your password',
      smtpServer: 'stmp.gmail.com',
      smtpPort: 587,
      //Settings to your system Configurations
      sendIcon: const Icon(Icons.send, color: Colors.black),
      userIcon: const Icon(Icons.person, color: Colors.white),
      botIcon: const Icon(Icons.android, color: Colors.white),
      botChatColor: Colors.black45,
      delayBot: 100,
      closingTime: 1000,
      delayResponse: 1,
      userChatColor: Colors.blue,
      waitingTime: 1,
      keywords: keywords,
      responses: responses,
      backgroundColor: Colors.white,
      backgroundImage:
      'https://i.pinimg.com/564x/f8/1e/aa/f81eaafae688f5e319b99fdbcafdf22d.jpg',
      backgroundAssetimage:"assets/image/white.jpg" ,
      initialGreeting:
      "كيف يمكنني ان اساعدك؟",
      defaultResponse: "مش فاهم قصدك ايه؟",
      inactivityMessage: "أي سؤال تاني؟",
      closingMessage: "المحادثه هتقفل",
      inputHint: 'Send a message',
      waitingText: 'لحظه واحده',
      useAsset: false,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Stack(
        children: [
          ikchatbot(config: chatBotConfig),
        Container(
            height: heightR(100, context),
            width: widthR(393, context),
          decoration: BoxDecoration(color: Color(0xFF16A896),borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          child: Padding(
            padding:  EdgeInsets.only(top: heightR(49.2, context),left: widthR(20, context),right:widthR(20, context) ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(CupertinoIcons.back)),
              Text("ChatBot",style: TextStyle(color: Colors.white,fontSize: sizeR(24, context),fontWeight: FontWeight.w700),),
                  SizedBox(width: 15,),
            ]),
          ),
        ) //Color(0xFF16A896)),
      ],),
    );
  }
}
