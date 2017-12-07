package org.app.admin.util.executor;

import org.app.admin.pojo.Resource;
import org.app.admin.service.ResourceService;
import org.app.admin.util.ImageTool;
import org.app.admin.util.ImgCompressionBean;
import org.app.admin.util.ImgInfoBean;
import org.app.admin.util.SampleUsage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;


public class Task implements Runnable {
    private static final Logger log = LoggerFactory
            .getLogger(Task.class);

    private ResourceService resourceService;

    private String generateName;

    public Task(String generateName,ResourceService resourceService){
        this.generateName=generateName;
        this.resourceService=resourceService;
    }


    public String getGenerateName() {
        return generateName;
    }

    public void setGenerateName(String generateName) {
        this.generateName = generateName;
    }

    public ResourceService getResourceService() {
        return resourceService;
    }

    public void setResourceService(ResourceService resourceService) {
        this.resourceService = resourceService;
    }



    @Override
    public void run() {
        Task task = this;
        Resource r = loadResuces(task);
        if (r != null) {
            r.setImgCompressionBean(imgCompressionProcess(r));
            r.setImgInfoBean(imgInfoProcess(r));
        }
        task.resourceService.save(r);
    }


    /**
     * Load Resource
     *
     * @param task
     * @return
     */
    public Resource loadResuces(Task task) {
        Query query = new Query();
        query.addCriteria(Criteria.where("generateName").is(task.getGenerateName()));
        return task.resourceService.findOneByQuery(query, Resource.class);
    }

    /**
     *  Resource Compression ( min_ , middle_ , max_ )
     * @param r
     * @return
     */
    public ImgCompressionBean imgCompressionProcess(Resource r) {
        log.info("imgCompression_address：" + r.getOriginalPath());
        ImgCompressionBean icb = new ImgCompressionBean();
        icb.setMin_generateName(compressPicProcess(r,300,200,"min_",false));
        icb.setMiddle_generateName(compressPicProcess(r,800,600,"middle_",true));
        icb.setMax_generateName(compressPicProcess(r,1500,1200,"max_",true));
        return icb;
    }

    public String compressPicProcess(Resource r,int width,int heigth,String name,boolean is){
        ImageTool tool = new ImageTool();
        String newfileName=name + r.getGenerateName();
        tool.compressPic(r.getOriginalPath(), r.getOriginalPath(), r.getGenerateName(),
                newfileName, width, heigth, is);
        return newfileName;
    }

    public ImgInfoBean imgInfoProcess(Resource r) {
        log.info("imgInfoProcess"+r.getOriginalPath()+r.getGenerateName());
        return new SampleUsage().parseImgInfo(r.getOriginalPath()+r.getGenerateName());
    }



}
