//
//  ViewController2.m
//  Assign_4
//
//  Created by Oscar on 2/2/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    self.length_unit = [[NSArray alloc] initWithObjects:@"Centimeter",@"Inch",@"Kilometer",@"Meter",@"Mile", nil];
    
    _length1_picker.tag = 11;
    _length2_picker.tag = 12;
    _length_from.text = @"Centimeter";
    _length_to.text = @"Centimeter";
    lengthFromID = 0;
    lengthToID = 0;
    //[UITextField_to setEnabled:NO];
    [UITextField_from setDelegate:self];
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view.
}

-(NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.length_unit count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component
{
    return [self.length_unit objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    int n = row;
    NSString *tmp;
    if(n == 0){
        tmp = @"Centimeter";}
    else if(n == 1){
        tmp = @"Inch";}
    else if(n == 2){
        tmp = @"Kilometer";}
    else if(n == 3){
        tmp = @"Meter";}
    else if(n == 4){
        tmp = @"Mile";}
    
    if(pickerView.tag == 11){
        _length_from.text = tmp;
        lengthFromID = row;
        UITextField_from.placeholder = tmp;
    }
    else if(pickerView.tag == 12){
        _length_to.text = tmp;
        lengthToID = row;
        UITextField_to.placeholder = tmp;
    }
}

-(IBAction)ConvertButtonPressed:(id)sender
{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please, input the data!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    UIAlertView *alert2 = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Input value is not correct!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    bool check = true;
    
    if([[UITextField_from text] isEqualToString:@""] == true)
    {
        [alert show];
    }
    else
    {
        NSString* GetNum = [UITextField_from text];
        
        
        if( ![(NSNumber *)GetNum intValue])
        {
            if(![GetNum  isEqual: @"0"])
            {
                [alert2 show];
                check = false;
            }
            
        }
        
        if(check)
        {
            double CalResult;
            
            if(lengthFromID == lengthToID)
            {
                CalResult = [GetNum doubleValue];
            }
            else if(lengthFromID == 0)
            {
                if(lengthToID == 1)
                {
                    CalResult = [GetNum doubleValue] * 0.39370 ;
                }
                else if(lengthToID == 2)
                {
                    CalResult = [GetNum doubleValue] / 100000 ;
                }
                else if(lengthToID == 3)
                {
                    CalResult = [GetNum doubleValue] / 100;
                }
                else
                {
                    CalResult = [GetNum doubleValue] * 0.0000062137119223733;
                }
            }
            else if(lengthFromID == 1)
            {
                if(lengthToID == 0)
                {
                    CalResult = [GetNum doubleValue] * 2.54;
                }
                else if(lengthToID == 2)
                {
                    CalResult = [GetNum doubleValue] * 0.0000254;
                }
                else if(lengthToID == 3)
                {
                    CalResult = [GetNum doubleValue] * 0.0254;
                }
                else
                {
                    CalResult = [GetNum doubleValue] * 0.000015782828282828;
                }
            }
            else if(lengthFromID == 2)
            {
                if(lengthToID == 0)
                {
                    CalResult = [GetNum doubleValue] * 100000;
                }
                else if(lengthToID == 1)
                {
                    CalResult = [GetNum doubleValue] * 39370.078740157;
                }
                else if(lengthToID == 3)
                {
                    CalResult = [GetNum doubleValue] * 1000;
                }
                else
                {
                    CalResult = [GetNum doubleValue] * 0.62137119223733;
                }
            }
            else if(lengthFromID == 3)
            {
                if(lengthToID == 0)
                {
                    CalResult = [GetNum doubleValue] * 100;
                }
                else if(lengthToID == 1)
                {
                    CalResult = [GetNum doubleValue] * 39.370078740157;
                }
                else if(lengthToID == 2)
                {
                    CalResult = [GetNum doubleValue] * 0.001;
                }
                else
                {
                    CalResult = [GetNum doubleValue] * 0.00062137119223733;
                }
            }
            else
            {
                if(lengthToID == 0)
                {
                    CalResult = [GetNum doubleValue] * 160934.4;
                }
                else if(lengthToID == 1)
                {
                    CalResult = [GetNum doubleValue] * 63360;
                }
                else if(lengthToID == 2)
                {
                    CalResult = [GetNum doubleValue] * 1.609344;
                }
                else
                {
                    CalResult = [GetNum doubleValue] * 1609.344;
                    
                }
            }
            
            
            UITextField_to.text = [NSString stringWithFormat:@"%.3f",CalResult];
        }
        
    }
}

-(BOOL) textFieldShouldReturn:(UITextField *)_textField
{
    [UITextField_from resignFirstResponder];
    
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch * touch = [[event allTouches] anyObject];
    
    if ([UITextField_from isFirstResponder] && [touch view] != UITextField_from)
        [UITextField_from resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
