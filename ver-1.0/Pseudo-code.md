```

// 1. stage setup of body parts
func detectRightArm(int x, y, x_rightArm, y_rightArm)
  begin
    if x > x_rightArm and y < y_rightArm:
      x_rightArm = x
      y_rightArm = y
  end

func detectLeftArm(int x, y, x_leftArm, y_leftArm)
  begin
   if x< x_leftArm and y < y_leftArm:
      x_leftArm = x
      y_leftArm = y
  end

func detectLeftLef(int x, y, x_leftLeg, y_leftLeg)
  begin
    if x<x_leftLeg and y > y_leftleg:
      x_leftLeg = x
      y_leftLeg = y
  end
      
func detectLeftArm(int x, y, x_rightLeg, y_rightLeg)
  begin
    if x>x_rightLeg and y>y_rightLeg:
      x_rightLeg = x
      y_rightLeg = y
  end
// 2. stage detection of changes
func backgroundSubstraction(int x_original, y_original, x_new, y_new)
  begin
    if (RGB of (x_original, y_original) == white and RGB of (x_new, y_new) == white) or 
       (RGB of (x_original, y_original) == black and RGB of (x_new, y_new) == white):
        detectChange(x,y)
        if change: 
          saveChange(x,y)


func detectChange(int: x_previous, y_previous)
  begin
      if absoluteValue(x-x_previous)< 10 and absoluteValue(y-y_previous)< 10 {
        x_previous = x
        y_previous = y
        return true
      return false
  end
      // With the frequency of 25 FPS we should not expect any drastics changes in a finite time,
      // that means that in 0.04s (25 FPS) the change should not be bigger than 10 pixels per movement
      
```
