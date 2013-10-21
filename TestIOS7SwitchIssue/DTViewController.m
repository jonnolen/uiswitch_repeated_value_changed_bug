//
//  DTViewController.m
//  TestIOS7SwitchIssue
//
//  Created by Jonathan Nolen on 10/21/13.
//  Copyright (c) 2013 test. All rights reserved.
//

#import "DTViewController.h"

@interface DTViewController ()
@property (nonatomic, weak) IBOutlet UITextView *textView;
@end

@implementation DTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchChanged:(UISwitch *)sender{
    static BOOL background = NO;
    NSMutableAttributedString *newString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@-changed to %@\n", [NSDate date], (sender.isOn ? @"On": @"Off")]];
    if (background){
        [newString addAttribute:NSBackgroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, newString.length)];
    }
    [newString insertAttributedString:_textView.attributedText atIndex:0];
    _textView.attributedText = newString;
    background = !background;
    [_textView scrollRangeToVisible:NSMakeRange(_textView.attributedText.length -1, 1)];
}
@end
