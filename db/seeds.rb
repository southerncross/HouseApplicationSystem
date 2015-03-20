# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.create(date: Date.today, title: '奢侈品牌中国区降价引发抢购', content: '新京报讯 (记者李媛 金彧 郭永芳)香奈儿降价后，引发国内消费市场的一阵骚动。上海某商场香奈儿专卖店出现排队抢购的热闹景象。北京市场表现相对淡定，并未出现排队扫货场景，但客流量较以往大大增加。而据记者了解，目前LV、PRADA、GUCCI等品牌，都尚未跟进降价。

　　降价换来客流量增长

　　3月18日，香奈儿宣布，从4月8日开始上调在欧洲售卖的产品价格，同时下调亚洲区售价，最终缩小全球市场的价格差在5%左右。据了解，香奈儿将欧洲售价上涨了20%，中国内地则下调20%。

　　这次首先调整的是香奈儿经典款(11.12和2.55)与Le Boy Chanel手袋系列。其中，11.12款手袋在中国内地的售价从先前的3.82万元降到3万元，Le Boy手袋中国内地的价格从原本的3.27万元下调至2.6万元。“有的包一下降了8000元，两个包的降幅累计就能去一趟欧洲了。”有消费者调侃说。

　　尽管没有出现上海排长队“抢购”的景象，但北京的部分门店客流量明显增加。昨日，记者在北京国贸商城香奈儿腕表珠宝专卖店发现，香奈儿腕表中也有部分已经降价，降幅也在20%左右。看到记者后，香奈儿店销售人员非常主动地谈起产品普遍降价的情况，“现在买表特别划算，我们有一款5万的经典女表直降到4万元，前晚总部刚刚下达调价信息，客流量比之前明显多了”。

　　位于北京新光天地的香奈儿国际精品店里，晚7点半至八点左右，记者发现19日到店消费者明显比18日增多。记者粗略统计到店人数，同一时间段内，到店人数较前一天激增两倍，相比前一天，钱包、手袋区域甚至有点拥挤，且成交活跃。

　　其他奢侈品品牌尚未跟进

　　降价给消费者带来更明显的福利。四川成都林女士每年都会有几次购买奢侈品的需求，昨日她对新京报记者说，“姐妹团听说香奈儿降价了都很高兴，以后再不用在选择代购还是在国内购买之间纠结了。”不过也有消费者表示，尽管国内降价，但是相比欧洲还是有价差，计划在4月份欧洲涨价之前托亲友代购。

　　“降价以后，肯定选择在国内买香奈儿，而且可以包退包换，比代购方便很多”。林女士说，这次降价的三款产品中，有一款是经典款，正打算去看看。

　　北京的李女士说，前几年买了一个香奈儿的箱包当时国内售价2.8万元，再后来涨到3万多元。降价后跟之前的水平差不多。“估计这轮降价会成为常态，所以我没打算立刻去抢购，可以等有需求的时候再去选。”李女士说。

　　昨日，记者也走访了位于国贸商城、金融街购物中心、新光天地的LV、GUCCI、PRADA等品牌，上述品牌销售人员均告诉记者，香奈儿降价后，确有消费者关心这些品牌旗下产品是否降价，不过，目前尚未接到公司总部通知，价格暂不调整。')

