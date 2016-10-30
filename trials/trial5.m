template = imread('testset/j.jpg');

[bw, maskedTemplate] = segmentImage(template);

i = imread('testset/k.jpg');
[bw, rotI] = segmentImage(i);

BW = edge(rotI, 'Sobel') | edge(rotI, 'Roberts') | edge(rotI,'Prewitt');

[H,T,R] = hough(BW);
P  = houghpeaks(H,5);

lines = houghlines(BW,T,R,P,'FillGap',50,'MinLength',100);
figure, imshow(rotI), hold on;
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');