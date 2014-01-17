//
//  main.m
//  JSON Experiment
//
//  Created by Anar Enhsaihan on 11/26/13.
//  Copyright (c) 2013 Anar Enhsaihan. All rights reserved.
////

#import <Foundation/Foundation.h>
#import <Foundation/NSJSONSerialization.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSError *errorInfo;
        
        NSData *jsonData = nil;
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@[@"S2", @"S3", @"S4"], @"Samsung", @[@"iPhone4", @"iPhone5"], @"Apple", nil];
        
        
        if ([NSJSONSerialization isValidJSONObject:dict]) {
            
            jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&errorInfo];
            
            if (errorInfo) {
                NSLog(@"%@", [errorInfo localizedDescription]);
            } else if (jsonData != nil) {
                NSLog(@"You have successfully created a JSON object!");
                NSLog(@"%@", jsonData);
            }
        }
        
        
        if (jsonData != nil) {
            NSError *errorInfo2;
            
            id backToDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&errorInfo2];
            
            NSLog(@"%@", backToDict);
        }
        
        
        
    }
    return 0;
}

