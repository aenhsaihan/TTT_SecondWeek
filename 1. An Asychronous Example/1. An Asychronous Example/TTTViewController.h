//
//  TTTViewController.h
//  1. An Asychronous Example
//
//  Created by Aditya Narayan on 11/25/13.
//  Copyright (c) 2013 TurnToTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTTViewController : UIViewController<NSURLConnectionDelegate> {
    NSMutableData *_responseData;
}


@property (retain, nonatomic) IBOutlet UITextField *addressInTextField;

@end
