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
        UITextField *txt1 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
        NSString *txt1string = [NSString stringWithFormat: @"%@\n\n%@", orgName1,@" 3 hrs"];
        txt1.text = txt1string;
        [view addSubview:txt1];
        deltaY += 40;
        NSLog(orgName1);
    
        NSString *orgName2 = [test stringForKey:@"orgName2"];
        if (![orgName2 isEqualToString:(orgName1)]) {
            UITextField *txt2 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
            NSString *txt2string = [NSString stringWithFormat: @"%@\n\n%@", orgName2,@"                8 hrs"];
            txt2.text = txt2string;
            [view addSubview:txt2];
            deltaY += 40;
            NSLog(orgName2);
        }
        NSString *orgName3 = [test stringForKey:@"orgName3"];
        if (![orgName3 isEqualToString:(orgName2)]) {
            UITextField *txt3 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
            NSString *txt3string = [NSString stringWithFormat: @"%@\n\n%@", orgName3,@"        2 hrs"];
            txt3.text = txt3string;
            [view addSubview:txt3];
            deltaY += 40;
            NSLog(orgName3);
        }
        NSString *orgName4 = [test stringForKey:@"orgName4"];
        if (![orgName4 isEqualToString:(orgName3)]) {
            UITextField *txt4 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
            NSString *txt4string = [NSString stringWithFormat: @"%@\n\n%@", orgName4,@" 2 hrs"];
            txt4.text = txt4string;
            [view addSubview:txt4];
            deltaY += 40;
            NSLog(orgName4);
        }
        NSString *orgName5 = [test stringForKey:@"orgName5"];
        if (![orgName5 isEqualToString:(orgName4)]) {
            UITextField *txt5 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
            NSString *txt5string = [NSString stringWithFormat: @"%@\n\n%@", orgName5,@"            6 hrs"];
            txt5.text = txt5string;
            [view addSubview:txt5];
            deltaY += 40;
            NSLog(orgName5);
        }
        NSString *orgName6 = [test stringForKey:@"orgName6"];
        if (![orgName6 isEqualToString:(orgName5)]) {
            UITextField *txt6 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
            NSString *txt6string = [NSString stringWithFormat: @"%@\n\n%@", orgName6,@"        8 hrs"];
            txt6.text = txt6string;
            [view addSubview:txt6];
            deltaY += 40;
            NSLog(orgName6);
        }
        NSString *orgName7 = [test stringForKey:@"orgName6"];
        if (![orgName7 isEqualToString:(orgName6)]) {
            UITextField *txt7 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
            NSString *txt7string = [NSString stringWithFormat: @"%@\n\n%@", orgName7,@"        8 hrs"];
            txt7.text = txt7string;
            [view addSubview:txt7];
            deltaY += 40;
            NSLog(orgName7);
        }
        NSString *orgName8 = [test stringForKey:@"orgName6"];
        if (![orgName8 isEqualToString:(orgName6)]) {
            UITextField *txt8 = [[UITextField alloc] initWithFrame:CGRectMake(10, 35 + deltaY, 300, 40)];
            NSString *txt8string = [NSString stringWithFormat: @"%@\n\n%@", orgName8,@"        3 hrs"];
            txt8.text = txt8string;
            [view addSubview:txt8];
            deltaY += 40;
            NSLog(orgName8);
        }
        [self.view addSubview:view];
    }

    
    // Update the UI elements with the saved data
    //firstNameTextField.text = firstName;

    [super viewDidLoad];
    
    
}

@end

