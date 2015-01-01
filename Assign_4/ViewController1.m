//
//  ViewController1.m
//  Assign_4
//
//  Created by Oscar on 2/2/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//


#import "ViewController1.h"

@interface ViewController1 ()

@end

@implementation ViewController1

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
    self.temperture_unit = [[NSArray alloc] initWithObjects:@"Celsius",@"Fahrenheit",@"Kelvin", nil];
    
    _temperture1_picker.tag = 11;
    _temperture2_picker.tag = 12;
    _temperture_from.text = @"Celsius";
    _temperture_to.text = @"Celsius";
    tempFromID = 0;
    tempToID = 0;
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
    return [self.temperture_unit count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView
            titleForRow:(NSInteger)row
           forComponent:(NSInteger)component
{
    return [self.temperture_unit objectAtIndex:row];
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    int n = row;
    NSString *tmp;
    if(n == 0){
        tmp = @"Celsius";}
    else if(n == 1){
        tmp = @"Fahrenheit";}
    else if(n == 2){
        tmp = @"Kelvin";}
    
    if(pickerView.tag == 11){
        _temperture_from.text = tmp;
        tempFromID = row;
        UITextField_from.placeholder = tmp;
    }
    else if(pickerView.tag == 12){
        _temperture_to.text = tmp;
        tempToID = row;
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
            if(tempFromID == tempToID)
            {
                UITextField_to.text = GetNum;
            }
            else if(tempFromID == 0)
            {
                if(tempToID == 1)
                {
                    double CalResult = ([GetNum doubleValue] * 9 / 5 ) + 32;
                    UITextField_to.text = [NSString stringWithFormat:@"%.3f",CalResult];
                }
                else
                {
                    double CalResult = [GetNum doubleValue] + 273.15;
                    UITextField_to.text = [NSString stringWithFormat:@"%.3f",CalResult];
                }
            }
            else if(tempFromID == 1)
            {
                if(tempToID == 0)
                {
                    double CalResult = ([GetNum doubleValue] + 459.67) * 5 / 9 ;
                    UITextField_to.text = [NSString stringWithFormat:@"%.3f",CalResult];
                }
                else
                {
                    double CalResult = ([GetNum doubleValue] - 32) * 5 / 9 ;
                    UITextField_to.text = [NSString stringWithFormat:@"%.3f",CalResult];
                }
            }
            else
            {
                if(tempToID == 0)
                {
                    double CalResult = [GetNum doubleValue] - 273.15;
                    UITextField_to.text = [NSString stringWithFormat:@"%.3f",CalResult];
                }
                else
                {
                    double CalResult = ([GetNum doubleValue] * 9 / 5) - 459.67;
                    UITextField_to.text = [NSString stringWithFormat:@"%.3f",CalResult];
                }
            }
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
