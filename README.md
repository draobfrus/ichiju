## 一汁

#### ■サービス概要
日々のごはん作りを頑張りたいあなたへ。
まずは「みそ汁」から始めてみませんか？
「一汁」は、毎日のみそ汁作りを応援する、みそ汁特化型SNSサービスです。

#### ■メインターゲットのユーザー
- 一人暮らしの会社員など、自分のご飯を自分で用意している人
- 家族のために毎日料理を作っている人

#### ■ユーザーが抱える問題
- 健康や節約のために、自炊をしようと思っているが、日々忙殺されて習慣化できない
- 家庭料理のレシピがマンネリ化してしまう。

#### ■解決方法
「一汁」では、上記の問題に対して、みそ汁を用いた解決方法を提案します。
- みそ汁は非常にシンプルな作り方にも関わらず、たくさんの具材を入れることで栄養価の高いおかずとしても成り立つので、自炊習慣をつけるのに最適な一品です。「一汁」に作ったみそ汁を投稿し、「みそ汁カレンダー」を日々埋めていくことで、自炊継続を可視化することができます。また作ったみそ汁をユーザーに見てもらうことで、自炊のモチベーションアップに繋がります。
- 「一汁」に投稿されたみそ汁を閲覧し、作りたいレシピをブックマークすることができるので、明日作るみそ汁レシピに困ることはありません。また、あらかじめ冷蔵庫の食材を登録することで、レシピサイトに登録された人気みそ汁レシピを提案してくれます。

#### ■実装予定の機能
- 一般ユーザー
  - 未登録ユーザー
    - ユーザー登録機能（名前・メールアドレス・出身地・居住地・パスワード）
    - トップ画面表示
    - みそ汁投稿表示（新着投稿順）
    - 管理者への問い合わせ機能
  - 登録ユーザー
    - ログイン・ログアウト機能
    - パスワード再設定機能
    - マイページ機能
      - みそ汁カレンダー表示
        - 投稿したみそ汁の画像がカレンダー上に表示され、画像のリンクからいつでもレシピを見返すことができる
      - プロフィール編集（アバター画像・名前・メールアドレス・出身地・居住地）
      - 冷蔵庫の食材登録
        - 冷蔵庫の食材をもとに、みそ汁の人気レシピをレコメンドする（※1）
      - ブックマークした投稿一覧を表示
      - みそ汁チャートの表示
        - 1週間ごとの投稿数によってチャートが色づき、みそ汁作りの頑張りが一目で分かる
      - おみそ、おだしの登録機能
        - 調理によく使う、またはお気に入りのおみそ、おだしを登録する（※2）
    - 投稿作成・編集機能
      - 作ったみそ汁の写真をアップロード
      - タイトル・本文の入力
      - 材料タグ選択（※3）
      - マイページで登録したおみそ、おだしを選択し、投稿に加えることができる（※2）
      - Twitterシェア
    - 投稿削除機能
    - みそ汁投稿の検索機能
      - フリーワード検索
      - 使っている食材タグで検索（※3）
    - みそ汁投稿のいいねスタンプ機能
    - みそ汁投稿のブックマーク機能
    - 他ユーザーのプロフィール閲覧機能（アバター画像・名前・投稿・みそ汁チャート）
    - 管理者への問い合わせ機能

- 管理者ユーザー
  - 管理ユーザー登録
  - 管理ユーザー削除
  - 一般ユーザーの一覧・詳細・編集・削除・検索
  - 各投稿の一覧・詳細・編集・削除・検索

（※1）「楽天レシピAPI」を使用し、登録した食材を使用した上位ランキングのレシピを表示
（※2）「楽天市場検索API」を使用し、おみそ、おだしの商品情報を検索・保存。
（※3）「日本食品標準成分表」または「食品栄養データベース API」を使用し、あらかじめ用意された食材タグからみそ汁の具材を選択

#### ■なぜこのサービスを作りたいのか
私自身一人暮らしで生活しており、日々の仕事や学習で毎日のご飯づくり億劫に感じ、つい出来合いのものに頼ってきました。
これは私と同じ境遇でなくても、人生のどのフェーズにおいても共感しうるものだと考えています（例えば「子育てで忙しい」「親の介護で忙しい」など）。
同時に、自炊を続けることによって健康維持・食費節約といった恩恵を受けられるため、「何とか自炊を継続化する方法はないか」と悩んでいました。

そんな中、栄養価が高く、どんな具材を入れても様になり、作り方も単純な「みそ汁」は、それだけでお腹を満たすので、「自炊を習慣化したいけど、面倒臭い」と感じる全ての人の味方となるのでは？と考えました。
「一汁」と通して、毎日のみそ汁づくり、ひいては自炊継続の一助となれば幸いです。

#### ■画面遷移図
URLは[こちら](https://www.figma.com/file/byXYHVgoi48ftTHrX3LmpG/%E4%B8%80%E6%B1%81%EF%BC%8F%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1&t=DnZDzoEadONtC7uT-1)

#### ER図
URLは[こちら](https://i.gyazo.com/3d05e37fa38ddc50c7c528962852f0aa.png)

#### ■スケジュール
- 企画〜技術調査：12/25 〆切
- README〜ER図作成：12/25 〆切
- メイン機能実装：12/26 - 2/12
- β版をRUNTEQ内リリース（MVP）：2/12〆切
- 本番リリース：2月末
