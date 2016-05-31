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

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo1;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo2;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo3;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo4;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo5;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo6;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo7;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *winningCombo8;

@property NSArray *allWinningCombinations;

@property NSArray *winningArray;
@property NSString *storedButtonTitle;
@property NSMutableArray *xButtonArray;
@property NSMutableArray *oButtonArray;
@property NSString *whoWon;

//@property NSString *showCurrentPLayer;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property NSMutableString *storedValues;


@property BOOL isX;


@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.isX = true;
    [self showCurrentPlayer];
    self.storedValues = [[NSMutableString alloc] init];
    
    self.xButtonArray = [[NSMutableArray alloc] init];
    self.oButtonArray = [[NSMutableArray alloc] init];
    self.allWinningCombinations = @[self.winningCombo1, self.winningCombo2, self.winningCombo3,
                                    self.winningCombo4, self.winningCombo5, self.winningCombo6, self.winningCombo7, self.winningCombo8];
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
            
            // Displays currentTitle of the Button the user click's on
            self.storedButtonTitle =  [button currentTitle];
            NSLog(@"Current Title: %@\n", [button currentTitle]);
        }
        
        // The below allows a user's choice to remain unchanged. On button click, saves user choice in button by disabling UserInteraction
        
        [sender setUserInteractionEnabled:NO];
        x++;
    }
    
    // Add each button/sender to its respective Mutable Array
    if (self.isX) {
        [self.xButtonArray addObject: sender];
    } else {
        [self.oButtonArray addObject: sender];
    }
    
    [self showCurrentPlayer];
    [self declareTheWinner];
}


-(void)declareTheWinner{
    BOOL winnerIsX = NO;
    BOOL winnerIsO = NO;
    
    for (NSArray * array in self.allWinningCombinations) {
        
        BOOL contains1 = NO;
        BOOL contains2 = NO;
        BOOL contains3 = NO;
        
        int i = 1;
        for (UIButton * button in array) {
            if (i == 1 && [self.xButtonArray containsObject:button]) {
                contains1 = YES;
            }
            if (i == 2 && [self.xButtonArray containsObject:button]) {
                contains2 = YES;
            }
            if (i == 3 && [self.xButtonArray containsObject:button]) {
                contains3 = YES;
            }
            i++;
        }
        if (contains3 && contains2 && contains1) {
            winnerIsX = YES;
            }
    }
    
    for (NSArray * array in self.allWinningCombinations) {
        
        BOOL contains1 = NO;
        BOOL contains2 = NO;
        BOOL contains3 = NO;
        
        int i = 1;
        for (UIButton * button in array) {
            if (i == 1 && [self.oButtonArray containsObject:button]) {
                contains1 = YES;
            }
            if (i == 2 && [self.oButtonArray containsObject:button]) {
                contains2 = YES;
            }
            if (i == 3 && [self.oButtonArray containsObject:button]) {
                contains3 = YES;
            }
            i++;
        }
        if (contains3 && contains2 && contains1) {
            winnerIsO= YES;
        }
    }
    
    if (winnerIsX) {
        self.whoWon = @"Winner is X.";
// Passed a parameter - using a custom method
        [self alertWinner:self.whoWon];
    }
    if (winnerIsO) {
        self.whoWon = @"Winner is O.";
        [self alertWinner:self.whoWon];
    }
}

    
- (void) alertWinner:(NSString *)stringForAlert {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"The Winner"
                                                                   message: stringForAlert
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:nil];
// Passed a parameter - using a custom method
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
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
    NSLog(@"Show current player: whichplayerlabel:%@, storedValues:%@", self.whichPlayerLabel.text, self.storedValues);
}




@end
