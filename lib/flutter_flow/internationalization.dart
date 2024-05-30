import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // welcome
  {
    's129ydo3': {
      'en': 'Nature is here to help you\n',
      'hi': 'प्रकृति आपकी सहायता के लिए यहाँ है',
    },
    '1wldydha': {
      'en': 'Sign up with e-mail',
      'hi': 'ईमेल के लिए साइन इन करें',
    },
    '57j95a5g': {
      'en': 'Or use social media',
      'hi': 'या सोशल मीडिया का उपयोग करें',
    },
    'g86w9wwd': {
      'en': 'Sign up with Google',
      'hi': 'गूगल के साथ साइन अप करें',
    },
    '7k48rj4p': {
      'en': 'Already have an account?',
      'hi': 'क्या आपके पास पहले से एक खाता मौजूद है?',
    },
    'x31j8830': {
      'en': ' Log In!',
      'hi': 'लॉग इन करें!',
    },
    '58xx8epk': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // create
  {
    'd4kc50cy': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
    },
    '12beg8qc': {
      'en': 'Create Account',
      'hi': 'खाता बनाएं',
    },
    '3o1arzk1': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': 'आइये नीचे दिया गया फॉर्म भरकर शुरुआत करें।',
    },
    '7vtov5pr': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    'ymnntgz9': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    'lum7tvpm': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    '56fx1r49': {
      'en': 'Or sign up with',
      'hi': 'या साइन अप करें',
    },
    '4nsh66ka': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
    },
    'ak4860q7': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // login
  {
    'pjhg7448': {
      'en': 'Scarecrow',
      'hi': 'Scarecrod',
    },
    '5s6ipb7g': {
      'en': 'Log In',
      'hi': 'लॉग इन करें',
    },
    'w1ug8h99': {
      'en': 'Welcome Back',
      'hi': 'वापसी पर स्वागत है',
    },
    'iool8ckh': {
      'en': 'Fill out the information below in order to access your account.',
      'hi': 'अपने खाते तक पहुंचने के लिए नीचे दी गई जानकारी भरें।',
    },
    'paj1d8vl': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    '95lcwsq3': {
      'en': 'Password',
      'hi': 'पासवर्ड',
    },
    '4vuhwres': {
      'en': 'Or sign in with',
      'hi': 'या साइन इन करें',
    },
    '7snfkkob': {
      'en': 'Continue with Google',
      'hi': 'Google के साथ जारी रखें',
    },
    '0tojcvto': {
      'en': 'Forgot Password?',
      'hi': 'पासवर्ड भूल गए?',
    },
    'ragehifo': {
      'en': 'Home',
      'hi': 'Home',
    },
  },
  // edit
  {
    'dbqqxrvb': {
      'en': 'Your Account',
      'hi': 'आपका खाता',
    },
    'dm1df71f': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
    },
    'is2fmv5l': {
      'en': 'Notification Settings',
      'hi': 'अधिसूचना सेटिंग्स',
    },
    'oeomoibd': {
      'en': 'App Settings',
      'hi': 'एप्लिकेशन सेटिंग',
    },
    'h0grvwe4': {
      'en': 'Support',
      'hi': 'सहायता',
    },
    '0eu7xoew': {
      'en': 'Terms of Service',
      'hi': 'सेवा की शर्तें',
    },
    'aqkaua2x': {
      'en': 'Emergency Services',
      'hi': 'आपातकालीन सेवाएं',
    },
    'zqu9pc37': {
      'en': 'Log Out',
      'hi': 'लॉग आउट',
    },
    '8z9bs59b': {
      'en': 'Home',
      'hi': 'Home',
    },
  },
  // editinfo
  {
    'c569jl9h': {
      'en': 'Full name*',
      'hi': 'पूरा नाम*',
    },
    'iqi4eies': {
      'en': 'Email',
      'hi': 'ईमेल',
    },
    't6zlziwb': {
      'en': 'Date of birth*',
      'hi': 'जन्म की तारीख*',
    },
    '939qwnnk': {
      'en': 'Gender',
      'hi': 'लिंग',
    },
    'csfsaljw': {
      'en': 'Female',
      'hi': 'महिला',
    },
    '1yhewvh4': {
      'en': 'Male',
      'hi': 'पुरुष',
    },
    'l23lp9y1': {
      'en': 'Other',
      'hi': 'अन्य',
    },
    'vb7xqhnm': {
      'en': 'SAVE',
      'hi': 'बचाना',
    },
    'n0pft7pk': {
      'en': 'Please enter the patients full name.',
      'hi': 'कृपया मरीज का पूरा नाम दर्ज करें।',
    },
    'czegpbkf': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'r8abr4ht': {
      'en': 'Please enter an age for the patient.',
      'hi': 'कृपया रोगी की आयु दर्ज करें।',
    },
    '071n1d67': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    '4yfb2le7': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'h6iyhbnp': {
      'en': 'Please enter the date of birth of the patient.',
      'hi': 'कृपया मरीज की जन्मतिथि दर्ज करें।',
    },
    'mxovy2o1': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'rdlj8pix': {
      'en': 'Field is required',
      'hi': 'ये स्थान भरा जाना है',
    },
    'uku2rii9': {
      'en': 'Please choose an option from the dropdown',
      'hi': 'कृपया ड्रॉपडाउन से कोई विकल्प चुनें',
    },
    'i20ll86v': {
      'en': 'Edit',
      'hi': 'संपादन करना',
    },
    'tld20tka': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ForgotPassword
  {
    'me06lm7y': {
      'en': 'Back',
      'hi': 'पीछे',
    },
    '0hxiiit0': {
      'en': 'Forgot Password',
      'hi': 'पासवर्ड भूल गए',
    },
    '0mr132zx': {
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'hi':
          'हम आपको अपना पासवर्ड रीसेट करने के लिए एक लिंक के साथ एक ईमेल भेजेंगे, कृपया नीचे अपने खाते से संबद्ध ईमेल दर्ज करें।',
    },
    'mc2i4vpb': {
      'en': 'Your email address...',
      'hi': 'आपका ईमेल पता...',
    },
    'hngde4my': {
      'en': 'Enter your email...',
      'hi': 'अपना ईमेल दर्ज करें...',
    },
    '153f3rlw': {
      'en': 'Send Link',
      'hi': 'लिंक भेजें',
    },
    'x4bhkba8': {
      'en': 'Back',
      'hi': 'पीछे',
    },
    'v37ua396': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Croplist
  {
    '2v244ex4': {
      'en': 'Crops',
      'hi': 'फसलें',
    },
    'vxbbtshd': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'बिजूका में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'bumbp8yt': {
      'en': 'Pulses',
      'hi': 'दालें',
    },
    '0hbpm4oo': {
      'en': 'Cereal',
      'hi': 'अनाज',
    },
    'iy63ev0n': {
      'en': 'Vegetables',
      'hi': 'सब्ज़ियाँ',
    },
    '5c6e869h': {
      'en': 'Fruits',
      'hi': 'फल',
    },
    't2dnk9e3': {
      'en': 'Herbs and Spices',
      'hi': 'जड़ी बूटियों और मसालों',
    },
    'rubg9iha': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Pulses
  {
    '6j92cp2c': {
      'en': 'Pulses',
      'hi': 'दालें',
    },
    'ex5e37j7': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'बिजूका में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'lmt2q8md': {
      'en': 'Pegion Peas / Toor Dal',
      'hi': 'पेगियन मटर / तुअर दाल',
    },
    'zzcma4im': {
      'en': 'Gram Bean / Mung',
      'hi': 'चना / मूंग',
    },
    'pp0oji4a': {
      'en': 'Green Peas Dry',
      'hi': 'हरी मटर सूखी',
    },
    '5wcs7ykl': {
      'en': 'Cow Pea Red/ Red Lobiya',
      'hi': 'काऊ मटर लाल/ लाल लोबिया',
    },
    'xi6j16fw': {
      'en': 'Kidney Beans / Rajma',
      'hi': 'राजमा / राजमा',
    },
    'eqz7apge': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Cereals
  {
    '5ayks1qg': {
      'en': 'Cereal',
      'hi': 'अनाज',
    },
    'vjszbebt': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'बिजूका में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'v0cjr4cn': {
      'en': 'Wheat',
      'hi': 'गेहूँ',
    },
    '7epgk9j3': {
      'en': 'Rice',
      'hi': 'चावल',
    },
    'rudj1apt': {
      'en': 'Corn',
      'hi': 'भुट्टा',
    },
    'ybjrvy4v': {
      'en': 'Sorghum',
      'hi': 'चारा',
    },
    '50lluhky': {
      'en': 'Pearl millet',
      'hi': 'बाजरा',
    },
    '7105nl7m': {
      'en': 'Soybean',
      'hi': 'सोयाबीन',
    },
    '3lyzm972': {
      'en': 'Green Peas',
      'hi': 'हरे मटर',
    },
    'tk8vibca': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Vegetables
  {
    'e7ylp1wz': {
      'en': 'Vegetables',
      'hi': 'सब्ज़ियाँ',
    },
    'ztt4o8g7': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'बिजूका में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'c88qm6zi': {
      'en': 'Potato',
      'hi': 'आलू',
    },
    'qi4b5i27': {
      'en': 'Onion',
      'hi': 'प्याज',
    },
    '9j1v72r4': {
      'en': 'Ladyfinger / Bhindi',
      'hi': 'भिंडी',
    },
    'cfns4885': {
      'en': 'Cabbage',
      'hi': 'पत्ता गोभी',
    },
    'k5uuyn86': {
      'en': 'Broccoli',
      'hi': 'ब्रोकोली',
    },
    'u3yifzo2': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Fruits
  {
    '1buwzx2i': {
      'en': 'Fruits',
      'hi': 'फल',
    },
    '8rgxzyxx': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'Scarecrow में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'xl6wxxir': {
      'en': 'Apple',
      'hi': 'सेब',
    },
    'ogbmmfmu': {
      'en': 'Orange',
      'hi': 'नारंगी',
    },
    's48hn0tg': {
      'en': 'Mango',
      'hi': 'आम',
    },
    'xceckzg8': {
      'en': 'Watermelon',
      'hi': 'तरबूज',
    },
    'jtq6eb9i': {
      'en': 'Strawberry',
      'hi': 'स्ट्रॉबेरी',
    },
    '5hl655sg': {
      'en': 'Home',
      'hi': 'Home',
    },
  },
  // Herbs-Spices
  {
    'wzl2pdai': {
      'en': 'Herbs and Spices',
      'hi': 'जड़ी बूटियों और मसालों',
    },
    's2silsek': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'Scarecrow में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'jusfk9jv': {
      'en': 'Green Chilli',
      'hi': 'हरी मिर्च',
    },
    'wtw81czh': {
      'en': 'Black pepper',
      'hi': 'काली मिर्च',
    },
    'mae8vgfx': {
      'en': 'Red Chilli',
      'hi': 'लाल मिर्च',
    },
    '4337k40d': {
      'en': 'Home',
      'hi': 'Home',
    },
  },
  // Dashboard
  {
    '0d5vb9g0': {
      'en': 'Scarecrow',
      'hi': 'बिजूका',
    },
    'vlize33u': {
      'en': 'Crops',
      'hi': 'फसलें',
    },
    'n9btcfjl': {
      'en': 'Floral Plants',
      'hi': 'पुष्प पौधे',
    },
    'ikpl5zqj': {
      'en': 'Finance',
      'hi': 'वित्त',
    },
    '36ysnbjd': {
      'en': 'Services',
      'hi': 'सेवाएं',
    },
    'xlgmzzw0': {
      'en': 'News',
      'hi': 'समाचार',
    },
    'yrn0r4za': {
      'en': 'Farm Controls',
      'hi': 'फार्म नियंत्रण',
    },
    'dmdkyrkd': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Flowerdash
  {
    'it1h5hay': {
      'en': 'Rose',
      'hi': 'गुलाब',
    },
    '05uc5bdj': {
      'en': 'Hibiscus',
      'hi': 'हिबिस्कुस',
    },
    'ojx47gpy': {
      'en': 'Marigold',
      'hi': 'गेंदे का फूल',
    },
    's8ulhoto': {
      'en': 'Tulip',
      'hi': 'ट्यूलिप',
    },
    'aq9swk0s': {
      'en': 'Sunflower',
      'hi': 'सूरजमुखी',
    },
    'ea1gaumo': {
      'en': 'News',
      'hi': 'समाचार',
    },
    'bfx7mq24': {
      'en': 'Lily',
      'hi': 'लिली',
    },
    'bqqlr0lb': {
      'en': 'Leaves',
      'hi': 'समाचार',
    },
    'nnyxetzd': {
      'en': 'Lily',
      'hi': 'लिली',
    },
    'olpw1ejf': {
      'en': 'News',
      'hi': 'समाचार',
    },
    'kjutx3fa': {
      'en': 'Sunflower',
      'hi': 'सूरजमुखी',
    },
    '9owfi1vn': {
      'en': 'News',
      'hi': 'समाचार',
    },
    'fus5nc8s': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // news
  {
    'thzubl09': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Rice
  {
    'h5hdu2ko': {
      'en': 'Rice',
      'hi': 'चावल',
    },
    'iinx6dan': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'fit27ebc': {
      'en': 'November to February | March to June',
      'hi': 'नवंबर से फरवरी | मार्च से जून',
    },
    '0fn6gx6v': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'bw0r6jxj': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'vyid7b4l': {
      'en':
          'When selecting seeds for your rice crop, look for varieties that are well-suited to your climate and soil conditions. Choose seeds from reputable suppliers or seed companies to ensure quality and reliability. Check for seeds that are plump, uniform in size, and free from damage or disease. Different rice varieties have different growth characteristics and yield potentials, so research which ones are best suited for your area.',
      'hi':
          'अपनी चावल की फसल के लिए बीज चुनते समय, ऐसी किस्मों की तलाश करें जो आपकी जलवायु और मिट्टी की स्थितियों के अनुकूल हों। गुणवत्ता और विश्वसनीयता सुनिश्चित करने के लिए प्रतिष्ठित आपूर्तिकर्ताओं या बीज कंपनियों से बीज चुनें। ऐसे बीजों की जाँच करें जो मोटे, आकार में एक समान हों और क्षति या बीमारी से मुक्त हों। विभिन्न चावल की किस्मों में अलग-अलग विकास विशेषताएँ और उपज क्षमताएँ होती हैं, इसलिए शोध करें कि आपके क्षेत्र के लिए कौन सी किस्में सबसे उपयुक्त हैं।',
    },
    'q8qsx8us': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    'zkxk3wn8': {
      'en':
          'Rice is a water-loving crop, and proper water management is crucial for its growth and development. During the early stages of growth, keep the field flooded with about 2-3 inches of water. As the plants grow taller, gradually increase the water depth to around 4-6 inches. Monitor the water level regularly and ensure consistent irrigation, especially during dry periods. Avoid overwatering, as it can lead to nutrient leaching and disease.',
      'hi':
          'चावल एक जल-प्रेमी फसल है, और इसके विकास और वृद्धि के लिए उचित जल प्रबंधन महत्वपूर्ण है। विकास के शुरुआती चरणों के दौरान, खेत में लगभग 2-3 इंच पानी भरकर रखें। जैसे-जैसे पौधे बड़े होते हैं, धीरे-धीरे पानी की गहराई बढ़ाकर लगभग 4-6 इंच करें। नियमित रूप से जल स्तर की निगरानी करें और लगातार सिंचाई सुनिश्चित करें, खासकर शुष्क अवधि के दौरान। अधिक पानी देने से बचें, क्योंकि इससे पोषक तत्व रिस सकते हैं और बीमारी हो सकती है।',
    },
    'az2p5c0t': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'e473ylw3': {
      'en':
          'Weeds can compete with rice plants for water, nutrients, and sunlight, so it\'s essential to keep them under control. Manual weeding, using hand tools like hoes or weeders, is an effective and environmentally friendly method. You can also use mulching to suppress weed growth and conserve soil moisture. Additionally, herbicides can be used to target specific weed species, but it\'s essential to follow label instructions carefully and apply them only as directed.',
      'hi':
          'खरपतवार चावल के पौधों के साथ पानी, पोषक तत्वों और सूरज की रोशनी के लिए प्रतिस्पर्धा कर सकते हैं, इसलिए उन्हें नियंत्रण में रखना आवश्यक है। कुदाल या खरपतवार हटाने वाले जैसे हाथ के औजारों का उपयोग करके मैन्युअल रूप से निराई करना एक प्रभावी और पर्यावरण के अनुकूल तरीका है। आप खरपतवार की वृद्धि को रोकने और मिट्टी की नमी को संरक्षित करने के लिए मल्चिंग का भी उपयोग कर सकते हैं। इसके अतिरिक्त, खरपतवारनाशकों का उपयोग विशिष्ट खरपतवार प्रजातियों को लक्षित करने के लिए किया जा सकता है, लेकिन लेबल निर्देशों का सावधानीपूर्वक पालन करना और उन्हें केवल निर्देशानुसार ही लागू करना आवश्यक है।',
    },
    'k02rohjr': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'tbgi5487': {
      'en':
          'Regular scouting of the rice field is essential to monitor pest and disease activity. Common rice pests include insects like rice stem borers and diseases like blast and sheath blight. Integrated pest management (IPM) practices, such as using resistant varieties, crop rotation, and biological control agents, can help manage pest and disease pressure. If chemical control is necessary, select pesticides that are specific to the target pest and apply them according to recommended rates and timings.',
      'hi':
          'कीट और रोग गतिविधि की निगरानी के लिए चावल के खेत की नियमित निगरानी आवश्यक है। चावल के सामान्य कीटों में चावल के तने के छेदक जैसे कीट और ब्लास्ट और शीथ ब्लाइट जैसी बीमारियाँ शामिल हैं। एकीकृत कीट प्रबंधन (IPM) अभ्यास, जैसे प्रतिरोधी किस्मों का उपयोग, फसल चक्र और जैविक नियंत्रण एजेंट, कीट और रोग के दबाव को प्रबंधित करने में मदद कर सकते हैं। यदि रासायनिक नियंत्रण आवश्यक है, तो लक्षित कीट के लिए विशिष्ट कीटनाशकों का चयन करें और उन्हें अनुशंसित दरों और समय के अनुसार लागू करें।',
    },
    '06yctlqv': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'l5joc3hb': {
      'en':
          'Harvesting is typically done when the rice grains have matured and the moisture content is around 20-25%. The timing of harvest depends on factors such as rice variety, weather conditions, and desired grain quality. Harvesting can be done manually using sickles or mechanized using combine harvesters. If harvesting manually, cut the rice stalks near the base and tie them into bundles for easier handling. After harvesting, thresh the rice to separate the grains from the straw. Threshing can be done using traditional methods like beating the rice stalks or mechanized methods like using threshers. Finally, winnow the rice to remove any remaining chaff and debris. Proper drying and storage are essential to maintain grain quality and prevent post-harvest losses. Dry the harvested rice to a moisture content of around 14% or lower before storing it in clean, dry containers or silos.',
      'hi':
          'आम तौर पर कटाई तब की जाती है जब चावल के दाने पक जाते हैं और नमी की मात्रा 20-25% के आसपास होती है। कटाई का समय चावल की किस्म, मौसम की स्थिति और वांछित अनाज की गुणवत्ता जैसे कारकों पर निर्भर करता है। कटाई दरांती का उपयोग करके मैन्युअल रूप से या कंबाइन हार्वेस्टर का उपयोग करके मशीनीकृत रूप से की जा सकती है। यदि मैन्युअल रूप से कटाई की जाती है, तो चावल के डंठल को आधार के पास से काटें और उन्हें आसानी से संभालने के लिए बंडलों में बाँध दें। कटाई के बाद, अनाज को भूसे से अलग करने के लिए चावल को थ्रेस करें। थ्रेसिंग चावल के डंठल को पीटने जैसे पारंपरिक तरीकों या थ्रेसर का उपयोग करने जैसे मशीनीकृत तरीकों से की जा सकती है। अंत में, बचे हुए भूसे और मलबे को हटाने के लिए चावल को फटकें। अनाज की गुणवत्ता बनाए रखने और कटाई के बाद होने वाले नुकसान को रोकने के लिए उचित सुखाने और भंडारण आवश्यक है। साफ, सूखे कंटेनरों या साइलो में भंडारण करने से पहले कटे हुए चावल को लगभग 14% या उससे कम नमी की मात्रा तक सुखाएँ।',
    },
    'klmraj3h': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Irrigation
  {
    'qazyqyp6': {
      'en': 'Controls',
      'hi': '',
    },
    'z90afoay': {
      'en': 'Water Supply',
      'hi': '',
    },
    'l8hmcwgc': {
      'en': 'Fertilizer Supply',
      'hi': '',
    },
    'bj3zp64a': {
      'en': 'Min 0 | Max 100',
      'hi': '',
    },
    '19q2o5kz': {
      'en': 'Confirm',
      'hi': '',
    },
  },
  // Emergency
  {
    'nwk69uw9': {
      'en': 'List of Emergency Contact',
      'hi': 'आपातकालीन संपर्क की सूची',
    },
    '1zce167i': {
      'en': 'Hospital',
      'hi': 'अस्पताल',
    },
    'z1evdnrw': {
      'en': 'Animal Control',
      'hi': 'जानवर नियंत्रण',
    },
    's9ixrbz7': {
      'en': 'Veterinary Hospital',
      'hi': 'पशु चिकित्सा अस्पताल',
    },
    'akqfmovo': {
      'en': 'Fire',
      'hi': 'आग',
    },
    'wcwce2eu': {
      'en': 'Police',
      'hi': 'पुलिस',
    },
    'ltnaojt6': {
      'en': 'Tap on the Button to Call',
      'hi': 'कॉल करने के लिए बटन पर टैप करें',
    },
    '2c46cwl5': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Buy
  {
    '5kquqcjp': {
      'en': 'Shopping',
      'hi': 'खरीदारी',
    },
    'itk737w7': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'बिजूका में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'vwp4o5uu': {
      'en': 'Tractor',
      'hi': 'ट्रैक्टर',
    },
    '6kjoc3py': {
      'en': 'Harvester',
      'hi': 'फ़सल काटने की मशीन',
    },
    '7ldt75ar': {
      'en': 'Plough',
      'hi': 'हल',
    },
    'jqhh8cjn': {
      'en': 'Seed Drill',
      'hi': 'बीज ड्रिल',
    },
    'ukvuw2lr': {
      'en': 'Cultivator',
      'hi': 'खेतिहर',
    },
    '3z4iwxib': {
      'en': 'Thersher',
      'hi': 'थेर्शर',
    },
    'c4isjmn6': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Servicespage
  {
    '34pm2cmj': {
      'en': 'Services',
      'hi': 'सेवाएं',
    },
    '2olw821z': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'बिजूका में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'ashlcu6l': {
      'en': 'Rent',
      'hi': 'किराया',
    },
    '7w74vl2x': {
      'en': 'Buy',
      'hi': 'खरीदना',
    },
    'vsighmm9': {
      'en': 'Become a provider',
      'hi': 'प्रदाता बनें',
    },
    '1z07o4de': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Rent
  {
    'fnnnn1v5': {
      'en': 'Rent',
      'hi': 'किराया',
    },
    'fziiidmi': {
      'en': 'Explore wide variety of crops at scarecrow',
      'hi': 'बिजूका में फसलों की विस्तृत विविधता का अन्वेषण करें',
    },
    'gpba42d2': {
      'en': 'Tractor',
      'hi': 'ट्रैक्टर',
    },
    '14qvsm13': {
      'en': 'Harvester',
      'hi': 'फ़सल काटने की मशीन',
    },
    'danralxe': {
      'en': 'Plough',
      'hi': 'हल',
    },
    '2wew073u': {
      'en': 'Seed Drill',
      'hi': 'बीज ड्रिल',
    },
    'p637tkrx': {
      'en': 'Cultivator',
      'hi': 'खेतिहर',
    },
    '9g8qejtm': {
      'en': 'Thersher',
      'hi': 'थेर्शर',
    },
    'rafzxwjr': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Financepg
  {
    'oo8a55x3': {
      'en': 'Wheat',
      'hi': 'गेहूँ',
    },
    '0s554d20': {
      'en': 'Rice',
      'hi': 'चावल',
    },
    'jb6mamss': {
      'en': 'Soyabean',
      'hi': 'सोया बीन',
    },
    '4lmkpr5w': {
      'en': 'Green Peas',
      'hi': 'हरे मटर',
    },
    'of9zogi4': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Wheat
  {
    'sv0v0fl0': {
      'en': 'Wheat',
      'hi': 'गेहूँ',
    },
    'loqhfwqf': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'pbonwv2f': {
      'en': 'October to December | Feburary to May',
      'hi': 'अक्टूबर से दिसंबर | फरवरी से मई',
    },
    'v7nru047': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    '6jgyegrp': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'aw1din9t': {
      'en':
          'Selecting the right wheat seeds is crucial for a successful crop. Look for certified seeds from reputable suppliers that are adapted to your local climate and soil conditions. Choose seeds that are plump, uniform in size, and free from disease and damage. Different wheat varieties have different characteristics, such as winter or spring growth habits, so choose the one best suited to your area and intended planting time.',
      'hi':
          'सफल फसल के लिए सही गेहूं के बीज का चयन करना महत्वपूर्ण है। प्रतिष्ठित आपूर्तिकर्ताओं से प्रमाणित बीज लें जो आपके स्थानीय जलवायु और मिट्टी की स्थितियों के अनुकूल हों। ऐसे बीज चुनें जो मोटे, आकार में एक समान हों और रोग और क्षति से मुक्त हों। विभिन्न गेहूं किस्मों की अलग-अलग विशेषताएं होती हैं, जैसे कि सर्दी या वसंत में उगने की आदतें, इसलिए अपने क्षेत्र और इच्छित रोपण समय के लिए सबसे उपयुक्त एक चुनें।',
    },
    'rokswzgk': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    '2do1pta6': {
      'en':
          'Wheat requires adequate moisture for germination and early growth but can tolerate drier conditions once established. Ensure the soil is moist at planting time to support seed germination. During the growing season, monitor soil moisture levels and irrigate as needed, especially during dry periods. Avoid overwatering, as excessive moisture can lead to disease problems such as root rot.',
      'hi':
          'गेहूं को अंकुरण और शुरुआती वृद्धि के लिए पर्याप्त नमी की आवश्यकता होती है, लेकिन एक बार स्थापित होने के बाद यह शुष्क परिस्थितियों को सहन कर सकता है। सुनिश्चित करें कि बीज के अंकुरण को समर्थन देने के लिए रोपण के समय मिट्टी नम हो। बढ़ते मौसम के दौरान, मिट्टी की नमी के स्तर की निगरानी करें और आवश्यकतानुसार सिंचाई करें, खासकर शुष्क अवधि के दौरान। अधिक पानी देने से बचें, क्योंकि अत्यधिक नमी से जड़ सड़न जैसी बीमारी की समस्या हो सकती है।',
    },
    'wzi8hpe3': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'kyf4qiie': {
      'en':
          'Weeds compete with wheat for nutrients, water, and sunlight, so effective weed control is essential. Pre-emergence herbicides can be applied before planting to prevent weed germination, while post-emergence herbicides target weeds that have already emerged. Mechanical methods such as cultivation or hand-weeding can also be used to control weeds. Be sure to follow label instructions when using herbicides and consider rotating herbicide modes of action to prevent herbicide resistance.',
      'hi':
          'खरपतवार पोषक तत्वों, पानी और सूरज की रोशनी के लिए गेहूं के साथ प्रतिस्पर्धा करते हैं, इसलिए प्रभावी खरपतवार नियंत्रण आवश्यक है। खरपतवार के अंकुरण को रोकने के लिए रोपण से पहले प्री-इमर्जेंस हर्बिसाइड्स का इस्तेमाल किया जा सकता है, जबकि पोस्ट-इमर्जेंस हर्बिसाइड्स उन खरपतवारों को लक्षित करते हैं जो पहले ही उग चुके हैं। खरपतवारों को नियंत्रित करने के लिए खेती या हाथ से निराई जैसी यांत्रिक विधियों का भी इस्तेमाल किया जा सकता है। हर्बिसाइड्स का उपयोग करते समय लेबल निर्देशों का पालन करना सुनिश्चित करें और हर्बिसाइड प्रतिरोध को रोकने के लिए हर्बिसाइड क्रिया के घुमाव मोड पर विचार करें।',
    },
    'pl7ejbjx': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'edblt4io': {
      'en':
          'Common pests and diseases that affect wheat include aphids, armyworms, rusts, and powdery mildew. Monitor the crop regularly for signs of pest and disease damage and take appropriate action if needed. Integrated pest management (IPM) strategies, such as planting resistant varieties, crop rotation, and biological control, can help manage pest and disease pressure. Fungicides and insecticides may be necessary in severe infestations, but use them judiciously and follow label instructions to minimize environmental impact.',
      'hi':
          'गेहूं को प्रभावित करने वाले आम कीटों और बीमारियों में एफिड्स, आर्मीवर्म, रस्ट और पाउडरी मिल्ड्यू शामिल हैं। कीट और रोग क्षति के संकेतों के लिए फसल की नियमित निगरानी करें और यदि आवश्यक हो तो उचित कार्रवाई करें। एकीकृत कीट प्रबंधन (आईपीएम) रणनीतियाँ, जैसे कि प्रतिरोधी किस्मों को लगाना, फसल चक्र और जैविक नियंत्रण, कीट और रोग के दबाव को प्रबंधित करने में मदद कर सकती हैं। गंभीर संक्रमण में कवकनाशी और कीटनाशक आवश्यक हो सकते हैं, लेकिन उनका विवेकपूर्ण तरीके से उपयोग करें और पर्यावरणीय प्रभाव को कम करने के लिए लेबल निर्देशों का पालन करें।',
    },
    'klwujeky': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'l1hphv4t': {
      'en':
          'Harvesting wheat at the right time is critical to ensure optimal grain quality and yield. Harvest timing depends on factors such as wheat variety, weather conditions, and intended end-use. Harvest when the wheat kernels are fully mature and the moisture content is around 13-15%. Use a combine harvester to cut the wheat stalks and separate the grain from the straw. Thresh the harvested wheat to separate the grain from the chaff, either using a combine or a separate threshing machine. Finally, clean and dry the grain to a safe moisture level for storage, typically around 12%. Store the harvested wheat in clean, dry bins or silos to protect it from moisture and pests until it\'s ready for sale or use.',
      'hi':
          'गेहूं की सही समय पर कटाई करना अनाज की सर्वोत्तम गुणवत्ता और उपज सुनिश्चित करने के लिए महत्वपूर्ण है। कटाई का समय गेहूं की किस्म, मौसम की स्थिति और इच्छित अंतिम उपयोग जैसे कारकों पर निर्भर करता है। जब गेहूं के दाने पूरी तरह से पक जाएं और नमी की मात्रा लगभग 13-15% हो, तब कटाई करें। गेहूं के डंठलों को काटने और अनाज को भूसे से अलग करने के लिए कंबाइन हार्वेस्टर का उपयोग करें। अनाज को भूसे से अलग करने के लिए कटे हुए गेहूं को कंबाइन या अलग थ्रेसिंग मशीन का उपयोग करके थ्रेस करें। अंत में, भंडारण के लिए अनाज को सुरक्षित नमी के स्तर तक साफ और सुखाएं, आमतौर पर लगभग 12%। कटाई किए गए गेहूं को नमी और कीटों से बचाने के लिए साफ, सूखे डिब्बों या साइलो में तब तक स्टोर करें जब तक कि यह बिक्री या उपयोग के लिए तैयार न हो जाए।',
    },
    'zhpy21n2': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Corn
  {
    'avaz1uim': {
      'en': 'Corn',
      'hi': 'भुट्टा',
    },
    'yejipw24': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'm9bxvamm': {
      'en': 'June to August | December',
      'hi': 'जून से अगस्त | दिसंबर',
    },
    '3txln0yx': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    '9g3jyk6y': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'ttpbklco': {
      'en':
          'Selecting quality corn seeds is vital for a successful crop. Look for seeds from reputable suppliers that are well-suited to your local climate and soil conditions. Consider factors such as maturity length, disease resistance, and yield potential when choosing varieties. Ensure the seeds are uniform in size, free from damage, and treated with fungicides and insecticides for protection.',
      'hi':
          'सफल फसल के लिए गुणवत्ता वाले मकई के बीज का चयन करना महत्वपूर्ण है। प्रतिष्ठित आपूर्तिकर्ताओं से बीज लें जो आपके स्थानीय जलवायु और मिट्टी की स्थितियों के लिए उपयुक्त हों। किस्मों का चयन करते समय परिपक्वता अवधि, रोग प्रतिरोध और उपज क्षमता जैसे कारकों पर विचार करें। सुनिश्चित करें कि बीज आकार में एक समान हों, क्षति से मुक्त हों, और सुरक्षा के लिए कवकनाशी और कीटनाशकों से उपचारित हों।',
    },
    'w9ghp2n8': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    'zaqs1riq': {
      'en':
          'Corn requires consistent moisture throughout its growing season, especially during critical growth stages like pollination and kernel development. Monitor soil moisture levels and irrigate as needed to ensure adequate water supply. Aim to keep the soil evenly moist, but avoid waterlogged conditions, which can lead to root rot and other diseases.',
      'hi':
          'मकई को अपने पूरे उगने के मौसम में लगातार नमी की आवश्यकता होती है, खासकर परागण और कर्नेल विकास जैसे महत्वपूर्ण विकास चरणों के दौरान। मिट्टी की नमी के स्तर की निगरानी करें और पर्याप्त पानी की आपूर्ति सुनिश्चित करने के लिए आवश्यकतानुसार सिंचाई करें। मिट्टी को समान रूप से नम रखने का लक्ष्य रखें, लेकिन जलभराव की स्थिति से बचें, जिससे जड़ सड़न और अन्य बीमारियाँ हो सकती हैं।',
    },
    'q5oavnoe': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'bed2m60j': {
      'en':
          'Weeds compete with corn for nutrients, water, and sunlight, so effective weed control is essential. Pre-emergence herbicides can be applied before planting to prevent weed germination, while post-emergence herbicides target weeds that have already emerged. Mechanical methods like cultivation or hoeing can also be used to control weeds. Be cautious when using herbicides near corn plants to avoid crop injury.',
      'hi':
          'खरपतवार पोषक तत्वों, पानी और सूरज की रोशनी के लिए मकई के साथ प्रतिस्पर्धा करते हैं, इसलिए प्रभावी खरपतवार नियंत्रण आवश्यक है। खरपतवार के अंकुरण को रोकने के लिए रोपण से पहले प्री-इमर्जेंस हर्बिसाइड्स का इस्तेमाल किया जा सकता है, जबकि पोस्ट-इमर्जेंस हर्बिसाइड्स उन खरपतवारों को लक्षित करते हैं जो पहले ही उग चुके हैं। खरपतवारों को नियंत्रित करने के लिए खेती या कुदाल जैसे यांत्रिक तरीकों का भी इस्तेमाल किया जा सकता है। फसल को नुकसान से बचाने के लिए मकई के पौधों के पास हर्बिसाइड्स का इस्तेमाल करते समय सावधानी बरतें।',
    },
    'x2f245t9': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'ncak73b2': {
      'en':
          'Corn is susceptible to various pests and diseases, including corn borers, earworms, rusts, and fungal diseases like gray leaf spot. Monitor the crop regularly for signs of pest and disease damage and take appropriate action if needed. Integrated pest management (IPM) practices, such as planting resistant varieties, crop rotation, and biological control, can help manage pest and disease pressure. In severe infestations, insecticides and fungicides may be necessary, but use them judiciously and follow label instructions to minimize environmental impact.',
      'hi':
          'मक्का विभिन्न कीटों और बीमारियों के प्रति संवेदनशील होता है, जिसमें मकई बोरर, ईयरवर्म, जंग और ग्रे लीफ स्पॉट जैसे फंगल रोग शामिल हैं। कीट और रोग क्षति के संकेतों के लिए फसल की नियमित रूप से निगरानी करें और यदि आवश्यक हो तो उचित कार्रवाई करें। एकीकृत कीट प्रबंधन (आईपीएम) प्रथाएँ, जैसे कि प्रतिरोधी किस्मों को लगाना, फसल चक्र और जैविक नियंत्रण, कीट और रोग के दबाव को प्रबंधित करने में मदद कर सकते हैं। गंभीर संक्रमण में, कीटनाशक और कवकनाशी आवश्यक हो सकते हैं, लेकिन उनका विवेकपूर्ण तरीके से उपयोग करें और पर्यावरणीय प्रभाव को कम करने के लिए लेबल निर्देशों का पालन करें।',
    },
    '8wqdf6xv': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'nkly68il': {
      'en':
          'Harvesting corn at the right time is crucial for optimal yield and quality. Harvest timing depends on factors such as corn maturity, weather conditions, and intended end-use. For grain corn, harvest when the kernels are fully mature and the moisture content is around 20-25%. Use a combine harvester equipped with a corn head attachment to harvest the ears. For silage corn, harvest when the whole plant reaches the desired moisture content, typically around 65-70%. After harvesting, dry the grain to a safe moisture level for storage, typically around 15%. Store the harvested corn in clean, dry bins or silos to protect it from moisture and pests until it\'s ready for sale or use.',
      'hi':
          'सही समय पर मक्का की कटाई करना इष्टतम उपज और गुणवत्ता के लिए महत्वपूर्ण है। कटाई का समय मकई की परिपक्वता, मौसम की स्थिति और इच्छित अंतिम उपयोग जैसे कारकों पर निर्भर करता है। अनाज मकई के लिए, जब दाने पूरी तरह से पक जाएं और नमी की मात्रा लगभग 20-25% हो, तब कटाई करें। मकई के दानों की कटाई के लिए मकई के सिर के अटैचमेंट से लैस कंबाइन हार्वेस्टर का उपयोग करें। साइलेज मकई के लिए, जब पूरा पौधा वांछित नमी की मात्रा तक पहुँच जाए, आमतौर पर लगभग 65-70%, तब कटाई करें। कटाई के बाद, अनाज को भंडारण के लिए सुरक्षित नमी के स्तर तक सुखाएँ, आमतौर पर लगभग 15%। कटाई किए गए मकई को नमी और कीटों से बचाने के लिए साफ, सूखे डिब्बे या साइलो में तब तक स्टोर करें जब तक कि यह बिक्री या उपयोग के लिए तैयार न हो जाए।',
    },
    'urckotel': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Sorghum
  {
    'ch4tndh3': {
      'en': 'Sorghum',
      'hi': 'चारा',
    },
    'gqt7e3bb': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'xt3q9btt': {
      'en': 'June to August | December',
      'hi': 'जून से अगस्त | दिसंबर',
    },
    'mw9wsbe6': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    't5sayf1b': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'yagn8y96': {
      'en':
          'Selecting quality sorghum seeds is the first step to a successful crop. Look for seeds from reputable suppliers that are well-suited to your local climate and soil conditions. Consider factors such as maturity length, disease resistance, and yield potential when choosing varieties. Ensure the seeds are uniform in size, free from damage, and treated with fungicides and insecticides for protection against pests and diseases.',
      'hi':
          'गुणवत्ता वाले ज्वार के बीजों का चयन सफल फसल के लिए पहला कदम है। प्रतिष्ठित आपूर्तिकर्ताओं से बीज लें जो आपके स्थानीय जलवायु और मिट्टी की स्थितियों के लिए उपयुक्त हों। किस्मों का चयन करते समय परिपक्वता अवधि, रोग प्रतिरोध और उपज क्षमता जैसे कारकों पर विचार करें। सुनिश्चित करें कि बीज आकार में एक समान हों, क्षति से मुक्त हों, और कीटों और बीमारियों से सुरक्षा के लिए कवकनाशी और कीटनाशकों से उपचारित हों।',
    },
    'ziigha69': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    '6hrzuegg': {
      'en':
          'Sorghum is a drought-tolerant crop but performs best with consistent moisture, especially during critical growth stages like germination, flowering, and grain fill. Monitor soil moisture levels and irrigate as needed to ensure adequate water supply, especially during dry periods. Aim to keep the soil evenly moist but avoid waterlogged conditions, which can lead to root rot and other diseases.',
      'hi':
          'ज्वार एक सूखा-सहिष्णु फसल है, लेकिन लगातार नमी के साथ सबसे अच्छा प्रदर्शन करती है, खासकर अंकुरण, फूल और अनाज भरने जैसे महत्वपूर्ण विकास चरणों के दौरान। मिट्टी की नमी के स्तर की निगरानी करें और पर्याप्त पानी की आपूर्ति सुनिश्चित करने के लिए आवश्यकतानुसार सिंचाई करें, खासकर शुष्क अवधि के दौरान। मिट्टी को समान रूप से नम रखने का लक्ष्य रखें, लेकिन जलभराव की स्थिति से बचें, जिससे जड़ सड़न और अन्य बीमारियाँ हो सकती हैं।',
    },
    '32x9lg8w': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    '12qtnt6v': {
      'en':
          'Weeds can compete with sorghum for nutrients, water, and sunlight, so effective weed control is essential. Pre-emergence herbicides can be applied before planting to prevent weed germination, while post-emergence herbicides target weeds that have already emerged. Mechanical methods like cultivation or hoeing can also be used to control weeds. Be cautious when using herbicides near sorghum plants to avoid crop injury.',
      'hi':
          'खरपतवार पोषक तत्वों, पानी और सूरज की रोशनी के लिए ज्वार के साथ प्रतिस्पर्धा कर सकते हैं, इसलिए प्रभावी खरपतवार नियंत्रण आवश्यक है। खरपतवार के अंकुरण को रोकने के लिए रोपण से पहले प्री-इमर्जेंस हर्बिसाइड्स का इस्तेमाल किया जा सकता है, जबकि पोस्ट-इमर्जेंस हर्बिसाइड्स उन खरपतवारों को लक्षित करते हैं जो पहले ही उग चुके हैं। खरपतवारों को नियंत्रित करने के लिए खेती या कुदाल चलाने जैसी यांत्रिक विधियों का भी इस्तेमाल किया जा सकता है। फसल को नुकसान से बचाने के लिए ज्वार के पौधों के पास हर्बिसाइड्स का इस्तेमाल करते समय सावधानी बरतें।',
    },
    'tzm59x41': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'gbdhamka': {
      'en':
          'Sorghum is susceptible to pests such as aphids, grasshoppers, and sorghum midge, as well as diseases like anthracnose, downy mildew, and sorghum rust. Monitor the crop regularly for signs of pest and disease damage and take appropriate action if needed. Integrated pest management (IPM) practices, such as planting resistant varieties, crop rotation, and biological control, can help manage pest and disease pressure. In severe infestations, insecticides and fungicides may be necessary, but use them judiciously and follow label instructions to minimize environmental impact.',
      'hi':
          'ज्वार एफिड्स, टिड्डे और ज्वार मिज जैसे कीटों के साथ-साथ एन्थ्रेक्नोज, डाउनी फफूंद और ज्वार जंग जैसी बीमारियों के प्रति संवेदनशील है। कीट और रोग क्षति के संकेतों के लिए फसल की नियमित रूप से निगरानी करें और यदि आवश्यक हो तो उचित कार्रवाई करें। एकीकृत कीट प्रबंधन (आईपीएम) अभ्यास, जैसे प्रतिरोधी किस्मों को लगाना, फसल चक्र और जैविक नियंत्रण, कीट और रोग के दबाव को प्रबंधित करने में मदद कर सकते हैं। गंभीर संक्रमण में, कीटनाशक और कवकनाशी आवश्यक हो सकते हैं, लेकिन उनका विवेकपूर्ण तरीके से उपयोग करें और पर्यावरणीय प्रभाव को कम करने के लिए लेबल निर्देशों का पालन करें।',
    },
    'bn31jvnz': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'cn1yrrzf': {
      'en':
          'Harvesting sorghum at the right time is crucial for optimal yield and quality. Harvest timing depends on factors such as sorghum maturity, weather conditions, and intended end-use. For grain sorghum, harvest when the seeds are fully mature and the moisture content is around 15-20%. Use a combine harvester equipped with a sorghum head attachment to harvest the grain. For forage sorghum, harvest when the plants reach the desired height and the stalks are still green and juicy. After harvesting, dry the grain to a safe moisture level for storage, typically around 12-14%. Store the harvested sorghum in clean, dry bins or silos to protect it from moisture and pests until it\'s ready for sale or use.',
      'hi':
          'ज्वार की सही समय पर कटाई करना इष्टतम उपज और गुणवत्ता के लिए महत्वपूर्ण है। कटाई का समय ज्वार की परिपक्वता, मौसम की स्थिति और इच्छित अंतिम उपयोग जैसे कारकों पर निर्भर करता है। अनाज ज्वार के लिए, जब बीज पूरी तरह से परिपक्व हो जाएं और नमी की मात्रा लगभग 15-20% हो, तब कटाई करें। अनाज की कटाई के लिए ज्वार के सिर के अटैचमेंट से सुसज्जित कंबाइन हार्वेस्टर का उपयोग करें। चारा ज्वार के लिए, जब पौधे वांछित ऊंचाई तक पहुंच जाएं और डंठल अभी भी हरे और रसीले हों, तब कटाई करें। कटाई के बाद, अनाज को भंडारण के लिए सुरक्षित नमी के स्तर तक सुखाएं, आमतौर पर लगभग 12-14%। कटाई किए गए ज्वार को नमी और कीटों से बचाने के लिए साफ, सूखे डिब्बे या साइलो में तब तक स्टोर करें जब तक कि यह बिक्री या उपयोग के लिए तैयार न हो जाए।',
    },
    'axlnbm14': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // PearlMillet
  {
    'x5gey0ir': {
      'en': 'Pearl Millet',
      'hi': 'बाजरा',
    },
    'l72sk037': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'vtz0lkba': {
      'en': 'June and July | October to November',
      'hi': 'जून और जुलाई | अक्टूबर से नवंबर',
    },
    'd020wsu4': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'dgom9plu': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'txny9tey': {
      'en':
          'Start your pearl millet crop with high-quality seeds. Look for seeds suited to your local climate and soil conditions. Select varieties known for their drought tolerance and disease resistance. Ensure the seeds are clean, uniform in size, and free from damage or signs of disease. Treat seeds with fungicides and insecticides to protect against pests and diseases.',
      'hi':
          'अपनी बाजरे की फसल को उच्च गुणवत्ता वाले बीजों से शुरू करें। अपने स्थानीय जलवायु और मिट्टी की स्थितियों के अनुकूल बीजों की तलाश करें। सूखे को सहन करने और रोग प्रतिरोधक क्षमता के लिए जानी जाने वाली किस्मों का चयन करें। सुनिश्चित करें कि बीज साफ हों, आकार में एक समान हों और उनमें कोई क्षति या बीमारी के लक्षण न हों। कीटों और बीमारियों से बचाने के लिए बीजों को फफूंदनाशकों और कीटनाशकों से उपचारित करें।',
    },
    'mcu884sg': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    'pj26ti5o': {
      'en':
          'Pearl millet is known for its drought tolerance but benefits from consistent moisture, especially during germination and early growth stages. Monitor soil moisture levels and irrigate as needed to ensure adequate water supply, especially during dry spells. Avoid overwatering, as pearl millet is sensitive to waterlogged conditions, which can lead to root rot.',
      'hi':
          'मोती बाजरा अपनी सूखा सहनशीलता के लिए जाना जाता है, लेकिन लगातार नमी से लाभ होता है, खासकर अंकुरण और शुरुआती विकास चरणों के दौरान। मिट्टी की नमी के स्तर की निगरानी करें और पर्याप्त पानी की आपूर्ति सुनिश्चित करने के लिए आवश्यकतानुसार सिंचाई करें, खासकर सूखे के दौरान। अधिक पानी देने से बचें, क्योंकि मोती बाजरा जलभराव की स्थिति के प्रति संवेदनशील है, जिससे जड़ सड़ सकती है।',
    },
    'mtfnbja1': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'fjgqn38k': {
      'en':
          'Weeds compete with pearl millet for nutrients, water, and sunlight, so effective weed control is essential. Use pre-emergence herbicides before planting to prevent weed germination. Post-emergence herbicides can be used to target weeds that have already emerged. Mechanical methods like hoeing or hand-weeding can also be effective. Be cautious when using herbicides near pearl millet plants to avoid crop injury.',
      'hi':
          'खरपतवार पोषक तत्वों, पानी और सूरज की रोशनी के लिए बाजरे के साथ प्रतिस्पर्धा करते हैं, इसलिए प्रभावी खरपतवार नियंत्रण आवश्यक है। खरपतवार के अंकुरण को रोकने के लिए रोपण से पहले प्री-इमर्जेंस हर्बिसाइड्स का उपयोग करें। उगने के बाद के हर्बिसाइड्स का उपयोग उन खरपतवारों को लक्षित करने के लिए किया जा सकता है जो पहले ही उग चुके हैं। कुदाल या हाथ से निराई जैसी यांत्रिक विधियाँ भी प्रभावी हो सकती हैं। फसल को नुकसान से बचाने के लिए बाजरे के पौधों के पास हर्बिसाइड्स का उपयोग करते समय सावधानी बरतें।',
    },
    '5h9yru0l': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'ca4v8je8': {
      'en':
          'Pearl millet is relatively resistant to pests and diseases but can still be affected by pests like aphids, stem borers, and diseases like downy mildew and rust. Monitor the crop regularly for signs of pest and disease damage and take appropriate action if needed. Integrated pest management (IPM) practices, such as planting resistant varieties and promoting beneficial insects, can help manage pest and disease pressure. In severe cases, insecticides and fungicides may be necessary, but use them judiciously and follow label instructions.',
      'hi':
          'मोती बाजरा कीटों और बीमारियों के लिए अपेक्षाकृत प्रतिरोधी है, लेकिन फिर भी एफिड्स, स्टेम बोरर जैसे कीटों और डाउनी फफूंदी और जंग जैसी बीमारियों से प्रभावित हो सकता है। कीट और रोग क्षति के संकेतों के लिए फसल की नियमित रूप से निगरानी करें और यदि आवश्यक हो तो उचित कार्रवाई करें। एकीकृत कीट प्रबंधन (आईपीएम) प्रथाएँ, जैसे कि प्रतिरोधी किस्मों को लगाना और लाभकारी कीटों को बढ़ावा देना, कीट और रोग के दबाव को प्रबंधित करने में मदद कर सकता है। गंभीर मामलों में, कीटनाशक और कवकनाशी आवश्यक हो सकते हैं, लेकिन उनका विवेकपूर्ण तरीके से उपयोग करें और लेबल निर्देशों का पालन करें।',
    },
    'b0kz34mb': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'sx7i3xuk': {
      'en':
          'Harvest pearl millet when the grains are fully mature and the seed heads have turned golden brown. Timing of harvest depends on factors like variety, weather conditions, and intended use. Use a combine harvester equipped with a grain head attachment to harvest the millet. After harvesting, thresh the grain to separate it from the chaff. Dry the harvested grain to a safe moisture level for storage, typically around 12%. Store the grain in clean, dry bins or containers to protect it from moisture and pests until it\'s ready for use.',
      'hi':
          'जब बाजरे के दाने पूरी तरह पक जाएं और बीज के सिरे सुनहरे भूरे रंग के हो जाएं, तब बाजरे की कटाई करें। कटाई का समय किस्म, मौसम की स्थिति और इच्छित उपयोग जैसे कारकों पर निर्भर करता है। बाजरे की कटाई के लिए अनाज के सिरे से जुड़ी हुई कंबाइन हार्वेस्टर का उपयोग करें। कटाई के बाद, अनाज को भूसे से अलग करने के लिए उसे थ्रेस करें। कटे हुए अनाज को भंडारण के लिए सुरक्षित नमी के स्तर तक सुखाएं, आमतौर पर लगभग 12%। अनाज को नमी और कीटों से बचाने के लिए साफ, सूखे डिब्बों या कंटेनरों में तब तक स्टोर करें जब तक कि वह उपयोग के लिए तैयार न हो जाए।',
    },
    '2gmroxcm': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Soybean
  {
    'hq5xft6k': {
      'en': 'Soybean',
      'hi': 'सोयाबीन',
    },
    '5vpw6kft': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'zne65lq5': {
      'en': 'June to July | October to November',
      'hi': 'जून से जुलाई | अक्टूबर से नवंबर',
    },
    'gf7mrkyq': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    '8qc3g69p': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    '8ylc1pqf': {
      'en':
          'Begin your soybean crop with quality seeds from reputable suppliers. Select seeds adapted to your local climate and soil conditions, considering factors such as maturity group and disease resistance. Look for seeds that are uniform in size, free from damage, and treated with fungicides and insecticides for protection against pests and diseases.',
      'hi':
          'अपनी सोयाबीन की फसल की शुरुआत प्रतिष्ठित आपूर्तिकर्ताओं से गुणवत्ता वाले बीजों से करें। परिपक्वता समूह और रोग प्रतिरोधकता जैसे कारकों को ध्यान में रखते हुए, अपने स्थानीय जलवायु और मिट्टी की स्थितियों के अनुकूल बीजों का चयन करें। ऐसे बीजों की तलाश करें जो आकार में एक समान हों, क्षति से मुक्त हों, और कीटों और बीमारियों से सुरक्षा के लिए कवकनाशी और कीटनाशकों से उपचारित हों।',
    },
    'fz4nv5iq': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    'qnwjynhe': {
      'en':
          'Soybeans require consistent moisture for optimal growth, especially during critical growth stages like flowering and pod development. Monitor soil moisture levels and irrigate as needed to ensure adequate water supply, particularly during dry periods. Aim to keep the soil evenly moist but avoid waterlogging, which can lead to root rot and other diseases.',
      'hi':
          'सोयाबीन को इष्टतम विकास के लिए लगातार नमी की आवश्यकता होती है, खासकर फूल आने और फली बनने जैसे महत्वपूर्ण विकास चरणों के दौरान। मिट्टी की नमी के स्तर की निगरानी करें और आवश्यकतानुसार सिंचाई करें ताकि पर्याप्त पानी की आपूर्ति सुनिश्चित हो सके, खासकर शुष्क अवधि के दौरान। मिट्टी को समान रूप से नम रखने का लक्ष्य रखें लेकिन जलभराव से बचें, जिससे जड़ सड़न और अन्य बीमारियाँ हो सकती हैं।',
    },
    '2defwfr7': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'bcgofkyt': {
      'en':
          'Weeds can compete with soybeans for nutrients, water, and sunlight, so effective weed control is essential. Apply pre-emergence herbicides before planting to prevent weed germination. Post-emergence herbicides can be used to target weeds that have already emerged. Mechanical methods such as cultivation or hoeing can also help control weeds. Be cautious when using herbicides near soybean plants to avoid crop injury.',
      'hi':
          'खरपतवार सोयाबीन के साथ पोषक तत्वों, पानी और सूरज की रोशनी के लिए प्रतिस्पर्धा कर सकते हैं, इसलिए प्रभावी खरपतवार नियंत्रण आवश्यक है। खरपतवार के अंकुरण को रोकने के लिए रोपण से पहले प्री-इमर्जेंस हर्बिसाइड्स का प्रयोग करें। पोस्ट-इमर्जेंस हर्बिसाइड्स का उपयोग उन खरपतवारों को लक्षित करने के लिए किया जा सकता है जो पहले ही उग चुके हैं। खेती या कुदाल चलाने जैसी यांत्रिक विधियाँ भी खरपतवारों को नियंत्रित करने में मदद कर सकती हैं। फसल को नुकसान से बचाने के लिए सोयाबीन के पौधों के पास हर्बिसाइड्स का उपयोग करते समय सावधानी बरतें।',
    },
    'beraw1rr': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    '9bsaofwr': {
      'en':
          'Soybeans are susceptible to pests like soybean aphids, bean leaf beetles, and diseases such as soybean cyst nematode, brown spot, and sudden death syndrome. Monitor the crop regularly for signs of pest and disease damage and take appropriate action if needed. Integrated pest management (IPM) practices, such as planting resistant varieties and using biological control agents, can help manage pest and disease pressure. In severe cases, insecticides and fungicides may be necessary, but use them judiciously and follow label instructions.',
      'hi':
          'सोयाबीन सोयाबीन एफिड्स, बीन लीफ बीटल जैसे कीटों और सोयाबीन सिस्ट नेमाटोड, ब्राउन स्पॉट और अचानक मृत्यु सिंड्रोम जैसी बीमारियों के प्रति संवेदनशील है। कीट और रोग क्षति के संकेतों के लिए फसल की नियमित रूप से निगरानी करें और यदि आवश्यक हो तो उचित कार्रवाई करें। एकीकृत कीट प्रबंधन (आईपीएम) अभ्यास, जैसे कि प्रतिरोधी किस्मों को लगाना और जैविक नियंत्रण एजेंटों का उपयोग करना, कीट और रोग के दबाव को प्रबंधित करने में मदद कर सकता है। गंभीर मामलों में, कीटनाशक और कवकनाशी आवश्यक हो सकते हैं, लेकिन उनका विवेकपूर्ण तरीके से उपयोग करें और लेबल निर्देशों का पालन करें।',
    },
    '8t30gagp': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'tu5p11wg': {
      'en':
          'Harvest soybeans when the pods are fully mature and the seeds have reached their maximum size and moisture content. Timing of harvest depends on factors like variety, weather conditions, and intended use. Use a combine harvester equipped with a soybean header to harvest the crop. After harvesting, dry the soybeans to a safe moisture level for storage, typically around 13%. Store the harvested soybeans in clean, dry bins or silos to protect them from moisture and pests until they\'re ready for sale or use.',
      'hi':
          'सोयाबीन की कटाई तब करें जब फलियाँ पूरी तरह से पक जाएँ और बीज अपने अधिकतम आकार और नमी की मात्रा तक पहुँच जाएँ। कटाई का समय किस्म, मौसम की स्थिति और इच्छित उपयोग जैसे कारकों पर निर्भर करता है। फसल की कटाई के लिए सोयाबीन हेडर से सुसज्जित कंबाइन हार्वेस्टर का उपयोग करें। कटाई के बाद, सोयाबीन को भंडारण के लिए सुरक्षित नमी के स्तर तक सुखाएँ, आमतौर पर लगभग 13%। कटाई की गई सोयाबीन को नमी और कीटों से बचाने के लिए साफ, सूखे डिब्बों या साइलो में तब तक स्टोर करें जब तक कि वे बिक्री या उपयोग के लिए तैयार न हो जाएँ।',
    },
    'b2b02yno': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // GreenPeas
  {
    's4gdwyn3': {
      'en': 'Green Peas',
      'hi': 'हरे मटर',
    },
    'zgvt6o51': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'fnxt6yul': {
      'en': 'October to November | June - August',
      'hi': 'अक्टूबर से नवंबर | जून - अगस्त',
    },
    'zzneebce': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    '0ek2ir5b': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'yu18f5k0': {
      'en':
          'When selecting seeds for growing green peas, it\'s crucial to consider factors like variety selection and seed quality. Different varieties, such as Alaska, Green Arrow, and Little Marvel, offer various traits suited to different climates and preferences. Examining seed quality is equally important; choose seeds that are plump, firm, and free from damage or disease, ensuring optimal germination and healthy plant development. Always check the information provided on the seed packet for details on germination rates and specific growing requirements, guiding you towards the best choice for your garden.',
      'hi':
          'हरी मटर उगाने के लिए बीज चुनते समय, किस्म के चयन और बीज की गुणवत्ता जैसे कारकों पर विचार करना महत्वपूर्ण है। अलास्का, ग्रीन एरो और लिटिल मार्वल जैसी विभिन्न किस्में अलग-अलग जलवायु और वरीयताओं के अनुकूल विभिन्न गुण प्रदान करती हैं। बीज की गुणवत्ता की जांच करना भी उतना ही महत्वपूर्ण है; ऐसे बीज चुनें जो मोटे, दृढ़ और क्षति या बीमारी से मुक्त हों, जिससे इष्टतम अंकुरण और स्वस्थ पौधे का विकास सुनिश्चित हो। अंकुरण दरों और विशिष्ट बढ़ती आवश्यकताओं के विवरण के लिए हमेशा बीज पैकेट पर दी गई जानकारी की जाँच करें, जो आपको आपके बगीचे के लिए सबसे अच्छे विकल्प की ओर ले जाएगा।',
    },
    'xzup3xwc': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    'u0j4fu2q': {
      'en':
          'Successful pea cultivation relies on proper water management techniques to ensure consistent moisture levels without waterlogging the soil. Implementing regular, even watering, aiming for about 1 inch per week, either through rainfall or irrigation, is crucial, especially during flowering and pod development stages. Direct water at the base of plants to avoid wetting foliage, which can lead to fungal diseases. Utilizing organic mulches, like straw or shredded leaves, helps retain soil moisture, suppress weeds, and regulate soil temperature, further supporting healthy pea growth throughout the season.',
      'hi':
          'मटर की सफल खेती के लिए उचित जल प्रबंधन तकनीकों पर निर्भर रहना पड़ता है, ताकि मिट्टी में जलभराव न हो और नमी का स्तर बना रहे। नियमित रूप से, समान रूप से पानी देना, प्रति सप्ताह लगभग 1 इंच पानी देना, चाहे बारिश के माध्यम से हो या सिंचाई के माध्यम से, विशेष रूप से फूल आने और फली के विकास के चरणों के दौरान महत्वपूर्ण है। पत्तियों को गीला होने से बचाने के लिए पौधों के आधार पर सीधे पानी डालें, जिससे फंगल रोग हो सकते हैं। पुआल या कटे हुए पत्तों जैसे जैविक मल्च का उपयोग करने से मिट्टी की नमी को बनाए रखने, खरपतवारों को दबाने और मिट्टी के तापमान को नियंत्रित करने में मदद मिलती है, जिससे पूरे मौसम में मटर की स्वस्थ वृद्धि को बढ़ावा मिलता है।',
    },
    'judc6rvw': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'tjnftpsn': {
      'en':
          'Effective weed control is essential to prevent competition for nutrients, water, and sunlight, which can hamper pea growth and yield. Employing methods such as mulching, hand weeding, and cultivation helps keep weed pressure at bay. Apply organic mulches around pea plants to smother weeds and maintain soil moisture, while regular hand weeding ensures the removal of weeds as they emerge, preventing seed production and future weed problems. Careful cultivation with a hoe or cultivator disrupts weed growth and exposes weed seedlings to drying air and sunlight, further minimizing weed ',
      'hi':
          'पोषक तत्वों, पानी और सूरज की रोशनी के लिए प्रतिस्पर्धा को रोकने के लिए प्रभावी खरपतवार नियंत्रण आवश्यक है, जो मटर की वृद्धि और उपज को बाधित कर सकता है। मल्चिंग, हाथ से निराई और खेती जैसे तरीकों को अपनाने से खरपतवार के दबाव को दूर रखने में मदद मिलती है। खरपतवारों को दबाने और मिट्टी की नमी बनाए रखने के लिए मटर के पौधों के चारों ओर जैविक मल्च लगाएं, जबकि नियमित रूप से हाथ से निराई करने से खरपतवारों के उगने के साथ ही उन्हें हटा दिया जाता है, जिससे बीज उत्पादन और भविष्य में खरपतवार की समस्याएँ नहीं होती हैं। कुदाल या कल्टीवेटर से सावधानीपूर्वक खेती करने से खरपतवार की वृद्धि बाधित होती है और खरपतवार के पौधे शुष्क हवा और सूरज की रोशनी के संपर्क में आते हैं, जिससे खरपतवार कम होते हैं',
    },
    'rjps1usv': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'qzm1u6e6': {
      'en':
          'Managing pests and diseases is critical to safeguarding pea plants and ensuring a healthy harvest. Integrated pest management (IPM) strategies involve monitoring, cultural practices, and the use of natural predators and organic sprays. Regularly inspect plants for signs of pest infestation or disease symptoms, implementing cultural practices like crop rotation to disrupt pest life cycles. Encourage beneficial insects, such as ladybugs and lacewings, which prey on common pests like aphids, and utilize organic sprays like insecticidal soap or neem oil to manage pest and disease outbreaks effectively while minimizing harm to beneficial organisms and the environment.',
      'hi':
          'मटर के पौधों की सुरक्षा और स्वस्थ फसल सुनिश्चित करने के लिए कीटों और बीमारियों का प्रबंधन करना महत्वपूर्ण है। एकीकृत कीट प्रबंधन (आईपीएम) रणनीतियों में निगरानी, ​​सांस्कृतिक अभ्यास और प्राकृतिक शिकारियों और जैविक स्प्रे का उपयोग शामिल है। कीटों के संक्रमण या बीमारी के लक्षणों के लिए पौधों का नियमित रूप से निरीक्षण करें, कीटों के जीवन चक्र को बाधित करने के लिए फसल चक्रण जैसी सांस्कृतिक प्रथाओं को लागू करें। लाभकारी कीटों, जैसे कि लेडीबग्स और लेसविंग्स को प्रोत्साहित करें, जो एफिड्स जैसे सामान्य कीटों का शिकार करते हैं, और लाभकारी जीवों और पर्यावरण को होने वाले नुकसान को कम करते हुए कीट और बीमारी के प्रकोप को प्रभावी ढंग से प्रबंधित करने के लिए कीटनाशक साबुन या नीम के तेल जैसे जैविक स्प्रे का उपयोग करें।',
    },
    '9l0wjoa4': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'ahw7afoz': {
      'en':
          'Knowing when and how to harvest green peas is crucial for optimal flavor and texture. Harvest peas when pods are plump, well-filled, and still tender, avoiding overripeness, which can result in toughness. Use a gentle snapping motion to pick pods from the vine, being careful not to damage the plant. Harvest regularly, every couple of days during peak season, to encourage continued pod production. Proper storage, either in the refrigerator for short-term use or by blanching and freezing for longer-term storage, preserves the freshness and quality of harvested peas, allowing you to enjoy their delicious flavor throughout the year.',
      'hi':
          'हरी मटर की कटाई कब और कैसे करनी है, यह जानना बेहतरीन स्वाद और बनावट के लिए बहुत ज़रूरी है। मटर की फ़सल तब काटें जब फलियाँ फूली हुई, अच्छी तरह भरी हुई और अभी भी कोमल हों, ज़्यादा पकने से बचें, जिससे वे सख्त हो सकती हैं। बेल से फलियाँ तोड़ने के लिए हल्के से झटके से हिलाएँ, ध्यान रखें कि पौधे को नुकसान न पहुँचे। नियमित रूप से कटाई करें, पीक सीज़न के दौरान हर दो दिन में, ताकि फलियाँ लगातार बनती रहें। उचित भंडारण, चाहे थोड़े समय के लिए रेफ्रिजरेटर में या लंबे समय तक भंडारण के लिए ब्लैंचिंग और फ़्रीज़िंग द्वारा, कटी हुई मटर की ताज़गी और गुणवत्ता को बनाए रखता है, जिससे आप पूरे साल उनके स्वादिष्ट स्वाद का आनंद ले सकते हैं।',
    },
    'xhy4jnjp': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Apple
  {
    'kwv8xz25': {
      'en': 'Apple',
      'hi': 'सेब',
    },
    'jnvued16': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'jz2ddfco': {
      'en': 'January and February | September-October',
      'hi': 'जनवरी और फरवरी | सितंबर-अक्टूबर',
    },
    '87qn484h': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'aqiw0330': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'h7z3dm2s': {
      'en':
          'Selecting high-quality apple tree saplings is crucial for establishing a healthy orchard. Consider factors such as apple variety, rootstock, and tree health when choosing saplings. Varieties like Granny Smith, Gala, and Fuji offer a range of flavors and uses, so select varieties suited to your climate and taste preferences. Pay attention to the rootstock, as it can affect tree size, vigor, and resistance to certain diseases. Look for saplings with well-developed root systems, straight trunks, and healthy foliage, avoiding those with signs of damage, disease, or stress. Purchasing saplings from reputable nurseries or suppliers ensures you receive quality trees that will thrive in your orchard.',
      'hi':
          'स्वस्थ बाग़ की स्थापना के लिए उच्च गुणवत्ता वाले सेब के पेड़ के पौधे चुनना महत्वपूर्ण है। पौधे चुनते समय सेब की किस्म, रूटस्टॉक और पेड़ के स्वास्थ्य जैसे कारकों पर विचार करें। ग्रैनी स्मिथ, गाला और फ़ूजी जैसी किस्में कई तरह के स्वाद और उपयोग प्रदान करती हैं, इसलिए अपनी जलवायु और स्वाद वरीयताओं के अनुकूल किस्मों का चयन करें। रूटस्टॉक पर ध्यान दें, क्योंकि यह पेड़ के आकार, शक्ति और कुछ बीमारियों के प्रति प्रतिरोध को प्रभावित कर सकता है। अच्छी तरह से विकसित जड़ प्रणाली, सीधे तने और स्वस्थ पत्ते वाले पौधे चुनें, नुकसान, बीमारी या तनाव के संकेत वाले पौधों से बचें। प्रतिष्ठित नर्सरियों या आपूर्तिकर्ताओं से पौधे खरीदना सुनिश्चित करता है कि आपको गुणवत्ता वाले पेड़ मिलेंगे जो आपके बाग़ में पनपेंगे।',
    },
    'gbsptk57': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    '4xcnak39': {
      'en':
          'Proper water management is essential for the growth and productivity of apple trees. Newly planted saplings require regular watering to establish their root systems, while mature trees benefit from deep, infrequent watering during dry periods. Provide about 1 to 2 inches of water per week, either through rainfall or irrigation, ensuring the soil remains consistently moist but not waterlogged. Avoid overhead watering, as wet foliage can promote fungal diseases. Apply mulch around the base of the trees to retain soil moisture, suppress weeds, and regulate soil temperature, creating optimal growing conditions for apple trees.',
      'hi':
          'सेब के पेड़ों की वृद्धि और उत्पादकता के लिए उचित जल प्रबंधन आवश्यक है। नए लगाए गए पौधों को अपनी जड़ प्रणाली स्थापित करने के लिए नियमित रूप से पानी देने की आवश्यकता होती है, जबकि परिपक्व पेड़ों को शुष्क अवधि के दौरान गहरी, कम बार पानी देने से लाभ होता है। प्रति सप्ताह लगभग 1 से 2 इंच पानी दें, या तो वर्षा या सिंचाई के माध्यम से, यह सुनिश्चित करते हुए कि मिट्टी लगातार नम रहे लेकिन जलभराव न हो। ऊपर से पानी देने से बचें, क्योंकि गीले पत्ते फंगल रोगों को बढ़ावा दे सकते हैं। मिट्टी की नमी बनाए रखने, खरपतवारों को दबाने और मिट्टी के तापमान को नियंत्रित करने के लिए पेड़ों के आधार के चारों ओर गीली घास लगाएं, जिससे सेब के पेड़ों के लिए इष्टतम बढ़ती परिस्थितियाँ बनती हैं।',
    },
    'n6913geu': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'sr2k16rp': {
      'en':
          'Weed control is vital for maintaining the health and productivity of apple orchards. Mulching around the base of apple trees helps suppress weed growth, retain soil moisture, and improve soil structure. Regularly inspect orchards for weeds and remove them promptly to prevent competition for resources. Cultivate the soil carefully around apple trees to disrupt weed growth and expose weed seedlings to drying air and sunlight. Utilize herbicides sparingly and selectively, following label instructions and guidelines to minimize environmental impact and protect apple trees from herbicide damage.',
      'hi':
          'सेब के बागों के स्वास्थ्य और उत्पादकता को बनाए रखने के लिए खरपतवार नियंत्रण महत्वपूर्ण है। सेब के पेड़ों के आधार के चारों ओर मल्चिंग करने से खरपतवार की वृद्धि को रोकने, मिट्टी की नमी को बनाए रखने और मिट्टी की संरचना में सुधार करने में मदद मिलती है। खरपतवारों के लिए बागों का नियमित रूप से निरीक्षण करें और संसाधनों के लिए प्रतिस्पर्धा को रोकने के लिए उन्हें तुरंत हटा दें। खरपतवार की वृद्धि को बाधित करने और खरपतवार के पौधों को शुष्क हवा और धूप के संपर्क में लाने के लिए सेब के पेड़ों के चारों ओर मिट्टी की सावधानीपूर्वक जुताई करें। पर्यावरणीय प्रभाव को कम करने और सेब के पेड़ों को खरपतवारनाशकों से होने वाले नुकसान से बचाने के लिए लेबल निर्देशों और दिशानिर्देशों का पालन करते हुए, शाकनाशियों का संयम से और चुनिंदा रूप से उपयोग करें।',
    },
    'w2tgr2w8': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    '8qvkex35': {
      'en':
          'Managing pests and diseases is essential for preventing damage to apple trees and ensuring a successful harvest. Integrated pest management (IPM) strategies involve monitoring, cultural practices, and the use of biological controls and targeted sprays. Regularly monitor apple trees for signs of pest infestation or disease symptoms, such as insect damage, leaf discoloration, or fungal growth. Implement cultural practices like pruning, sanitation, and proper orchard hygiene to reduce pest and disease pressure. Use biological controls such as beneficial insects and predatory mites to manage pests naturally, and apply targeted sprays of insecticides or fungicides when necessary, following label instructions and safety precautions.',
      'hi':
          'सेब के पेड़ों को होने वाले नुकसान को रोकने और सफल फसल सुनिश्चित करने के लिए कीटों और बीमारियों का प्रबंधन करना आवश्यक है। एकीकृत कीट प्रबंधन (आईपीएम) रणनीतियों में निगरानी, ​​सांस्कृतिक अभ्यास और जैविक नियंत्रण और लक्षित स्प्रे का उपयोग शामिल है। कीट संक्रमण या रोग के लक्षणों, जैसे कि कीट क्षति, पत्ती का रंग उड़ना या फफूंद वृद्धि के संकेतों के लिए सेब के पेड़ों की नियमित निगरानी करें। कीट और रोग के दबाव को कम करने के लिए छंटाई, स्वच्छता और उचित बाग़ की स्वच्छता जैसी सांस्कृतिक प्रथाओं को लागू करें। कीटों को प्राकृतिक रूप से प्रबंधित करने के लिए लाभकारी कीटों और शिकारी घुनों जैसे जैविक नियंत्रणों का उपयोग करें और लेबल निर्देशों और सुरक्षा सावधानियों का पालन करते हुए, आवश्यक होने पर कीटनाशकों या कवकनाशी के लक्षित स्प्रे लागू करें।',
    },
    '5hm3n50l': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'yw260951': {
      'en':
          'Harvesting apples at the right time is essential for optimal flavor, texture, and storage quality. Determine ripeness by color, firmness, and flavor, and conduct a taste test to ensure apples are ready for harvest. Use a gentle twisting motion to pick apples from the tree, being careful not to damage the fruit or branches. Harvest apples regularly as they ripen, checking trees every few days during peak season. Proper storage, in a cool, dark, and humid environment, prolongs the shelf life of harvested apples, allowing you to enjoy them fresh or processed into delicious apple products throughout the year.',
      'hi':
          'सेबों की सही समय पर कटाई करना, उनके स्वाद, बनावट और भंडारण की गुणवत्ता के लिए ज़रूरी है। रंग, दृढ़ता और स्वाद के आधार पर सेबों की परिपक्वता का निर्धारण करें और यह सुनिश्चित करने के लिए स्वाद परीक्षण करें कि सेब कटाई के लिए तैयार हैं। सेबों को पेड़ से तोड़ने के लिए हल्के से घुमाएँ, ध्यान रखें कि फलों या शाखाओं को नुकसान न पहुँचे। सेबों के पकने के समय नियमित रूप से कटाई करें, पीक सीज़न के दौरान हर कुछ दिनों में पेड़ों की जाँच करें। ठंडे, अंधेरे और नम वातावरण में उचित भंडारण, काटे गए सेबों की शेल्फ लाइफ़ को बढ़ाता है, जिससे आप उन्हें पूरे साल ताज़ा या स्वादिष्ट सेब उत्पादों में संसाधित करके खा सकते हैं।',
    },
    'kkh2902b': {
      'en': 'Apple Yield per Acre:',
      'hi': 'प्रति एकड़ सेब की उपज:',
    },
    'eof2y84y': {
      'en':
          'The yield of apples per acre varies depending on factors such as apple variety, orchard density, soil fertility, climate, and management practices. On average, an acre of apple orchard can produce between 15,000 and 25,000 pounds of apples per year, although yields may fluctuate based on specific growing conditions and other variables. By implementing best practices for orchard management, including proper tree selection, water management, weed control, pest and disease management, and harvesting techniques, you can maximize the yield and quality of your apple crop, ensuring a bountiful harvest for years to come.',
      'hi':
          'प्रति एकड़ सेब की उपज सेब की किस्म, बाग की सघनता, मिट्टी की उर्वरता, जलवायु और प्रबंधन प्रथाओं जैसे कारकों के आधार पर भिन्न होती है। औसतन, एक एकड़ सेब के बाग में प्रति वर्ष 15,000 से 25,000 पाउंड सेब का उत्पादन हो सकता है, हालांकि विशिष्ट बढ़ती परिस्थितियों और अन्य चर के आधार पर उपज में उतार-चढ़ाव हो सकता है। उचित वृक्ष चयन, जल प्रबंधन, खरपतवार नियंत्रण, कीट और रोग प्रबंधन, और कटाई तकनीकों सहित बाग प्रबंधन के लिए सर्वोत्तम प्रथाओं को लागू करके, आप अपनी सेब की फसल की उपज और गुणवत्ता को अधिकतम कर सकते हैं, जिससे आने वाले वर्षों के लिए भरपूर फसल सुनिश्चित होगी।',
    },
    '34b9yrkh': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Orange
  {
    '7v8iwpyx': {
      'en': 'Orange',
      'hi': 'नारंगी',
    },
    'xzmy2ga9': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'k4klu7kq': {
      'en': 'January and February | September-October',
      'hi': 'जनवरी और फरवरी | सितंबर-अक्टूबर',
    },
    'f81i43j1': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'xm82qkg8': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'apaj2a49': {
      'en':
          'Selecting high-quality orange tree saplings is crucial for establishing a thriving orchard. When choosing saplings, consider factors such as orange variety, rootstock compatibility, and overall tree health. Varieties like Valencia, Navel, and Blood oranges offer diverse flavors and characteristics, so choose varieties suited to your climate and preferences. Pay attention to the rootstock, as it influences tree size, vigor, and adaptability to soil conditions. Look for saplings with well-developed root systems, straight trunks, and healthy foliage, while avoiding those with signs of disease, pest damage, or stress. Purchasing saplings from reputable nurseries ensures you receive quality trees that will flourish in your orchard.',
      'hi':
          'एक समृद्ध बाग़ की स्थापना के लिए उच्च गुणवत्ता वाले संतरे के पेड़ के पौधे चुनना महत्वपूर्ण है। पौधे चुनते समय, संतरे की किस्म, रूटस्टॉक संगतता और समग्र पेड़ के स्वास्थ्य जैसे कारकों पर विचार करें। वैलेंसिया, नावेल और ब्लड ऑरेंज जैसी किस्में विविध स्वाद और विशेषताएँ प्रदान करती हैं, इसलिए अपनी जलवायु और वरीयताओं के अनुकूल किस्मों का चयन करें। रूटस्टॉक पर ध्यान दें, क्योंकि यह पेड़ के आकार, शक्ति और मिट्टी की स्थितियों के अनुकूलता को प्रभावित करता है। अच्छी तरह से विकसित जड़ प्रणाली, सीधे तने और स्वस्थ पत्ते वाले पौधे चुनें, जबकि बीमारी, कीट क्षति या तनाव के लक्षण वाले पौधों से बचें। प्रतिष्ठित नर्सरियों से पौधे खरीदना सुनिश्चित करता है कि आपको गुणवत्ता वाले पेड़ मिलेंगे जो आपके बाग़ में पनपेंगे।',
    },
    '380mqq3u': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    '545n367u': {
      'en':
          'Effective water management is essential for the growth and productivity of orange trees. Newly planted saplings require regular watering to establish their root systems, while mature trees benefit from deep, infrequent watering during dry spells. Provide about 1 to 2 inches of water per week, either through rainfall or irrigation, ensuring the soil remains consistently moist but not waterlogged. Avoid wetting the foliage during watering, as this can promote fungal diseases. Apply organic mulch around the base of orange trees to retain soil moisture, suppress weed growth, and regulate soil temperature, creating optimal growing conditions for oranges.',
      'hi':
          'संतरे के पेड़ों की वृद्धि और उत्पादकता के लिए प्रभावी जल प्रबंधन आवश्यक है। नए लगाए गए पौधों को अपनी जड़ प्रणाली स्थापित करने के लिए नियमित रूप से पानी देने की आवश्यकता होती है, जबकि परिपक्व पेड़ों को सूखे के दौरान गहरी, कम बार पानी देने से लाभ होता है। प्रति सप्ताह लगभग 1 से 2 इंच पानी दें, या तो वर्षा या सिंचाई के माध्यम से, यह सुनिश्चित करते हुए कि मिट्टी लगातार नम रहे लेकिन जलभराव न हो। पानी देने के दौरान पत्तियों को गीला करने से बचें, क्योंकि इससे फंगल रोग हो सकते हैं। मिट्टी की नमी बनाए रखने, खरपतवार की वृद्धि को रोकने और मिट्टी के तापमान को नियंत्रित करने के लिए संतरे के पेड़ों के आधार के चारों ओर जैविक गीली घास लगाएं, जिससे संतरे के लिए इष्टतम बढ़ती परिस्थितियाँ बनती हैं।',
    },
    'h4agavhp': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    '5s6yh74u': {
      'en':
          'Weed control is crucial for maintaining the health and productivity of orange orchards. Mulching around the base of orange trees helps suppress weed growth, retain soil moisture, and improve soil structure. Regularly inspect orchards for weeds and remove them promptly to prevent competition for resources. Cultivate the soil carefully around orange trees to disrupt weed growth and expose weed seedlings to drying air and sunlight. Utilize herbicides selectively and judiciously, following label instructions and guidelines to minimize environmental impact and protect orange trees from herbicide damage.',
      'hi':
          'संतरे के बागों के स्वास्थ्य और उत्पादकता को बनाए रखने के लिए खरपतवार नियंत्रण बहुत ज़रूरी है। संतरे के पेड़ों के आधार के चारों ओर मल्चिंग करने से खरपतवार की वृद्धि को रोकने, मिट्टी की नमी को बनाए रखने और मिट्टी की संरचना में सुधार करने में मदद मिलती है। खरपतवारों के लिए बागों का नियमित रूप से निरीक्षण करें और संसाधनों के लिए प्रतिस्पर्धा को रोकने के लिए उन्हें तुरंत हटा दें। खरपतवार की वृद्धि को बाधित करने और खरपतवार के पौधों को शुष्क हवा और सूरज की रोशनी के संपर्क में लाने के लिए संतरे के पेड़ों के चारों ओर मिट्टी की सावधानीपूर्वक जुताई करें। पर्यावरणीय प्रभाव को कम करने और संतरे के पेड़ों को खरपतवारनाशकों से होने वाले नुकसान से बचाने के लिए लेबल निर्देशों और दिशानिर्देशों का पालन करते हुए, चुनिंदा और विवेकपूर्ण तरीके से शाकनाशियों का उपयोग करें।',
    },
    'clndz4ms': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    '0byvtbx7': {
      'en':
          'Managing pests and diseases is vital for preventing damage to orange trees and ensuring a successful harvest. Integrated pest management (IPM) strategies involve monitoring, cultural practices, and the use of biological controls and targeted sprays. Regularly monitor orange trees for signs of pest infestation or disease symptoms, such as insect damage, leaf discoloration, or fungal growth. Implement cultural practices like pruning, sanitation, and proper orchard hygiene to reduce pest and disease pressure. Use biological controls such as beneficial insects and predatory mites to manage pests naturally, and apply targeted sprays of insecticides or fungicides when necessary, following label instructions and safety precautions.',
      'hi':
          'संतरे के पेड़ों को होने वाले नुकसान को रोकने और सफल फसल सुनिश्चित करने के लिए कीटों और बीमारियों का प्रबंधन करना महत्वपूर्ण है। एकीकृत कीट प्रबंधन (आईपीएम) रणनीतियों में निगरानी, ​​सांस्कृतिक अभ्यास और जैविक नियंत्रण और लक्षित स्प्रे का उपयोग शामिल है। कीटों के संक्रमण या बीमारी के लक्षणों, जैसे कि कीट क्षति, पत्ती का रंग उड़ना या फफूंद वृद्धि के संकेतों के लिए नियमित रूप से संतरे के पेड़ों की निगरानी करें। कीट और बीमारी के दबाव को कम करने के लिए छंटाई, सफाई और उचित बाग़ की स्वच्छता जैसी सांस्कृतिक प्रथाओं को लागू करें। कीटों को प्राकृतिक रूप से प्रबंधित करने के लिए लाभकारी कीटों और शिकारी घुनों जैसे जैविक नियंत्रणों का उपयोग करें और लेबल निर्देशों और सुरक्षा सावधानियों का पालन करते हुए, आवश्यक होने पर कीटनाशकों या कवकनाशी के लक्षित स्प्रे लागू करें।',
    },
    'auni1jxr': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'iwgz71el': {
      'en':
          'Harvesting oranges at the right time is crucial for optimal flavor, juiciness, and storage quality. Determine ripeness by color, aroma, and taste, as well as by conducting a firmness test. Use pruning shears or clippers to harvest oranges, leaving a small stem attached to the fruit. Harvest oranges regularly as they ripen, checking trees every few days during peak season. Proper storage in a cool, dry, and ventilated environment prolongs the shelf life of harvested oranges, allowing you to enjoy them fresh or processed into various orange products throughout the year.',
      'hi':
          'संतरे की सही समय पर कटाई करना, बेहतरीन स्वाद, रस और भंडारण गुणवत्ता के लिए महत्वपूर्ण है। रंग, सुगंध और स्वाद के साथ-साथ दृढ़ता परीक्षण करके पकने का निर्धारण करें। संतरे की कटाई करने के लिए प्रूनिंग कैंची या क्लिपर का उपयोग करें, फल से जुड़ा एक छोटा तना छोड़ दें। संतरे के पकने पर नियमित रूप से कटाई करें, पीक सीजन के दौरान हर कुछ दिनों में पेड़ों की जाँच करें। ठंडे, सूखे और हवादार वातावरण में उचित भंडारण से काटे गए संतरे की शेल्फ लाइफ बढ़ जाती है, जिससे आप उन्हें पूरे साल ताजा या विभिन्न संतरे के उत्पादों में संसाधित करके खा सकते हैं।',
    },
    'qdozsxuo': {
      'en': 'Orange Yield per Acre:',
      'hi': 'प्रति एकड़ संतरे की उपज:',
    },
    'jz4d3tjc': {
      'en':
          'The yield of oranges per acre varies depending on factors such as orange variety, orchard density, soil fertility, climate, and management practices. On average, an acre of orange orchard can produce between 250 and 400 boxes of oranges per year, with each box weighing around 40 to 50 pounds. Yields may fluctuate based on specific growing conditions and other variables. By implementing best practices for orchard management, including proper tree selection, water management, weed control, pest and disease management, and harvesting techniques, you can maximize the yield and quality of your orange crop, ensuring a bountiful harvest for years to come.',
      'hi':
          'प्रति एकड़ संतरे की उपज संतरे की किस्म, बाग की सघनता, मिट्टी की उर्वरता, जलवायु और प्रबंधन प्रथाओं जैसे कारकों के आधार पर भिन्न होती है। औसतन, एक एकड़ संतरे के बाग में प्रति वर्ष 250 से 400 बक्से संतरे पैदा हो सकते हैं, जिनमें से प्रत्येक बॉक्स का वजन लगभग 40 से 50 पाउंड होता है। विशिष्ट बढ़ती परिस्थितियों और अन्य चर के आधार पर पैदावार में उतार-चढ़ाव हो सकता है। उचित वृक्ष चयन, जल प्रबंधन, खरपतवार नियंत्रण, कीट और रोग प्रबंधन, और कटाई तकनीकों सहित बाग प्रबंधन के लिए सर्वोत्तम प्रथाओं को लागू करके, आप अपनी संतरे की फसल की उपज और गुणवत्ता को अधिकतम कर सकते हैं, जिससे आने वाले वर्षों के लिए भरपूर फसल सुनिश्चित होगी।',
    },
    'y9f8gtm2': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Mango
  {
    'fen0wz3g': {
      'en': 'Mango',
      'hi': 'आम',
    },
    'vucfxi8d': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'cbvomqsx': {
      'en': 'February-March | June–July',
      'hi': 'फरवरी-मार्च | जून-जुलाई',
    },
    'z2j6rni0': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'pkus4n9m': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'a33zvyjn': {
      'en':
          'Selecting high-quality mango tree saplings is essential for establishing a productive orchard. When choosing saplings, consider factors such as mango variety, rootstock compatibility, and overall tree health. Varieties like Alphonso, Kensington Pride, and Tommy Atkins offer diverse flavors and characteristics, so select varieties suited to your climate and preferences. Pay attention to the rootstock, as it influences tree size, vigor, and adaptability to soil conditions. Look for saplings with well-developed root systems, straight trunks, and healthy foliage, while avoiding those with signs of disease, pest damage, or stress. Purchasing saplings from reputable nurseries ensures you receive quality trees that will thrive in your orchard.',
      'hi':
          'उत्पादक बाग़ की स्थापना के लिए उच्च गुणवत्ता वाले आम के पेड़ के पौधे चुनना ज़रूरी है। पौधे चुनते समय, आम की किस्म, रूटस्टॉक की अनुकूलता और पेड़ के समग्र स्वास्थ्य जैसे कारकों पर विचार करें। अल्फांसो, केंसिंग्टन प्राइड और टॉमी एटकिंस जैसी किस्में अलग-अलग स्वाद और विशेषताएँ प्रदान करती हैं, इसलिए अपनी जलवायु और पसंद के हिसाब से किस्में चुनें। रूटस्टॉक पर ध्यान दें, क्योंकि यह पेड़ के आकार, शक्ति और मिट्टी की स्थितियों के अनुकूलता को प्रभावित करता है। अच्छी तरह से विकसित जड़ प्रणाली, सीधे तने और स्वस्थ पत्ते वाले पौधे चुनें, जबकि बीमारी, कीट क्षति या तनाव के लक्षण वाले पौधों से बचें। प्रतिष्ठित नर्सरियों से पौधे खरीदना सुनिश्चित करता है कि आपको गुणवत्ता वाले पेड़ मिलेंगे जो आपके बाग़ में पनपेंगे।',
    },
    '36i44fgt': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    '0cwdmk0j': {
      'en':
          'Effective water management is crucial for the growth and productivity of mango trees. Newly planted saplings require regular watering to establish their root systems, while mature trees benefit from deep, infrequent watering during dry spells. Provide about 1 to 2 inches of water per week, either through rainfall or irrigation, ensuring the soil remains consistently moist but not waterlogged. Avoid wetting the foliage during watering, as this can promote fungal diseases. Apply organic mulch around the base of mango trees to retain soil moisture, suppress weed growth, and regulate soil temperature, creating optimal growing conditions for mangoes.',
      'hi':
          'आम के पेड़ों की वृद्धि और उत्पादकता के लिए प्रभावी जल प्रबंधन महत्वपूर्ण है। नए लगाए गए पौधों को अपनी जड़ प्रणाली स्थापित करने के लिए नियमित रूप से पानी देने की आवश्यकता होती है, जबकि परिपक्व पेड़ों को सूखे के दौरान गहरी, कम बार पानी देने से लाभ होता है। प्रति सप्ताह लगभग 1 से 2 इंच पानी दें, या तो वर्षा या सिंचाई के माध्यम से, यह सुनिश्चित करते हुए कि मिट्टी लगातार नम रहे लेकिन जलभराव न हो। पानी देने के दौरान पत्तियों को गीला करने से बचें, क्योंकि इससे फंगल रोगों को बढ़ावा मिल सकता है। मिट्टी की नमी बनाए रखने, खरपतवार की वृद्धि को रोकने और मिट्टी के तापमान को नियंत्रित करने के लिए आम के पेड़ों के आधार के चारों ओर जैविक गीली घास लगाएं, जिससे आम के लिए इष्टतम बढ़ती परिस्थितियाँ बनती हैं।',
    },
    'zpk28gon': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'mkhe3oh7': {
      'en':
          'Weed control is vital for maintaining the health and productivity of mango orchards. Mulching around the base of mango trees helps suppress weed growth, retain soil moisture, and improve soil structure. Regularly inspect orchards for weeds and remove them promptly to prevent competition for resources. Cultivate the soil carefully around mango trees to disrupt weed growth and expose weed seedlings to drying air and sunlight. Utilize herbicides selectively and judiciously, following label instructions and guidelines to minimize environmental impact and protect mango trees from herbicide damage.',
      'hi':
          'आम के बागों के स्वास्थ्य और उत्पादकता को बनाए रखने के लिए खरपतवार नियंत्रण बहुत ज़रूरी है। आम के पेड़ों के आधार के चारों ओर मल्चिंग करने से खरपतवार की वृद्धि को रोकने, मिट्टी की नमी को बनाए रखने और मिट्टी की संरचना में सुधार करने में मदद मिलती है। खरपतवारों के लिए बागों का नियमित रूप से निरीक्षण करें और संसाधनों के लिए प्रतिस्पर्धा को रोकने के लिए उन्हें तुरंत हटा दें। खरपतवार की वृद्धि को बाधित करने और खरपतवार के पौधों को शुष्क हवा और सूरज की रोशनी के संपर्क में लाने के लिए आम के पेड़ों के चारों ओर मिट्टी की सावधानीपूर्वक जुताई करें। पर्यावरणीय प्रभाव को कम करने और आम के पेड़ों को खरपतवारनाशकों से होने वाले नुकसान से बचाने के लिए लेबल निर्देशों और दिशानिर्देशों का पालन करते हुए, चुनिंदा और विवेकपूर्ण तरीके से शाकनाशियों का उपयोग करें।',
    },
    '9vinqnfg': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    '6ofbar70': {
      'en':
          'Managing pests and diseases is essential for preventing damage to mango trees and ensuring a successful harvest. Integrated pest management (IPM) strategies involve monitoring, cultural practices, and the use of biological controls and targeted sprays. Regularly monitor mango trees for signs of pest infestation or disease symptoms, such as insect damage, leaf discoloration, or fungal growth. Implement cultural practices like pruning, sanitation, and proper orchard hygiene to reduce pest and disease pressure. Use biological controls such as beneficial insects and predatory mites to manage pests naturally, and apply targeted sprays of insecticides or fungicides when necessary, following label instructions and safety precautions.',
      'hi':
          'आम के पेड़ों को होने वाले नुकसान को रोकने और सफल फसल सुनिश्चित करने के लिए कीटों और बीमारियों का प्रबंधन करना आवश्यक है। एकीकृत कीट प्रबंधन (आईपीएम) रणनीतियों में निगरानी, ​​सांस्कृतिक अभ्यास और जैविक नियंत्रण और लक्षित स्प्रे का उपयोग शामिल है। कीटों के संक्रमण या बीमारी के लक्षणों, जैसे कि कीट क्षति, पत्ती का रंग उड़ना या फफूंद का बढ़ना, के लिए आम के पेड़ों की नियमित निगरानी करें। कीट और बीमारी के दबाव को कम करने के लिए छंटाई, सफाई और उचित बाग़ की स्वच्छता जैसी सांस्कृतिक प्रथाओं को लागू करें। कीटों को प्राकृतिक रूप से प्रबंधित करने के लिए लाभकारी कीटों और शिकारी घुनों जैसे जैविक नियंत्रणों का उपयोग करें और लेबल निर्देशों और सुरक्षा सावधानियों का पालन करते हुए, आवश्यक होने पर कीटनाशकों या कवकनाशी के लक्षित स्प्रे लागू करें।',
    },
    '81g6tyqi': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'vlw12py3': {
      'en':
          'Harvesting mangoes at the right time is crucial for optimal flavor, sweetness, and quality. Determine ripeness by color, aroma, and firmness, as well as by conducting a taste test. Use pruning shears or a pole picker to harvest mangoes, leaving a small stem attached to the fruit. Harvest mangoes regularly as they ripen, checking trees every few days during peak season. Proper storage in a cool, dry, and ventilated environment prolongs the shelf life of harvested mangoes, allowing you to enjoy them fresh or processed into various mango products throughout the year.',
      'hi':
          'आमों की सही समय पर कटाई करना, उनके स्वाद, मिठास और गुणवत्ता के लिए बहुत ज़रूरी है। रंग, सुगंध और दृढ़ता के साथ-साथ स्वाद परीक्षण करके भी पकने का पता लगाएँ। आमों की कटाई करने के लिए प्रूनिंग कैंची या पोल पिकर का इस्तेमाल करें, फल से जुड़ा एक छोटा तना छोड़ दें। आमों के पकने पर नियमित रूप से कटाई करें, पीक सीजन के दौरान हर कुछ दिनों में पेड़ों की जाँच करें। ठंडे, सूखे और हवादार वातावरण में उचित भंडारण से कटे हुए आमों की शेल्फ लाइफ़ बढ़ जाती है, जिससे आप उन्हें पूरे साल ताज़ा या विभिन्न आम उत्पादों में संसाधित करके खा सकते हैं।',
    },
    'f3edq91o': {
      'en': 'Mango Yield per Acre:',
      'hi': 'प्रति एकड़ आम की उपज:',
    },
    'fr6071rf': {
      'en':
          'The yield of mangoes per acre varies depending on factors such as mango variety, orchard density, soil fertility, climate, and management practices. On average, an acre of mango orchard can produce between 2,000 and 4,000 pounds of mangoes per year, with yields influenced by specific growing conditions and other variables. By implementing best practices for orchard management, including proper tree selection, water management, weed control, pest and disease management, and harvesting techniques, you can maximize the yield and quality of your mango crop, ensuring a bountiful harvest for years to come.',
      'hi':
          'प्रति एकड़ आम की उपज आम की किस्म, बाग की सघनता, मिट्टी की उर्वरता, जलवायु और प्रबंधन प्रथाओं जैसे कारकों के आधार पर भिन्न होती है। औसतन, एक एकड़ आम के बाग में प्रति वर्ष 2,000 से 4,000 पाउंड आम का उत्पादन हो सकता है, जिसमें पैदावार विशिष्ट बढ़ती परिस्थितियों और अन्य चरों से प्रभावित होती है। उचित वृक्ष चयन, जल प्रबंधन, खरपतवार नियंत्रण, कीट और रोग प्रबंधन, और कटाई तकनीकों सहित बाग प्रबंधन के लिए सर्वोत्तम प्रथाओं को लागू करके, आप अपनी आम की फसल की उपज और गुणवत्ता को अधिकतम कर सकते हैं, जिससे आने वाले वर्षों के लिए भरपूर फसल सुनिश्चित होगी।',
    },
    'zpqucs4x': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Watermelon
  {
    'gxr0wkjz': {
      'en': 'Watermelon',
      'hi': 'तरबूज',
    },
    '41000zls': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'l7zo3pj0': {
      'en': 'February-March | July and August',
      'hi': 'फरवरी-मार्च | जुलाई और अगस्त',
    },
    'kgpnforz': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'pn6heeee': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'g3zlgdm4': {
      'en':
          'Selecting high-quality watermelon seeds is crucial for a successful harvest. Consider factors such as variety, disease resistance, and seed quality when choosing seeds. Varieties like Crimson Sweet, Sugar Baby, and Charleston Gray offer different sizes, flavors, and maturity dates, so select varieties suited to your climate and preferences. Look for seeds from reputable suppliers or nurseries, ensuring they are fresh, viable, and free from damage or disease. Check the seed packet for information on disease resistance, germination rates, and specific growing requirements, guiding you towards the best choice for your garden.',
      'hi':
          'सफल फसल के लिए उच्च गुणवत्ता वाले तरबूज के बीज चुनना महत्वपूर्ण है। बीज चुनते समय विविधता, रोग प्रतिरोधक क्षमता और बीज की गुणवत्ता जैसे कारकों पर विचार करें। क्रिमसन स्वीट, शुगर बेबी और चार्ल्सटन ग्रे जैसी किस्में अलग-अलग आकार, स्वाद और परिपक्वता तिथियां प्रदान करती हैं, इसलिए अपनी जलवायु और पसंद के अनुसार किस्मों का चयन करें। प्रतिष्ठित आपूर्तिकर्ताओं या नर्सरी से बीज खरीदें, सुनिश्चित करें कि वे ताजे, व्यवहार्य और क्षति या बीमारी से मुक्त हों। रोग प्रतिरोधक क्षमता, अंकुरण दर और विशिष्ट बढ़ती आवश्यकताओं के बारे में जानकारी के लिए बीज के पैकेट की जाँच करें, जो आपको आपके बगीचे के लिए सबसे अच्छे विकल्प की ओर ले जाएगा।',
    },
    'etimje10': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    'ljiwf6lz': {
      'en':
          'Proper water management is essential for the growth and development of watermelon plants. Watermelons require consistent moisture, especially during fruit development, but they are also susceptible to waterlogging. Provide regular, deep watering, ensuring the soil remains consistently moist but not waterlogged. Aim for about 1 to 2 inches of water per week, either through rainfall or irrigation. Avoid overhead watering, as wet foliage can promote fungal diseases. Apply mulch around the base of watermelon plants to retain soil moisture, suppress weed growth, and regulate soil temperature, creating optimal growing conditions for watermelons.',
      'hi':
          'तरबूज के पौधों की वृद्धि और विकास के लिए उचित जल प्रबंधन आवश्यक है। तरबूजों को लगातार नमी की आवश्यकता होती है, खासकर फलों के विकास के दौरान, लेकिन वे जलभराव के प्रति भी संवेदनशील होते हैं। नियमित रूप से, गहरी सिंचाई करें, यह सुनिश्चित करते हुए कि मिट्टी लगातार नम रहे लेकिन जलभराव न हो। प्रति सप्ताह लगभग 1 से 2 इंच पानी का लक्ष्य रखें, या तो वर्षा या सिंचाई के माध्यम से। ऊपर से पानी देने से बचें, क्योंकि गीले पत्ते फंगल रोगों को बढ़ावा दे सकते हैं। मिट्टी की नमी बनाए रखने, खरपतवार की वृद्धि को रोकने और मिट्टी के तापमान को नियंत्रित करने के लिए तरबूज के पौधों के आधार के चारों ओर गीली घास लगाएं, जिससे तरबूज के लिए इष्टतम विकास की स्थिति बनेगी।',
    },
    'va5n9zqm': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    '120le4lt': {
      'en':
          'Weed control is crucial for maintaining the health and productivity of watermelon patches. Apply organic mulch, such as straw or shredded leaves, around the base of watermelon plants to suppress weed growth and retain soil moisture. Regularly inspect the patch for weeds and remove them promptly to prevent competition for resources. Cultivate the soil carefully around watermelon plants to disrupt weed growth and expose weed seedlings to drying air and sunlight. Utilize herbicides selectively and judiciously, following label instructions and guidelines to minimize environmental impact and protect watermelon plants from herbicide damage.',
      'hi':
          'तरबूज के पौधों के स्वास्थ्य और उत्पादकता को बनाए रखने के लिए खरपतवार नियंत्रण महत्वपूर्ण है। खरपतवार की वृद्धि को रोकने और मिट्टी की नमी को बनाए रखने के लिए तरबूज के पौधों के आधार के चारों ओर जैविक गीली घास, जैसे पुआल या कटे हुए पत्ते लगाएं। खरपतवारों के लिए पैच का नियमित रूप से निरीक्षण करें और संसाधनों के लिए प्रतिस्पर्धा को रोकने के लिए उन्हें तुरंत हटा दें। खरपतवार की वृद्धि को बाधित करने और खरपतवार के पौधों को शुष्क हवा और सूरज की रोशनी के संपर्क में लाने के लिए तरबूज के पौधों के चारों ओर मिट्टी को सावधानी से जोतें। पर्यावरणीय प्रभाव को कम करने और तरबूज के पौधों को खरपतवारनाशकों से होने वाले नुकसान से बचाने के लिए लेबल निर्देशों और दिशानिर्देशों का पालन करते हुए, चुनिंदा और विवेकपूर्ण तरीके से शाकनाशियों का उपयोग करें।',
    },
    '4orq45mk': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'baxk2gwk': {
      'en':
          'Managing pests and diseases is essential for preventing damage to watermelon plants and ensuring a successful harvest. Integrated pest management (IPM) strategies involve monitoring, cultural practices, and the use of biological controls and targeted sprays. Regularly monitor watermelon plants for signs of pest infestation or disease symptoms, such as insect damage, leaf discoloration, or fungal growth. Implement cultural practices like crop rotation and proper sanitation to reduce pest and disease pressure. Use biological controls such as beneficial insects and parasitic nematodes to manage pests naturally, and apply targeted sprays of insecticides or fungicides when necessary, following label instructions and safety precautions.',
      'hi':
          'तरबूज के पौधों को होने वाले नुकसान को रोकने और सफल फसल सुनिश्चित करने के लिए कीटों और बीमारियों का प्रबंधन करना आवश्यक है। एकीकृत कीट प्रबंधन (आईपीएम) रणनीतियों में निगरानी, ​​सांस्कृतिक अभ्यास और जैविक नियंत्रण और लक्षित स्प्रे का उपयोग शामिल है। कीट संक्रमण या रोग के लक्षणों, जैसे कि कीट क्षति, पत्ती का रंग उड़ना या फफूंद वृद्धि के संकेतों के लिए तरबूज के पौधों की नियमित निगरानी करें। कीट और रोग के दबाव को कम करने के लिए फसल चक्र और उचित स्वच्छता जैसी सांस्कृतिक प्रथाओं को लागू करें। कीटों को प्राकृतिक रूप से प्रबंधित करने के लिए लाभकारी कीटों और परजीवी नेमाटोड जैसे जैविक नियंत्रणों का उपयोग करें और लेबल निर्देशों और सुरक्षा सावधानियों का पालन करते हुए, आवश्यक होने पर कीटनाशकों या कवकनाशी के लक्षित स्प्रे लागू करें।',
    },
    'xegqp2no': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    '6ogmnjdq': {
      'en':
          'Harvesting watermelons at the right time is crucial for optimal flavor, sweetness, and juiciness. Determine ripeness by color, sound, and texture, as well as by conducting a thump test. A ripe watermelon should have a deep, hollow sound when tapped and a firm, smooth rind. Use pruning shears or a knife to harvest watermelons, leaving a short stem attached to the fruit. Harvest watermelons regularly as they ripen, checking plants every few days during peak season. Proper storage in a cool, dry, and ventilated environment prolongs the shelf life of harvested watermelons, allowing you to enjoy them fresh or preserved throughout the season.',
      'hi':
          'तरबूज़ों को सही समय पर काटना, उनके स्वाद, मिठास और रसीलेपन के लिए बहुत ज़रूरी है। रंग, आवाज़ और बनावट के साथ-साथ थंप टेस्ट करके भी पकने का पता लगाएँ। पके हुए तरबूज़ को टैप करने पर उसमें गहरी, खोखली आवाज़ आनी चाहिए और उसका छिलका सख्त और चिकना होना चाहिए। तरबूज़ों को काटने के लिए प्रूनिंग कैंची या चाकू का इस्तेमाल करें, जिससे फल से जुड़ा एक छोटा तना रह जाए। तरबूज़ों को पकने के बाद नियमित रूप से काटें, पीक सीज़न के दौरान हर कुछ दिनों में पौधों की जाँच करें। ठंडे, सूखे और हवादार वातावरण में उचित भंडारण से कटे हुए तरबूज़ों की शेल्फ़ लाइफ़ बढ़ जाती है, जिससे आप उन्हें पूरे मौसम में ताज़ा या संरक्षित करके खा सकते हैं।',
    },
    'tic40i0u': {
      'en': 'Watermelon Yield per Acre:',
      'hi': 'प्रति एकड़ तरबूज की उपज:',
    },
    'd2j8wd2d': {
      'en':
          'The yield of watermelons per acre varies depending on factors such as variety, soil fertility, climate, and management practices. On average, an acre of watermelon patch can produce between 20,000 and 40,000 pounds of watermelons per year, with yields influenced by specific growing conditions and other variables. By implementing best practices for patch management, including proper seed selection, water management, weed control, pest and disease management, and harvesting techniques, you can maximize the yield and quality of your watermelon crop, ensuring a bountiful harvest for your enjoyment.',
      'hi':
          'प्रति एकड़ तरबूज की उपज विविधता, मिट्टी की उर्वरता, जलवायु और प्रबंधन प्रथाओं जैसे कारकों के आधार पर भिन्न होती है। औसतन, एक एकड़ तरबूज के खेत में प्रति वर्ष 20,000 से 40,000 पाउंड तरबूज पैदा हो सकते हैं, जिसमें पैदावार विशिष्ट बढ़ती परिस्थितियों और अन्य चरों से प्रभावित होती है। उचित बीज चयन, जल प्रबंधन, खरपतवार नियंत्रण, कीट और रोग प्रबंधन, और कटाई तकनीकों सहित पैच प्रबंधन के लिए सर्वोत्तम प्रथाओं को लागू करके, आप अपनी तरबूज की फसल की उपज और गुणवत्ता को अधिकतम कर सकते हैं, जिससे आपके आनंद के लिए भरपूर फसल सुनिश्चित होगी।',
    },
    'wd7yh2d5': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Strawberry
  {
    'dibklvpy': {
      'en': 'Strawberry',
      'hi': 'स्ट्रॉबेरी',
    },
    'ap1eiq0n': {
      'en': 'Sowing Season | Harvesting Season',
      'hi': 'बुवाई का मौसम | कटाई का मौसम',
    },
    'vvu20fcf': {
      'en': 'March or April | May to June',
      'hi': 'मार्च या अप्रैल | मई से जून',
    },
    'el7wt3on': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'rjlrx37z': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'ggc35dxe': {
      'en':
          'Selecting high-quality strawberry plants is essential for a successful harvest. Consider factors such as variety, plant health, and root structure when choosing plants. Varieties like Chandler, Seascape, and Albion offer different flavors, sizes, and growing habits, so select varieties suited to your climate and preferences. Look for plants from reputable suppliers or nurseries, ensuring they are healthy, disease-free, and certified disease-resistant if possible. Examine the roots of the plants, which should be white or light-colored and free from rot or damage. Purchasing bare-root or container-grown plants ensures you receive quality plants that will establish well in your garden.',
      'hi':
          'सफल फसल के लिए उच्च गुणवत्ता वाले स्ट्रॉबेरी पौधों का चयन करना आवश्यक है। पौधों का चयन करते समय विविधता, पौधे के स्वास्थ्य और जड़ संरचना जैसे कारकों पर विचार करें। चैंडलर, सीस्केप और एल्बियन जैसी किस्में अलग-अलग स्वाद, आकार और बढ़ने की आदतें प्रदान करती हैं, इसलिए अपनी जलवायु और वरीयताओं के अनुकूल किस्मों का चयन करें। प्रतिष्ठित आपूर्तिकर्ताओं या नर्सरी से पौधे खरीदें, सुनिश्चित करें कि वे स्वस्थ, रोग-मुक्त और यदि संभव हो तो प्रमाणित रोग-प्रतिरोधी हों। पौधों की जड़ों की जाँच करें, जो सफ़ेद या हल्के रंग की होनी चाहिए और सड़न या क्षति से मुक्त होनी चाहिए। नंगे जड़ वाले या कंटेनर में उगाए गए पौधे खरीदना सुनिश्चित करता है कि आपको गुणवत्ता वाले पौधे मिलेंगे जो आपके बगीचे में अच्छी तरह से स्थापित होंगे।',
    },
    'uqjo9dc0': {
      'en': '2. Water Management:',
      'hi': '2. जल प्रबंधन:',
    },
    'gwnc6utv': {
      'en':
          'Preparing the soil properly is crucial for the growth and productivity of strawberry plants. Choose a site with well-drained, fertile soil and ample sunlight for optimal growth. Test the soil pH and amend it as needed to achieve a slightly acidic pH of 5.5 to 6.5, which is ideal for strawberries. Incorporate organic matter such as compost or aged manure into the soil to improve fertility, structure, and moisture retention. Remove any weeds, rocks, or debris from the planting area to create a clean, weed-free environment for strawberry plants. Proper soil preparation provides a solid foundation for healthy plant growth and a bountiful harvest.',
      'hi':
          'स्ट्रॉबेरी के पौधों की वृद्धि और उत्पादकता के लिए मिट्टी को ठीक से तैयार करना बहुत ज़रूरी है। इष्टतम वृद्धि के लिए अच्छी जल निकासी वाली, उपजाऊ मिट्टी और पर्याप्त धूप वाली जगह चुनें। मिट्टी के pH का परीक्षण करें और ज़रूरत के हिसाब से उसमें बदलाव करें ताकि 5.5 से 6.5 का थोड़ा अम्लीय pH प्राप्त हो जाए, जो स्ट्रॉबेरी के लिए आदर्श है। उर्वरता, संरचना और नमी बनाए रखने में सुधार के लिए मिट्टी में खाद या पुरानी खाद जैसे कार्बनिक पदार्थ मिलाएँ। स्ट्रॉबेरी के पौधों के लिए एक स्वच्छ, खरपतवार मुक्त वातावरण बनाने के लिए रोपण क्षेत्र से किसी भी खरपतवार, पत्थर या मलबे को हटा दें। उचित मिट्टी की तैयारी स्वस्थ पौधे के विकास और भरपूर फसल के लिए एक ठोस आधार प्रदान करती है।',
    },
    'vg1wnhdb': {
      'en': '3. Weed Control:',
      'hi': '3. खरपतवार नियंत्रण:',
    },
    'boysoawl': {
      'en':
          'Planting strawberries correctly is essential for establishing strong, productive plants. Choose a planting time in early spring or late summer, avoiding periods of extreme heat or cold. Space strawberry plants about 12 to 18 inches apart in rows, with rows spaced 2 to 3 feet apart, to allow for proper air circulation and room for growth. Plant strawberries at the same depth they were growing in their nursery containers, ensuring the crown (where the leaves meet the roots) is level with the soil surface. Water strawberry plants thoroughly after planting to settle the soil and promote root establishment. Mulch around the base of plants with straw or pine needles to suppress weeds, retain soil moisture, and protect fruits from rot.',
      'hi':
          'मजबूत, उत्पादक पौधे लगाने के लिए स्ट्रॉबेरी को सही तरीके से लगाना ज़रूरी है। शुरुआती वसंत या देर से गर्मियों में रोपण का समय चुनें, अत्यधिक गर्मी या ठंड के समय से बचें। स्ट्रॉबेरी के पौधों को पंक्तियों में लगभग 12 से 18 इंच की दूरी पर रखें, पंक्तियों के बीच 2 से 3 फ़ीट की दूरी रखें, ताकि उचित वायु संचार और विकास के लिए जगह मिल सके। स्ट्रॉबेरी को उसी गहराई पर लगाएँ जिस पर वे अपने नर्सरी कंटेनर में उग रही थीं, यह सुनिश्चित करते हुए कि मुकुट (जहाँ पत्तियाँ जड़ों से मिलती हैं) मिट्टी की सतह के साथ समतल हो। मिट्टी को व्यवस्थित करने और जड़ों को स्थापित करने के लिए रोपण के बाद स्ट्रॉबेरी के पौधों को अच्छी तरह से पानी दें। खरपतवारों को दबाने, मिट्टी की नमी को बनाए रखने और फलों को सड़ने से बचाने के लिए पौधों के आधार के चारों ओर पुआल या पाइन सुइयों से मल्च करें।',
    },
    'iid11nvj': {
      'en': '4. Pest and Disease Management:',
      'hi': '4. कीट एवं रोग प्रबंधन:',
    },
    'lwhsjk87': {
      'en':
          'Proper watering and fertilizing are essential for the growth and development of strawberry plants. Provide regular, even watering, aiming for about 1 to 1.5 inches of water per week, either through rainfall or irrigation. Water early in the morning to minimize evaporation and reduce the risk of fungal diseases. Apply a balanced fertilizer formulated for strawberries, following label instructions for rates and timing. Fertilize strawberry plants lightly in early spring as new growth begins and again after the first flush of fruiting to promote healthy plant growth and fruit production. Avoid over-fertilizing, as this can lead to excessive vegetative growth at the expense of fruit production.',
      'hi':
          'स्ट्रॉबेरी के पौधों की वृद्धि और विकास के लिए उचित पानी और खाद डालना आवश्यक है। नियमित रूप से, समान रूप से पानी दें, प्रति सप्ताह लगभग 1 से 1.5 इंच पानी दें, या तो वर्षा या सिंचाई के माध्यम से। वाष्पीकरण को कम करने और फंगल रोगों के जोखिम को कम करने के लिए सुबह जल्दी पानी दें। स्ट्रॉबेरी के लिए तैयार संतुलित खाद डालें, दरों और समय के लिए लेबल निर्देशों का पालन करें। स्वस्थ पौधे के विकास और फल उत्पादन को बढ़ावा देने के लिए शुरुआती वसंत में स्ट्रॉबेरी के पौधों को हल्का खाद दें क्योंकि नई वृद्धि शुरू होती है और फिर फल लगने के बाद। अधिक खाद डालने से बचें, क्योंकि इससे फलों के उत्पादन की कीमत पर अत्यधिक वनस्पति वृद्धि हो सकती है।',
    },
    'jp0xqumr': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'kso2gwbg': {
      'en':
          'Harvesting strawberries at the right time is crucial for optimal flavor, sweetness, and juiciness. Determine ripeness by color, texture, and taste, as well as by conducting a gentle tug test. Ripe strawberries should be fully colored, firm, and fragrant, with no white or green areas. Gently pinch the stem just above the fruit and pull it away from the plant; ripe strawberries will release easily. Harvest strawberries regularly as they ripen, checking plants every few days during peak season. Proper storage in a cool, dry, and ventilated environment prolongs the shelf life of harvested strawberries, allowing you to enjoy them fresh or preserved throughout the season.',
      'hi':
          'स्ट्रॉबेरी को सही समय पर काटना, उसके स्वाद, मिठास और रस के लिए बहुत ज़रूरी है। रंग, बनावट और स्वाद के साथ-साथ हल्के से टग टेस्ट करके भी उसके पकने का पता लगाएँ। पकी हुई स्ट्रॉबेरी पूरी तरह से रंगीन, सख्त और सुगंधित होनी चाहिए, जिसमें कोई सफ़ेद या हरा क्षेत्र न हो। फल के ठीक ऊपर तने को धीरे से दबाएँ और उसे पौधे से अलग खींच लें; पकी हुई स्ट्रॉबेरी आसानी से निकल जाएगी। जब स्ट्रॉबेरी पकती है, तो उसे नियमित रूप से काटें, पीक सीज़न के दौरान हर कुछ दिनों में पौधों की जाँच करें। ठंडे, सूखे और हवादार वातावरण में उचित भंडारण से कटी हुई स्ट्रॉबेरी की शेल्फ लाइफ़ बढ़ जाती है, जिससे आप उन्हें पूरे मौसम में ताज़ा या संरक्षित करके खा सकते हैं।',
    },
    'abj1h8f3': {
      'en': 'Strawberry Yield per Acre:',
      'hi': 'प्रति एकड़ स्ट्रॉबेरी की उपज:',
    },
    '6r9tgd4v': {
      'en':
          'The yield of strawberries per acre varies depending on factors such as variety, planting density, soil fertility, climate, and management practices. On average, an acre of strawberry patch can produce between 8,000 and 12,000 pounds of strawberries per year, with yields influenced by specific growing conditions and other variables. By implementing best practices for patch management, including proper plant selection, soil preparation, watering and fertilizing, pest and disease management, and harvesting techniques, you can maximize the yield and quality of your strawberry crop, ensuring a bountiful harvest for your enjoyment.',
      'hi':
          'प्रति एकड़ स्ट्रॉबेरी की उपज विविधता, रोपण घनत्व, मिट्टी की उर्वरता, जलवायु और प्रबंधन प्रथाओं जैसे कारकों के आधार पर भिन्न होती है। औसतन, एक एकड़ स्ट्रॉबेरी पैच प्रति वर्ष 8,000 से 12,000 पाउंड स्ट्रॉबेरी का उत्पादन कर सकता है, जिसमें पैदावार विशिष्ट बढ़ती परिस्थितियों और अन्य चर से प्रभावित होती है। उचित पौधे का चयन, मिट्टी की तैयारी, पानी और खाद, कीट और रोग प्रबंधन, और कटाई तकनीकों सहित पैच प्रबंधन के लिए सर्वोत्तम प्रथाओं को लागू करके, आप अपनी स्ट्रॉबेरी फसल की उपज और गुणवत्ता को अधिकतम कर सकते हैं, जिससे आपके आनंद के लिए भरपूर फसल सुनिश्चित होगी।',
    },
    'dxxrwn1r': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // GreenChilli
  {
    'rovwa7u4': {
      'en': 'Green Chilli',
      'hi': 'हरी मिर्च',
    },
    'emrapmay': {
      'en': 'Timeframe',
      'hi': 'निर्धारित समय - सीमा',
    },
    'kx2cjpz9': {
      'en': '60 - 70 Days After Sowing Seeds',
      'hi': 'बीज बोने के 60 - 70 दिन बाद',
    },
    'mjzxir6x': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    '7a0b0rwa': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'p076v9h7': {
      'en':
          'Selecting high-quality apple tree saplings is crucial for establishing a healthy orchard. Consider factors such as apple variety, rootstock, and tree health when choosing saplings. Varieties like Granny Smith, Gala, and Fuji offer a range of flavors and uses, so select varieties suited to your climate and taste preferences. Pay attention to the rootstock, as it can affect tree size, vigor, and resistance to certain diseases. Look for saplings with well-developed root systems, straight trunks, and healthy foliage, avoiding those with signs of damage, disease, or stress. Purchasing saplings from reputable nurseries or suppliers ensures you receive quality trees that will thrive in your orchard.',
      'hi':
          'स्वस्थ बाग़ की स्थापना के लिए उच्च गुणवत्ता वाले सेब के पेड़ के पौधे चुनना महत्वपूर्ण है। पौधे चुनते समय सेब की किस्म, रूटस्टॉक और पेड़ के स्वास्थ्य जैसे कारकों पर विचार करें। ग्रैनी स्मिथ, गाला और फ़ूजी जैसी किस्में कई तरह के स्वाद और उपयोग प्रदान करती हैं, इसलिए अपनी जलवायु और स्वाद वरीयताओं के अनुकूल किस्मों का चयन करें। रूटस्टॉक पर ध्यान दें, क्योंकि यह पेड़ के आकार, शक्ति और कुछ बीमारियों के प्रति प्रतिरोध को प्रभावित कर सकता है। अच्छी तरह से विकसित जड़ प्रणाली, सीधे तने और स्वस्थ पत्ते वाले पौधे चुनें, नुकसान, बीमारी या तनाव के संकेत वाले पौधों से बचें। प्रतिष्ठित नर्सरियों या आपूर्तिकर्ताओं से पौधे खरीदना सुनिश्चित करता है कि आपको गुणवत्ता वाले पेड़ मिलेंगे जो आपके बाग़ में पनपेंगे।',
    },
    'rqsjzms0': {
      'en': '2. Soil Preparation:',
      'hi': '2. मिट्टी की तैयारी:',
    },
    'obs18q1m': {
      'en':
          'Preparing the soil properly is essential for the growth and productivity of green chili plants. Choose a site with well-drained, fertile soil and ample sunlight for optimal growth. Test the soil pH and amend it as needed to achieve a slightly acidic pH of 6.0 to 6.8, which is ideal for green chilies. Incorporate organic matter such as compost or aged manure into the soil to improve fertility, structure, and moisture retention. Remove any weeds, rocks, or debris from the planting area to create a clean, weed-free environment for green chili plants. Proper soil preparation provides a solid foundation for healthy plant growth and a bountiful harvest.',
      'hi':
          'हरी मिर्च के पौधों की वृद्धि और उत्पादकता के लिए मिट्टी को ठीक से तैयार करना आवश्यक है। इष्टतम वृद्धि के लिए अच्छी जल निकासी वाली, उपजाऊ मिट्टी और पर्याप्त धूप वाली जगह चुनें। मिट्टी के पीएच का परीक्षण करें और आवश्यकतानुसार इसे संशोधित करें ताकि 6.0 से 6.8 का थोड़ा अम्लीय पीएच प्राप्त हो, जो हरी मिर्च के लिए आदर्श है। उर्वरता, संरचना और नमी बनाए रखने में सुधार के लिए मिट्टी में खाद या पुरानी खाद जैसे कार्बनिक पदार्थ शामिल करें। हरी मिर्च के पौधों के लिए एक स्वच्छ, खरपतवार मुक्त वातावरण बनाने के लिए रोपण क्षेत्र से किसी भी खरपतवार, पत्थर या मलबे को हटा दें। उचित मिट्टी की तैयारी स्वस्थ पौधे के विकास और भरपूर फसल के लिए एक ठोस आधार प्रदान करती है।',
    },
    'thmorvxt': {
      'en': '3. Planting:',
      'hi': '3. रोपण:',
    },
    'e8j5tjj9': {
      'en':
          'Planting green chilies correctly is essential for establishing strong, productive plants. Choose a planting time in early spring after the danger of frost has passed, or start seeds indoors several weeks before the last frost date. Space green chili plants about 18 to 24 inches apart in rows, with rows spaced 24 to 36 inches apart, to allow for proper air circulation and room for growth. Plant green chili seedlings at the same depth they were growing in their nursery containers, ensuring the soil is well-drained and loose. Water green chili plants thoroughly after planting to settle the soil and promote root establishment.',
      'hi':
          'मजबूत, उत्पादक पौधे लगाने के लिए हरी मिर्च को सही तरीके से लगाना ज़रूरी है। ठंढ का खतरा टल जाने के बाद शुरुआती वसंत में रोपण का समय चुनें, या आखिरी ठंढ की तारीख से कई हफ़्ते पहले घर के अंदर बीज बोएँ। उचित वायु संचार और विकास के लिए जगह बनाने के लिए पंक्तियों में हरी मिर्च के पौधों को लगभग 18 से 24 इंच की दूरी पर रखें, जबकि पंक्तियों के बीच 24 से 36 इंच की दूरी रखें। हरी मिर्च के पौधों को उसी गहराई पर रोपें, जिस पर वे अपने नर्सरी कंटेनर में उग रहे थे, यह सुनिश्चित करते हुए कि मिट्टी अच्छी तरह से सूखा और ढीली हो। मिट्टी को स्थिर करने और जड़ों को स्थापित करने के लिए रोपण के बाद हरी मिर्च के पौधों को अच्छी तरह से पानी दें।',
    },
    'zq68glp6': {
      'en': '4. Watering and Fertilizing:',
      'hi': '4. पानी और खाद देना:',
    },
    'rf5o8epu': {
      'en':
          'Proper watering and fertilizing are essential for the growth and development of green chili plants. Provide regular, even watering, aiming for about 1 to 1.5 inches of water per week, either through rainfall or irrigation. Water early in the morning to minimize evaporation and reduce the risk of fungal diseases. Apply a balanced fertilizer formulated for vegetables, following label instructions for rates and timing. Fertilize green chili plants lightly at planting time and again when they begin to flower and set fruit, to promote healthy plant growth and fruit production. Avoid over-fertilizing, as this can lead to excessive vegetative growth at the expense of fruit production.',
      'hi':
          'हरी मिर्च के पौधों की वृद्धि और विकास के लिए उचित पानी और खाद डालना आवश्यक है। नियमित रूप से, समान रूप से पानी दें, प्रति सप्ताह लगभग 1 से 1.5 इंच पानी दें, या तो वर्षा या सिंचाई के माध्यम से। वाष्पीकरण को कम करने और फंगल रोगों के जोखिम को कम करने के लिए सुबह जल्दी पानी दें। सब्जियों के लिए तैयार संतुलित खाद डालें, दरों और समय के लिए लेबल निर्देशों का पालन करें। स्वस्थ पौधे के विकास और फल उत्पादन को बढ़ावा देने के लिए, रोपण के समय और फिर से जब वे फूल और फल देना शुरू करते हैं, तो हरी मिर्च के पौधों को हल्का खाद दें। अधिक खाद डालने से बचें, क्योंकि इससे फलों के उत्पादन की कीमत पर अत्यधिक वनस्पति वृद्धि हो सकती है।',
    },
    'hhq3wuso': {
      'en': '5. Pest and Disease Management:',
      'hi': '5. कीट एवं रोग प्रबंधन:',
    },
    'rqlrkjki': {
      'en':
          'Managing pests and diseases is essential for preventing damage to green chili plants and ensuring a successful harvest. Integrated pest management (IPM) strategies involve monitoring, cultural practices, and the use of biological controls and targeted sprays. Regularly inspect green chili plants for signs of pest infestation or disease symptoms, such as insect damage, leaf discoloration, or fungal growth. Implement cultural practices like proper spacing, sanitation, and weed control to reduce pest and disease pressure. Use biological controls such as beneficial insects and microbial pesticides to manage pests naturally, and apply targeted sprays of insecticides or fungicides when necessary, following label instructions and safety precautions.',
      'hi':
          'हरी मिर्च के पौधों को नुकसान से बचाने और सफल फसल सुनिश्चित करने के लिए कीटों और बीमारियों का प्रबंधन आवश्यक है। एकीकृत कीट प्रबंधन (आईपीएम) रणनीतियों में निगरानी, ​​सांस्कृतिक अभ्यास और जैविक नियंत्रण और लक्षित स्प्रे का उपयोग शामिल है। कीट संक्रमण या रोग के लक्षणों, जैसे कि कीट क्षति, पत्ती का रंग उड़ना या फफूंद वृद्धि के संकेतों के लिए हरी मिर्च के पौधों का नियमित रूप से निरीक्षण करें। कीट और रोग के दबाव को कम करने के लिए उचित दूरी, स्वच्छता और खरपतवार नियंत्रण जैसी सांस्कृतिक प्रथाओं को लागू करें। कीटों को प्राकृतिक रूप से प्रबंधित करने के लिए लाभकारी कीटों और माइक्रोबियल कीटनाशकों जैसे जैविक नियंत्रणों का उपयोग करें और लेबल निर्देशों और सुरक्षा सावधानियों का पालन करते हुए, आवश्यक होने पर कीटनाशकों या कवकनाशी के लक्षित स्प्रे लागू करें।',
    },
    'qwlyezkg': {
      'en': '5. Harvesting:',
      'hi': '5. कटाई:',
    },
    'cmz3kqba': {
      'en':
          'Harvesting green chilies at the right time is crucial for optimal flavor, heat level, and texture. Determine ripeness by color, size, and firmness, as well as by conducting a taste test. Ripe green chilies should have a vibrant green color, firm texture, and full flavor. Use pruning shears or scissors to harvest green chilies, leaving a short stem attached to the fruit. Harvest green chilies regularly as they ripen, checking plants every few days during peak season. Proper storage in a cool, dry, and ventilated environment prolongs the shelf life of harvested green chilies, allowing you to enjoy them fresh or preserved throughout the season.',
      'hi':
          'हरी मिर्च को सही समय पर काटना, उसके स्वाद, गर्मी के स्तर और बनावट के लिए बहुत ज़रूरी है। रंग, आकार और दृढ़ता के साथ-साथ स्वाद परीक्षण करके भी उसके पकने का पता लगाएँ। पकी हुई हरी मिर्च का रंग चमकीला हरा, बनावट में स्थिरता और भरपूर स्वाद होना चाहिए। हरी मिर्च को काटने के लिए प्रूनिंग कैंची या कैंची का इस्तेमाल करें, फल से जुड़ा एक छोटा तना छोड़ दें। हरी मिर्च को पकने के बाद नियमित रूप से काटें, पीक सीजन के दौरान हर कुछ दिनों में पौधों की जाँच करें। ठंडी, सूखी और हवादार जगह में उचित भंडारण से कटी हुई हरी मिर्च की शेल्फ लाइफ बढ़ जाती है, जिससे आप उन्हें पूरे सीजन में ताज़ा या संरक्षित करके खा सकते हैं।',
    },
    'lr1xdqpi': {
      'en': 'Apple Yield per Acre:',
      'hi': 'प्रति एकड़ सेब की उपज:',
    },
    'ror6m6ww': {
      'en':
          'The yield of green chilies per acre varies depending on factors such as variety, planting density, soil fertility, climate, and management practices. On average, an acre of green chili field can produce between 8,000 and 15,000 pounds of green chilies per year, with yields influenced by specific growing conditions and other variables. By implementing best practices for field management, including proper seed selection, soil preparation, watering and fertilizing, pest and disease management, and harvesting techniques, you can maximize the yield and quality of your green chili crop, ensuring a bountiful harvest for your culinary endeavors.',
      'hi':
          'प्रति एकड़ हरी मिर्च की उपज विविधता, रोपण घनत्व, मिट्टी की उर्वरता, जलवायु और प्रबंधन प्रथाओं जैसे कारकों के आधार पर भिन्न होती है। औसतन, एक एकड़ हरी मिर्च के खेत में प्रति वर्ष 8,000 से 15,000 पाउंड हरी मिर्च का उत्पादन हो सकता है, जिसमें पैदावार विशिष्ट बढ़ती परिस्थितियों और अन्य चर से प्रभावित होती है। उचित बीज चयन, मिट्टी की तैयारी, पानी और खाद, कीट और रोग प्रबंधन, और कटाई तकनीकों सहित क्षेत्र प्रबंधन के लिए सर्वोत्तम प्रथाओं को लागू करके, आप अपनी हरी मिर्च की फसल की उपज और गुणवत्ता को अधिकतम कर सकते हैं, जिससे आपके पाक प्रयासों के लिए भरपूर फसल सुनिश्चित होगी।',
    },
    '0o20naca': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Pepper
  {
    '8lsewnic': {
      'en': 'Black Pepper',
      'hi': 'काली मिर्च',
    },
    'e6uye1nr': {
      'en': 'Timeframe',
      'hi': 'निर्धारित समय - सीमा',
    },
    'dz85ya6r': {
      'en': '60 - 70 Days After Sowing Seeds',
      'hi': 'बीज बोने के 60 - 70 दिन बाद',
    },
    '8o2vfj0l': {
      'en': 'Procedure :-',
      'hi': 'प्रक्रिया :-',
    },
    'r5l48er8': {
      'en': '1. Choosing High-Quality Seeds:',
      'hi': '1. उच्च गुणवत्ता वाले बीज का चयन:',
    },
    'oznbjo8a': {
      'en':
          'Selecting high-quality black pepper seeds is crucial for a successful harvest. Black pepper, also known as Piper nigrum, is typically propagated from cuttings rather than seeds. When selecting cuttings, look for healthy, disease-free vines with well-developed nodes and internodes. Choose cuttings from mature, vigorous plants with a history of high yields and resistance to pests and diseases. It\'s best to obtain cuttings from reputable suppliers or nurseries to ensure their quality and authenticity. Proper selection of cuttings ensures the establishment of healthy black pepper vines in your garden or plantation.',
      'hi':
          'सफल फसल के लिए उच्च गुणवत्ता वाले काली मिर्च के बीजों का चयन करना महत्वपूर्ण है। काली मिर्च, जिसे पाइपर निग्रम के नाम से भी जाना जाता है, आमतौर पर बीजों के बजाय कटिंग से प्रचारित की जाती है। कटिंग चुनते समय, अच्छी तरह से विकसित नोड्स और इंटरनोड्स के साथ स्वस्थ, रोग-मुक्त बेलों की तलाश करें। उच्च उपज और कीटों और बीमारियों के प्रतिरोध के इतिहास वाले परिपक्व, मजबूत पौधों से कटिंग चुनें। उनकी गुणवत्ता और प्रामाणिकता सुनिश्चित करने के लिए प्रतिष्ठित आपूर्तिकर्ताओं या नर्सरी से कटिंग प्राप्त करना सबसे अच्छा है। कटिंग का उचित चयन आपके बगीचे या बागान में स्वस्थ काली मिर्च की बेलों की स्थापना सुनिश्चित करता है।',
    },
    '39to7nuo': {
      'en': '2. Soil Preparation:',
      'hi': '2. मिट्टी की तैयारी:',
    },
    'cwv1won1': {
      'en':
          'Preparing the soil properly is essential for the growth and productivity of black pepper vines. Choose a site with well-drained, fertile soil and ample sunlight for optimal growth. Black pepper thrives in rich, loamy soil with a slightly acidic to neutral pH of 5.5 to 7.0. Incorporate organic matter such as compost or well-rotted manure into the soil to improve fertility, structure, and moisture retention. Clear the planting area of weeds, rocks, or debris to create a clean, weed-free environment for black pepper vines. Proper soil preparation provides a solid foundation for healthy vine growth and a bountiful harvest.',
      'hi':
          'काली मिर्च की बेलों की वृद्धि और उत्पादकता के लिए मिट्टी को ठीक से तैयार करना आवश्यक है। इष्टतम वृद्धि के लिए अच्छी जल निकासी वाली, उपजाऊ मिट्टी और पर्याप्त धूप वाली जगह चुनें। काली मिर्च 5.5 से 7.0 के हल्के अम्लीय से तटस्थ पीएच के साथ समृद्ध, दोमट मिट्टी में पनपती है। उर्वरता, संरचना और नमी बनाए रखने में सुधार के लिए मिट्टी में खाद या अच्छी तरह से सड़ी हुई खाद जैसे कार्बनिक पदार्थ डालें। काली मिर्च की बेलों के लिए एक स्वच्छ, खरपतवार मुक्त वातावरण बनाने के लिए रोपण क्षेत्र को खरपतवार, चट्टानों या मलबे से साफ़ करें। उचित मिट्टी की तैयारी स्वस्थ बेल विकास और भरपूर फसल के लिए एक ठोस आधार प्रदान करती है।',
    },
    'lw9vqbid': {
      'en': '3. Planting:',
      'hi': '3. रोपण:',
    },
    'dcelz80t': {
      'en':
          'Planting black pepper correctly is essential for establishing strong, productive vines. Choose a planting time during the warm, rainy season, as black pepper prefers warm and humid conditions for optimal growth. Prepare planting pits or trenches spaced about 2 to 3 meters apart, with each pit measuring around 30 to 45 cm in depth and diameter. Plant black pepper cuttings horizontally in the pits, burying them about 5 to 10 cm below the soil surface. Provide support structures such as trellises or stakes for the vines to climb as they grow. Water the newly planted cuttings thoroughly to settle the soil and promote root establishment.',
      'hi':
          'मजबूत, उत्पादक बेलों को स्थापित करने के लिए काली मिर्च को सही तरीके से लगाना आवश्यक है। गर्म, बरसात के मौसम के दौरान रोपण का समय चुनें, क्योंकि काली मिर्च इष्टतम विकास के लिए गर्म और आर्द्र परिस्थितियों को पसंद करती है। रोपण गड्ढे या खाइयाँ लगभग 2 से 3 मीटर की दूरी पर तैयार करें, जिसमें प्रत्येक गड्ढे की गहराई और व्यास लगभग 30 से 45 सेमी हो। गड्ढों में काली मिर्च की कटिंग को क्षैतिज रूप से रोपें, उन्हें मिट्टी की सतह से लगभग 5 से 10 सेमी नीचे दबा दें। बेलों के बढ़ने पर चढ़ने के लिए ट्रेलिस या खूंटे जैसी सहायक संरचनाएँ प्रदान करें। मिट्टी को व्यवस्थित करने और जड़ों की स्थापना को बढ़ावा देने के लिए नई रोपाई गई कटिंग को अच्छी तरह से पानी दें।',
    },
    '52ecjezq': {
      'en': '4. Training and Pruning',
      'hi': '4. प्रशिक्षण और छंटाई',
    },
    'ecx82jg3': {
      'en':
          'Training and pruning black pepper vines are essential for optimizing vine growth and fruit production. Train the vines to climb the support structures provided, guiding them upwards using twine or clips. Prune the vines regularly to remove weak or diseased growth, as well as to promote branching and fruiting. Pruning encourages the development of lateral shoots, which bear the majority of the pepper berries. Train the lateral shoots horizontally along the support structures to maximize fruiting potential. Proper training and pruning ensure the efficient use of space and resources and facilitate the harvesting process.',
      'hi':
          'काली मिर्च की बेलों को प्रशिक्षित करना और उनकी छंटाई करना बेल की वृद्धि और फल उत्पादन को अनुकूलित करने के लिए आवश्यक है। बेलों को प्रदान की गई सहायक संरचनाओं पर चढ़ने के लिए प्रशिक्षित करें, उन्हें सुतली या क्लिप का उपयोग करके ऊपर की ओर निर्देशित करें। कमजोर या रोगग्रस्त वृद्धि को हटाने के लिए बेलों की नियमित रूप से छंटाई करें, साथ ही शाखाओं और फलों को बढ़ावा दें। छंटाई पार्श्व शाखाओं के विकास को प्रोत्साहित करती है, जो मिर्च के अधिकांश जामुन को धारण करती हैं। फलने की क्षमता को अधिकतम करने के लिए पार्श्व शाखाओं को सहायक संरचनाओं के साथ क्षैतिज रूप से प्रशिक्षित करें। उचित प्रशिक्षण और छंटाई स्थान और संसाधनों के कुशल उपयोग को सुनिश्चित करती है और कटाई की प्रक्रिया को सुविधाजनक बनाती है।',
    },
    '17i77qqy': {
      'en': '5. Watering and Fertilizing:',
      'hi': '5. पानी और खाद देना:',
    },
    'm61kycir': {
      'en':
          'Proper watering and fertilizing are essential for the growth and development of black pepper vines. Provide regular, even watering, aiming for about 1 to 2 inches of water per week during the growing season. Avoid waterlogging the soil, as black pepper is sensitive to waterlogged conditions. Apply organic mulch around the base of the vines to retain soil moisture, suppress weed growth, and regulate soil temperature. Apply a balanced fertilizer formulated for black pepper, following label instructions for rates and timing. Fertilize black pepper vines lightly at planting time and again during the growing season to promote healthy vine growth and fruit production.',
      'hi':
          'काली मिर्च की बेलों की वृद्धि और विकास के लिए उचित पानी और खाद डालना आवश्यक है। बढ़ते मौसम के दौरान प्रति सप्ताह लगभग 1 से 2 इंच पानी देने का लक्ष्य रखते हुए नियमित रूप से, समान रूप से पानी दें। मिट्टी को जलभराव से बचाएं, क्योंकि काली मिर्च जलभराव की स्थिति के प्रति संवेदनशील होती है। मिट्टी की नमी बनाए रखने, खरपतवार की वृद्धि को रोकने और मिट्टी के तापमान को नियंत्रित करने के लिए बेलों के आधार के चारों ओर जैविक गीली घास लगाएं। दरों और समय के लिए लेबल निर्देशों का पालन करते हुए, काली मिर्च के लिए तैयार संतुलित उर्वरक लागू करें। स्वस्थ बेल विकास और फल उत्पादन को बढ़ावा देने के लिए बढ़ते मौसम के दौरान रोपण के समय और बार-बार काली मिर्च की बेलों को हल्का खाद दें।',
    },
    'usnzi46d': {
      'en': '6. Pest and Disease Management:',
      'hi': '6. कीट एवं रोग प्रबंधन:',
    },
    'cej8uqee': {
      'en':
          'Managing pests and diseases is essential for preventing damage to black pepper vines and ensuring a successful harvest. Monitor the vines regularly for signs of pest infestation or disease symptoms, such as insect damage, leaf discoloration, or fungal growth. Implement cultural practices like proper spacing, sanitation, and weed control to reduce pest and disease pressure. Use biological controls such as beneficial insects and microbial pesticides to manage pests naturally, and apply targeted sprays of insecticides or fungicides when necessary, following label instructions and safety precautions.',
      'hi':
          'काली मिर्च की बेलों को नुकसान से बचाने और सफल फसल सुनिश्चित करने के लिए कीटों और बीमारियों का प्रबंधन करना आवश्यक है। कीटों के संक्रमण या बीमारी के लक्षणों, जैसे कि कीटों से होने वाली क्षति, पत्तियों का रंग बदलना या फफूंद का बढ़ना, के लिए नियमित रूप से बेलों की निगरानी करें। कीटों और बीमारियों के दबाव को कम करने के लिए उचित दूरी, स्वच्छता और खरपतवार नियंत्रण जैसी सांस्कृतिक प्रथाओं को लागू करें। कीटों को प्राकृतिक रूप से प्रबंधित करने के लिए लाभकारी कीटों और माइक्रोबियल कीटनाशकों जैसे जैविक नियंत्रणों का उपयोग करें और लेबल निर्देशों और सुरक्षा सावधानियों का पालन करते हुए, आवश्यक होने पर कीटनाशकों या कवकनाशी का लक्षित छिड़काव करें।',
    },
    '0d2bkv84': {
      'en': '7. Harvesting:',
      'hi': '7. कटाई:',
    },
    'fzjdgrwg': {
      'en':
          'Harvesting black pepper at the right time is crucial for optimal flavor, aroma, and pungency. Black pepper berries are harvested when they reach the desired stage of ripeness, which varies depending on the desired product. Green peppercorns are harvested when they are immature and still green in color, while black peppercorns are harvested when fully mature and turn black after drying. White peppercorns are harvested when fully ripe and soaked to remove the outer skin, revealing the white seed inside. Harvest black pepper berries carefully by hand or with pruning shears, avoiding damage to the vines. Proper drying and processing of the harvested berries ensure the preservation of their quality and flavor.',
      'hi':
          'काली मिर्च की कटाई सही समय पर करना, उसके स्वाद, सुगंध और तीखेपन के लिए बहुत ज़रूरी है। काली मिर्च के दानों की कटाई तब की जाती है जब वे पकने की वांछित अवस्था में पहुँच जाते हैं, जो वांछित उत्पाद के आधार पर अलग-अलग होता है। हरी मिर्च की कटाई तब की जाती है जब वे अपरिपक्व होती हैं और उनका रंग अभी भी हरा होता है, जबकि काली मिर्च की कटाई तब की जाती है जब वे पूरी तरह से पक जाती हैं और सूखने के बाद काली हो जाती हैं। सफ़ेद मिर्च की कटाई तब की जाती है जब वे पूरी तरह से पक जाती हैं और बाहरी छिलका हटाने के लिए उन्हें भिगोया जाता है, जिससे अंदर का सफ़ेद बीज दिखाई देता है। काली मिर्च के दानों की कटाई सावधानी से हाथ से या छंटाई कैंची से करें, ताकि बेलों को नुकसान न पहुंचे। काटे गए जामुनों को ठीक से सुखाना और उनका प्रसंस्करण करना उनकी गुणवत्ता और स्वाद को बनाए रखना सुनिश्चित करता है।',
    },
    't2017dtc': {
      'en': 'Black Pepper Yield per Acre:',
      'hi': 'प्रति एकड़ काली मिर्च की उपज:',
    },
    '0r5sjvfl': {
      'en':
          'The yield of black pepper per acre varies depending on factors such as vine density, soil fertility, climate, and management practices. On average, an acre of black pepper plantation can produce between 600 and 1,000 kilograms of dried black pepper per year, with yields influenced by specific growing conditions and other variables. By implementing best practices for plantation management, including proper selection of cuttings, soil preparation, planting, training and pruning, watering and fertilizing, pest and disease management, and harvesting techniques, you can maximize the yield and quality of your black pepper crop, ensuring a bountiful harvest for your culinary endeavors or commercial ventures.\n',
      'hi':
          'प्रति एकड़ काली मिर्च की उपज बेल घनत्व, मिट्टी की उर्वरता, जलवायु और प्रबंधन प्रथाओं जैसे कारकों के आधार पर भिन्न होती है। औसतन, एक एकड़ काली मिर्च के बागान में प्रति वर्ष 600 से 1,000 किलोग्राम सूखी काली मिर्च पैदा हो सकती है, जिसमें पैदावार विशिष्ट बढ़ती परिस्थितियों और अन्य चर से प्रभावित होती है। कटिंग, मिट्टी की तैयारी, रोपण, प्रशिक्षण और छंटाई, पानी और खाद, कीट और रोग प्रबंधन, और कटाई तकनीकों के उचित चयन सहित बागान प्रबंधन के लिए सर्वोत्तम प्रथाओं को लागू करके, आप अपनी काली मिर्च की फसल की उपज और गुणवत्ता को अधिकतम कर सकते हैं, जिससे आपके पाक प्रयासों या व्यावसायिक उपक्रमों के लिए भरपूर फसल सुनिश्चित होगी।',
    },
    'epycgh4o': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // weather
  {
    '4fu28q4s': {
      'en': 'Wind Km/ph',
      'hi': 'हवा किमी/घंटा',
    },
    'bo9n4vf7': {
      'en': 'Humidity',
      'hi': 'नमी',
    },
  },
  // Miscellaneous
  {
    'kgk95v90': {
      'en': '',
      'hi': '',
    },
    'ok2iftv9': {
      'en': '',
      'hi': '',
    },
    'mkv3m6pi': {
      'en': '',
      'hi': '',
    },
    'qprf3lp6': {
      'en': '',
      'hi': '',
    },
    '127ukknx': {
      'en': '',
      'hi': '',
    },
    'v9dvxk79': {
      'en': '',
      'hi': '',
    },
    'rt7da0bg': {
      'en': '',
      'hi': '',
    },
    'ptp9pdax': {
      'en': '',
      'hi': '',
    },
    'wbhtc4e8': {
      'en': '',
      'hi': '',
    },
    'xh66s0p9': {
      'en': '',
      'hi': '',
    },
    'wuhcg80x': {
      'en': '',
      'hi': '',
    },
    '482w43rg': {
      'en': '',
      'hi': '',
    },
    'g68b9lim': {
      'en': '',
      'hi': '',
    },
    'hfnz9v44': {
      'en': '',
      'hi': '',
    },
    'ek01ih9c': {
      'en': '',
      'hi': '',
    },
    '8cktegpm': {
      'en': '',
      'hi': '',
    },
    'ue5jvxr5': {
      'en': '',
      'hi': '',
    },
    '2zrktqp4': {
      'en': '',
      'hi': '',
    },
    'yu1qnom8': {
      'en': '',
      'hi': '',
    },
    '6jziyd1t': {
      'en': '',
      'hi': '',
    },
    '3rv2p19f': {
      'en': '',
      'hi': '',
    },
    'zgxyzt3q': {
      'en': '',
      'hi': '',
    },
    '0j2d6ga7': {
      'en': '',
      'hi': '',
    },
    'fjysmo71': {
      'en': '',
      'hi': '',
    },
    'kloba103': {
      'en': '',
      'hi': '',
    },
    's25g43us': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
