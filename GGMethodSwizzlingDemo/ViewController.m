//
//  ViewController.m
//  GGMethodSwizzlingDemo
//
//  Created by __无邪_ on 15/10/8.
//  Copyright © 2015年 __无邪_. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Swizzle.h"
#import <objc/runtime.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    Method ori_Method =  class_getInstanceMethod([NSArray class], @selector(lastObject));
    Method my_Method = class_getInstanceMethod([NSArray class], @selector(myLastObject));
    method_exchangeImplementations(ori_Method, my_Method);
    
    NSArray *array = @[@"0",@"1",@"2",@"3"];
    NSString *string = [array lastObject];
    NSLog(@"TEST RESULT : %@",string);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
