package com.jdai.tagsys

import grails.transaction.Transactional

import java.awt.Event


class TagTaskController {

    def  commonService
/*
*  String title;//任务名称
    String taskType;//任务类型
    String taskProgress;//任务进度
    String createPerson;//创建人

    String taskProcess;//任务流程
* */


    def addtestData(){

        def task = new TagTask();
        task.createPersonLabenCn = "ssss";
        task.taskName = "aaaaaaaaaa";
        task.taskType = "11111";
        task.taskProgress = "100%";
        if (task.save(flush: true)){
            render("ok");
        }else {
            task.errors.allErrors.each {
                log.error(it)
            }
            render("error")
        }
//        new TagTask(taskName:'3C分类2',taskType:'图片分类',createPersonLabenCn:"王永杰",taskProgress:'100%').save(flush: true);
//        new TagTask(taskName:'3C分类3',taskType:'图片分类',createPersonLabenCn:"王永杰",taskProgress:'100%').save(flush: true);
//        new TagTask(taskName:'3C分类4',taskType:'图片分类',createPersonLabenCn:"王永杰",taskProgress:'100%').save(flush: true);
//        new TagTask(taskName:'3C分类5',taskType:'图片分类',createPersonLabenCn:"王永杰",taskProgress:'100%').save(flush: true);
//        render "ok"
    }
    @Transactional
    def index() {
        //def list = TagTask.findByCreatePerson("王永杰")
        println (params)

    }

    //保存页面传过来的数据
    @Transactional
    def saveTask(){
        println("scope.tagTask: ${params}");
        def personId = commonService.getCreatePersonBySession();
//        def test = params;
        def tagTaskInstance = new TagTask(params);
        tagTaskInstance.relatedCreatePersonId = personId;
        if(tagTaskInstance.save())
        {
            render(contentType: "application/json") {
                [state:'ok',tagTaskInstance:tagTaskInstance]
            }
        }else{
            println("errors.tagTask: ${tagTaskInstance.errors}");
            log.debug("errors.tagTask: ${tagTaskInstance.errors}")
            throw new RuntimeException("${tagTaskInstance}")
        }
    }
    //保存catalog
    @Transactional
    def saveTaskCatalog(){

        def person = commonService.getCreatePersonBySession();
        //def test = params;
        def tagTaskCatalog = new TagTaskCatalog(params);
        tagTaskCatalog.relatedSuperTaskCatalogId = person;

        if(tagTaskCatalog.save())
        {
            render(contentType: "application/json") {
                [state:'ok',tagTaskInstance:tagTaskCatalog]
            }
        }else{
            println("errors.tagTask: ${tagTaskCatalog.errors}");
            log.debug("errors.tagTask: ${tagTaskCatalog.errors}")
            throw new RuntimeException("${tagTaskCatalog}")
        }

    }

    //保存subCalss
    @Transactional
    def savesubCalss(){

        def person = commonService.getCreatePersonBySession();
        def cataloglist = params.list("0");

        if (cataloglist)
        {
            render(contentType: "application/json") {
                [state:'ok']
            }
        }

    }

    //保存subCalss
    @Transactional
    def saveSecondGrade(){

        def person = commonService.getCreatePersonBySession();
        for(int i = 1; i<params.size()-3; i++)
        {
            def listm = i.toString();
            def cataloglist = params.list(listm);


        }



        if (cataloglist)
        {
            render(contentType: "application/json") {
                [state:'ok']
            }
        }


    }

    //保存页面传过来的数据
    @Transactional
    def delCurrentTagTask(){
        def delTaskId = params.taskId;
        def tag = TagTask.findById(delTaskId);
        tag.delete();
        if (TagTaskCatalog.findByRelatedTagTaskId(delTaskId))
        {
            def tagCatalog = TagTaskCatalog.findByRelatedTagTaskId(delTaskId);
            tagCatalog.delete();
        }
        render(contentType: "application/json") {
            [state:'ok']
        }
    }

    @Transactional
    def tagTaskList(){

        def list = TagTask.list();
        render(contentType: "application/json") {
          [state:'ok',data:list]
        }
    }
    def createTagTask(){

    }
    /**
     *
     */
    @Transactional
    def findTagTaskByStr(){

       def searchValue = params.searchStr

        render(contentType: "application/json") {
            [state: 'ok']
        }
    }
    @Transactional
    def updateTagTaskById(){
        def taskId = params.taskId
        if(taskId)
        {
            [state: 'ok', data: taskId]
        }


    }
    /**
     *
     * @return
     */
    @Transactional
    def delTagTaskById() {

        def taskId = params.taskId

        def tag = TagTask.findById(taskId)
        tag.delete()

        render(contentType: "application/json") {
            [state: 'ok']
        }
    }
    /////
}
