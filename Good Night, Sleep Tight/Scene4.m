
//  Scene4.m
//  Good Night, Sleep Tight
//
//  Created by carahewitt on 29/07/2014.
//  Copyright (c) 2014 cara hewitt. All rights reserved.
//

#import "MyScene.h"
#import "Scene1.h"
#import "Scene2.h"
#import "Scene3.h"
#import "Scene4.h"
#import "EndScene.h"
#import "DrawingOrder.h"
#import <AVFoundation/AVFoundation.h>


static const uint32_t bubbleCategory = 1;     //00000000000000000000000000000001
static const uint32_t topEdgeCategory = 2;    //00000000000000000000000000000010


@implementation Scene4 {
    
    SKSpriteNode *_btnAnimal;
    SKSpriteNode *_btnCoral1;
    SKSpriteNode *_btnNewCoral;
    SKSpriteNode *_btnEel;
    SKSpriteNode *_btnCrab;
    SKSpriteNode *_btnNextScene;
    SKSpriteNode *_btnPrevScene;
    SKSpriteNode *_btnHome;
    SKSpriteNode *_btnNightSky;
    SKSpriteNode *_btnBubble;
    SKSpriteNode *rock;
    AVAudioPlayer *_yawnSound;
    AVAudioPlayer *_crabSound;
    AVAudioPlayer *_coralSound;
    AVAudioPlayer *_giggleSound;
}


-(void)didBeginContact:(SKPhysicsContact *)contact{
    
    NSLog(@"boing");
    
    if (contact.bodyA.categoryBitMask == topEdgeCategory) {
        NSLog(@"bodyA is the edge!");
                SKAction *playSFX = [SKAction playSoundFileNamed:@"pop1temp.mp3" waitForCompletion:NO];
                [self runAction:playSFX];
        [contact.bodyB.node removeFromParent];
    }
    
   
}


