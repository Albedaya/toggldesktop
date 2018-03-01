//
//  TimerEditViewController.h
//  Toggl Desktop on the Mac
//
//  Created by Tanel Lebedev on 19/09/2013.
//  Copyright (c) 2013 TogglDesktop developers. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSTextFieldClickable.h"
#import "NSTextFieldDuration.h"
#import "NSCustomTimerComboBox.h"
#import "NSHoverButton.h"
#import "NSBoxClickable.h"
#import "AutoCompleteInput.h"

@interface TimerEditViewController : NSViewController <NSComboBoxDataSource, NSTextFieldDelegate, NSTableViewDelegate> {
}
@property (strong) IBOutlet NSBoxClickable *manualBox;
@property (strong) IBOutlet NSBox *hidingBox;
@property (strong) IBOutlet NSBoxClickable *mainBox;
@property IBOutlet NSTextFieldDuration *durationTextField;
@property (weak) IBOutlet NSLayoutConstraint *descriptionTrailing;
@property IBOutlet NSHoverButton *startButton;
@property IBOutlet NSTextField *projectTextField;
@property IBOutlet NSTextFieldClickable *descriptionLabel;
@property IBOutlet NSBox *startButtonBox;
@property (nonatomic, strong) IBOutlet NSImageView *billableFlag;
@property (nonatomic, strong) IBOutlet NSImageView *tagFlag;
@property NSArray *projectComboConstraint;
@property NSArray *projectLabelConstraint;
- (IBAction)startButtonClicked:(id)sender;
- (IBAction)durationFieldChanged:(id)sender;
- (IBAction)autoCompleteChanged:(id)sender;
@property (strong) IBOutlet NSTextFieldClickable *addEntryLabel;
@property (weak) IBOutlet AutoCompleteInput *autoCompleteInput;
- (void)timerFired:(NSTimer *)timer;
- (void)fillEntryFromAutoComplete:(AutocompleteItem *)item;
@end
