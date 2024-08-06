# list_repo.shの使い方

このスクリプトは、指定したGitレポジトリのディレクトリ構造とファイル一覧を表示し、複数のレポジトリが指定された場合には、それらの変更差分を表示します。クローン時のメッセージは非表示にします。

## 使用方法

1. スクリプトファイルを作成し、例えば `list_repo.sh` という名前で保存します。
2. スクリプトに実行権限を付与します：
   
   chmod +x list_repo.sh

3. スクリプトを実行します：

   - 引数なしの場合
     現在のディレクトリがGitレポジトリの場合、そのレポジトリのディレクトリ構造とファイル一覧を表示します。現在のディレクトリがGitレポジトリでない場合にはエラーメッセージを表示します。

   - 引数が1つの場合
     指定したレポジトリURLのディレクトリ構造とファイル一覧を表示します。

   - 引数が2つの場合
     最初のレポジトリURLと2つ目のレポジトリURLのディレクトリ構造とファイル一覧を表示し、変更差分を表示します。

## 例

- 現在のディレクトリがGitレポジトリの場合：

   ./list_repo.sh

- レポジトリURL1のディレクトリ構造とファイル一覧を表示：

   ./list_repo.sh <レポジトリURL1>

- レポジトリURL1とレポジトリURL2の変更差分を表示：

   ./list_repo.sh <レポジトリURL1> <レポジトリURL2>

`<レポジトリURL1>` と `<レポジトリURL2>` は、参照したいGitレポジトリのURLに置き換えてください。

このスクリプトを実行すると、指定されたまたは現在のディレクトリのGitレポジトリのディレクトリ構造とファイル一覧が表示され、必要に応じて変更差分も表示されます。クローン時のメッセージは表示されません。