-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //give dimension output in console
        float boundsWidth = [UIScreen mainScreen].bounds.size.width;
        float boundsHeight = [UIScreen mainScreen].bounds.size.height;
        float scalefactor = [UIScreen mainScreen].scale;
        NSLog(@"bounds width: %f, bounds height: %f", boundsWidth, boundsHeight);
        NSLog(@"In initWithSize at %.0f wide and %.0f high", size.width, size.height);
        NSLog(@"scale is: %f", scalefactor);
        
        
        
        
        
        
        // add the night sky background
        if (boundsWidth == 568) {_btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s4nightsky568"]; }
        else {_btnNightSky = [SKSpriteNode spriteNodeWithImageNamed:@"s4nightsky"]; }
        _btnNightSky.position = CGPointMake(size.width/2, (size.height/2));
        if (boundsWidth == 480) {_btnNightSky.position = CGPointMake(size.width/2, (size.height/2)); }
        if (boundsWidth == 568) {_btnNightSky.position = CGPointMake(size.width/2, (size.height/2)); }
        _btnNightSky.zPosition = DrawingOrderBackground;
        [self addChild:_btnNightSky];
        
        
        
        
        
        
        
        // add the animal
        _btnAnimal = [SKSpriteNode spriteNodeWithImageNamed:@"fish"];
        _btnAnimal.position = CGPointMake(670, 330);
        if (boundsWidth == 480) {_btnAnimal.position = CGPointMake(320, 150); }
        if (boundsWidth == 568) {_btnAnimal.position = CGPointMake(380, 120); }
        _btnAnimal.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnAnimal];
        
        

        // add the coral
        _btnCoral1 = [SKSpriteNode spriteNodeWithImageNamed:@"coral1"];
        _btnCoral1.position = CGPointMake(358, 215);
        if (boundsWidth == 480) {_btnCoral1.position = CGPointMake(168, 100); }
        if (boundsWidth == 568) {_btnCoral1.position = CGPointMake(219, 58); }
        _btnCoral1.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnCoral1];
        
        
        
        
        // add the new coral just for iphone5, iphone6 and iphone6plus
        if (boundsWidth == 568) {
            _btnNewCoral = [SKSpriteNode spriteNodeWithImageNamed:@"newcoral568"];
            _btnNewCoral.position = CGPointMake(175, 30);
            _btnNewCoral.zPosition = DrawingOrderOtherSprites;
            [self addChild:_btnNewCoral];
        }
        
        
        
        
        // add the eel
        _btnEel = [SKSpriteNode spriteNodeWithImageNamed:@"eel"];
        _btnEel.position = CGPointMake(110, 50);
        if (boundsWidth == 480) {_btnEel.position = CGPointMake(50, 20); }
        if (boundsWidth == 568) {_btnEel.position = CGPointMake(50, 30); }
        _btnEel.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnEel];
        
        // add the crab
        _btnCrab = [SKSpriteNode spriteNodeWithImageNamed:@"crab"];
        _btnCrab.position = CGPointMake(810, 180);
        if (boundsWidth == 480) {_btnCrab.position = CGPointMake(370, 70); }
        if (boundsWidth == 568) {_btnCrab.position = CGPointMake(450, 40); }
        _btnCrab.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnCrab];
        
        
        // add home button
        _btnHome = [SKSpriteNode spriteNodeWithImageNamed:@"homebutton"];
        _btnHome.position = CGPointMake(930, 740);
        if (boundsWidth == 480) {_btnHome.position = CGPointMake(440, 305); }
        if (boundsWidth == 568) {_btnHome.position = CGPointMake(515, 305); }
        _btnHome.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnHome];
        
        // add previous scene button
        _btnPrevScene = [SKSpriteNode spriteNodeWithImageNamed:@"previousscenetab"];
        _btnPrevScene.position = CGPointMake(35, 250);
        if (boundsWidth == 480) {_btnPrevScene.position = CGPointMake(15, 110); }
        if (boundsWidth == 568) {_btnPrevScene.position = CGPointMake(15, 110); }
        _btnPrevScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnPrevScene];
        
        //add next scene button
        _btnNextScene = [SKSpriteNode spriteNodeWithImageNamed:@"nextscenetab"];
        _btnNextScene.position = CGPointMake(990, 250);
        if (boundsWidth == 480) {_btnNextScene.position = CGPointMake(465, 110); }
        if (boundsWidth == 568) {_btnNextScene.position = CGPointMake(552, 110); }
        _btnNextScene.zPosition = DrawingOrderOtherSprites;
        [self addChild:_btnNextScene];
        
        
        // sounds using the AVAudioPlayer so they can't be spammed
        NSURL *yawnURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"fishsleep" ofType:@"wav"]];
        _yawnSound = [[AVAudioPlayer alloc] initWithContentsOfURL:yawnURL error:nil];
        
        
        NSURL *crabURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"crab" ofType:@"wav"]];
        _crabSound = [[AVAudioPlayer alloc] initWithContentsOfURL:crabURL error:nil];
  
        
        NSURL *coralURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"coralglow" ofType:@"wav"]];
        _coralSound = [[AVAudioPlayer alloc] initWithContentsOfURL:coralURL error:nil];
        
        
        NSURL *giggleURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"giggle" ofType:@"wav"]];
        _giggleSound = [[AVAudioPlayer alloc] initWithContentsOfURL:giggleURL error:nil];
        
        [self addTopEdge:size];
        
        self.physicsWorld.gravity = CGVectorMake( 0, +0.2 );
        self.physicsWorld.contactDelegate = self;
        
        


    }
    return self;
}








