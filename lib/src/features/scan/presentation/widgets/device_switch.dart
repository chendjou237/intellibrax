import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:heroicons/heroicons.dart';
import 'package:intellibra/src/app/assets.dart';
import 'package:intellibra/src/common/common.dart';
import 'package:intellibra/src/common/widgets/toast.dart';
import 'package:intellibra/src/configs/configs.dart';
import 'package:intellibra/src/extensions/build_context.dart';
import 'package:intellibra/src/extensions/num.dart';
import 'package:intellibra/src/extensions/widgetx.dart';
import 'package:intellibra/src/features/scan/presentation/cubit/scan_cubit.dart';
import 'package:ripple_wave/ripple_wave.dart';

class DeviceSwitch extends StatefulWidget {
  const DeviceSwitch({super.key});

  @override
  State<DeviceSwitch> createState() => _DeviceSwitchState();
}

class _DeviceSwitchState extends State<DeviceSwitch> with SingleTickerProviderStateMixin{
  
   late AnimationController _controller ;
@override
initState() {
    super.initState();
    _controller = AnimationController(  duration: const Duration(seconds: 3), vsync: this);
  }

@override
dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleStartScan(BuildContext context,ActionSliderController controller) {
    context.read<ScanCubit>().startScreening();
    //  setState(() {
      _controller.repeat();
    Timer.periodic(const Duration(seconds: 13), (timer) {
      timer.cancel();
      _controller.reset();
        controller
                          ..success()
                          ..reset();
      toastSuccess(context, 'Scan Completed Successfully ✅');
      // ('Scan Complete ✅');
      context.router.pushNamed('/medical-record');
        
    //  });
    });
  }
  @override
  Widget build(BuildContext context) {
    return
     BlocProvider(
      create: (context) => ScanCubit(),
       child: BlocConsumer<ScanCubit, ScanState>(
        listener: (context, state) {
        
          if (context.watch<ScanCubit>().state is ScanScreeningSuccess) {
            toastSuccess(context, 'Scan Completed Successfully ✅');
            context.router.pushNamed('/medical-record');
          }
        },
        builder: (context, state) =>  ActionSlider.standard(
        boxShadow: const [],
        height: 58,
        width: context.width * .55,
        icon: Container(
          height: 68,
          width: 68,
          decoration: BoxDecoration(
            color: context.scheme.primary,
            shape: BoxShape.circle,
          ),
          child: HeroIcon(
            HeroIcons.power,
            size: 22,
            color: context.scheme.onPrimary,
          ),
        ),
        customBackgroundBuilder: (context, _, child) {
          return GlassContainer.frostedGlass(
            height: 58,
            width: context.width * .55,
            borderWidth: 0,
            borderColor: context.scheme.primaryContainer,
            borderRadius: BorderRadius.circular(58),
            blur: 12,
            child: child,
          );
        },
        sliderBehavior: SliderBehavior.stretch,
        customBackgroundBuilderChild: Padding(
          padding: const EdgeInsets.only(left: 54),
          child: Row(
            children: [
              const Text('Connect'),
              if (!kIsWeb) const Spacer() else 16.hGap,
              HeroIcon(
                HeroIcons.chevronRight,
                size: 14,
                color: context.scheme.primary.withOpacity(.35),
              ),
              HeroIcon(
                HeroIcons.chevronRight,
                size: 16,
                color: context.scheme.primary.withOpacity(.55),
              ),
              HeroIcon(
                HeroIcons.chevronRight,
                size: 20,
                color: context.scheme.primary,
              ),
            ],
          ),
        ),
        action: (controller) async {
          controller.loading();
          BlocProvider.of<ScanCubit>(context).scanDevices();
          await Future<void>.delayed(const Duration(seconds: 1));
          if (context.mounted) {
            await showFlexibleBottomSheet<void>(
              minHeight: 0,
              initHeight: 0.5,
              maxHeight: 1,
              bottomSheetColor: context.colorScheme.onPrimary,
              bottomSheetBorderRadius: const BorderRadius.only(
                topLeft: Radius.circular(38),
                topRight: Radius.circular(38),
              ),
              context: context,
              builder: (BuildContext context, scroller, double offset) {
                return context.watch<ScanCubit>().state is ScanScreeningInProgress ?
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      
                      SizedBox(
                        height: 300,
                        width: 300,
                        child: RippleWave(
                            childTween: Tween(begin: 0.01, end: 1),
                        color: Palette.primary,
                        repeat: false,
                        animationController: _controller,
                            child:  Text(
                                context.watch<ScanCubit>().state.message ,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ).animate().scale(),
                          ),
                      ),
                   Text('Please wait a moment', 
                   style: Theme.of(context).textTheme.displayLarge!.copyWith(fontWeight: FontWeight.bold, color: Palette.primary),), ],
                  ),
                )   :
              Column(
                  children: <Widget>[
                    Text(
                      'INTELLIBRA CE12XFMZ',
                      style: context.bodyLg.copyWith(
                        color: context.scheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    18.vGap,
                    Image.asset(
                      Assets.assetsIconsIntellibra,
                      height: 180,
                      width: 180,
                    ),
                    18.vGap,
                    Center(
                      child: IntellibraButton(
                        text: 'Launch Scan',
                        width: .55,
                        color: context.scheme.primary,
                        //icon: Icons.local_activity,
                        action: () {
                          setState(() {
       _handleStartScan(context, controller);                        // context.router.pop();
                          });
                            
                        
                        },
                      ),
                    ),
                  ],
                ).hPadding.vPadding;
              },
              anchors: [0, 0.5, .75, 1],
            );
          }
        },
        ),
           ),
     );
  }
}
