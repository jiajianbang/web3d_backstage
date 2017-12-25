package com.jdai.tagsys

import grails.transaction.Transactional

@Transactional
class CommonService {

    def getCfgTagTaskStatus() {

        return [
                [name:'新建',value:'0'],
                [name:'开始',value:'1'],
                [name:'进行中',value:'2'],
                [name:'完成',value:'3'],
                [name:'异常',value:'4']
        ]
    }

    def getCreatePersonBySession() {

        return "test001"
    }
}
