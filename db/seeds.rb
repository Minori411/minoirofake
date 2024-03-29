user = User.new(name: "林みのり",
                email: Faker::Internet.email,
                password: "password1234",
                level: "★★★ 初中級",
                experience: "〜3年",
                prefecture: Gimei.address.prefecture.kanji,
                introduction: "こんにちは",
                userstyle: 1,
                id: 1)

user.skip_confirmation!
user.save!

10.times do |n|
  User.create!(id: n+2,
               userstyle: 1,
               prefecture: Gimei.address.prefecture.kanji,
               introduction: "こんにちは",
               url: "aaa",
               name: Gimei.kanji,
               email: Faker::Internet.email,
               password: "minori1234#{n + 1}",
               password_confirmation: "minori1234#{n + 1}",
               disability_passport: "www",
               certificate: "sss",
               image: "B000.png",
               level: "★★★ 初中級",
               experience: "〜3年")
end

User.all.each do |user|
  user.careers.create!(started_at: "2022-05-01 00:00:00",
                      end_at: "2022-08-01 00:00:00",
                      content: "◯◯大学卒業")

  user.plans.create!(title: "悩みを色で解決します",
                     can_do: "カップルコンサル",
                     youtube: "https://www.youtube.com",
                     body: "こんにちは",
                     user_id: user.id)
end

Plan.all.each do |plan|
  plan.smallplans.create!(plan_name: "夫婦関係について相談できます",
                          plan_detail: "夫婦のお悩み",
                          price: [1000,2000,3000,4000,5000].sample,
                          video: true,
                          chat: false,
                          user_id: plan.user_id,
                          plan_id: plan.id)
end

9.times do |n|
Review.create(body: "知りたいことが知れました。とてもいい経験になりました。",
              name: "林みのり",
              reviewer_id: n+1,
              reviewee_id: n,
              user_id: n,
              evaluation: [2,3,4,5].sample)
end

User.all.each do |user|
user.articles.create!(subject: "最近の相談",
                body: "最近の相談は夫婦関係が多いです",
                user_id: user.id)
end

Room.create!(
  [
    {
      id: 1
    },
    {
      id: 2
    }
  ]
)

