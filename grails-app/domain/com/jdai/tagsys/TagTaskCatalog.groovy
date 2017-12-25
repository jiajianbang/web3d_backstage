package com.jdai.tagsys

/**
 *标注任务子分类说明
 */
class TagTaskCatalog {

    String remark = 0;
    Date dateCreated;//创建日期
    Date lastUpdated;//更新日期
    //
    String catalogTitle;//(name：商品图片+3C+手机+品牌)
    String catalogItems = "图片标注";//任务类型 图片标注
    String votes;//任务进度 当前分类级别
    String times =1;//
    Integer level =1;//分类级别
    String relatedTagTaskId;
    String relatedSuperTaskCatalogId;//上级catalogID defuantl 0



    static constraints = {
        remark nullable:true

    }


    static mapping = {

        autoTimestamp true;
    }
}
