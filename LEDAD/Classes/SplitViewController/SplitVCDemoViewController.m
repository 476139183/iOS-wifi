//
//  LEDADViewController.m
//  LEDAD
//
//  yixingman on 11-10-22.
//  ledmedia All rights reserved.
//

#import "SplitVCDemoViewController.h"

@implementation SplitVCDemoViewController

@synthesize splitVC;

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


/**/
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
//	[self.view addSubview:splitVC.view];
	// Split View Controller 只能作为window的根视图控制器
	UIWindow* window=[(AppDelegate*)[[UIApplication sharedApplication]delegate]window];
    window.frame = [[UIScreen mainScreen] bounds];
//    window.frame = CGRectMake(-20, 0, 748, 1024);
    window.backgroundColor = [UIColor clearColor];
	window.rootViewController=splitVC;
    
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[splitVC release];
    [super dealloc];
}

@end
