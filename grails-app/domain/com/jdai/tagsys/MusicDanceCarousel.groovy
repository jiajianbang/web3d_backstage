package com.jdai.tagsys

class MusicDanceCarousel {
    String remark;
    Date dateCreated;//创建日期
    Date lastUpdated;//更新日期
    String labelTitle;//轮播名称
    String labelDetail;//轮播详情
    String imageUrl;//图片URL

    static constraints = {
        remark nullable:true
    }

    static mapping = {

        autoTimestamp true;
    }
}
