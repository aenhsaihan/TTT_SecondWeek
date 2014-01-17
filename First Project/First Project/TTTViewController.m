//
//  TTTViewController.m
//  First Project
//
//  Created by Aditya Narayan on 11/25/13.
//  Copyright (c) 2013 TurnToTech. All rights reserved.
//

#import "TTTViewController.h"

@interface TTTViewController ()

@end

@implementation TTTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
}


-(void)viewDidAppear:(BOOL)animated {
    
    
    [super viewDidAppear:animated];
    
    
    NSLog(@"viewDidAppear");
    
}

- (IBAction)buttonClicked:(id)sender {
    
     NSLog(@"Button clicked");
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"didReceiveMemoryWarning");
}

- (void)dealloc {
    [_segmentedCtrl release];
    [_slidingBar release];
    [_offAndOnSwitch release];
    [_savedText release];
    [_currentValueOfStepper release];
    [super dealloc];
}

- (IBAction)segValueChanged:(id)sender {
    
    int selectedValue = self.segmentedCtrl.selectedSegmentIndex;
    
    NSLog(@"Selected index = %d",selectedValue);
    
    
}
- (IBAction)slidingBarValueChanged:(id)sender {
    
    int barValue = self.slidingBar.value;
    
    NSLog(@"Changed bar value = %d", barValue);
}

- (IBAction)switchOffAndOn:(id)sender {
    
    BOOL state = self.offAndOnSwitch.on;
    
    if (state) {
        NSLog(@"The switch is on");
    } else {
        NSLog(@"The switch is off");
    }
    
}


- (IBAction)readTextButton:(id)sender {
    
    NSString *readTextFromTextBox = self.savedText.text;
    
    NSLog(@"%@", readTextFromTextBox);
}

- (IBAction)readValueOfStepper:(id)sender {
    
    int stepperValue = self.currentValueOfStepper.value;
    
    NSLog(@"%d", stepperValue);
}
@end
