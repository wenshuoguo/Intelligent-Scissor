function yC = calC(x1,y1,x2,y2,img) % x col y row
length = sqrt((x1-x2)* (x1 - x2)+(y1-y2)*(y1-y2));
yC = (calDMAX(img)-calD(x1,y1,x2,y2,img))*length;
end
