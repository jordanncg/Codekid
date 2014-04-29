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

- (Block *)createBlockOfType:(NSInteger)type withData:(id)data
{
    Block *temp = [[Block alloc] init];
    temp.inner_drop_zones = [[NSMutableArray alloc] init];
    
    switch (type)
    {
        case BLOCK_EVENTS_START:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 230, 59)
                              andColor:[UIColor colorWithRed:0.819607843137255 green:0.443137254901961 blue:0 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"WHEN START" fontSize:35 andPosition:CGPointMake(5, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
        }
            break;
        case BLOCK_EVENTS_WHEN:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 168.5, 59)
                              andColor:[UIColor colorWithRed:0.819607843137255 green:0.443137254901961 blue:0 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"WHEN" fontSize:35 andPosition:CGPointMake(7, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(116, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_APPEARANCE_SHOW:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 111.5, 59)
                              andColor:[UIColor colorWithRed:0.450980392156863 green:0.207843137254902 blue:0.835294117647059 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"SHOW" fontSize:35 andPosition:CGPointMake(4, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
        }
            break;
        case BLOCK_APPEARANCE_CLEAR:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 111.5, 59)
                              andColor:[UIColor colorWithRed:0.450980392156863 green:0.207843137254902 blue:0.835294117647059 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"CLEAR" fontSize:35 andPosition:CGPointMake(-5, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
        }
            break;
        case BLOCK_APPEARANCE_HIDE:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 111.5, 59)
                              andColor:[UIColor colorWithRed:0.450980392156863 green:0.207843137254902 blue:0.835294117647059 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"HIDE" fontSize:35 andPosition:CGPointMake(6, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
        }
            break;
        case BLOCK_APPEARANCE_LOAD:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 168.5, 59)
                              andColor:[UIColor colorWithRed:0.450980392156863 green:0.207843137254902 blue:0.835294117647059 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"LOAD" fontSize:35 andPosition:CGPointMake(7, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(116, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_APPEARANCE_SCALE:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 168.5, 59)
                              andColor:[UIColor colorWithRed:0.450980392156863 green:0.207843137254902 blue:0.835294117647059 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"SCALE" fontSize:35 andPosition:CGPointMake(0, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(116, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_APPEARANCE_SET:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 168.5, 59)
                              andColor:[UIColor colorWithRed:0.450980392156863 green:0.207843137254902 blue:0.835294117647059 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"SET" fontSize:35 andPosition:CGPointMake(20, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(116, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_APPEARANCE_SAY:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 230, 59)
                              andColor:[UIColor colorWithRed:0.450980392156863 green:0.207843137254902 blue:0.835294117647059 alpha:1.0]];
            
            // Primer Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"SAY" fontSize:35 andPosition:CGPointMake(0, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(70, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Segundo Texto
            UILabel *second_text = [[VariableLabel alloc] initWithName:@"FOR" fontSize:35 andPosition:CGPointMake(105, 0)];
            [second_text setTag:3];
            [temp.main_view addSubview:second_text];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(179, 0, 40, 59)];
            [second_drop_zone setTag:4];
            [second_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_INTEGER]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_MOVEMENT_TURN:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 168.5, 59)
                              andColor:[UIColor colorWithRed:0.207843137254902 green:0.317647058823529 blue:0.815686274509804 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"TURN" fontSize:35 andPosition:CGPointMake(7, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(116, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_MOVEMENT_MOVE:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 201, 59)
                              andColor:[UIColor colorWithRed:0.207843137254902 green:0.317647058823529 blue:0.815686274509804 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"MOVE" fontSize:35 andPosition:CGPointMake(0, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(98, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(149, 0, 40, 59)];
            [second_drop_zone setTag:4];
            [second_drop_zone addBackTextField:[
                                                [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_CONTROL_IF:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 123.5, 59)
                              andColor:[UIColor colorWithRed:0.847058823529412 green:0.603921568627451 blue:0 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"IF" fontSize:35 andPosition:CGPointMake(7, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(71, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_CONTROL_REPEAT_UNTIL:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 230, 59)
                              andColor:[UIColor colorWithRed:0.847058823529412 green:0.603921568627451 blue:0 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"REPEAT UNTIL" fontSize:26 andPosition:CGPointMake(-2, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(183, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_CONTROL_SET:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 230, 59)
                              andColor:[UIColor colorWithRed:0.847058823529412 green:0.603921568627451 blue:0 alpha:1.0]];
            
            // Primer Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"SET" fontSize:35 andPosition:CGPointMake(2, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(82, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Segundo Texto
            UILabel *second_text = [[VariableLabel alloc] initWithName:@"TO" fontSize:35 andPosition:CGPointMake(120, 0)];
            [second_text setTag:3];
            [temp.main_view addSubview:second_text];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(179, 0, 40, 59)];
            [second_drop_zone setTag:4];
            [second_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_CONTROL_WAIT:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 168.5, 59)
                              andColor:[UIColor colorWithRed:0.847058823529412 green:0.603921568627451 blue:0 alpha:1.0]];
            
            // Primer Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"WAIT" fontSize:35 andPosition:CGPointMake(9, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(117, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_INTEGER]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_CONTROL_WAIT_UNTIL:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 230, 59)
                              andColor:[UIColor colorWithRed:0.847058823529412 green:0.603921568627451 blue:0 alpha:1.0]];
            
            // Texto
            UILabel *first_text = [[VariableLabel alloc] initWithName:@"WAIT UNTIL" fontSize:30 andPosition:CGPointMake(0, 0)];
            [first_text setTag:1];
            [temp.main_view addSubview:first_text];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(183, 0, 40, 59)];
            [first_drop_zone setTag:2];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_PLUS:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 140, 59)
                              andColor:[UIColor colorWithRed:0.145098039 green:0.552941176 blue:0.2 alpha:1.0]];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UILabel *plus_sign = [[VariableLabel alloc] initWithName:@"+" fontSize:55 andPosition:CGPointMake(48, 0)];
            [plus_sign setTag:2];
            [temp.main_view addSubview:plus_sign];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [second_drop_zone addBackTextField:[
                                                [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_MINUS:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 140, 59)
                              andColor:[UIColor colorWithRed:0.0392156862745098 green:0.556862745098039 blue:0 alpha:1.0]];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UILabel *plus_sign = [[VariableLabel alloc] initWithName:@"-" fontSize:55 andPosition:CGPointMake(48, 0)];
            [plus_sign setTag:2];
            [temp.main_view addSubview:plus_sign];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [second_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_MULTIPLICATION:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 140, 59)
                              andColor:[UIColor colorWithRed:0.0392156862745098 green:0.556862745098039 blue:0 alpha:1.0]];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UILabel *plus_sign = [[VariableLabel alloc] initWithName:@"*" fontSize:55 andPosition:CGPointMake(48, 0)];
            [plus_sign setTag:2];
            [temp.main_view addSubview:plus_sign];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [second_drop_zone addBackTextField:[
                                                [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_DIVISION:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 140, 59)
                              andColor:[UIColor colorWithRed:0.0392156862745098 green:0.556862745098039 blue:0 alpha:1.0]];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UILabel *plus_sign = [[VariableLabel alloc] initWithName:@"/" fontSize:55 andPosition:CGPointMake(48, 0)];
            [plus_sign setTag:2];
            [temp.main_view addSubview:plus_sign];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [second_drop_zone addBackTextField:[
                                                [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_EQUALS:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 140, 59)
                              andColor:[UIColor colorWithRed:0.0392156862745098 green:0.556862745098039 blue:0 alpha:1.0]];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UILabel *plus_sign = [[VariableLabel alloc] initWithName:@"=" fontSize:55 andPosition:CGPointMake(48, 0)];
            [plus_sign setTag:2];
            [temp.main_view addSubview:plus_sign];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [second_drop_zone addBackTextField:[
                                                [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_STRING]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_GREATER_THAN:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 140, 59)
                              andColor:[UIColor colorWithRed:0.0392156862745098 green:0.556862745098039 blue:0 alpha:1.0]];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UILabel *plus_sign = [[VariableLabel alloc] initWithName:@">" fontSize:55 andPosition:CGPointMake(48, 0)];
            [plus_sign setTag:2];
            [temp.main_view addSubview:plus_sign];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [second_drop_zone addBackTextField:[
                                                [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_OPERATOR_LESS_THAN:
        {
            temp.main_view = [
                              [BlockView alloc]
                              initWithFrame:CGRectMake(0, 0, 140, 59)
                              andColor:[UIColor colorWithRed:0.0392156862745098 green:0.556862745098039 blue:0 alpha:1.0]];
            
            // Primer Dropzone
            DropZoneView *first_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(10, 0, 40, 59)];
            [first_drop_zone setTag:1];
            [first_drop_zone addBackTextField:[
                                               [DropZoneTextField alloc]
                                               initWithFrame:CGRectMake(0, 0, first_drop_zone.frame.size.width, first_drop_zone.frame.size.height)
                                               andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:first_drop_zone];
            
            // Imagen del signo
            UILabel *plus_sign = [[VariableLabel alloc] initWithName:@"<" fontSize:55 andPosition:CGPointMake(48, 0)];
            [plus_sign setTag:2];
            [temp.main_view addSubview:plus_sign];
            
            // Segundo Dropzone
            DropZoneView *second_drop_zone = [[DropZoneView alloc] initWithFrame:CGRectMake(90, 0, 40, 59)];
            [second_drop_zone setTag:3];
            [second_drop_zone addBackTextField:[
                                                [DropZoneTextField alloc]
                                                initWithFrame:CGRectMake(0, 0, second_drop_zone.frame.size.width, second_drop_zone.frame.size.height)
                                                andType:TEXT_TYPE_FLOAT]];
            [[temp inner_drop_zones] addObject:second_drop_zone];
        }
            break;
        case BLOCK_VARIABLE:
        {
            Variable *this_var = (Variable *)data;
            VariableLabel *name = [[VariableLabel alloc] initWithName:[this_var name] andFontSize:35];
            
            [temp setMain_view:[
                                [BlockView alloc]
                                initWithFrame:CGRectMake(0, 0, name.frame.size.width, 59)
                                andColor:[UIColor colorWithRed:0.250980392156863 green:0.619607843137255 blue:1 alpha:1.0]]
             ];
            [[temp main_view] addSubview:name];
        }
            break;
        default:
            break;
    }
    
    return temp;
}

@end
