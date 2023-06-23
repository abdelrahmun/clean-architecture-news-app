import 'package:news_task_app/core/utils/all_images.dart';
import 'package:news_task_app/features/homeScreen/data/models/tweets_model.dart';

class DummyTweets {
  static const String firstTweetArBody = 'عندما يريد العالم أن ‪يتكلّم ‬ ، فهو يتحدّث بلغة يونيكود. تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا.';
  static const String firstTweetEnBody = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";
  static const String secondTweetArBody = 'تسجّل الآن لحضور المؤتمر الدولي العاشر ليونيكود (Unicode Conference)، الذي سيعقد في 10-12 آذار 1997 بمدينة مَايِنْتْس، ألمانيا. و سيجمع المؤتمر بين خبراء من كافة قطاعات الصناعة على الشبكة العالمية انترنيت ويونيكود، حيث ستتم، على الصعيدين الدولي والمحلي على حد سواء مناقشة سبل استخدام يونكود في النظم القائمة وفيما يخص التطبيقات الحاسوبية، الخطوط، تصميم النصوص والحوسبة متعددة اللغات';
  static const String secondTweetEnBody = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  static List<TweetsModel> tweets = [
    const TweetsModel(
        id: 1,
        accountLogo: AllImages.logo,
        userName: 'account',
        accountName: 'الدورى السعودى',
        arTweetBody: firstTweetArBody,
        enTweetBody: firstTweetEnBody),
    const TweetsModel(
        id: 2,
        accountLogo: AllImages.logo,
        userName: 'spl',
        accountName: 'الدورى الرياضى',
        arTweetBody: secondTweetArBody,
        enTweetBody: secondTweetEnBody),
  ];
}
