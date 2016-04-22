```
func backgroundSubstraction(int x_original, y_original, x_new, y_new)
  begin
    if (RGB of (x_original, y_original) == white and RGB of (x_new, y_new) == white) or 
       (RGB of (x_original, y_original) == black and RGB of (x_new, y_new) == white):
        detectChange(x,y)


func detectChange(int: x_previous, y_previous)
  begin
      if absoluteValue(x-x_previous)< 10 and absoluteValue(y-y_previous)< 10 {
        x_previous = x
        y_previous = y
  end
      // With the frequency of 25 FPS we should not expect any drastics changes in a finite time,
      // that means that in 0.04s (25 FPS) the change should not be bigger than 10 pixels per movement
      
```
