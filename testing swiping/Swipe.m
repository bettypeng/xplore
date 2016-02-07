//
//  Swipe.m
//  testing swiping
//
//  Created by Joy Hsu on 2/6/16.
//  Copyright © 2016 Richard Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Swipe.h"

@interface Swipe ()
@end


@implementation Swipe

int deltaY = 0;

- (void)viewDidLoad
{
    //UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(45, 30, 200, 40)];
    
    NSUserDefaults *test = [NSUserDefaults standardUserDefaults];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 400, 600)];
    
    
    NSString *orgName1 = [test stringForKey:@"orgName1"];
    if (orgName1) {
        UITextField *txt1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 30 + deltaY, 300, 40)];
        txt1.text = orgName1;
        [view addSubview:txt1];
        deltaY += 40;
        NSLog(orgName1);
    
        NSString *orgName2 = [test stringForKey:@"orgName2"];
        if (![orgName2 isEqualToString:(orgName1)]) {
            UITextField *txt2 = [[UITextField alloc] initWithFrame:CGRectMake(10, 30 + deltaY, 300, 40)];
            txt2.text = orgName2;
            [view addSubview:txt2];
            deltaY += 40;
            NSLog(orgName2);
        }
        NSString *orgName3 = [test stringForKey:@"orgName3"];
        if (![orgName3 isEqualToString:(orgName2)]) {
            UITextField *txt3 = [[UITextField alloc] initWithFrame:CGRectMake(10, 30 + deltaY, 300, 40)];
            txt3.text = orgName3;
            [view addSubview:txt3];
            deltaY += 40;
            NSLog(orgName3);
        }
        NSString *orgName4 = [test stringForKey:@"orgName4"];
        if (![orgName4 isEqualToString:(orgName3)]) {
            UITextField *txt4 = [[UITextField alloc] initWithFrame:CGRectMake(10, 30 + deltaY, 300, 40)];
            txt4.text = orgName4;
            [view addSubview:txt4];
            deltaY += 40;
            NSLog(orgName4);
        }
        NSString *orgName5 = [test stringForKey:@"orgName5"];
        if (![orgName5 isEqualToString:(orgName4)]) {
            UITextField *txt5 = [[UITextField alloc] initWithFrame:CGRectMake(10, 30 + deltaY, 300, 40)];
            txt5.text = orgName5;
            [view addSubview:txt5];
            deltaY += 40;
            NSLog(orgName5);
        }
        NSString *orgName6 = [test stringForKey:@"orgName6"];
        if (![orgName6 isEqualToString:(orgName5)]) {
            UITextField *txt6 = [[UITextField alloc] initWithFrame:CGRectMake(10, 30 + deltaY, 300, 40)];
            txt6.text = orgName6;
            [view addSubview:txt6];
            deltaY += 40;
            NSLog(orgName6);
        }
        [self.view addSubview:view];
    }

    
    // Update the UI elements with the saved data
    //firstNameTextField.text = firstName;

    [super viewDidLoad];
    
    
}

@end

