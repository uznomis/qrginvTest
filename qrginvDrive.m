%% random singular matrices
R = cell(1,5);
exec_time1 = zeros(5,5);
errors1 = zeros(5,4,5);
ranks1 = zeros(1,5);
conds1 = zeros(1,5);
rconds1 = zeros(1,5);
i = 0;
for exp = 4:8
    i = i + 1;
    A = rand(2^exp);
    A(end,:) = mean(A(1:end-1,:));
    ranks1(i) = rank(A);
    conds1(i) = cond(A);
    rconds1(i) = rcond(A);
    % pinv
    tic
    R{1} = pinv(A);
    exec_time1(1,i) = toc;
    % CGS
    tic
    R{2} = CGS_MPi(A);
    exec_time1(2,i) = toc;
    % geninv
    tic
    R{3} = geninv(A);
    exec_time1(3,i) = toc;
    % stan
    tic
    R{4} = stan(A);
    exec_time1(4,i) = toc;
    % qrginv
    tic
    R{5} = qrginv(A);
    exec_time1(5,i) = toc;
    for j = 1:5
        errors1(j,1,i) = norm(A*R{j}*A-A);
        errors1(j,2,i) = norm(R{j}*A*R{j}-R{j});
        errors1(j,3,i) = norm(A*R{j}-(A*R{j})');
        errors1(j,4,i) = norm(R{j}*A-(R{j}*A)');
    end
end
disp('random matrices done');
%% Higham's
n = 200;
nums = [4 8 13 19 24 30 41 49 52];
R = cell(1,5);
exec_time2 = zeros(5,9);
errors2 = zeros(5,4,9);
ranks2 = zeros(1,9);
conds2 = zeros(1,9);
rconds2 = zeros(1,9);
for i = 1:length(nums)
    A = matrix(nums(i),n);
    ranks2(i) = rank(A);
    conds2(i) = cond(A);
    rconds2(i) = rcond(A);
    % pinv
    tic
    R{1} = pinv(A);
    exec_time2(1,i) = toc;
    % CGS
    tic
    R{2} = CGS_MPi(A);
    exec_time2(2,i) = toc;
    % geninv
    tic
    R{3} = geninv(A);
    exec_time2(3,i) = toc;
    % stan
    tic
    R{4} = stan(A);
    exec_time2(4,i) = toc;
    % qrginv
    tic
    R{5} = qrginv(A);
    exec_time2(5,i) = toc;
    for j = 1:5
        errors2(j,1,i) = norm(A*R{j}*A-A);
        errors2(j,2,i) = norm(R{j}*A*R{j}-R{j});
        errors2(j,3,i) = norm(A*R{j}-(A*R{j})');
        errors2(j,4,i) = norm(R{j}*A-(R{j}*A)');
    end
end
disp('Highams done');
%% sparse matrices
filenames = {'well1033','well1850','illc1850','gr_30_30','watt__1'};
R = cell(1,5);
exec_time3 = zeros(5,5);
errors3 = zeros(5,4,5);
ms3 = zeros(1,5);
for i = 1:length(filenames)
    A = mmread([filenames{i},'.mtx']);
    ms3(i) = size(A,1);
    A = full(A);
    A = [A zeros(ms3(i),100)];
    % pinv
    tic
    R{1} = pinv(A);
    exec_time3(1,i) = toc;
    % CGS
    tic
    R{2} = CGS_MPi(A);
    exec_time3(2,i) = toc;
    % geninv
    tic
    R{3} = geninv(A);
    exec_time3(3,i) = toc;
    % stan
    tic
    R{4} = stan(A);
    exec_time3(4,i) = toc;
    % qrginv
    tic
    R{5} = qrginv(A);
    exec_time3(5,i) = toc;
    for j = 1:5
        errors3(j,1,i) = norm(A*R{j}*A-A);
        errors3(j,2,i) = norm(R{j}*A*R{j}-R{j});
        errors3(j,3,i) = norm(A*R{j}-(A*R{j})');
        errors3(j,4,i) = norm(R{j}*A-(R{j}*A)');
    end
end
disp('sparse done');