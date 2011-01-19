//
//  Glove_for_iOSAppDelegate.h
//  Glove-for-iOS
//
//  Created by Felix Schulze on 12.01.11.
//  Copyright 2011 Felix Schulze. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//  

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface Glove_for_iOSAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UINavigationController *navigationController;
	SettingsViewController *settingsViewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
@property (nonatomic, retain) SettingsViewController *settingsViewController;


- (IBAction)openSettings:(id)sender;

@end

