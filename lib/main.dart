import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Pick a Book',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 51, 162, 177),
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  int currentIndex = 0;
  String activeCategory = 'التاريخ';
  Color backgroundColor = Colors.white;

  List<String> favorites = [];
  List<String> notes = [];

  final Map<String, List<Map<String, String>>> categories = {
    "التاريخ": [
{
    "word": "فتح مكة",
    "description":
        "فتح مكة كان حدثًا تاريخيًا هامًا وقع في العام الثامن للهجرة (630م)، حيث قاد النبي محمد ﷺ جيشًا قوامه 10,000 مقاتل إلى مكة المكرمة. جاء هذا الحدث بعد أن نقضت قريش اتفاقية الحديبية، فدخل المسلمون مكة سلمًا بعد أن استسلمت قريش دون مقاومة. قام النبي ﷺ بإزالة الأصنام من حول الكعبة، وأعلن العفو العام عن أهل مكة، قائلاً: 'اذهبوا فأنتم الطلقاء'. كان هذا الفتح نقطة تحول في التاريخ الإسلامي، حيث أصبح الإسلام الدين المهيمن في شبه الجزيرة العربية.",
    "source": "المصدر: كتاب 'الرحيق المختوم' - صفي الرحمن المباركفوري"
  },
  {
    "word": "معركة بدر",
    "description":
        "وقعت معركة بدر في العام الثاني للهجرة (624م) بين المسلمين وقريش قرب بئر بدر. كانت المعركة الأولى الكبرى في الإسلام، وشارك فيها نحو 313 مسلمًا ضد جيش قريش المكون من حوالي 1,000 مقاتل. انتهت المعركة بانتصار المسلمين وقتل عدد من كبار قادة قريش مثل أبو جهل. كان هذا الانتصار معجزة للإسلام ومصدر قوة سياسية ودينية للمسلمين.",
    "source": "المصدر: كتاب 'البداية والنهاية' - ابن كثير"
  },
  {
    "word": "بناء قبة الصخرة",
    "description":
        "بُنيت قبة الصخرة في القدس عام 691م بأمر من الخليفة الأموي عبد الملك بن مروان. استغرقت عملية البناء حوالي سبع سنوات، وتعد قبة الصخرة أقدم مبنى إسلامي متكامل ما زال قائمًا حتى اليوم. يتميز المبنى بتصميم معماري رائع وزخارف فسيفسائية مذهلة. بنيت القبة لتكون موقعًا دينيًا مركزيًا ولإظهار هيبة الإسلام في تلك الفترة.",
    "source": "المصدر: كتاب 'تاريخ العمارة الإسلامية' - كريس كوبر"
  },
  {
    "word": "سقوط بغداد",
    "description":
        "في عام 1258م، سقطت بغداد، عاصمة الخلافة العباسية، في أيدي المغول بقيادة هولاكو خان. حاصر المغول المدينة لمدة أسابيع ثم اقتحموها، مما أدى إلى مذبحة كبرى راح ضحيتها مئات الآلاف من السكان. دمرت مكتبة بيت الحكمة، التي كانت تحتوي على آلاف المخطوطات العلمية والثقافية. يعتبر سقوط بغداد أحد الأحداث الأكثر تدميرًا في التاريخ الإسلامي وأثره استمر لقرون.",
    "source": "المصدر: كتاب 'تاريخ المغول في العالم الإسلامي' - ديفيد مورغان"
  },
  {
    "word": "الحضارة الأندلسية",
    "description":
        "كانت الأندلس مركزًا للحضارة الإسلامية في أوروبا من 711م إلى 1492م، واشتهرت بإنجازاتها العلمية والثقافية. برز علماء مثل ابن رشد في الفلسفة، وابن الزهر في الطب، والزرقالي في الفلك. امتزجت الحضارة الإسلامية بالأوروبية، ما أوجد عصرًا ذهبيًا استثنائيًا في العلوم والفنون. انتهت الحضارة الأندلسية بسقوط غرناطة في يد الملكين الكاثوليكيين فرناندو وإيزابيلا.",
    "source": "المصدر: كتاب 'الحضارة الإسلامية في الأندلس' - ليوبولد فايس"
  },
  {
    "word": "حرب المئة عام",
    "description":
        "كانت حرب المئة عام نزاعًا طويل الأمد بين إنجلترا وفرنسا من 1337م إلى 1453م. اشتعلت الحرب بسبب نزاعات على العرش الفرنسي وحقوق الأراضي. تضمنت المعارك الشهيرة معركة كريسي عام 1346 ومعركة أجينكورت عام 1415، حيث استخدم الإنجليز رماة السهام الطويلة لتحقيق النصر. انتهت الحرب باستعادة فرنسا جميع أراضيها تقريبًا، ما عدا كاليه.",
    "source": "المصدر: كتاب 'حروب العصور الوسطى الأوروبية' - كريستوفر ألاردايس"
  },
  {
    "word": "اكتشاف الأمريكتين",
    "description":
        "في عام 1492م، قاد كريستوفر كولومبوس رحلة بحرية ممولة من الملكة إيزابيلا ملكة إسبانيا، بحثًا عن طريق جديد للوصول إلى الهند. بدلاً من ذلك، اكتشف الأمريكتين، مما فتح الباب أمام الاستعمار الأوروبي للعالم الجديد. كان هذا الحدث نقطة تحول في التاريخ العالمي، حيث أدى إلى التبادل الثقافي والاقتصادي بين أوروبا والأمريكيتين.",
    "source": "المصدر: كتاب 'التاريخ الحديث' - جون لويس جاديس"
  },
  {
    "word": "الثورة الصناعية",
    "description":
        "بدأت الثورة الصناعية في بريطانيا في القرن الثامن عشر، وكانت نقطة تحول في تاريخ البشرية. تميزت بظهور الآلات البخارية والتقدم في الإنتاج الزراعي والصناعي. ساهمت الاختراعات مثل المحرك البخاري لجيمس واط ونول النسيج الآلي في زيادة الإنتاجية بشكل غير مسبوق، مما أدى إلى تحول المجتمعات من زراعية إلى صناعية.",
    "source": "المصدر: كتاب 'الثورة الصناعية' - باتريك فيرغسون"
  },
  {
    "word": "فتح القسطنطينية",
    "description":
        "في عام 1453م، فتح السلطان العثماني محمد الفاتح مدينة القسطنطينية، عاصمة الإمبراطورية البيزنطية. كان هذا الحدث نهاية الإمبراطورية البيزنطية وبداية توسع الإمبراطورية العثمانية. اشتهر الفتح باستخدام مدافع عملاقة لتحطيم الأسوار الهائلة للمدينة، وكان خطوة حاسمة في تاريخ الإسلام.",
    "source": "المصدر: كتاب 'فتح القسطنطينية' - جورج أبي العز"
  }    ],
    "العلوم": [
      {
      "word": "مبدأ عدم اليقين لهايزنبرغ",
      "description":
          "يقول هذا المبدأ إنه لا يمكننا قياس موقع وسرعة الجسيم في نفس الوقت بدقة مطلقة. كلما عرفنا أحدهما بشكل أفضل، زادت الشكوك حول الآخر. هذا يجعل العالم الكمي غامضًا ومليئًا بالمفاجآت.",
      "source": "المصدر: كتاب 'أسس ميكانيكا الكم' - فيرنر هايزنبرغ"
    },
    {
      "word": "نظرية النسبية لأينشتاين",
      "description":
          "تقول النظرية النسبية العامة إن الجاذبية ليست قوة مباشرة بين الأجسام، بل انحناء في الزمكان يسببه وجود الكتلة. أما النسبية الخاصة فتؤكد أن الزمن والمسافة نسبيان ويعتمدان على سرعة المراقب.",
      "source": "المصدر: كتاب 'أساسيات النسبية' - ألبرت أينشتاين"
    },
    {
      "word": "ازدواجية الجسيم والموجة",
      "description":
          "في ميكانيكا الكم، يمكن للجسيمات الصغيرة مثل الإلكترونات أن تسلك سلوك الجسيم والموجة معًا. فهي تنتقل كموجة لكنها تتصرف كجسيم عند قياسها.",
      "source": "المصدر: كتاب 'مبادئ فيزياء الكم' - ماكس بلانك"
    },
    {
      "word": "قطة شرودنغر",
      "description":
          "تجربة فكرية تقول إنه في العالم الكمي، يمكن لجسم ما أن يكون في حالتين مختلفتين في نفس الوقت. مثل القطة في صندوق مغلق يمكن أن تكون حية وميتة معًا حتى نفتح الصندوق ونرصد حالتها.",
      "source": "المصدر: كتاب 'النظرية الكمية والحياة' - إروين شرودنغر"
    },
    {
      "word": "التشابك الكمي",
      "description":
          "عندما يتشابك جسيمان كميان، فإن حالة أحدهما تعتمد على الآخر حتى لو كانا بعيدين عن بعضهما بمسافات كبيرة جدًا. هذا يعني أن التغيير في أحدهما يؤثر فورًا على الآخر.",
      "source": "المصدر: كتاب 'الكون الكمي' - ألبرت أينشتاين ونييلز بور"
    },
    {
      "word": "طاقة النقطة الصفرية",
      "description":
          "حتى في الفراغ التام حيث لا توجد مادة أو طاقة، توجد طاقة صغيرة تُعرف بطاقة النقطة الصفرية، وهي نتيجة لاهتزازات المجال الكمي.",
      "source": "المصدر: كتاب 'المجال الكمي' - بول ديراك"
    },
    {
      "word": "مبدأ باولي للاستبعاد",
      "description":
          "يقول هذا المبدأ إنه لا يمكن لإلكترونين في نفس الذرة أن يمتلكا نفس الأرقام الكمية الأربعة، وهذا يفسر تشكيل الإلكترونات في مستويات الطاقة المختلفة.",
      "source": "المصدر: كتاب 'ميكانيكا الكم' - ولفغانغ باولي"
    },
    {
      "word": "الانبعاث المحفز (الليزر)",
      "description":
          "يصف كيف يمكن للإلكترونات المثارة أن تطلق فوتونات عند العودة إلى مستويات طاقة أقل، مما يؤدي إلى انبعاث ضوء مكثف وموجه، وهو مبدأ عمل الليزر.",
      "source": "المصدر: كتاب 'أصول الضوء والليزر' - ثيودور مايمان"
    }
    ],
    "الفلسفة": [
      {
      "word": "سفينة ثيسيوس",
      "description":
          "إذا قمت بتغيير كل جزء في سفينة قديمة بجزء جديد واحدًا تلو الآخر، هل ستبقى نفس السفينة أم تصبح شيئًا جديدًا؟ هذه الفكرة تدعوك للتفكير في ما يجعل الأشياء هي نفسها بمرور الوقت.",
      "source": "المصدر: كتاب 'ميتافيزيقا الهوية' - جون لوك"
    },
    {
      "word": "كهف أفلاطون",
      "description":
          "تخيل أنك تعيش في كهف وترى فقط ظلال أشياء على الجدران. هل يمكن أن تعرف ما هو حقيقي إذا كنت لا ترى إلا الظلال؟ هذه الفكرة تتحدث عن محدودية فهمنا للعالم.",
      "source": "المصدر: كتاب 'الجمهورية' - أفلاطون"
    },
    {
      "word": "معضلة عربة القطار",
      "description":
          "إذا كان هناك قطار متجه لقتل 5 أشخاص، وكان بإمكانك تغيير مساره ليقتل شخصًا واحدًا بدلاً من ذلك، فماذا ستفعل؟ هذه الفكرة تتحدث عن القرارات الصعبة في الحياة.",
      "source": "المصدر: كتاب 'مبادئ الأخلاق' - فيليب فوت"
    },
    {
      "word": "دماغ في وعاء",
      "description":
          "ماذا لو كنت مجرد دماغ في وعاء متصل بأجهزة تقدم لك كل ما تشعر به على أنه حقيقي؟ هل يمكنك أن تكون متأكدًا من أن العالم حقيقي؟",
      "source": "المصدر: كتاب 'عقل مغلق' - هيلاري بوتنام"
    },
    {
      "word": "الشيء كما هو",
      "description":
          "ما نراه وندركه ليس هو الشيء الحقيقي بالكامل. هناك دائمًا شيء مخفي لا يمكننا فهمه تمامًا.",
      "source": "المصدر: كتاب 'نقد العقل المحض' - إيمانويل كانط"
    },
    {
      "word": "اليد غير المرئية",
      "description":
          "عندما يعمل كل شخص لتحقيق مصلحته الشخصية، يمكن أن يستفيد المجتمع كله دون أن يقصدوا ذلك. مثل السوق الذي ينظم نفسه بنفسه.",
      "source": "المصدر: كتاب 'ثروة الأمم' - آدم سميث"
    },
    {
      "word": "العودة الأبدية",
      "description":
          "تخيل أنك ستعيش حياتك نفسها مرارًا وتكرارًا للأبد. هل ستعيشها بطريقة مختلفة إذا كان هذا حقيقيًا؟",
      "source": "المصدر: كتاب 'هكذا تكلم زرادشت' - فريدريك نيتشه"
    },
    {
      "word": "ماكينة التجربة",
      "description":
          "إذا كان هناك جهاز يتيح لك عيش حياة مثالية ومليئة بالسعادة، هل ستدخل فيه أم تفضل عيش الحياة الحقيقية رغم صعوباتها؟",
      "source": "المصدر: كتاب 'أناركي، دولة ويوتوبيا' - روبرت نوزيك"
    },
    {
      "word": "المفارقة الكذابة",
      "description":
          "هذه الجملة كاذبة. إذا كانت صحيحة، فهي كاذبة، وإذا كانت كاذبة، فهي صحيحة. هذه الفكرة تجعلك تفكر في حدود اللغة والتفكير.",
      "source": "المصدر: كتاب 'المنطق والفلسفة' - ألفريد تارسكي"
    }
    ],
    "الخيال": [
      {
  "word": "1984",
  "description":
      "رواية ديستوبية شهيرة للكاتب جورج أورويل. تدور أحداثها في عالم تخضع فيه البشرية لرقابة صارمة من قبل نظام شمولي قمعي يُدعى 'الأخ الأكبر'. تستعرض الرواية معاناة البطل وينستون سميث الذي يحاول التمرد ضد هذا النظام القاسي، لكنها مليئة بالتشويق والصراعات النفسية.",
  "source": "المصدر: كتاب '1984' - جورج أورويل"
},
{
  "word": "هاري بوتر وحجر الفيلسوف",
  "description":
      "القصة الأولى في سلسلة هاري بوتر الشهيرة، حيث يكتشف هاري بوتر، الصبي اليتيم، أنه ساحر وأن لديه مكانًا في مدرسة السحر 'هوغوورتس'. تبدأ مغامراته الشيقة في مواجهة قوى الشر التي يمثلها الساحر الأسود 'فولدمورت'.",
  "source": "المصدر: كتاب 'هاري بوتر وحجر الفيلسوف' - ج. ك. رولينج"
},
{
  "word": "الجريمة والعقاب",
  "description":
      "تحفة أدبية للكاتب فيودور دوستويفسكي. تدور القصة حول راسكولينكوف، الطالب الفقير الذي يقتل مُرابية عجوزًا بحجة إنقاذ نفسه والآخرين من شرها. الرواية تستعرض صراعاته النفسية وتأنيب الضمير، مما يجعلها مشوقة وعميقة للغاية.",
  "source": "المصدر: كتاب 'الجريمة والعقاب' - فيودور دوستويفسكي"
},
{
  "word": "خوف",
  "description":
      "رواية مثيرة للكاتب أسامة المسلم، تأخذك في رحلة مظلمة إلى عوالم الخيال والرعب. تتمحور حول بطل يكتشف أسرارًا غامضة مرتبطة بعائلته، وتتعاقب الأحداث المشوقة التي تجعلك تعيش أجواء الخوف.",
  "source": "المصدر: كتاب 'خوف' - أسامة المسلم"
},
{
  "word": "The witcher",
  "description":
      "قصة ملحمية عن غيرالت الصياد المحترف للوحوش في عالم مليء بالمخلوقات الخارقة والسحر. غيرالت ليس فقط قاتلاً للوحوش، بل هو شخصية رمادية تواجه قرارات أخلاقية معقدة ومهام خطرة للغاية.",
  "source": "المصدر: سلسلة 'ذا ويتشر' - أندريه سابكوسكي"
},
{
  "word": "ثمانون عامًا بحثًا عن مخرج",
  "description":
      "رواية عربية فلسفية تتناول رحلة رجل يجد نفسه عالقًا في متاهة زمنية غريبة لمدة ثمانين عامًا، وهو يحاول إيجاد مخرج. تستعرض القصة تفاصيل مثيرة عن محاولاته لفهم الزمن، مواجهة المجهول، وإيجاد معنى لحياته.",
  "source": "المصدر: كتاب 'ثمانون عامًا بحثًا عن مخرج' - صلاح حسين"
},
{
  "word": "the diary of a wimpy kid",
  "description":
      "قصة فكاهية تدور حول حياة جريج هيفلي، المراهق الذي يكافح للتكيف مع المدرسة المتوسطة والمشاكل العائلية والصداقة. مليئة بالمواقف الكوميدية اليومية التي تجذب القراء من جميع الأعمار.",
  "source": "المصدر: سلسلة 'يوميات طفل مستاء' - جيف كيني"
},
{
  "word": "the great gatsby",
  "description":
      "تحفة أدبية للكاتب ف. سكوت فيتزجيرالد، تدور أحداثها في عصر الجاز بالولايات المتحدة. تحكي القصة عن غاتسبي، المليونير الغامض الذي يعيش حياة مليئة بالترف، لكنه يسعى لاستعادة حب ضائع. الرواية تسلط الضوء على الحلم الأمريكي وزيفه.",
  "source": "المصدر: كتاب 'غاتسبي العظيم' - ف. سكوت فيتزجيرالد"
},
{
  "word": "أرض زيكولا",
  "description":
      "رواية خيالية تأخذك إلى عالم موازٍ، حيث يتم التعامل بالذكاء بدلاً من النقود. تدور القصة حول خالد الذي يدخل عالم زيكولا ويحاول فهم قوانينه الغريبة للبقاء على قيد الحياة. القصة مليئة بالإثارة والتحديات.",
  "source": "المصدر: كتاب 'أرض زيكولا' - عمرو عبد الحميد"
}

    ],
  };

  List<Map<String, String>> get currentCategory =>
      categories[activeCategory] ?? [];

  Map<String, String> get currentWord => currentCategory[currentIndex];

  void nextWord() {
    currentIndex = (currentIndex + 1) % currentCategory.length;
    notifyListeners();
  }

  void setActiveCategory(String category, Color color) {
    activeCategory = category;
    currentIndex = 0;
    backgroundColor = color;
    notifyListeners();
  }

  void toggleFavorite(String word) {
    if (favorites.contains(word)) {
      favorites.remove(word);
    } else {
      favorites.add(word);
    }
    notifyListeners();
  }

  void addNote(String note) {
    notes.add(note);
    notifyListeners();
  }

  bool isFavorite(String word) {
    return favorites.contains(word);
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = HistoryPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      case 2:
        page = NotesPage();
        break;
      case 3:
        page = DonationPage();
        break;
      case 4:
        page = AccountPage();
        break;
      default:
        throw UnimplementedError('لا يوجد عنصر للصفحة المختارة');
    }

    var mainArea = ColoredBox(
      color: context.watch<MyAppState>().backgroundColor,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('اختر كتابا'),
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
              child: Center(
                child: Text(
                  'القائمة الرئيسية',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('الصفحة الرئيسية'), // تغيير النص
              onTap: () {
                setState(() {
                  selectedIndex = 0; // تبقى الصفحة الأولى
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.favorite),
              title: Text('المفضلة'),
              onTap: () {
                setState(() {
                  selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.notes),
              title: Text('الملاحظات'),
              onTap: () {
                setState(() {
                  selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.attach_money),
              title: Text('الدعم المادي'),
              onTap: () {
                setState(() {
                  selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('الحساب'),
              onTap: () {
                setState(() {
                  selectedIndex = 4;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          mainArea,
          Positioned(
            top: 16,
            right: 16,
            child: FloatingActionButton(
              backgroundColor: Colors.teal,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('الدعم الفني'),
                    content:
                        Text('يرجى الاتصال بخدمة العملاء: kkhalled896@gmail.com'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('إغلاق'),
                      ),
                    ],
                  ),
                );
              },
              child: Icon(Icons.support_agent, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.teal,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                appState.currentWord["word"]!,
                style: TextStyle(fontSize: 36, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(appState.currentWord["word"]!),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(appState.currentWord["description"]!),
                          SizedBox(height: 10),
                          Text(
                            appState.currentWord["source"]!,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('إغلاق'),
                        ),
                      ],
                    ),
                  );
                },
                icon: Icon(Icons.info_outline),
                label: Text('عرض التفاصيل'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: appState.nextWord,
                child: Text('المعلومة التالية'),
              ),
              SizedBox(width: 10),
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite(appState.currentWord["word"]!);
                },
                icon: Icon(appState.isFavorite(appState.currentWord["word"]!)
                    ? Icons.favorite
                    : Icons.favorite_border),
                label: Text('إعجاب'),
              ),
            ],
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 10,
            children: appState.categories.keys.map((category) {
              return ElevatedButton(
                onPressed: () {
                  appState.setActiveCategory(
                      category,
                      category == "التاريخ"
                          ? Colors.red.shade100
                          : category == "العلوم"
                              ? Colors.green.shade100
                              : category == "الفلسفة"
                                  ? Colors.blue.shade100
                                  : Colors.purple.shade100);
                },
                child: Text(category),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var favorites = appState.favorites;

    return favorites.isEmpty
        ? Center(child: Text('لا توجد مفضلات حتى الآن.'))
        : ListView(
            padding: EdgeInsets.all(16),
            children: favorites.map((word) {
              return ListTile(
                leading: Icon(Icons.favorite, color: Colors.teal),
                title: Text(word),
              );
            }).toList(),
          );
  }
}

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var notes = appState.notes;

    return Column(
      children: [
        Expanded(
          child: notes.isEmpty
              ? Center(child: Text('لا توجد ملاحظات حتى الآن.'))
              : ListView(
                  padding: EdgeInsets.all(16),
                  children: notes.map((note) {
                    return ListTile(
                      leading: Icon(Icons.note, color: Colors.teal),
                      title: Text(note),
                    );
                  }).toList(),
                ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  String newNote = '';
                  return AlertDialog(
                    title: Text('إضافة ملاحظة'),
                    content: TextField(
                      onChanged: (value) => newNote = value,
                      decoration: InputDecoration(
                        hintText: 'أدخل ملاحظتك هنا',
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('إلغاء'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (newNote.isNotEmpty) {
                            context.read<MyAppState>().addNote(newNote);
                          }
                          Navigator.of(context).pop();
                        },
                        child: Text('إضافة'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('إضافة ملاحظة'),
          ),
        ),
      ],
    );
  }
}

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('الدعم المالي'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('شكراً لدعمك!'),
                  content: Text('يرجى زيارة الموقع للدعم: https://dkn.to/cloud91'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('إغلاق'),
                    ),
                  ],
                ),
              );
            },
            child: Text('تقديم الدعم'),
          ),
        ],
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'تسجيل الدخول',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              labelText: 'البريد الإلكتروني',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'كلمة المرور',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              String email = emailController.text.trim();
              String password = passwordController.text.trim();

              if (email.isEmpty || password.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('خطأ'),
                    content: Text('يرجى إدخال البريد الإلكتروني وكلمة المرور'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('حسناً'),
                      ),
                    ],
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('مرحباً'),
                    content: Text('تم تسجيل الدخول كـ $email'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('موافق'),
                      ),
                    ],
                  ),
                );
              }
            },
            child: Text('تسجيل الدخول'),
          ),
        ],
      ),
    );
  }
} 