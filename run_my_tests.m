testResults = runtests;

failed = [testResults.Failed];
if any(failed)
    disp('Some tests failed.');
    disp(testResults([testResults.Failed]));
    exit(1); % エラー終了
else
    disp('All tests passed.');
    exit(0); % 正常終了
end