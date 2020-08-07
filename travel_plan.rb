#メソッドで何がしたいか（動詞）
#その結果の値（戻り値）を、引数として渡す。
#結果の値（戻り値）をメソッド実行時に、変数として代入する。

#旅行代金の計算アプリ

#１場所と料金を集計する
#2 プランを選択する（してもらう）
#3 ユーザが選択したプランを表示する 
####======後半＝＝＝＝＝＝＝###
# 4 人数を選択してもらう
# 5 基本料金を計算する
# 6 割引価格を計算する
# 7  旅行代金を表示する。



def summarize_place_price
  [
    {place:"沖縄",price: 30000},
    {place:"北海道",price: 10000},
    {place:"九州",price: 20000}
  ]
end

def select_plan(travel_plans)
  while true do
    puts "旅行プランを選択してください"
    travel_plans.each.with_index(1) do |travel_plan,number|
      puts "#{number} : #{travel_plan[:place]} 旅行 #{travel_plan[:price]}円"
    end

    #旅行プランの取得

    plan_number = gets.to_i
    break if (1..3).include?(plan_number)
    puts "不正な値なので、再度入力してください"
  end
  plan_number
end

def disp_selected_plan(travel_plans,plan_number)
  selected_travel_plan = travel_plans[plan_number -1] 
  puts "#{selected_travel_plan[:place]}　旅行が選択されました。"　#配列の中から　ハッシュを取り出し、キーを指定するコマンド
  
  selected_travel_plan #戻り値
end
####ここまで前半########
def select_person_num
  while true do 
    puts "参加人数を入力して下さい"
    person_number = gets.to_i
    break if 1 <= person_number
    puts "不正な値です。再入力お願いします"
  end

   person_number
end
# 5 基本料金を計算する
def calculate_price(selected_travel_plan,person_number)
  selected_travel_plan[:price] * person_number #戻り値
end
# 6 割引価格を計算する
def calculate_discount_price(selected_travel_plan,person_number)
  selected_travel_plan[:price] * person_number * 0.9 #戻り値
end
# 7  旅行代金を表示する。
def disp_price(selected_travel_plan,person_number)
  puts "#{selected_travel_plan[:place]} 旅行ですね。    人数は、#{person_number}"
  
  if person_number < 5
    puts "#{calculate_price(selected_travel_plan,person_number)}  円になります" 
  else
    puts "10％引き価格になります。トータル　#{calculate_discount_price(selected_travel_plan,person_number)} 円になります"
  end

end

 #メソッド呼び出し
travel_plans = summarize_place_price
plan_number = select_plan(travel_plans)
selected_travel_plan = disp_selected_plan(travel_plans,plan_number)

####ここまで前半########

person_number = select_person_num
calculate_price(selected_travel_plan,person_number)
calculate_discount_price(selected_travel_plan,person_number)

disp_price(selected_travel_plan,person_number)