//
//  TextFieldViewController.m
//  TipCalculator
//
//  Created by Jenny Chang on 18/01/2019.
//  Copyright © 2019 Jenny Chang. All rights reserved.
//

#import "TextFieldViewController.h"

@interface TextFieldViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipAmountLabel;
@property (nonatomic) float userBill;
@property (weak, nonatomic) IBOutlet UILabel *customTimAmount;

@end

@implementation TextFieldViewController

- (IBAction)tip12:(UIButton *)sender {
    self.userBill = [self.billAmountTextField.text integerValue];
    float billTax = self.userBill * 1.12;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f",billTax];
}
- (IBAction)tip15:(UIButton *)sender {
    self.userBill = [self.billAmountTextField.text integerValue];
    float billTax = self.userBill * 1.15;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f",billTax];
}
- (IBAction)tip20:(UIButton *)sender {
    self.userBill = [self.billAmountTextField.text integerValue];
    float billTax = self.userBill * 1.20;
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f",billTax];
}
- (IBAction)customTipSlider:(UISlider *)sender {
    // set range of the slider
    self.userBill = [self.billAmountTextField.text integerValue];
    float billTax = self.userBill * (1+(sender.value/100));
    
    self.customTimAmount.text = [NSString stringWithFormat:@"%.1f",sender.value];
    self.tipAmountLabel.text = [NSString stringWithFormat:@"$%.2f",billTax];
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.billAmountTextField.delegate = self;
    [self setupTextField];

}

-(void)displayTopLabelText:(NSString *)text {
    self.billAmountTextField.text = text;
}

-(void)setupTextField {
    
    self.billAmountTextField.keyboardType = UIKeyboardTypeDecimalPad;
    self.billAmountTextField.clearButtonMode = UITextFieldViewModeUnlessEditing;

    NSLog(@"in setuptextfield: %@",self.billAmountTextField.typingAttributes);

}




@end
