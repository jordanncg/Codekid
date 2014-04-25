//
//  BlockFactory.m
//  codekid
//
//  Created by Jordan Cortes Guzman on 4/19/14.
//  Copyright (c) 2014 Cecilia Rodríguez Ramírez & Jordan Y. Cortés Guzmán. All rights reserved.
//

#import "BlockFactory.h"

@implementation BlockFactory

- (id)init
{
    self = [super init];
    
    if (self)
    {
        _notificationCenter = [NSNotificationCenter defaultCenter];
    }
    
    return self;
}

- (Block *)createBlockOfType:(NSInteger)type
{
    Block *temp = [[Block alloc] init];
    //temp.block_inside = NO;
    temp.inner_drop_zones = [[NSMutableArray alloc] init];
    
    switch (type)
    {
        case BLOCK_MOVEMENT_TURN:
        {
            temp.main_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
            temp.main_view.backgroundColor = [UIColor yellowColor];
            [[temp inner_drop_zones] addObject:[[DropZoneView alloc] initWithFrame:CGRectMake(20, 0, 10, 50)]];
        }
            break;
        case BLOCK_OPERATOR_PLUS:
        {
            temp.main_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 140, 59)];
            [[temp.main_view layer] setBorderWidth:2.0];
            [[temp.main_view layer] setBorderColor:[UIColor blackColor].CGColor];
            temp.main_view.backgroundColor = [UIColor colorWithRed:0.145098039 green:0.552941176 blue:0.2 alpha:1.0];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [[first_drop_zone layer] setBorderWidth:2.0];
            [[first_drop_zone layer] setBorderColor:[UIColor blackColor].CGColor];
            DropZoneTextField *first_text = [[DropZoneTextField alloc] initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)];
            [first_drop_zone addSubview:first_text];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UIImageView *plus_sign = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"block_sign_plus"]];
            [plus_sign setTag:2];
            [plus_sign setFrame:CGRectMake(60.627, 19.764, 19.888, 19.4715)];
            [temp.main_view addSubview:plus_sign];
            
            // Primer Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [[second_drop_zone layer] setBorderWidth:2.0];
            [[second_drop_zone layer] setBorderColor:[UIColor blackColor].CGColor];
            DropZoneTextField *second_text = [[DropZoneTextField alloc] initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)];
            [second_drop_zone addSubview:second_text];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_MINUS:
        {
            temp.main_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 140, 59)];
            temp.main_view.backgroundColor = [UIColor blueColor];
            [[temp inner_drop_zones] addObject:[[DropZoneView alloc] initWithFrame:CGRectMake(20, 0, 10, 50)]];
        }
            break;
        default:
            break;
    }
    
    for (UIView *this_view in [temp inner_drop_zones])
    {
        [this_view setBackgroundColor:[UIColor whiteColor]];
    }
    
    return temp;
}

@end