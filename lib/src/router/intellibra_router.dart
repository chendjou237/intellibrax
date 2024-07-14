import 'package:auto_route/auto_route.dart';
import 'package:intellibra/src/router/intellibra_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen|View,Route',
)
class IntellibraRouter extends $IntellibraRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: Welcome.page,
          initial: true,
          path: '/welcome',
        ),
        AutoRoute(
          page: CreateAccount.page,
          path: '/create-account',
        ),
        AutoRoute(
          page: ChooseLanguage.page,
          path: '/choose-language',
        ),
        AutoRoute(
          page: ChooseTheme.page,
          path: '/choose-theme',
        ),
      // AutoRoute(page: Article.page, path: '/article/:id'),
        AutoRoute(
          page: AccountSettings.page,
          path: '/account-settings',
        ),
        AutoRoute(
          page: AppSettings.page,
          path: '/app-settings',
        ),
        AutoRoute(
          page: BillingSettings.page,
          path: '/billing-settings',
        ),
        AutoRoute(
          page: EditProfile.page,
          path: '/billing-settings',
        ), 
        
        AutoRoute(
          page: ArticleRoute.page,
          path: '/article',
        ), 
        
        AutoRoute(
          page: ChatRoute.page,
          path: '/chat',
        ), 
 
        AutoRoute(
        page: MedicalRecord.page,
        path: '/medical-record',
        ),
       
        AutoRoute(
          page: Home.page,
          path: '/home',
          children: [
            AutoRoute(
              page: SelfCheck.page,
              path: 'self-check',
            ),
            AutoRoute(
              page: Awareness.page,
              path: 'awareness',
            ),
            AutoRoute(
              page: IntelliRecords.page,
              path: 'medical-records',
            ),
            AutoRoute(
              page: Settings.page,
              path: 'settings',
            ),
          ],
        ),
      ];
}
