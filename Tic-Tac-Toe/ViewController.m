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
- (IBAction)saveCurrentPosition:(UIButton *)sender;
@property NSString *someLocalField;

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

// Also adds color to X (blue) or O (red) depending on click/turn.
-(IBAction)onButtonTapped:(UIButton *)sender {
    int x = 1;
    for (UIButton *button in self.buttons) {
        if (sender == button) {
            [button setTitle:self.whichPlayerLabel.text forState:UIControlStateNormal];
            [button setTitleColor: self.whichPlayerLabel.textColor forState:UIControlStateNormal];
            
            
//            NSLog(@"Button #: %i - Name: %@",x,button.titleLabel.text);
        }
        x++;
    }
    
    [self showCurrentPlayer];
}


-(void)showCurrentPlayer{
    self.isX = !(self.isX);

    if (self.isX) {
        self.whichPlayerLabel.text = @"X";
        self.whichPlayerLabel.textColor = [UIColor blueColor];
    } else {
        self.whichPlayerLabel.text = @"O";
        self.whichPlayerLabel.textColor = [UIColor redColor];

    }

    // label color
}


-(IBAction)saveCurrentPosition:(UIButton *)sender {
    
  NSString *title = [(UIButton *)sender currentTitle];
    
    sender.titleLabel.text = title;
    [sender setUserInteractionEnabled:NO];
    NSLog(@"%@", title);

}



@end
