#!/bin/bash

get_current_repo_url() {
  if [ -d .git ]; then
    git config --get remote.origin.url
  else
    echo ""
  fi
}

if [ "$#" -lt 1 ]; then
  REPO_URL=$(get_current_repo_url)
  if [ -z "$REPO_URL" ]; then
    echo "errer; 現在のディレクトリはGitレポジトリではありません。"
    exit 1
  fi
else
  REPO_URL=$1
fi

TEMP_DIR1=$(mktemp -d)

git clone --quiet $REPO_URL $TEMP_DIR1

if [ $? -ne 0 ]; then
  echo "レポジトリのクローンに失敗しました。"
  exit 1
fi

echo "レポジトリのディレクトリ構造:"
cd $TEMP_DIR1
find . -type d -not -path '*/\.git*' -print
echo
echo "レポジトリのファイル一覧:"
find . -type f -not -path '*/\.git*' -print

if [ "$#" -ge 2 ]; then
  REPO2_URL=$2
  TEMP_DIR2=$(mktemp -d)

  git clone --quiet $REPO2_URL $TEMP_DIR2

  if [ $? -ne 0 ]; then
    echo "レポジトリ2のクローンに失敗しました。"
    rm -rf $TEMP_DIR1
    exit 1
  fi

  echo
  echo "レポジトリ2のディレクトリ構造:"
  cd $TEMP_DIR2
  find . -type d -not -path '*/\.git*' -print
  echo
  echo "レポジトリ2のファイル一覧:"
  find . -type f -not -path '*/\.git*' -print

  echo
  echo "レポジトリ1とレポジトリ2の変更差分:"
  diff -r --exclude=.git $TEMP_DIR1 $TEMP_DIR2

  rm -rf $TEMP_DIR2
fi

rm -rf $TEMP_DIR1
