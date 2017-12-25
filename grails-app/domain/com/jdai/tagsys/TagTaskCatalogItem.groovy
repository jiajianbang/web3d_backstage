package com.jdai.tagsys

/**
 * 标注子分类类别
 */
class TagTaskCatalogItem {

    String remark;
    Date dateCreated;//创建日期
    Date lastUpdated;//更新日期
    //
    String itemTitle;//(name：手机、相机、pc，defualt)
    String itemValue;//(0,1,2)
    String relatedTagTaskId;
    String relatedSuperTaskCatalogId;//上级catalogID
    String relatedTaskCatalogId;
    String votes =1;//任务进度 当前分类级别
    String times =1;//
    Integer level =1;//分类级别



    static constraints = {
        remark nullable:true

    }

    static mapping = {

        autoTimestamp true;
    }
}
