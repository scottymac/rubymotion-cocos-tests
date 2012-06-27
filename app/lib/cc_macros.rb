module CCMacros

    def CCMacros.CCLOG(message)
        $stdout.puts message
    end

    # On iPhone it returns 2 if RetinaDisplay is On. Otherwise it returns 1
    def CCMacros.CC_CONTENT_SCALE_FACTOR
        CCDirector.sharedDirector.contentScaleFactor
    end

    # Converts a rect in pixels to points
    def CCMacros.CC_RECT_PIXELS_TO_POINTS(__rect_in_pixels__)                                                                        
        CGRectMake( (__rect_in_pixels__).origin.x / CC_CONTENT_SCALE_FACTOR(), (__rect_in_pixels__).origin.y / CC_CONTENT_SCALE_FACTOR(),(__rect_in_pixels__).size.width / CC_CONTENT_SCALE_FACTOR(), (__rect_in_pixels__).size.height / CC_CONTENT_SCALE_FACTOR() )
    end

    # Converts a rect in points to pixels     
    def CCMacros.CC_RECT_POINTS_TO_PIXELS(__rect_in_points_points__)                                                                     
        CGRectMake( (__rect_in_points_points__).origin.x * CC_CONTENT_SCALE_FACTOR(), (__rect_in_points_points__).origin.y * CC_CONTENT_SCALE_FACTOR(), (__rect_in_points_points__).size.width * CC_CONTENT_SCALE_FACTOR(), (__rect_in_points_points__).size.height * CC_CONTENT_SCALE_FACTOR() )
    end

    #Converts a rect in pixels to points
    def CCMacros.CC_POINT_PIXELS_TO_POINTS(__pixels__)                                                                       
        CGPointMake( (__pixels__).x / CC_CONTENT_SCALE_FACTOR(), (__pixels__).y / CC_CONTENT_SCALE_FACTOR())
    end
    
    # Converts a rect in points to pixels
    def CCMacros.CC_POINT_POINTS_TO_PIXELS(__points__)                                                                   
        CGPointMake( (__points__).x * CC_CONTENT_SCALE_FACTOR(), (__points__).y * CC_CONTENT_SCALE_FACTOR())
    end
    
    # Converts a rect in pixels to points     
    def CCMacros.CC_SIZE_PIXELS_TO_POINTS(__size_in_pixels__)                                                                        
        CGSizeMake( (__size_in_pixels__).width / CC_CONTENT_SCALE_FACTOR(), (__size_in_pixels__).height / CC_CONTENT_SCALE_FACTOR())
    end

    # Converts a rect in points to pixels
    def CCMacros.CC_SIZE_POINTS_TO_PIXELS(__size_in_points__)                                                                        
        CGSizeMake( (__size_in_points__).width * CC_CONTENT_SCALE_FACTOR(), (__size_in_points__).height * CC_CONTENT_SCALE_FACTOR())
    end

    

end












# cocos2d for iPhone: http://www.cocos2d-iphone.org

# Copyright (c) 2008-2010 Ricardo Quesada
# Copyright (c) 2011 Zynga Inc.

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

