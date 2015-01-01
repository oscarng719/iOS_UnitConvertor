//
//  ViewController2.h
//  Assign_4
//
//  Created by Oscar on 2/2/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController2 : ViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    IBOutlet UITextField *UITextField_from;
    IBOutlet UITextField *UITextField_to;
    int lengthFromID;
    int lengthToID;
}

@property (strong, nonatomic) NSArray *length_unit;
@property (strong, nonatomic) NSArray *TpickersArray;
@property (strong, nonatomic) IBOutlet UIPickerView *length1_picker;
@property (strong, nonatomic) IBOutlet UIPickerView *length2_picker;
@property (strong, nonatomic) IBOutlet UILabel *length_from;
@property (strong, nonatomic) IBOutlet UILabel *length_to;
@property (strong, nonatomic) IBOutlet UIButton *Tconvert;


-(IBAction)ConvertButtonPressed:(id)sender;

@end
