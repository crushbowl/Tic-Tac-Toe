//
//  ViewController.m
//  Tic-Tac-Toe
//
//  Created by joy on 5/28/16.
//  Copyright © 2016 JanL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonTwo;
@property (weak, nonatomic) IBOutlet UIButton *buttonThree;
@property (weak, nonatomic) IBOutlet UIButton *buttonFour;
@property (weak, nonatomic) IBOutlet UIButton *buttonFive;
@property (weak, nonatomic) IBOutlet UIButton *buttonSix;
@property (weak, nonatomic) IBOutlet UIButton *buttonSeven;
@property (weak, nonatomic) IBOutlet UIButton *buttonEight;
@property (weak, nonatomic) IBOutlet UIButton *buttonNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;


@property BOOL isX;
@property BOOL shouldSave;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.isX = true;
    [self showCurrentPlayer];
}


// When a user clicks on a button, the sender (indiv button) fires and records the current Player Label
// in the button Title text

-(IBAction)onButtonTapped:(UIButton *)sender {
    int x = 1;
    for (UIButton *button in self.buttons) {
        if (sender == button) {
            [button setTitle:self.whichPlayerLabel.text forState:UIControlStateNormal];
            [button setTitleColor: self.whichPlayerLabel.textColor forState:UIControlStateNormal];
            NSLog(@"Button #: %i - Name: %@",x,button.titleLabel.text); }
        x++;
    }
    [self showCurrentPlayer];
}


-(void)showCurrentPlayer{
    self.isX = !(self.isX);

    if (self.isX) {
        self.whichPlayerLabel.text = @"X";
    } else {
        self.whichPlayerLabel.text = @"O";
    }

    // label color
}


-(void)saveCurrentPosition {
    
    if (self.shouldSave) {
        self.whichPlayerLabel.text = @"X";
    } else {
        self.whichPlayerLabel.text = @"0";
    }

}



@end
