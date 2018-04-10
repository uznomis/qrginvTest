% plot comparison
%% constants
methods = {'pinv','CGS-MPi','geninv','stan','qrginv'};
criteria = {'TT+T-T','T+TT+-T+','TT+-(TT+)*','T+T-(T+T)*'};
%% D1 time
time0 = reshape(D1(:,1),5,[]);
time = exec_time1;
figure('Name', 'D1 time');
for i = 1:size(time,1)
    subplot(2,3,i);
    loglog(time0(i,:), time(i,:), '*');
    title(methods{i});
    xlabel('time(s)');
    ylabel('time(s)');
    xlim([1e-5 1e5]);
    ylim([1e-5 1e5]);
end

%% D2 time
time0 = reshape(D2(:,1),5,[]);
time = exec_time2;
figure('Name', 'D2 time');
for i = 1:size(time,1)
    subplot(2,3,i);
    loglog(time0(i,:), time(i,:), '*');
    title(methods{i});
    xlabel('time(s)');
    ylabel('time(s)');
    xl = xlim;
    xlim([xl(1) xl(1)*1e1]);
    yl = ylim;
    ylim([yl(1) yl(1)*1e1]);
end

%% D3 time
time0 = reshape(D3(:,1),4,[]);
time = exec_time3(2:end,:);
figure('Name', 'D3 time');
for i = 1:size(time,1)
    subplot(2,3,i);
    loglog(time0(i,:), time(i,:), '*');
end

%% D1 errors
figure('Name', 'D1 errors');
for i = 1:5
data0 = reshape(D1(:,2:5),5,5,4); % method, dataset, metric
data = errors1;
subplot(2,3,i);
hold on
for j = 1:4
    loglog(data0(i,:,j), reshape(data(i,j,:),1,[]), '*');
end
hold off
set(gca,'xscale','log','yscale','log');
end

%% D2 errors
figure('Name', 'D2 errors');
for i = 1:5
data0 = reshape(D2(:,2:5),5,9,4); % method, dataset, metric
data = errors2;
subplot(2,3,i);
hold on
for j = 1:4
    loglog(data0(i,:,j), reshape(data(i,j,:),1,[]), '*');
end
hold off
set(gca,'xscale','log','yscale','log');
end

%% D3 errors
figure('Name', 'D3 errors');
for i = 1:4
data0 = reshape(D3(:,2:5),4,5,4); % method, dataset, metric
data = errors3(2:end,:,:);
subplot(2,3,i);
hold on
for j = 1:4
    loglog(data0(i,:,j), reshape(data(i,j,:),1,[]), '*');
end
hold off
set(gca,'xscale','log','yscale','log');
end

%% time

