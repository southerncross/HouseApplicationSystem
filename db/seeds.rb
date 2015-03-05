# -*- coding: utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Message.create(date: Date.today, title: 'title test', content: 'content test')
Message.create(date: Date.today, title: '中文标题', content: '中文内容')

Type.create(name: '午-A', meta: 2, description: '2室2厅1卫', area: 90, amount: 900)
Type.create(name: '午-A(反)', meta: 2, description: '2室2厅1卫', area: 90, amount: 900)
Type.create(name: '丑-B', meta: 3, description: '3室2厅1卫', area: 140, amount: 300)

Site.create(name: "E'地块", area: 38570, transportation: '距地铁16号线500米，紧邻肖家河公交站', medicine: '距北医三院中央党校院区0.8千米，距海淀区红十字医院1.3千米，距上地医院1.3千米', food: '九头鹰酒家（农大店），御京香，丫咪火锅，和气一家人')

Building.create(name: "E-1", area: 9600)

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
