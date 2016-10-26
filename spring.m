% Calculates and records the path of a two spring system.
% Cameron Armstrong 21194619
function [x, t] = spring(ks, rs, startx, d, m, c, tinc, atol, vtol)
if (size(ks,1) ~= 1 || size(ks,2) ~= 2)
    disp('ks must be a 1x2 array')
    return
end
if (size(rs,1) ~= 1 || size(rs,2) ~= 2)
    disp('rs must be a 1x2 array')
    return
end

if (startx < 0)
    disp('Must have positive or 0 starting point')
    return
end

if (d <= 0)
    disp('Must have positive distance between springs')
    return
end

if (m <= 0)
    disp('Must have positive mass')
    return
end

if (c < 0)
    disp('Must have positive damping constant')
    return
end

if (tinc <= 0)
    disp('Must have positive time increment')
    return
end

if (atol < 0)
    disp('Must have positive acceleration tolerance')
    return
end

if (vtol < 0)
    disp('Must have positive velocity tolerance')
    return
end

X = startx;
v = 0;
a = 0;
time = 0;
x = [];
t = [];
began = false;

while (((abs(v) > vtol) && (abs(a) > atol)) || (began == false))
    began = true;
   f = -ks(1)*(X - rs(1)) + ks(2)*(d - X - rs(2)) - (c * v);
   a = f / m;
   v = v + (a * tinc);
   X = X + (v * tinc);
   x = [x X];
   t = [t time];
   time = time + tinc;
   
end

end