- (void)sleepAnimal
{
    [_yawnSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"fish"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"fish%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnAnimal runAction:keepRepeatingAnimation];
    
    
    //add "good night, monkey" text
    SKSpriteNode *goodnightMonkey = [SKSpriteNode spriteNodeWithImageNamed:@"goodnight-fish"];
    goodnightMonkey.position = CGPointMake(780, 50);
    if ([UIScreen mainScreen].bounds.size.width == 480) {goodnightMonkey.position = CGPointMake(285, 25); }
    if ([UIScreen mainScreen].bounds.size.width == 568) {goodnightMonkey.position = CGPointMake(240, 180); }
    goodnightMonkey.zPosition = DrawingOrderOtherSprites;
    goodnightMonkey.alpha = 0.0;
    SKAction *fadeIn = [SKAction fadeAlphaTo:1.0 duration:2.0];
    [self addChild:goodnightMonkey];
    [goodnightMonkey runAction:fadeIn];
    

    
}



- (void)coralTouch
{
    [_coralSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"coral1"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"coral%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:3];
    [_btnCoral1 runAction:keepRepeatingAnimation];
    

}


- (void)eelTouch
{
    [_giggleSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"eel"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"eel%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnEel runAction:keepRepeatingAnimation];
    

    
}


- (void)crabTouch
{
    [_crabSound play];
    
    // get reference to the atlas
    SKTextureAtlas *Atlas = [SKTextureAtlas atlasNamed:@"crab"];
    // create an array to hold image textures
    NSMutableArray *Textures = [NSMutableArray array];
    
    // load the animation frames from the TextureAtlas
    int numImages = (int)Atlas.textureNames.count;
    for (int i=1; i <= numImages; i++) {
        NSString *textureName = [NSString stringWithFormat:@"crab%02i", i];
        SKTexture *SequenceTexture = [Atlas textureNamed:textureName];
        [Textures addObject:SequenceTexture];
        NSLog(@"%@",Textures); //show which image assets are being used.
    }
    SKAction *repeatAnimation = [SKAction animateWithTextures:Textures timePerFrame:0.1];
    SKAction *keepRepeatingAnimation = [SKAction repeatAction:repeatAnimation count:1];
    [_btnCrab runAction:keepRepeatingAnimation];
    

    
}


- (void)addBubbles:(CGPoint)location  {
    _btnBubble = [SKSpriteNode spriteNodeWithImageNamed:@"bubble"];
    _btnBubble.zPosition = DrawingOrderBubbles;
    _btnBubble.position = location;
    _btnBubble.physicsBody = [SKPhysicsBody bodyWithCircleOfRadius:_btnBubble.frame.size.width/2];
    _btnBubble.physicsBody.categoryBitMask = bubbleCategory;
    _btnBubble.physicsBody.contactTestBitMask = topEdgeCategory;
    

    [self addChild:_btnBubble];
    
    
    SKAction *playSFX = [SKAction playSoundFileNamed:@"bubblestemp.mp3" waitForCompletion:NO];
    [self runAction:playSFX];
}


-(void) addTopEdge:(CGSize) size {
    SKNode *topEdge = [SKNode node];
    topEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0,720) toPoint:CGPointMake(size.width, 720)];
    if ([UIScreen mainScreen].bounds.size.width == 480) {
        topEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0,310) toPoint:CGPointMake(size.width, 310)]; }
    if ([UIScreen mainScreen].bounds.size.width == 568) {
        topEdge.physicsBody = [SKPhysicsBody bodyWithEdgeFromPoint:CGPointMake(0,310) toPoint:CGPointMake(size.width, 310)]; }
    topEdge.physicsBody.categoryBitMask = topEdgeCategory;
    [self addChild:topEdge];
}




- (void)changeToHome
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    MyScene *nextScene = [MyScene sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}


- (void)changeToNextScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    EndScene *nextScene = [EndScene sceneWithSize:self.size];
    [self.view presentScene:nextScene transition:[SKTransition fadeWithDuration:0.5]];
}

- (void)changeToPrevScene
{
    SKAction *playSFX = [SKAction playSoundFileNamed:@"click.wav" waitForCompletion:NO];
    [self runAction:playSFX];
    Scene3 *prevScene = [Scene3 sceneWithSize:self.size];
    [self.view presentScene:prevScene transition:[SKTransition fadeWithDuration:0.5]];
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        

        
        if([_btnAnimal containsPoint:location])
        {
            NSLog(@"animal touch");
            [self sleepAnimal];
        
        }
        
        else if ([_btnCoral1 containsPoint:location]) {
            NSLog(@"coral touch");
            [self coralTouch];
        }
        
        
        else if ([_btnEel containsPoint:location]) {
            NSLog(@"eel touch");
            [self eelTouch];
        }
        
        else if ([_btnCrab containsPoint:location]) {
            NSLog(@"crab touch");
            [self crabTouch];
        }
        
        else if([_btnPrevScene containsPoint:location]) {
            NSLog(@"prev scene touch");
            [self changeToPrevScene];
        }
        
        else if([_btnNextScene containsPoint:location]) {
            NSLog(@"next scene touch");
            [self changeToNextScene];
        }
        
        else if([_btnHome containsPoint:location]) {
            NSLog(@"home touch");
            [self changeToHome];
        }
        
//        else if ([_btnBubble containsPoint:location]) {
//            NSLog(@"bubble touch");
//            [self popBubbles:location];
//        }
        
        else if ([_btnNightSky containsPoint:location]) {
          NSLog(@"sky touch");
          [self addBubbles:location];
        }
        

        

    }
}


















-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
