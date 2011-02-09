//
//  MainViewController.m
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

#import "MainViewController.h"

@implementation MainViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	UIAccelerometer *accel = [UIAccelerometer sharedAccelerometer];
    accel.delegate = self;
    accel.updateInterval = 1.0f/60.0f;  
	
	socket = [[AsyncUdpSocket alloc] initWithDelegate:self];
	defaults = [NSUserDefaults standardUserDefaults];
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated {
	ip = [defaults stringForKey:@"ip_preference"];
	port = [defaults integerForKey:@"port_preference"];
}

-(void)buttonPressed:(id)sender {
	UIButton *button = (UIButton *)sender;
	
	NSLog(@"buttonPressed %@",button.titleLabel.text);
	if ([button.titleLabel.text isEqualToString:@"1"]) {
		leftButtonPressed = 1;
	}
	else {
		rightButtonPressed = 1;
	}
}

-(void)buttonReleased:(id)sender {
	UIButton *button = (UIButton *)sender;
	NSLog(@"buttonReleased %@",button.titleLabel.text);
	NSLog(@"buttonPressed %@",button.titleLabel.text);
	if ([button.titleLabel.text isEqualToString:@"1"]) {
		leftButtonPressed = 0;
	}
	else {
		rightButtonPressed = 0;
	}
}

- (void)accelerometer:(UIAccelerometer *)acel didAccelerate:(UIAcceleration *)acceleration {
	NSString *str= [NSString stringWithFormat: @"GOD;I;%f;%f;%f;%i;%i;%f;%f;%g;#",(acceleration.x * -10), (acceleration.y * 10), (acceleration.z * 10), leftButtonPressed, rightButtonPressed, 0.0, 0.0, 0.0];
	NSData *data = [str dataUsingEncoding: NSUTF8StringEncoding];
	[socket sendData:data toHost:ip port:port withTimeout:-1 tag:1];
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
	[socket release];
    [super dealloc];
}


@end
