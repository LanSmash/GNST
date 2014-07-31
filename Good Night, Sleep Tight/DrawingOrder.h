//  DrawingOrder.h

#ifndef GNST_DrawingOrder_h
#define GNST_DrawingOrder_h

// example for Sprite Kit, for Cocos2d simply inverse the order of the values!
typedef NS_ENUM(NSInteger, DrawingOrder) {
    DrawingOrderBackground,
    DrawingOrderStars,
    DrawingOrderForeground,
    DrawingOrderOtherSprites,
    DrawingOrderBubbles,
    DrawingOrderUIElements,
};

#endif