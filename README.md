# 概要

ポートフォリオ名前：みのいろ（自分の名前である「みのり」と「色」をかけました。）

どんなサービスか：お客様とカラーコンサルタント（オーラソーマ）を繋げるサービスです。

* アプリケーション内のコンサルタントとはカラーコンサルタントのことです。

# 背景

体調不良で辛かった時にオーラソーマというカラーセラピーに出会い、とても助けになった経験があるので、カラーセラピーという診断方法を悩みを抱えた方達に知ってほしいという想いで作成しました。

# DEMO

 ![minoirodemo](https://user-images.githubusercontent.com/88385633/185148511-26953de1-22ff-45bf-9b47-a525140e9796.gif)
 
# URL

www.minoiro99.com

著作権保護のためBASIC認証をかけています。

お手数ですが、以下のIDとパスワードを使用してください。

---
### ID: abc

### PASS: 1111
---

# 機能一覧

### お客様・コンサルタント共通

・登録・ログイン・退会機能

・プロフィール作成機能

・メッセージ機能

・フォローアンフォロー機能

・お問い合わせ機能

・レビュー機能（スターレイト含む）

・契約機能

・ログイン時間明示機能

・ブログ作成機能

・ソーシャルシェア機能

・検索機能（コンサルタント絞り込み検索）

### お客様の機能

・ボトルを選ぶ機能

### コンサルタントの機能

・プラン作成機能

### 管理者機能(URLの後にadminと入れると管理者機能に飛びます）

・プランの公開非公開機能

・ユーザーの管理機能

# 使用技術

### フロントエンド

・HTML

・CSS(Sass)

・jQuery

### バックエンド

・Ruby 3.1.2

・RubyOnRails 7.0.3.1

### データベース

・MySQL 8.0.29

### インフラ

・Docker

・CircleCI

### コード解析

・Rubocop（可能な範囲内で）

### 主要なGem

・devise

・webpacker

・rails

・mysql2

・jquery-rails

・rspec-rails

・rubocop

・rails_admin

・dotenv-rails

・carrierwave

・faker

・gimei

# ER図

![ER図完成版](https://user-images.githubusercontent.com/88385633/188859489-0bec6bed-d6e5-45d2-bc51-048dddd4ab64.png)

# 作成期間

6ヶ月

### 詳細

1ヶ月目：基本設計書（モック等）を書いたり、ER図の作成や環境構築をしました。

2ヶ月目：モックをもとにフロントエンドを実装しました。

3ヶ月目：フロントエンド（主にjQuery)を実装しました。

4ヶ月目：バックエンドを実装しました。

5ヶ月目：バックエンドを実装しました。

6ヶ月目：CircleCiを使いHerokuにデプロイしたり、ドメインを取得しました。

# こだわった部分

### 技術について

・UIを整え、見た目にこだわりました。

・フォローボタンを非同期にするなど、ユーザーの使いやすさにこだわりました。

・ボトルを選ぶ画面で、ボトルを拡大させるなど、アプリケーションに動きをつけてユーザーが飽きないようにしました。

・検索機能を他テーブルからも検索できるようにしました。

### 仕様について

・障害者手帳の証明があれば半額キャンペーンなど、障害者の方がより使いやすくなるような仕様にしました。アプリケーションで障害者割引があると画期的かなと思いました。
