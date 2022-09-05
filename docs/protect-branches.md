# ブランチの保護

## 1. developブランチにマージする前に単体テストを行う

1. **Project settings**-> **Repositories** -> **対象リポジトリ** -> **Polisies** -> **develop**　の順にクリックします。

![](.image/2022-09-05-10-47-59.png)

2. **Build Validation** 内の、**＋** をクリックします。

![](.image/2022-09-05-10-48-27.png)

3. **arm-template-ci-qa** を選択して、**Save** します。

![](.image/2022-09-05-10-49-15.png)

## 2. mainブランチへのマージにはレビュアーの承認が必要

1. **main** を選択して、**Require minimum number of reviewers** をオンにしてレビュアー承認を要求するように構成します。

![](.image/2022-09-05-10-50-13.png)


## 次のステップ

[Pull Requestでコードをマージする](try-pull-request.md)