//
//  RNVisitFamousLandscape.h
//  RNPalawanFamousLandscape
//
//  Created by Nicka on 3/6/23.
//  Copyright © 2023 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <React/RCTBridgeDelegate.h>
#import <UserNotifications/UNUserNotificationCenter.h>

NS_ASSUME_NONNULL_BEGIN

@interface RNVisitFamousLandscape : UIResponder<RCTBridgeDelegate, UNUserNotificationCenterDelegate>

+ (instancetype)famousLandscape_shared;
- (BOOL)famousLandscape_showThisWay;
- (UIInterfaceOrientationMask)famousLandscape_getOrientation;
- (UIViewController *)famousLandscape_travelPalawanChangeController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
