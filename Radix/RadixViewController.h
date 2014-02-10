//
//  RadixViewController.h
//  Radix
//
//  Created by Константин Фомин on 01.02.14.
//  Copyright (c) 2014 Константин Фомин. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RadixViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
{
    
 IBOutlet UILabel *Out;
 IBOutlet UITextField *Number_textField;
// IBOutlet UITextField *System_textField;
 IBOutlet UIPickerView *System_PickerView;

 NSString *UserNumber;
 NSString *UserSystem;
 NSString *complete;
 NSString *variable;

 NSInteger Num;
 NSInteger Sys;
 NSInteger Res;
    
 NSArray *system_array;

    
}

- (IBAction)InputNumber;
//- (IBAction)InputSystem;
//- (IBAction)Output;
//- (IBAction)Button;



@end
