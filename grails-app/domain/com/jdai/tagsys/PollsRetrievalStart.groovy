package com.jdai.tagsys

class PollsRetrievalStart {

    String image_name;
    String image_url;
    String image_md;
    String image_label;
    Date create_time;

    static constraints = {
        image_label nullable: true
    }
    static mapping = {
        autoTimestamp true;
    }
}