Message.create(date: Date.today, title: 'IS将1600年前古老修道院炸成废墟', content: '中国网3月20日讯 据英媒报道，极端组织“伊斯兰国”日前在伊拉克巴克迪达炸毁了Mar Benham修道院，这座寺庙建于4世纪，距今已有1600年的历史。

从当地居民拍摄的视频看，极端组织用炸药将这座古老的修道院炸成了一片废墟。事发地点距“伊斯兰国”控制下重镇摩苏尔只有20英里。

据悉，Mar Benham修道院由亚述国王 Senchareb所建，每年都有成千上万的基督徒和穆斯林来此拜访。寺庙被摧毁后，其中的僧侣们被迫转移到了临近的基督教村镇。

此前已有多份报道显示，“伊斯兰国”武装人员在伊拉克大肆毁坏基督教文明，摧毁了许多珍贵文物。这些举动令舆论哗然，也引起了联合国教科文组织的重视，要求安理会将伊拉克遗产保护纳入安保工作。')

HouseType.create(name: 'T-1', meta: 2, description: '2室2厅1卫', area: 70, amount: 900)
HouseType.create(name: 'T-2', meta: 2, description: '2室2厅1卫', area: 70, amount: 900)
HouseType.create(name: 'T-3', meta: 2, description: '2室2厅1卫', area: 70, amount: 900)
HouseType.create(name: 'T-4', meta: 2, description: '2室2厅1卫', area: 80, amount: 900)
HouseType.create(name: 'T-5', meta: 2, description: '2室2厅1卫', area: 80, amount: 900)
HouseType.create(name: 'T-6', meta: 3, description: '3室2厅1卫', area: 90, amount: 900)
HouseType.create(name: 'T-7', meta: 3, description: '3室2厅1卫', area: 90, amount: 900)

house_types = HouseType.all
4.times do |unit|
  6.times do |floor|
    2.times do |door|
      house_types.each {|house_type| house_type.houses.create!(door: floor.to_s + "0" + door.to_s, unit: unit, floor: floor)}
    end
  end
end

%w(S-1 S-2 S-3 S-4).each {|name| Site.create(name: name, area: 38570, transportation: '这里是交通运输情况介绍', medicine: '这里是医疗卫生情况介绍', food: '这里是餐饮购物情况介绍')}

%w(1 2 3 4 5 6 7 8 9 10 11 12).each {|name| Building.create(name: name, area: 9600)}

User.create(name: "xjh", email: "xjh@example.com", password: "xjh888", password_confirmation: "xjh888")

=begin
Svg.create(description: 'Map of locations', content: '<svg height="500" version="1.1" width="550" xmlns="http://www.w3.org/2000/svg">
        <g>
                <title>map</title>
                <image xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="map.jpg" preserveAspectRatio="none" x="0" y="0" width="550" height="500"></image>
                <path d="M 50 280 l 120 -10 l 5 80 l -120 10 Z" stroke="#ee3a8c" style="stroke-width: 5px; fill-opacity: 0;"></path>
                <path d="M 50 280 l 120 -10 l 5 80 l -120 10 Z" fill="#ee3a8c" style="opacity: 0;"></path>
                <path d="M 100 367 l 75 -6 l 5 65 l -80 15 Z" stroke="#0080ff" style="stroke-width: 5px; fill-opacity: 0;"></path>
                <path d="M 100 367 l 75 -6 l 5 65 l -80 15 Z" fill="#0080ff" style="opacity: 0;"></path>
                <path d="M 285 172 l 85 -6 l 5 75 l -87 8 Z" stroke="#ffd306" style="stroke-width: 5px; fill-opacity: 0;"></path>
                <path d="M 285 172 l 85 -6 l 5 75 l -87 8 Z" fill="#ffd306" style="opacity: 0;"></path>
                <path d="M 380 145 l 40 -7 h 23 l 55 95 l -110 8 Z" stroke="#82d900" style="stroke-width: 5px; fill-opacity: 0;"></path>
                <path d="M 380 145 l 40 -7 h 23 l 55 95 l -110 8 Z" fill="#82d900" style="opacity: 0;"></path>
                <path d="M 395 255 l 105 -7 l 15 5 l 20 50 l 10 40 l -5 10 l -135 30 l -5 -5 Z" stroke="#8600ff" style="stroke-width: 5px; fill-opacity: 0;"></path>
                <path d="M 395 255 l 105 -7 l 15 5 l 20 50 l 10 40 l -5 10 l -135 30 l -5 -5 Z" fill="#8600ff" style="opacity: 0;"></path>
        </g>
</svg>')
=end
