// TouchPay
class Post {
  String registered_at;
  String title;
  String twitter;
  String facebook;
  String website;
  String post_description;
  String aboutus;
  String goals;
  String slug;
  String avatar;
  String mail;
  int payment;

  Post(
      {this.registered_at,
      this.title,
      this.twitter,
      this.facebook,
      this.website,
      this.post_description,
      this.aboutus,
      this.goals,
      this.slug,
      this.avatar,
      this.mail,
      this.payment});

  // For Next Step (Solutions Challenge) Dynamic Data
  /*factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      registered_at: json["registered_at"] as String,
      title: json["title"] as String,
      twitter: json["twitter"] as String,
      facebook: json["facebook"] as String,
      website: json["website"] as String,
      post_description: json["post_description"] as String,
      goals: json["goals"] as String,
      slug: json["slug"] as String,
      avatar: json["avatar"] as String,
      mail: json["mail"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["registered_at "] = this.registered_at;
    data["title"] = this.title;
    data["twitter_handle"] = this.twitter;
    data["facebook"] = this.facebook;
    data["website"] = this.website;
    data["post_description"] = this.post_description;
    data["goals"] = this.goals;
    data["slug"] = this.slug;
    data["avatar"] = this.avatar;
    data["mail"] = this.mail;
    return data;
  }*/
}

List<Post> list = [
  Post(
    registered_at: '',
    title: 'UNICEF',
    twitter: 'https://twitter.com/unicef',
    facebook: 'https://www.facebook.com/unicef',
    website: 'https://www.unicef.org/',
    post_description: 'For Every Child',
    aboutus:
        'UNICEF, also greatly known as the United Nations International Children\'s Emergency Fund, is a United Nations agency responsible for providing humanitarian and developmental aid to children worldwide. The agency is among the most widespread and recognizable social welfare organizations in the world, with a presence in 192 countries and territories. UNICEF\'s activities include providing immunizations and disease prevention, administering treatment for children and mothers with HIV, enhancing childhood and maternal nutrition, improving sanitation, promoting education, and providing emergency relief in response to disasters.',
    goals: '400',
    slug: '',
    avatar: 'assets/images/charity/UNICEF.jpg',
    mail: 'destek@unicefturk.org',
    payment: 200,
  ),
  Post(
    registered_at: '',
    title: 'LÖSEV',
    twitter:
        'https://twitter.com/losev1998?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor',
    facebook: 'https://www.facebook.com/losev1998',
    website: 'https://www.losev.org.tr/v6',
    post_description: 'Lösemili Çocuklar Vakfı',
    aboutus:
        'Children with Leukemia Health and Education Foundation, in 1998, Pediatric Hematologist, Oncologist Dr. Founded by Üstün Ezer in Ankara, it is a foundation that helps children and their helpers with leukemia and cancer and meets their many needs.',
    goals: '400',
    slug: '',
    avatar: 'assets/images/charity/lösev.png',
    mail: 'losev@losev.org.tr',
    payment: 500,
  ),
  Post(
      registered_at: '',
      title: 'TOHUM OTIZM',
      twitter: 'https://twitter.com/tohumotizm',
      facebook: 'https://www.facebook.com/tohumotizm/?ref=br_rs',
      website: 'https://www.tohumotizm.org.tr',
      post_description: 'Otizmli Çocuklar Vakfı',
      aboutus:
          'Seed Turkey Autism Early Diagnosis and Education Foundation, \'autism spectrum disorder\' that children be placed early diagnosis, pioneering the integration into the society with special education and the purpose of dissemination throughout the country that was founded on April 15, 2003.',
      goals: '1000',
      slug: '',
      avatar: 'assets/images/charity/Tohum_logo.png',
      mail: 'info@tohumotizm.org.tr',
      payment: 700),
  Post(
      registered_at: '',
      title: 'TEMA',
      twitter: 'https://twitter.com/temavakfi',
      facebook: 'https://www.facebook.com/temavakfi',
      website: 'https://www.tema.org.tr/iletisim',
      post_description: 'Umut Yeşertiyoruz',
      aboutus:
          'TEMA Vakfı’nın varoluş nedeni yaşama yani toprağa sahip çıkmak ve onu korumaktır. Çünkü toprak hepimizin yuvası, gıdamızın %95’inin doğrudan ya da dolaylı kaynağı, habitatlarımızın dayanıklılık kaynağıdır. Okyanuslardan sonraki en büyük karbon yutağı olarak toprak, iklim krizi ile mücadelenin de önemli bir aktörüdür. Toprağımız varsa ormanımız, tarımımız, meralarımız ve hayvancılığımız var. Toprağın 1 santimetresinin oluşması için 500 yıl gerekirken her yıl 642 milyon ton toprağımız erozyona uğruyor. Yaşama ve dolayısıyla toprağa sahip çıkmayı amaç edinmiş TEMA Vakfı’nın varoluş nedeni toprağı korumaktır.',
      goals: '1000',
      slug: '',
      avatar: 'assets/images/charity/tema.jpg',
      mail: 'bagis@tema.org.tr',
      payment: 4000),
  Post(
      registered_at: '',
      title: 'TEGV',
      twitter: 'https://twitter.com/TEGV',
      facebook: 'https://www.facebook.com/TurkiyeEgitimGonulluleriVakfi',
      website: 'https://tegv.org',
      post_description: 'Eğitim Gönüllüleri Vakfı',
      aboutus:
          'İlköğrenim çağındaki çocukların çağdaş ve evrensel değerler ile cumhuriyetin temel ilkelerine sahip, donanımlı ve nitelikli bireyler olarak yetiştirilmeleri amacıyla devlet tarafından verilen temel eğitime destek olmaktır.',
      goals: '400',
      slug: '',
      avatar: 'assets/images/charity/tegv.png',
      mail: 'tegv@tegv.org',
      payment: 2000),
  Post(
      registered_at: '',
      title: 'WFP',
      twitter: 'https://twitter.com/WFP',
      facebook: 'https://www.facebook.com/WorldFoodProgramme',
      website: 'https://www.wfp.org',
      post_description: 'Saving Lives Changing Lives',
      aboutus:
          'WFP has been saving and changing the lives of hungry people across the world for more than 50 years. Learn about our leadership team, how we are governed, and about the governments, companies and individuals whose generous support makes our work possible.',
      goals: '400',
      slug: '',
      avatar: 'assets/images/charity/wfp.png',
      mail: 'community@wfp.org',
      payment: 2000),
];
