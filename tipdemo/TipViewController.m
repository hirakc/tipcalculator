//
//  TipViewController.m
//  tipdemo
//
//  Created by Hirak Chatterjee on 6/5/14.
//  Copyright (c) 2014 Hirak Chatterjee. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentControl;


- (IBAction)onTapGesture:(id)sender;
- (IBAction)onTipPercentControlTap:(id)sender;


@end

@implementation TipViewController

int tipControlSelectedIndex = 2;
float tipPercentArray[] = {0.1, 0.15, 0.2};

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.


    self.tipLabel.text = @"0.00";
    self.totalLabel.text = @"0.00";

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTapGesture:(id)sender {
    NSLog(@"A user tapped");
    
    float billAmount = [self.billField.text floatValue];
    float tipAmount = billAmount * tipPercentArray[tipControlSelectedIndex];
    float totalAmount = billAmount + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
    
    [self.view endEditing:YES];
    
    
    
}

- (IBAction)onTipPercentControlTap:(id)sender {
    NSLog(@"tip percent tapped");
    
    tipControlSelectedIndex = self.tipPercentControl.selectedSegmentIndex;
    [self onTapGesture:sender];
}
@end
