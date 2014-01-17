//
//  TTTViewController.h
//  First Project
//
//  Created by Aditya Narayan on 11/25/13.
//  Copyright (c) 2013 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTViewController : UIViewController


@property (retain, nonatomic) IBOutlet UISegmentedControl *segmentedCtrl;

- (IBAction)segValueChanged:(id)sender;


@property (retain, nonatomic) IBOutlet UISlider *slidingBar;


- (IBAction)slidingBarValueChanged:(id)sender;


@property (retain, nonatomic) IBOutlet UISwitch *offAndOnSwitch;


- (IBAction)switchOffAndOn:(id)sender;


@property (retain, nonatomic) IBOutlet UITextField *savedText;


@property (retain, nonatomic) IBOutlet UIStepper *currentValueOfStepper;


- (IBAction)readValueOfStepper:(id)sender;


@end