Bottle.create!(
  [
    {
      bottle_type: "B000",
      bottle_name: "スピリチュアルレスキュー",
      meaning_detail: "直感的な深い洞察や気づきを、日常生活のなかに生かすのを助ける"
    },
    {
      bottle_type: "B001",
      bottle_name: "フィジカルレスキュー",
      meaning_detail: "日常生活のすべてがスピリチュアルであるということを理解し受け入れることをサポートします。ヒーラーのボトル"
    },
    {
      bottle_type: "B002",
      bottle_name: "ピースボトル",
      meaning_detail: "内なる真の平和と繋がる"

    },
    {
      bottle_type: "B003",
      bottle_name: "ハートボトル/アトランティアンボトル",
      meaning_detail: "ハートの問題、人生の感情的な側面"
    },
    {
      bottle_type: "B004",
      bottle_name: "サンライトボトル",
      meaning_detail: "内なる知識と内なる智恵「汝自身を知れ」の扉を開く"
    },
    {
      bottle_type: "B005",
      bottle_name: "サンライズ/サンセットボトル",
      meaning_detail: "広大なエネルギーに開いていくこと、開放されたエネルギーを知識を使って用いる"
    },
    {
      bottle_type: "B006",
      bottle_name: "エナジーボトル",
      meaning_detail: "献身的な愛"
    },
    {
      bottle_type: "B007",
      bottle_name: "ゲッセマネの園/最後に信仰が試される",
      meaning_detail: "信頼を試す"
    },
    {
      bottle_type: "B008",
      bottle_name: "アヌビス",
      meaning_detail: "考え過ぎは、内なる平和を乱す"
    },
    {
      bottle_type: "B009",
      bottle_name: "ハートの中のハート、クリスタルの洞窟、超越したハート",
      meaning_detail: "真理の探究"
    },
    {
      bottle_type: "B010",
      bottle_name: "「行って木を抱きしめなさい」",
      meaning_detail: "物事の決断を助ける"
    },
    {
      bottle_type: "B011",
      bottle_name: "エッセネボトル I",
      meaning_detail: "無条件の愛とは何かのフィーリングを得る"
    },
    {
      bottle_type: "B012",
      bottle_name: "新しい時代の平和",
      meaning_detail: "平和で有効的な対話"
    },
    {
      bottle_type: "B013",
      bottle_name: "新しい時代の変化",
      meaning_detail: "移行と変化に関わるスペース"
    },
    {
      bottle_type: "B014",
      bottle_name: "新しい時代の叡智",
      meaning_detail: "叡智へのクリアなチャネル（回路）になる"
    },
    {
      bottle_type: "B015",
      bottle_name: "新しい時代の奉仕",
      meaning_detail: "自分自身のヒーリングのパワーを獲得する"
    },
    {
      bottle_type: "B016",
      bottle_name: "薫色の衣",
      meaning_detail: "スピリチュアルな向上"
    },
    {
      bottle_type: "B017",
      bottle_name: "吟遊詩人 Ⅰ/希望のボトル",
      meaning_detail: "ハートを癒す"
    },
    {
      bottle_type: "B018",
      bottle_name: "エジプシャンボトル Ⅰ/ターニングタイド",
      meaning_detail: "自己欺瞞を克服する"
    },
    {
      bottle_type: "B019",
      bottle_name: "物質界に生きる",
      meaning_detail: "新しいエネルギーを貯える"
    },
    {
      bottle_type: "B020",
      bottle_name: "スターチャイルド",
      meaning_detail: "あらゆる領域で子どもたちを援助する。そしてまた、子供の頃の私たち（インナーチャイルド）をも援助する"
    },
    {
      bottle_type: "B021",
      bottle_name: "愛への新しい始まり",
      meaning_detail: "愛への新しい始まり"
    },
    {
      bottle_type: "B022",
      bottle_name: "再生者のボトル/目覚め",
      meaning_detail: "依存しない愛"
    },
    {
      bottle_type: "B023",
      bottle_name: "愛と光",
      meaning_detail: "自己愛を取り戻す"
    },
    {
      bottle_type: "B024",
      bottle_name: "新たなメッセーい",
      meaning_detail: "新たな可能性"
    },
    {
      bottle_type: "B025",
      bottle_name: "フローレンスナイチンゲールボトル",
      meaning_detail: "失望からの解放"
    },
    {
      bottle_type: "B026",
      bottle_name: "エーテルレスキュー/ハンプティ・ダンプティボトル",
      meaning_detail: "ショックボトル、ショックを吸収する"
    },
    {
      bottle_type: "B027",
      bottle_name: "ロビンフッド",
      meaning_detail: "主張"
    },
    {
      bottle_type: "B028",
      bottle_name: "メイド・マリアン",
      meaning_detail: "新たな始まり"
    },
    {
      bottle_type: "B029",
      bottle_name: "立ち上がって、進め",
      meaning_detail: "人生に秩序をもたらす"
    },
    {
      bottle_type: "B030",
      bottle_name: "地上に天国をもたらす",
      meaning_detail: "コミュニケーションを通してエネルギーを得る"
    },
    {
      bottle_type: "B031",
      bottle_name: "ファウンテン",
      meaning_detail: "深い恐れに打ち勝つ"
    },
    {
      bottle_type: "B032",
      bottle_name: "ソフィア",
      meaning_detail: "内なる真理を分け与える"
    },
    {
      bottle_type: "B033",
      bottle_name: "ドルフィンボトル/目的をもった平和",
      meaning_detail: "平和なコミュニケーション"
    },
    {
      bottle_type: "B034",
      bottle_name: "ヴィーナスの誕生",
      meaning_detail: "性格の中の様々なレベルの統合"
    },
    {
      bottle_type: "B035",
      bottle_name: "親切心",
      meaning_detail: "愛を通してスピリチュアルなものに近づく"
    },
    {
      bottle_type: "B036",
      bottle_name: "チャリティ",
      meaning_detail: "スピリチュアルな愛"
    },
    {
      bottle_type: "B037",
      bottle_name: "地上に降りた守護天使",
      meaning_detail: "有効性"
    },
    {
      bottle_type: "B038",
      bottle_name: "吟遊詩人 Ⅱ/識別力",
      meaning_detail: "思考からフィーリングへ"
    },
    {
      bottle_type: "B039",
      bottle_name: "エジプト人のボトル2/操り人形師",
      meaning_detail: "はかり知れない深い恐れを癒す"
    },
    {
      bottle_type: "B040",
      bottle_name: "「アイ・アム」ボトル",
      meaning_detail: "自己覚醒と自己を知る"
    },
    {
      bottle_type: "B041",
      bottle_name: "叡智のボトル/黄金郷",
      meaning_detail: "同化"
    },
    {
      bottle_type: "B042",
      bottle_name: "収穫",
      meaning_detail: "歓びのともなう自発性"
    },
    {
      bottle_type: "B043",
      bottle_name: "創造性",
      meaning_detail: "芸術やマスメディアを媒体にしたコミュニケーション"
    },
    {
      bottle_type: "B044",
      bottle_name: "守護天使",
      meaning_detail: "ネガティブから平和への変容"
    },
    {
      bottle_type: "B045",
      bottle_name: "プレス オブ ラブ",
      meaning_detail: "愛のギブアンドテイク"
    },
    {
      bottle_type: "B046",
      bottle_name: "放浪者（ワンダラー）",
      meaning_detail: "愛への新たな始まり"
    },
    {
      bottle_type: "B047",
      bottle_name: "古い魂のボトル",
      meaning_detail: "頭と身体をつなげる"
    },
    {
      bottle_type: "B048",
      bottle_name: "変化の翼",
      meaning_detail: "人生の目的を明確にする"
    },
    {
      bottle_type: "B049",
      bottle_name: "ニューメッセンジャー",
      meaning_detail: "フィーリングの表現"
    },
    {
      bottle_type: "B050",
      bottle_name: "エルモリヤ",
      meaning_detail: "これからずっと「大いなるものすべて」と調和し、人生を生きていくための準備"
    },
    {
      bottle_type: "B051",
      bottle_name: "クツミ",
      meaning_detail: "叡智を求める知性"
    },
    {
      bottle_type: "B052",
      bottle_name: "レディ ナダ",
      meaning_detail: "無条件の愛を経験する"
    },
    {
      bottle_type: "B053",
      bottle_name: "ヒラリオン",
      meaning_detail: "道、真理、そして生命"
    },
    {
      bottle_type: "B054",
      bottle_name: "セラビスベイ",
      meaning_detail: "あらゆるレベルでの浄化"
    },
    {
      bottle_type: "B055",
      bottle_name: "キリスト",
      meaning_detail: "献身的な愛の発達"
    },
    {
      bottle_type: "B056",
      bottle_name: "サンジェルマン",
      meaning_detail: "あらゆるレベルにおけるネガティブの解放"
    },
    {
      bottle_type: "B057",
      bottle_name: "パラスアテナとアイオロス",
      meaning_detail: "過去のパターンを解放する"
    },
    {
      bottle_type: "B058",
      bottle_name: "オリオンとアンジェリカ",
      meaning_detail: "自分自身のうちへの旅と外への旅"
    },
    {
      bottle_type: "B059",
      bottle_name: "レディ ポルシャ",
      meaning_detail: "正義と識別"
    },
    {
      bottle_type: "B060",
      bottle_name: "老子と観音",
      meaning_detail: "あまりにも深い安らぎの故に、自分がゆく道で出会う全てのものを静かに受け入れる"
    },
    {
      bottle_type: "B061",
      bottle_name: "サナトクマラとレディヴィーナス クマラ",
      meaning_detail: "個人的な喪失、個人を超越した獲得"
    },
    {
      bottle_type: "B062",
      bottle_name: "マハコハン",
      meaning_detail: "知性と霊性の絆"
    },
    {
      bottle_type: "B063",
      bottle_name: "ジュワルクールとヒラリオン",
      meaning_detail: "人生の目的を理解することを学ぶ"
    },
    {
      bottle_type: "B064",
      bottle_name: "ジュワルクール",
      meaning_detail: "人生で不変なものは、変化するということだけである"
    },
    {
      bottle_type: "B065",
      bottle_name: "頭は天に、足は地に",
      meaning_detail: "頭は天国に/足は地上に"
    },
    {
      bottle_type: "B066",
      bottle_name: "女優/ビクトリアのボトル",
      meaning_detail: "美で自分を包み込む"
    },
    {
      bottle_type: "B067",
      bottle_name: "天からの愛",
      meaning_detail: "行動の中のスピリチュアリティ"
    },
    {
      bottle_type: "B068",
      bottle_name: "ガブリエル",
      meaning_detail: "平和とスピリチュアルな理解"
    },
    {
      bottle_type: "B069",
      bottle_name: "鳴り響く鐘",
      meaning_detail: "愛の力"
    },
    {
      bottle_type: "B070",
      bottle_name: "壮麗なるビジョン",
      meaning_detail: "より大いなる明晰さを得る"
    },
    {
      bottle_type: "B071",
      bottle_name: "エッセネボトル Ⅱ/運の花の中の宝石",
      meaning_detail: "自己の受容 キリスト意識への強力なコネクタ"
    },
    {
      bottle_type: "B072",
      bottle_name: "道化師、パリアッチ",
      meaning_detail: "「悲しみのピエロ」を自由にする"
    },
    {
      bottle_type: "B073",
      bottle_name: "荘子",
      meaning_detail: "深い洞察を伝える"
    },
    {
      bottle_type: "B074",
      bottle_name: "勝利",
      meaning_detail: "困難な感情の状況に明晰さをもたらす"
    },
    {
      bottle_type: "B075",
      bottle_name: "流れと共に行く",
      meaning_detail: "流れと共に行く"
    },
    {
      bottle_type: "B076",
      bottle_name: "信頼",
      meaning_detail: "自分を愛することを通して、潜在能力を発揮する"
    },
    {
      bottle_type: "B077",
      bottle_name: "カップ",
      meaning_detail: "光の力が生命の力になる"
    },
    {
      bottle_type: "B078",
      bottle_name: "クラウンレスキュー/移行のボトル",
      meaning_detail: "人類援助のために地球にもたらされた高次元からのフルパワー"
    },
    {
      bottle_type: "B079",
      bottle_name: "ダチョウのボトル",
      meaning_detail: "霊的なショック 内面からの深い癒し 「エーテル ギャップ」のための強力な治療薬"
    },
    {
      bottle_type: "B080",
      bottle_name: "アルテミス",
      meaning_detail: "愛のパワーに目覚める"
    },
    {
      bottle_type: "B081",
      bottle_name: "無条件の愛",
      meaning_detail: "思いやりと理解。愛と自己需要の必要"
    },
    {
      bottle_type: "B082",
      bottle_name: "カリプソ",
      meaning_detail: "深い感情のショックの克服"
    },
    {
      bottle_type: "B083",
      bottle_name: "オープン セサミ",
      meaning_detail: "過去の叡智の心からのコミュニケーション。新しい皮袋の中の古いワイン"
    },
    {
      bottle_type: "B084",
      bottle_name: "風の中のキャンドル",
      meaning_detail: "愛の真のパワーを目覚めさせる。ケアしたい欲求"
    },
    {
      bottle_type: "B085",
      bottle_name: "タイタニア、妖精の女王",
      meaning_detail: "抑圧された感情の表現"
    },
    {
      bottle_type: "B086",
      bottle_name: "オベロン/妖精の王様",
      meaning_detail: "ハートの問題に明晰さをもたらす"
    },
    {
      bottle_type: "B087",
      bottle_name: "愛の叡智",
      meaning_detail: "あらゆるレベルでの愛の叡智。報われない愛"
    },
    {
      bottle_type: "B088",
      bottle_name: "翡翠の皇帝",
      meaning_detail: "自然への愛。フィーリンうを通じた深い平和からのコミュニケーション"
    },
    {
      bottle_type: "B089",
      bottle_name: "エナジー レスキュー タイムシフト",
      meaning_detail: "ヒーリングエネルギーを獲得する"
    },
    {
      bottle_type: "B090",
      bottle_name: "ウイズダム レスキュー",
      meaning_detail: "自分自身の混乱を包含する"
    },
    {
      bottle_type: "B091",
      bottle_name: "ハートのフェミニンリーダーシップ",
      meaning_detail: "リーダーシップの女性的な側面を伸ばす。ハートの教訓"
    },
    {
      bottle_type: "B092",
      bottle_name: "グレーテル",
      meaning_detail: "自分の直感を信頼する。競争ではなく強力"
    },
    {
      bottle_type: "B093",
      bottle_name: "ヘンゼル",
      meaning_detail: "愛の知恵、深い喜びの集団的コミュニケーション"
    },
    {
      bottle_type: "B094",
      bottle_name: "大天使 ミカエル",
      meaning_detail: "神との協力関係に入るために、個人の意志を紙の意志に明け渡す"
    },
    {
      bottle_type: "B095",
      bottle_name: "大天使ガブリエル",
      meaning_detail: "魂の意識または真のオーラと自己との整列結合"
    },
    {
      bottle_type: "B096",
      bottle_name: "大天使ラファエル",
      meaning_detail: "ハイヤー セルフと自己とのコミュニケーション"
    },
    {
      bottle_type: "B097",
      bottle_name: "大天使 ウリエル",
      meaning_detail: "黄金の光線の太古の知恵が意識的に心に明ける"
    },
    {
      bottle_type: "B098",
      bottle_name: "大天使 サンダルフォン",
      meaning_detail: "我々の中にいるインナーチャイルドが、我々自身である天使になる"
    },
    {
      bottle_type: "B099",
      bottle_name: "大天使 サドキエル",
      meaning_detail: "新しい方法による自由への一歩"
    },
    {
      bottle_type: "B100",
      bottle_name: "大天使 メタトロン",
      meaning_detail: "暗がりに差し込む光"
    },
    {
      bottle_type: "B101",
      bottle_name: "大天使 ヨフィエル",
      meaning_detail: "私たちの存在のフィーリング側をグラウンディングさせます。ハートの展開のプロセス。"
    },
    {
      bottle_type: "B102",
      bottle_name: "大天使 サミエル",
      meaning_detail: "恐れを超えて、ハートを開く"
    },
    {
      bottle_type: "B103",
      bottle_name: "大天使ハニエル",
      meaning_detail: "「栄光」または「神の恩寵の栄光」"
    },
    {
      bottle_type: "B104",
      bottle_name: "大天使カマエル",
      meaning_detail: "神のハートと愛"
    },
    {
      bottle_type: "B105",
      bottle_name: "大天使アズラエル",
      meaning_detail: "女神の具体化と、私たちに内在する女神を明らかにする"
    },
    {
      bottle_type: "B106",
      bottle_name: "大天使ラツィエル",
      meaning_detail: "内なる錬金術を通して条件付けのパターンを変容する"
    },
    {
      bottle_type: "B107",
      bottle_name: "大天使ツァフキエル",
      meaning_detail: "私たちの一人一人が近づけるかもしれないクリエイティブな吸収力。母の愛。"
    },
    {
      bottle_type: "B108",
      bottle_name: "大天使ジェレミエル",
      meaning_detail: "静けさを通してやってくる、ハートからの愛と真実のコミュニケーション"
    },
    {
      bottle_type: "B109",
      bottle_name: "大天使ザカリエル",
      meaning_detail: "新しい希望と確信をもたらず。創造性を活性化する。"
    },
    {
      bottle_type: "B110",
      bottle_name: "大天使アムブリエル",
      meaning_detail: "許し、自分自身を再び愛するために、自己受容をレスキューする"
    },
    {
      bottle_type: "B111",
      bottle_name: "大天使ダニエル",
      meaning_detail: "現実と非現実の区別を助け、コミュニケーションの明晰性をもたらす"
    },
    {
      bottle_type: "B112",
      bottle_name: "大天使イスラフェル",
      meaning_detail: "歓びに満ちた創造性の中にある明晰性"
    },
    {
      bottle_type: "B113",
      bottle_name: "大天使カシエル",
      meaning_detail: "愛を通して呼び起こされる気づき"
    },
    {
      bottle_type: "B114",
      bottle_name: "大天使ラグエル",
      meaning_detail: "状況の両側面を見れることは、バランスをもたらす助けになります。"
    },
    {
      bottle_type: "B115",
      bottle_name: "大天使ケミエルとアリエル",
      meaning_detail: "未定"
    },
    {
      bottle_type: "B116",
      bottle_name: "女王マブ",
      meaning_detail: "未定"
    },
    {
      bottle_type: "B117",
      bottle_name: "パン",
      meaning_detail: "未定"
    },
    {
      bottle_type: "B118",
      bottle_name: "エコー",
      meaning_detail: "未定"
    },
    {
      bottle_type: "B119",
      bottle_name: "セレス",
      meaning_detail: "未定"
    },
    {
      bottle_type: "B120",
      bottle_name: "ペルセポネ",
      meaning_detail: "未定"
    },
    {
      bottle_type: "B121",
      bottle_name: "プルトン",
      meaning_detail: "未定"
    }
  ]
)
