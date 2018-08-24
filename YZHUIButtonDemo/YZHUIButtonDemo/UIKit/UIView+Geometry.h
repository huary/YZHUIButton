//
//  UIView+Geometry.h
//  YZHUIExcelViewDemo
//
//  Created by yuan on 2017/9/20.
//  Copyright © 2017年 yuan. All rights reserved.
//

#import <UIKit/UIKit.h>

#define UPDATE_VIEW_FRAME(VIEW, FIELD, VAL)   {CGRect F = VIEW.frame; F.FIELD = VAL; VIEW.frame = F;}
#define UPDATE_VIEW_CENTER(VIEW, FIELD, VAL)  {CGPoint C = VIEW.center; C.FIELD = VAL; VIEW.center = C;}

//#define SET_VIEW_top(VIEW,TOP)        {CGRect F = VIEW.frame; F.origin.y = TOP; VIEW.frame=F;}
//#define SET_VIEW_left(VIEW,LEFT)      {CGRect F = VIEW.frame; F.origin.x = LEFT; VIEW.frame=F;}
//#define SET_VIEW_right(VIEW,RIGHT)    {CGRect F = VIEW.frame; F.origin.x = RIGHT - F.size.width; VIEW.frame=F;}
//#define SET_VIEW_bottom(VIEW,BOTTOM)  {CGRect F = VIEW.frame; F.origin.y = BOTTOM - F.size.height; VIEW.frame=F;}
//#define SET_VIEW_width(VIEW,WIDTH)    {CGRect F = VIEW.frame; F.size.width = WIDTH; VIEW.frame=F;}
//#define SET_VIEW_height(VIEW,HEIGHT)  {CGRect F = VIEW.frame; F.size.height = HEIGHT; VIEW.frame=F;}
//#define SET_VIEW_centerX(VIEW,CX)     {VIEW.center = CGPointMake(CX,VIEW.center.y);}
//#define SET_VIEW_centerY(VIEW,CY)     {VIEW.center = CGPointMake(VIEW.center.x,CY);}
//#define SET_VIEW_origin(VIEW,ORG)     {CGRect F = VIEW.frame; F.origin = ORG; VIEW.frame=F;}
//#define SET_VIEW_size(VIEW, SIZE)     {CGRect F = VIEW.frame; F.size = SIZE; VIEW.frame=F;}

#define SET_VIEW_top(VIEW,TOP)        UPDATE_VIEW_FRAME(VIEW, origin.y, TOP)
#define SET_VIEW_left(VIEW,LEFT)      UPDATE_VIEW_FRAME(VIEW, origin.x, LEFT)
#define SET_VIEW_right(VIEW,RIGHT)    UPDATE_VIEW_FRAME(VIEW, origin.x, RIGHT - F.size.width)
#define SET_VIEW_bottom(VIEW,BOTTOM)  UPDATE_VIEW_FRAME(VIEW, origin.y, BOTTOM - F.size.height)
#define SET_VIEW_width(VIEW,WIDTH)    UPDATE_VIEW_FRAME(VIEW, size.width, WIDTH)
#define SET_VIEW_height(VIEW,HEIGHT)  UPDATE_VIEW_FRAME(VIEW, size.height, HEIGHT)
#define SET_VIEW_centerX(VIEW,CX)     UPDATE_VIEW_CENTER(VIEW, x, CX)
#define SET_VIEW_centerY(VIEW,CY)     UPDATE_VIEW_CENTER(VIEW, y, CY)
#define SET_VIEW_origin(VIEW,ORG)     UPDATE_VIEW_FRAME(VIEW, origin, ORG)
#define SET_VIEW_size(VIEW, SIZE)     UPDATE_VIEW_FRAME(VIEW, size, SIZE)



#define GET_VIEW_top(VIEW)            (VIEW.frame.origin.y)
#define GET_VIEW_left(VIEW)           (VIEW.frame.origin.x)
#define GET_VIEW_right(VIEW)          (VIEW.frame.origin.x + VIEW.frame.size.width)
#define GET_VIEW_bottom(VIEW)         (VIEW.frame.origin.y + VIEW.frame.size.height)
#define GET_VIEW_width(VIEW)          (VIEW.frame.size.width)
#define GET_VIEW_height(VIEW)         (VIEW.frame.size.height)
#define GET_VIEW_centerX(VIEW)        (VIEW.center.x)
#define GET_VIEW_centerY(VIEW)        (VIEW.center.y)
#define GET_VIEW_origin(VIEW)         (VIEW.frame.origin)
#define GET_VIEW_size(VIEW)           (VIEW.frame.size)


#define SET_VIEW_TOP(VIEW,TOP)        SET_VIEW_top(VIEW,TOP)
#define SET_VIEW_LEFT(VIEW,LEFT)      SET_VIEW_left(VIEW,LEFT)
#define SET_VIEW_RIGHT(VIEW,RIGHT)    SET_VIEW_right(VIEW,RIGHT)
#define SET_VIEW_BOTTOM(VIEW,BOTTOM)  SET_VIEW_bottom(VIEW,BOTTOM)
#define SET_VIEW_WIDTH(VIEW,WIDTH)    SET_VIEW_width(VIEW,WIDTH)
#define SET_VIEW_HEIGHT(VIEW,HEIGHT)  SET_VIEW_height(VIEW,HEIGHT)
#define SET_VIEW_CENTER_X(VIEW,CX)    SET_VIEW_centerX(VIEW,CX)
#define SET_VIEW_CENTER_Y(VIEW,CY)    SET_VIEW_centerY(VIEW,CY)
#define SET_VIEW_ORIGIN(VIEW,ORG)     SET_VIEW_origin(VIEW,ORG)
#define SET_VIEW_SIZE(VIEW, SIZE)     SET_VIEW_size(VIEW, SIZE)

#define GET_VIEW_TOP(VIEW)            GET_VIEW_top(VIEW)
#define GET_VIEW_LEFT(VIEW)           GET_VIEW_left(VIEW)
#define GET_VIEW_RIGHT(VIEW)          GET_VIEW_right(VIEW)
#define GET_VIEW_BOTTOM(VIEW)         GET_VIEW_bottom(VIEW)
#define GET_VIEW_WIDTH(VIEW)          SET_VIEW_width(VIEW)
#define GET_VIEW_HEIGHT(VIEW)         SET_VIEW_height(VIEW)
#define GET_VIEW_CENTER_X(VIEW)       SET_VIEW_centerX(VIEW)
#define GET_VIEW_CENTER_Y(VIEW)       SET_VIEW_centerY(VIEW)
#define GET_VIEW_ORIGIN(VIEW)         SET_VIEW_origin(VIEW)
#define GET_VIEW_SIZE(VIEW)           SET_VIEW_size(VIEW)

#define GET_PROPERTY(TYPE,PROPERTY)             \
    -(TYPE)PROPERTY                             \
    {                                           \
        return GET_VIEW_##PROPERTY(self);        \
    }

#define SET_PROPERTY(TYPE,PROPERTY,NAME)       \
    -(void)set##NAME:(TYPE)PROPERTY            \
    {                                          \
        SET_VIEW_##PROPERTY(self,PROPERTY);     \
    }

#define GET_SET_PROPERTY(TYPE,PROPERTY,NAME)    \
    GET_PROPERTY(TYPE, PROPERTY)                \
    SET_PROPERTY(TYPE,PROPERTY,NAME)            \

@interface UIView (Geometry)

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;

@end
