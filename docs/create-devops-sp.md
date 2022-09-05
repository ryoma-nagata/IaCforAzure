# DevOps用サービスプリンシパルの準備

## 1. サービスプリンシパルの作成

1. [アプリの登録](https://docs.microsoft.com/ja-jp/power-bi/developer/embedded/embed-service-principal#step-1---create-an-azure-ad-app)を実施します。
2. 以下の情報をメモします。

- アプリケーション (クライアント) ID 
- ディレクトリ (テナント) ID
- クライアント シークレットの値

## 2. 権限付与

1. [Azure portal を使用して Azure ロールを割り当てる](https://docs.microsoft.com/ja-jp/azure/role-based-access-control/role-assignments-portal?tabs=current)を参考に、作成したサービスプリンシパルを対象のリソースグループの **所有者** に設定します。

## 次のステップ

[DevOps環境の構成](create-devops-environment.md)