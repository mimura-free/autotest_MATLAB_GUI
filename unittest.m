classdef unittest < matlab.uitest.TestCase
    methods(Test)
        function testSampleSize(testCase)
            app = ConfigurePlotAppExample;                  % アプリのインスタンスを作成
            testCase.addTeardown(@delete,app)               % テスト終了時にアプリを削除するクリーンアップを登録

            testCase.type(app.SampleSizeEditField,12)       % サンプルサイズ入力欄に「12」と入力
            testCase.press(app.UpdatePlotButton)             % 「Update Plot」ボタンを押す

            ax = app.UIAxes;                                % プロット用座標軸（UIAxes）を取得
            surfaceObj = ax.Children;                       % 座標軸上のグラフィックオブジェクト（サーフェス等）を取得
            testCase.verifySize(surfaceObj.ZData,[12 13])   % サーフェスのZDataが12x12サイズか検証
        end

        function testColormap(testCase)
            app = ConfigurePlotAppExample;                  % アプリのインスタンスを作成
            testCase.addTeardown(@delete,app)               % テスト終了時にアプリを削除するクリーンアップを登録

            testCase.choose(app.ColormapDropDown,"Winter")  % カラーマップのドロップダウンで「Winter」を選択
            testCase.press(app.UpdatePlotButton)             % 「Update Plot」ボタンを押す

            expectedMap = winter;                           % 期待されるカラーマップ（Winter）を作成
            ax = app.UIAxes;                                % プロット用座標軸（UIAxes）を取得
            testCase.verifyEqual(ax.Colormap,expectedMap)   % 座標軸のカラーマップが期待通りか検証
        end
    end
end