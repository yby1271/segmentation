clc;
clear all;
syms v;
p=load('456subsample.xyz');
x=p(:,1);
y=p(:,2);
z=p(:,3);
points=pointCloud(p);
%normals=pcnormals(points);
%find()
plot(x,y);
%hold on;
%plot3(p(659,1),p(659,2),p(659,3),'r+');
for i=1:length(p)
   [ID,D]=findNearestNeighbors(points,points.Location(i,:),20);
    PointId=p(ID,:);
    coeff(i,:)=polyfit(PointId(:,1),PointId(:,2),1);
end
[idx,c]=kmeans(coeff,20);
UN=unique(idx);
for i=1:20
    u=c(i,1)*v+c(i,2);
    hold on;
    ezplot(u);
end
TA=tabulate(idx);

