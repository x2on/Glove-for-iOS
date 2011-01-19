//
//  SettingsViewController.m
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

#import "SettingsViewController.h"


@implementation SettingsViewController

@synthesize ipField, portField;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	defaults = [NSUserDefaults standardUserDefaults];
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated {
	ipField.text = [defaults stringForKey:@"ip_preference"];
	int portValue = [defaults integerForKey:@"port_preference"];
	portField.text = [NSString stringWithFormat:@"%i",portValue];
}

- (IBAction)closeSettings:(id)sender {
	[defaults setValue:ipField.text forKey:@"ip_preference"];
	int portValue = [portField.text intValue];
	[defaults setInteger:portValue forKey:@"port_preference"];

    [self dismissModalViewControllerAnimated:YES];		
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
