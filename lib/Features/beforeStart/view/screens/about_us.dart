import 'package:estekhare/Core/utils/widgets.dart';
import 'package:estekhare/Core/utils/color.dart';
import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/Features/beforeStart/view/screens/start.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AboutUs extends StatelessWidget {
  static const String rn = "/aboutus";
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    const String content = '''
    أولا: هوية المركز:
    مؤسسة ثقافية اعلامية تبليغية على ضوء الاسلام ومذهب أهل البيت (عليهم السلام) ومنهجية ولاية الفقيه.
    
    ثانياَ: الأهداف:
    
    1ـ نشر وترويج الاسلام المحمدي الأصيل.
    2ـ العمل على إبراز القيم الإسلامية الرفيعة والتأكيد على أهمية التراث الحضاري للأمة الإسلامية.
    3ـ بث الوعي في جيل الشباب ووضع خطط فكرية سليمة لبناء جيل المستقبل.
    4ـ التأكيد على ضرورة الثقافة القرآنية كمحور أساسي ومصدر عام للأصول والمبادئ الدينية.
    5ـ الاعتماد على الموضوعية العلمية واحترام الرأي الآخر والابتعاد عن أساليب الإلغاء والتكفير.
    6ـ السعي لتفعيل ثقافة الوحدة بين المسلمين وتضييق الهوة بين المذاهب الإسلامية.
    7ـ بيان القيمة العلمية والعقائدية لتراث أهل البيت (عليهم السلام).
    8ـ السير على خطى النبي الاكرم (صلى الله عليه وآله) والاقتداء بهديه القويم.
    9ـ العمل على ترسيخ القواسم المشتركة بين المسلمين عقائديا وتاريخيا وفكريا.
    10ـ بناء الكوادر الإعلامية والثقافية والفكرية التي من شأنها المشاركة في المشروع التوعوي.
    11ـ متابعة الشبهات المطروحة على الاسلام وعلى مذهب آل البيت (عليهم السلام)، والرد عليها بالأساليب العلمية الصحيحة بعيداً عن الانفعال والتحيز والافراط والتفريط.
    12ـ إشاعة ثقافة الانتظار ودور الأمة في عصر الغيبة والتمهيد لظهور المهدي المنتظر (عجل الله تعالى فرجه الشريف).
    13ـ إنتاج وبث البرامج الدينية والفكرية والثقافية من خلال وسائل الاعلام المقروءة والمسموعة والمرئية.
    14ـ القيام بالدراسات والأبحاث العلمية لتأصيل الوعي الديني والفكري السليم والوقاية من الأفكار العلمانية والهجينة والالتقاطية.
    15ـ التأكيد على المرجعية الدينية بصفتها الملاذ الحصين للأمة.
    16ـ مواجهة الغزو الثقافي في صوره الحديثة وأشكاله الجديدة وتقنياته المتطورة، والتحذير من العولمة في أبعادها السلبية.
    
    نسأل الله سبحانه وتعالى أن يوفقنا لتحقيقها
    إدارة المركز
    ''';

    return Scaffold(
      body: bgWidget(
        context: context,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, bottom: 12),
              width: EsaySize.width(context) - 40,
              height: EsaySize.height(context) / 1.4,
              decoration: BoxDecoration(
                color: ColorApp.baseCubeColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text(
                    content,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.justify, // مرتب سازی و هم‌راستایی متن
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.8,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  btn(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, StartPage.rn);
                    },
                    icon: Icons.home,
                  ),
                  EsaySize.gap(20),
                  btn(
                    onPressed: () {
                      Share.share(content);
                    },
                    icon: Icons.share,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
