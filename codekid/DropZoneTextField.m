//
//  DropZoneTextField.m
//  codekid
//
//  Created by Jordan Cortes Guzman on 4/21/14.
//  Copyright (c) 2014 Cecilia Rodríguez Ramírez & Jordan Y. Cortés Guzmán. All rights reserved.
//

#import "DropZoneTextField.h"

@implementation DropZoneTextField

- (id)initWithFrame:(CGRect)frame andType:(NSInteger)type
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // iniciliza variables de control
        _input_type = type;
        _last_length = 0;
        
        // define propiedades de diseño
        [self setFont:[UIFont fontWithName:@"ActionMan-Bold" size:35]];
        [self setTextAlignment:NSTextAlignmentCenter];
        [self setKeyboardType:UIKeyboardTypeNumberPad];
        
        if (_input_type == TEXT_TYPE_DISABLED)
        {
            [self setEnabled:NO];
        }
        else
        {
            // agrega observadores
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldTextChange:) name:UITextFieldTextDidChangeNotification object:self];
            [self setDelegate:self];
        }
    }
    return self;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // This will be the character set of characters I do not want in my text field.  Then if the replacement string contains any of the characters, return NO so that the text does not change.
    NSCharacterSet *unacceptedInput = nil;
    
    if (_input_type == TEXT_TYPE_INTEGER)
    {
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:NUMERIC] invertedSet];
    }
    else if (_input_type == TEXT_TYPE_FLOAT)
    {
        NSUInteger minus_sign_count = [[[self text] componentsSeparatedByString:NUMERIC_NEGATIVE] count];
        NSUInteger dot_sign_count = [[[self text] componentsSeparatedByString:NUMERIC_DOT] count];
    
        if ([string isEqualToString:NUMERIC_NEGATIVE])
        {
            if (minus_sign_count > 1) // si ya hay un signo de menos
            {
                return NO;
            }
            else if (range.location != 0) // si el signo al escribirse no esta al principio
            {
                return NO;
            }
        }
        else if ([string isEqualToString:NUMERIC_DOT])
        {
            if (dot_sign_count > 1) // si ya hay un punto
            {
                return NO;
            }
            else if (range.location == 0) // si se quiere escribir al principio
            {
                return NO;
            }
            else if ([[self text] characterAtIndex:0] == '-' && range.location < 2) // si el primer signo es '-' no permite escribir el punto a un lado
            {
                return NO;
            }
        }
    
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:[[NUMERIC stringByAppendingString:NUMERIC_DOT] stringByAppendingString:NUMERIC_NEGATIVE]] invertedSet];
    }
    else if (_input_type == TEXT_TYPE_STRING || _input_type == TEXT_TYPE_FORCED_STRING)
    {
        unacceptedInput = [[NSCharacterSet characterSetWithCharactersInString:ALPHA_NUMERIC] invertedSet];
    }
    else
    {
        unacceptedInput = [[NSCharacterSet illegalCharacterSet] invertedSet];
    }

    return ([[string componentsSeparatedByCharactersInSet:unacceptedInput] count] <= 1);
}

- (void) textFieldTextChange:(NSNotification *)notification
{
    BOOL change_sizes = NO;
    NSInteger text_increment = INNER_TEXT_INCREMENT;
    
    if ([[self text] length] > _last_length && [[self text] length] > 1) // si se esta escribiendo
    {
        change_sizes = YES;
    }
    else if ([[self text] length] < _last_length && [[self text] length] > 0) // si se esta borrando
    {
        text_increment = -text_increment; // invierte el valor para disminuir el tamaño
        change_sizes = YES;
    }
    
    if (change_sizes)
    {
        UIView *this_view = [self superview];
        Class dropzone_class = [this_view class];
        
        do {
            // incremento tamaño de main_view
            CGRect main_view_frame = [[this_view superview] frame];
            main_view_frame.size.width += text_increment;
            [[this_view superview] setFrame:main_view_frame];
            
            // incrementa el tamaño del drop_zone (self)
            CGRect this_view_frame = [this_view frame];
            this_view_frame.size.width += text_increment;
            [this_view setFrame:this_view_frame];
            
            // mueve todo lo que este a la derecho del drop_zone (self)
            for (UIView *move_view in [this_view superview].subviews)
            {
                if ([move_view tag] > [this_view tag])
                {
                    CGRect move_view_frame = [move_view frame];
                    move_view_frame.origin.x += text_increment;
                    [move_view setFrame:move_view_frame];
                }
            }
            
            this_view = [[this_view superview] superview];
        } while ([this_view isKindOfClass:dropzone_class]);
        
        // Incrementa el tamaño del UITextField
        [self resizeToFitView:[self superview]];
    }
    
    [self setLast_length:[[self text] length]];
}

- (void)resizeToFitView:(UIView *)this_view
{
    self.frame = CGRectMake(0, 0, this_view.frame.size.width, this_view.frame.size.height);
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:) || action == @selector(copy:) || action == @selector(select:) || action == @selector(selectAll:))
    {
        return NO;
    }
    
    return [super canPerformAction:action withSender:sender];
}

@end
