//
//  RadixViewController.m
//  Radix
//
//  Created by Константин Фомин on 01.02.14.
//  Copyright (c) 2014 Константин Фомин. All rights reserved.
//

#import "RadixViewController.h"

@interface RadixViewController ()

@end

@implementation RadixViewController


- (IBAction)InputNumber {
    
    NSString *Number = Number_textField.text;
    Num=[Number intValue];
    NSLog(@"Num = %d",Num);
    complete = @" ";
    Out.text = @" ";
}



/*-(IBAction)InputSystem{
    NSString *System = System_textField.text; //was TextField "введите число"
    Sys=[System intValue];
    NSLog(@"Sys = %d",Sys);
}
*/

-(IBAction)Output{

     complete = @" ";
    
    int n, LoL, a;
    
    a = Sys;
    
    for(int i = 0 ;; i++)
    {
        if( pow(Sys, i) >= Num)
        {
            n = i;
            break;
        }
    }
    
    char mas[n];
    int i = 0;
    
    while(Num != 0)
    {
        LoL = Num % a;
        switch(LoL)
        {
            case(0): mas[i] = '0'; break;
            case(1): mas[i] = '1'; break;
            case(2): mas[i] = '2'; break;
            case(3): mas[i] = '3'; break;
            case(4): mas[i] = '4'; break;
            case(5): mas[i] = '5'; break;
            case(6): mas[i] = '6'; break;
            case(7): mas[i] = '7'; break;
            case(8): mas[i] = '8'; break;
            case(9): mas[i] = '9'; break;
            case(10): mas[i] = 'A'; break;
            case(11): mas[i] = 'B'; break;
            case(12): mas[i] = 'C'; break;
            case(13): mas[i] = 'D'; break;
            case(14): mas[i] = 'E'; break;
            case(15): mas[i] = 'F'; break;                                                                 
        }
        Num /= a;
        i++;
        }
    for (i = n ; i>=0; i--) {
        variable = [NSString stringWithFormat:@"%c",mas[i]];
        complete = [NSString stringWithFormat:@"%@%@",complete,variable];
                    
    }
    NSLog(@" %@",complete);
    Out.text = [NSString stringWithFormat:@"%@", complete];
}

/*- (IBAction)Button {
    complete = @" ";
    System_textField.text = @" ";
    Number_textField.text = @" "; //was Button "Начало"
    Out.text = @" ";
}
*/



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    system_array = [[NSArray alloc] initWithObjects:@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return system_array.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [system_array objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    Sys = row+2;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end