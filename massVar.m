% Plots the paths of 4 masses in a two spring system.
% Cameron Armstrong 21194619
function res = massVar(mL1, mL2, ks, rs, startx, d, c, tinc, atol, vtol)
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

m1 = min(mL1,mL2);
m4 = max(mL1,mL2);
dist = m4 - m1;
m2 = m1 + dist/3;
m3 = m2 + dist/3;

res = [m1 m2 m3 m4];

[x1, t1] = spring(ks, rs, startx, d, m1, c, tinc, atol, vtol);
[x2, t2] = spring(ks, rs, startx, d, m2, c, tinc, atol, vtol);
[x3, t3] = spring(ks, rs, startx, d, m3, c, tinc, atol, vtol);
[x4, t4] = spring(ks, rs, startx, d, m4, c, tinc, atol, vtol);
subplot(2,2,1)
plot(x1,t1)
title(strcat('mass = ',num2str(m1)))
xlabel('X')
ylabel('Time')
axis([min(x4) max(x4) 0 max(t4)])
subplot(2,2,2)
plot(x2,t2)
title(strcat('mass = ',num2str(m2)))
xlabel('X')
ylabel('Time')
axis([min(x4) max(x4) 0 max(t4)])
subplot(2,2,3)
plot(x3,t3)
title(strcat('mass = ',num2str(m3)))
xlabel('X')
ylabel('Time')
axis([min(x4) max(x4) 0 max(t4)])
subplot(2,2,4)
plot(x4,t4)
title(strcat('mass = ',num2str(m4)))
xlabel('X')
ylabel('Time')
axis([min(x4) max(x4) 0 max(t4)])
end