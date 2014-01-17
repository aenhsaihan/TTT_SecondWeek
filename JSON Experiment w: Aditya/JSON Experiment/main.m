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
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@[@"S2", @"S3", @"S4"], @"Samsung", @[@"iPhone4", @"iPhone5"], @[@"Apple", @"Cupertino"], nil];
        
        
        if ([NSJSONSerialization isValidJSONObject:dict])       
        {            
            jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:&errorInfo];
            
            if (!jsonData) {
                NSLog(@"%@", [errorInfo localizedDescription]);
            } else {
                NSLog(@"You have successfully created a JSON object!");
                NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
                NSLog(@"%@", jsonString);
            }
        } else {
            NSLog(@"Your dictionary is not a valid JSON Object");
        }
        
        
        NSString *jsonDataString2 = @"nthoaeunthoea";
        NSData *jsonData2 = [jsonDataString2 dataUsingEncoding:NSUTF8StringEncoding];
        
        if (jsonData2 != nil) {
            
            NSError *errorInfo2;
            
            id backToDict = [NSJSONSerialization JSONObjectWithData:jsonData2 options:NSJSONReadingMutableContainers error:&errorInfo2];
            
            if (!backToDict) {
                NSLog(@"%@", [errorInfo2 localizedDescription]);
            } else {
                NSLog(@"%@", backToDict);
            }
            
        } else {
            NSLog(@"Your JSON could not be converted to a dictionary");
        }
        
        
        
    }
    return 0;
}

