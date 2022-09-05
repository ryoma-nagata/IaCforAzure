# DevOps環境の作成

## 1. サインアップ

[Azure DevOpsにサインインする](https://docs.microsoft.com/ja-jp/azure/devops/user-guide/sign-up-invite-teammates?view=azure-devops)に従って、プロジェクトを作成します。

## 2. Repositryのインポート

1. **Repos** -> **Files** -> **Import repository** の順にクリックします

![](.image/2022-09-05-09-46-47.png)

2. **https://github.com/ryoma-nagata/IaCforAzure.git** を入力して、適宜名称を変更して **Import** をクリックします。

![](.image/2022-09-05-09-48-17.png)

1. リポジトリがインポートされていることを確認します。

![](.image/2022-09-05-09-49-17.png)


## 3. ブランチの作成

1. **New branch** をクリックします。
![](.image/2022-09-05-09-49-32.png)

2. **developブランチ** を作成します。

![](.image/2022-09-05-09-52-39.png)

3. **自身の作業用ブランチ** を作成します。

![](.image/2022-09-05-09-53-29.png)


## 4. サービス接続の作成

1. **Project setting** に移動します。

![](.image/2022-02-15-13-57-03.png)

2. **Service connections**->**Create service connection** の順にクリックします。

[参考](https://docs.microsoft.com/ja-jp/azure/devops/pipelines/library/service-endpoints?view=azure-devops&tabs=yaml#create-a-service-connection)

![](.image/2022-02-15-14-00-23.png)

3. **Azure Resource Manager** を選択します。

![](.image/2022-02-15-14-01-10.png)

4. **Service principal(manual)** を選択します。

![](.image/2022-02-15-14-01-39.png)

5. 各項目を入力のうえ、 **name** には **azure-devops-service-connection** と入力します。

![](.image/2022-02-15-14-04-03.png)

6. **Grant access permission to all pipelines** にチェックをつけて **Verify and save** をクリックします。

![](.image/2022-02-15-14-04-43.png)

## 5. 環境の作成

1. **Environment** に移動します。

![](.image/2022-09-05-09-55-17.png)

2. **Create environment** をクリックします。
![](.image/2022-09-05-09-55-52.png)

3. **dev環境** を作成します。

![](.image/2022-09-05-09-56-27.png)

4. **New environment** をクリックします。

![](.image/2022-09-05-09-57-02.png)

5. **prod環境** を作成します。

![](.image/2022-09-05-09-57-35.png)

###  (option) デプロイ承認ゲートの追加

1. **・・・** -> **Approvals and checks** をクリックします。

![](.image/2022-09-05-09-58-30.png)

2. **Approvals** をクリックします。

![](.image/2022-09-05-09-59-26.png)

3. 承認者を追加します。

![](.image/2022-09-05-09-59-52.png)


## 次のステップ

[パイプラインの構成と初回実行](run-pipeline.md)