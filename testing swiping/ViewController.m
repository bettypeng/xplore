//
//  ViewController.m
//  testing swiping
//
//  Created by Richard Kim on 5/21/14.
//  Copyright (c) 2014 Richard Kim. All rights reserved.
//
//  @cwRichardKim for updates and requests

#import "ViewController.h"
#import "DraggableViewBackground.h"
#import <linkedin-sdk/LISDK.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property IBOutlet UIButton *children;
@property IBOutlet UIButton *equality;
@property IBOutlet UIButton *environment;
@property IBOutlet UIButton *art;
@property IBOutlet UIButton *elders;
@property IBOutlet UIButton *education;
@property IBOutlet UIButton *hospital;
@property IBOutlet UIButton *animals;
@property IBOutlet UITextField *textfield;
@property IBOutlet UITextField *textfield2;


@end

@implementation ViewController

bool childrenbool;
bool equalitybool;
bool environmentbool;
bool artbool;
bool eldersbool;
bool educationbool;
bool hospitalbool;
bool animalsbool;


-(void)dismissKeyboard {
    [_textfield resignFirstResponder];
    [_textfield2 resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:draggableBackground];

    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    
//    testing = @"hello";

    
    
    childrenbool = true;
    equalitybool = true;
    environmentbool = true;
    artbool = true;
    eldersbool = true;
    educationbool = true;
    hospitalbool = true;
    animalsbool = true;

    [self.children setBackgroundImage:[UIImage imageNamed:@"children_black.png"] forState:UIControlStateNormal];
    
    
    [self.equality setBackgroundImage:[UIImage imageNamed:@"equals_black.png"] forState:UIControlStateNormal];
    
    [self.environment setBackgroundImage:[UIImage imageNamed:@"tree_black.png"] forState:UIControlStateNormal];
    
    
    [self.art setBackgroundImage:[UIImage imageNamed:@"art_black.png"] forState:UIControlStateNormal];
    
    
    [self.elders setBackgroundImage:[UIImage imageNamed:@"glasses_black.png"] forState:UIControlStateNormal];
    
    
    [self.education setBackgroundImage:[UIImage imageNamed:@"education_black.png"] forState:UIControlStateNormal];
    
    
    [self.hospital setBackgroundImage:[UIImage imageNamed:@"hospital_black.png"] forState:UIControlStateNormal];
    
    
    [self.animals setBackgroundImage:[UIImage imageNamed:@"animals_black"] forState:UIControlStateNormal];
    

    
}
- (IBAction)login:(id)sender {
    /*if([self.password.text isEqualToString:@""] && [self.username.text isEqualToString:@""] ){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login error" message:@"Empty" delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
    } else if([self.username.text isEqualToString:@"student"]) {
        
    } else {
        
    }*/
}

- (IBAction)explore:(id)sender {
//    CGRect frame = self.view.frame
    CGRect frame = CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height-90);
    frame.origin.y = -self.view.frame.size.height; //optional: if you want the view to drop down
    DraggableViewBackground *draggableBackground = [[DraggableViewBackground alloc]initWithFrame:frame];
    draggableBackground.alpha = 0; //optional: if you want the view to fade in
    
    [self.view addSubview:draggableBackground];
    
    //optional: animate down and in
    [UIView animateWithDuration:0.5 animations:^{
        draggableBackground.center = self.view.center;
        draggableBackground.alpha = 1;
    }];
}


- (IBAction)equalityBtnPressed:(id)sender {
    if(equalitybool) {
        [self.equality setBackgroundImage:[UIImage imageNamed:@"equals_white.png"] forState:UIControlStateNormal];
        equalitybool = false;
    } else {
        [self.equality setBackgroundImage:[UIImage imageNamed:@"equals_black.png"] forState:UIControlStateNormal];
        equalitybool = true;
    }
}
- (IBAction)childrenBtnPressed:(id)sender {
    if(childrenbool){
        [self.children setBackgroundImage:[UIImage imageNamed:@"children_white.png"] forState:UIControlStateNormal];
        childrenbool = false;
    } else {
        [self.children setBackgroundImage:[UIImage imageNamed:@"children_black.png"] forState:UIControlStateNormal];
        childrenbool = true;
    }
}
- (IBAction)environmentBtnPressed:(id)sender {
    if(environmentbool) {
        [self.environment setBackgroundImage:[UIImage imageNamed:@"tree_white.png"] forState:UIControlStateNormal];
        environmentbool = false;
    } else {
        [self.environment setBackgroundImage:[UIImage imageNamed:@"tree_black.png"] forState:UIControlStateNormal];
        environmentbool = true;
    }
}
- (IBAction)artsBtnPressed:(id)sender {
    if(artbool) {
        [self.art setBackgroundImage:[UIImage imageNamed:@"art_white.png"] forState:UIControlStateNormal];
        artbool = false;
    } else {
        [self.art setBackgroundImage:[UIImage imageNamed:@"art_black.png"] forState:UIControlStateNormal];
        artbool = true;
    }
}
- (IBAction)eldersBtnPressed:(id)sender {
    if(eldersbool) {
        [self.elders setBackgroundImage:[UIImage imageNamed:@"glasses_white.png"] forState:UIControlStateNormal];
        eldersbool = false;
    } else {
        [self.elders setBackgroundImage:[UIImage imageNamed:@"glasses_black.png"] forState:UIControlStateNormal];
        eldersbool = true;
    }
}
- (IBAction)educationBtnPressed:(id)sender {
    if(educationbool) {
        [self.education setBackgroundImage:[UIImage imageNamed:@"education_white.png"] forState:UIControlStateNormal];
        educationbool = false;
    } else {
        [self.education setBackgroundImage:[UIImage imageNamed:@"education_black.png"] forState:UIControlStateNormal];
        educationbool = true;
    }
}
- (IBAction)hospitalBtnPressed:(id)sender {
    if(hospitalbool) {
        [self.hospital setBackgroundImage:[UIImage imageNamed:@"hospital_white.png"] forState:UIControlStateNormal];
        hospitalbool = false;
    } else {
        [self.hospital setBackgroundImage:[UIImage imageNamed:@"hospital_black.png"] forState:UIControlStateNormal];
        hospitalbool = true;
    }
}
- (IBAction)animalsBtnPressed:(id)sender {
    if(animalsbool) {
        [self.animals setBackgroundImage:[UIImage imageNamed:@"animals_white.png"] forState:UIControlStateNormal];
        animalsbool = false;
    } else {
        [self.animals setBackgroundImage:[UIImage imageNamed:@"animals_black.png"] forState:UIControlStateNormal];
        animalsbool = true;
    }
}

@end
