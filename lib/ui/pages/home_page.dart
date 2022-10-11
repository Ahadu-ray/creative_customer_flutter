import 'package:creative_customer_flutter/shared/themes/app_theme.dart';
import 'package:creative_customer_flutter/ui/components/custom_appbar.dart';
import 'package:creative_customer_flutter/ui/components/screen_with_appbar.dart';
import 'package:creative_customer_flutter/ui/components/selectable_chips.dart';
import 'package:creative_customer_flutter/ui/screens/home/completed_screen.dart';
import 'package:creative_customer_flutter/ui/screens/home/job_request_screen.dart';
import 'package:creative_customer_flutter/ui/screens/home/schedule_screen.dart';
import 'package:creative_customer_flutter/ui/widgets/custom_grad_button.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenWithAppBar(
        appBar: CustomAppBar(
          title: "Appointments",
          onRightIcon: () {},
          extra: SelectableChips(
              onChange: [], tabs: ["Job Requests", "Schedule", "Completed"]),
        ),
        withSpace: 0,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                JobRequestsScreen(),
                ScheduleScreen(),
                CompletedScreen()
              ],
            ),
            Positioned(
              child: Container(
                decoration: AppTheme.homeBottomDecoration(),
                padding: EdgeInsets.symmetric(vertical: 29, horizontal: 37),
                child: GradientButton(title: "Book Appointment"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
    _controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOutCubic,
    );
  }
}
