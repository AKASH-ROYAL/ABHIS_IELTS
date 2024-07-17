import 'package:ielts_frontend/export.dart';
import 'package:ielts_frontend/widgets/helper_widgets/template_drawer.dart';

class TemplateScaffold extends StatelessWidget {
final Widget body;
final bool extendBodyBehindAppBar;
final PreferredSizeWidget? appBar;
final Color? backgroundColor;
final Widget? drawer;

  const TemplateScaffold({super.key, required this.body,  this.extendBodyBehindAppBar=false, this.appBar, this.backgroundColor, this.drawer});

  @override
  Widget build(BuildContext context) {
     return Scaffold(
       drawer:  drawer?? const TemplateDrawer(),
       backgroundColor: backgroundColor,
       appBar: appBar,
       extendBodyBehindAppBar:extendBodyBehindAppBar,
      body: SafeArea(child: body),
    );
  }
}
