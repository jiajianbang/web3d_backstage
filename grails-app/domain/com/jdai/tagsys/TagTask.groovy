package com.jdai.tagsys

/**
 *标注任务
 */
class TagTask {

    String remark;
    Date dateCreated;//创建日期
    Date lastUpdated;//更新日期
    //
    String createPersonLabenCn
    String relatedCreatePersonId = "sys";//创建人
    String taskName;//(name：商品图片+3C+手机+品牌)
    String taskType ="图片标注";//任务类型 图片标注
    String taskProgress="0";//任务进度 当前分类级别
    String status ="0";//新建-开始-进行中-完成
    Integer levels = 1;//分类级别


    static constraints = {
        remark nullable:true
        createPersonLabenCn nullable:true

    }

    static mapping = {

        autoTimestamp true;
    }
}
