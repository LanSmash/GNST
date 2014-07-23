//
//  EndScene.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 23/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//

#import "MyScene.h"
#import "Scene1.h"
#import "Scene2.h"
#import "Scene3.h"
#import "EndScene.h"

@implementation EndScene

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
        
        
        self.backgroundColor = [SKColor blackColor];
        
        SKLabelNode *label = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        label.text = @"NEXT SCENE ... COMING SOON!";
        label.fontColor = [SKColor whiteColor];
        label.fontSize = 40;
        label.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:label];
        
        
        SKLabelNode *tryAgain = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        tryAgain.text = @"go back to the beginning";
        tryAgain.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-100.0f);
        [self addChild:tryAgain];
        
        
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    MyScene *firstScene = [MyScene sceneWithSize:self.size];
    [self.view presentScene:firstScene transition:[SKTransition fadeWithDuration:0.5]];
}

@end
