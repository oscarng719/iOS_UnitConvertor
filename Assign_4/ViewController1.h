//
//  ViewController1.h
//  Assign_4
//
//  Created by Oscar on 2/2/14.
//  Copyright (c) 2014 Oscar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController1 : ViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
{
    IBOutlet UITextField *UITextField_from;
    IBOutlet UITextField *UITextField_to;
    int tempFromID;
    int tempToID;
}

@property (strong, nonatomic) NSArray *temperture_unit;
@property (strong, nonatomic) NSArray *TpickersArray;
@property (strong, nonatomic) IBOutlet UIPickerView *temperture1_picker;
@property (strong, nonatomic) IBOutlet UIPickerView *temperture2_picker;
@property (strong, nonatomic) IBOutlet UILabel *temperture_from;
@property (strong, nonatomic) IBOutlet UILabel *temperture_to;
@property (strong, nonatomic) IBOutlet UIButton *Tconvert;


-(IBAction)ConvertButtonPressed:(id)sender;


@end
