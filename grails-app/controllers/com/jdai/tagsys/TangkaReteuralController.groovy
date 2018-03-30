package com.jdai.tagsys

import grails.transaction.Transactional

class TangkaReteuralController {
    /*
    * 页面
    * */
    def index() { }
    /*
    * getTangkaList方法
    * */
    def getTangkaList(){
        def tangkaList = PollsRetrievalStart.list();
        render(contentType: 'application/json'){
            [data:tangkaList]
        }
    }
    /*
        * 更新修改方法
        * */
    @Transactional
    def updateTangka(){
        def tangka_id = params.idValue as Integer;
        def related_image = params.image_url as String;
        def retrival_image = params.image_name as String;
        def pollsRetrievalStart = PollsRetrievalStart.findById(tangka_id);
        pollsRetrievalStart.image_url = related_image;
        pollsRetrievalStart.image_name = retrival_image;
        try {
            if (pollsRetrievalStart.save()){
                render(contentType: 'application/json'){
                    [data:"ok"]
                }
                return ;
            }else {
                println("errors.tagTask: ${pollsRetrievalStart.errors}");
                log.debug("errors.tagTask: ${pollsRetrievalStart.errors}")
                throw new RuntimeException("${pollsRetrievalStart}")
            }
        }catch (Exception e)
        {
            log.error(e);
        }

    }

    /*
    * 删除
    * */
    @Transactional
    def deleteTangka(){
        def id_value = params.idValue;
        def pollsRetrievalStart = PollsRetrievalStart.findById(id_value);
        pollsRetrievalStart.delete();
        render(contentType: 'application/json'){
            [data:"ok"]
        }

    }

}
