//
//  UiPreferenceUiStyleSelectView.m
//  dodicall
//
//  Copyright (C) 2016, Telco Cloud Trading & Logistic Ltd
//
//  This file is part of dodicall.
//  dodicall is free software : you can redistribute it and / or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  dodicall is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with dodicall.If not, see <http://www.gnu.org/licenses/>.

#import "UiPreferenceUiStyleSelectView.h"
#import "UiPreferenceUiStyleSelectTableView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UiPreferencesTabNavRouter.h"

@interface UiPreferenceUiStyleSelectView ()
@property (weak, nonatomic) IBOutlet UIButton *BackButton;

@property UiPreferenceUiStyleSelectTableView *ChildView;

@end

@implementation UiPreferenceUiStyleSelectView

{
    BOOL _IsAllBinded;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.ViewModel =  [[UiPreferenceUiStyleSelectViewModel alloc] init];
        
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self BindAll];
}

- (void) BindAll
{
    
    @weakify(self);
    
    // Bind Back action
    [[self.BackButton rac_signalForControlEvents: UIControlEventTouchUpInside] subscribeNext: ^(id value) {
        
        @strongify(self);
        
        [UiPreferencesTabNavRouter ClosePreferenceStyleView];
        
        [self.ChildView.ViewModel ExecuteBackAction];
        //[self dismissModalViewControllerAnimated:YES];
        
    }];
    
    _IsAllBinded = TRUE;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"UiPreferenceUiStyleSelectTableContainerView"]) {
        self.ChildView = segue.destinationViewController;
    }
}

@end