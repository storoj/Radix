//
//  RadixViewController.m
//  Radix
//
//  Created by Константин Фомин on 01.02.14.
//  Copyright (c) 2014 Константин Фомин. All rights reserved.
//

#import "RadixViewController.h"
#import "RadixEntity.h"

@interface RadixViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *radixes;
@property (nonatomic, weak) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *inputNumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

typedef unichar RadixDigit;

static const RadixDigit RadixDigits[] = {
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
    'a', 'b', 'c', 'd', 'e', 'f'
};

@implementation RadixViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initRadixes];
}

- (void)initRadixes
{
    const RadixBase startBase = 2;
    const RadixBase endBase = 16;
    
    NSMutableArray *radixes = [NSMutableArray arrayWithCapacity:endBase-startBase+1];
    
    // adding titles for common used radixes
    for (NSUInteger base=startBase; base<=endBase; base++) {
        RadixEntity *entity = nil;
        switch (base) {
            case RadixBaseBinary:
                entity = [RadixEntity entityWithBase:base title:@"Binary"];
                break;
                
            case RadixBaseOctal:
                entity = [RadixEntity entityWithBase:base title:@"Octal"];
                break;
                
            case RadixBaseDecimal:
                entity = [RadixEntity entityWithBase:base title:@"Decimal"];
                break;
                
            case RadixBaseHex:
                entity = [RadixEntity entityWithBase:base title:@"Hex"];
                break;
                
            default:
                entity = [RadixEntity entityWithBase:base];
                break;
        }
        
        [radixes addObject:entity];
    }
    
    self.radixes = [radixes copy];
}

- (NSInteger)convertValueWithStringToDecimal:(NSString *)stringValue fromBase:(RadixBase)base
{
    if (base == RadixBaseDecimal) {
        return [stringValue integerValue];
    }
    
    // TODO
    return 0;
}

- (NSString *)convertDecimalValue:(NSInteger)decimalValue toBase:(RadixBase)base
{
    RadixDigit result[11];
    NSUInteger resultLength = 0;
    
    NSInteger value = decimalValue;
    while (value > 0) {
        NSUInteger digit = value % base;
        
        // needs to be reverted later
        result[resultLength++] = RadixDigits[digit];
        
        value = value / base;
    }
    
    if (resultLength == 0) {
        result[resultLength++] = RadixDigits[0];
    }
    
    // revert result
    for (NSUInteger i=0; i<resultLength/2; ++i) {
        const NSUInteger j = resultLength-i-1;
        
        RadixDigit tmp = result[i];
        result[i] = result[j];
        result[j] = tmp;
    }
    
    return [NSString stringWithCharacters:result length:resultLength];
}

- (NSString *)convertValueWithString:(NSString *)stringValue
                            fromBase:(RadixBase)srcBase
                              toBase:(RadixBase)destBase
{
    NSInteger decimalValue = [self convertValueWithStringToDecimal:stringValue fromBase:srcBase];
    
    NSString *result = [self convertDecimalValue:decimalValue toBase:destBase];
    return result;
}

- (void)updateResult
{
    NSString *valueString = [self.inputNumberTextField text];
    
    NSInteger selectedRadixRow = [self.pickerView selectedRowInComponent:0];
    RadixEntity *entity = self.radixes[selectedRadixRow];
    RadixBase destBase = [entity base];
    
    NSString *resultValueString = [self convertValueWithString:valueString
                                                      fromBase:RadixBaseDecimal
                                                        toBase:destBase];
    [self.resultLabel setText:resultValueString];
}

#pragma mark - Properties

- (void)setRadixes:(NSArray *)radixes
{
    _radixes = radixes;
    
    [self.pickerView reloadAllComponents];
}

#pragma mark - Actions

- (IBAction)sourceNumberEditingChanged:(UITextField *)sender
{
    [self updateResult];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.radixes count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    RadixEntity *entity = self.radixes[(NSUInteger)row];
    return [entity title];
}

#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    [self updateResult];
}

@end