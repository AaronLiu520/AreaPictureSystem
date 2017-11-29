package org.app.admin.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public class FileOperateUtil {
    private static final Logger log = LoggerFactory
            .getLogger(FileOperateUtil.class);
    private static final int BUFFER_SIZE = 16 * 1024;

    private static final String REALNAME = "realname";
    private static final String PATH = "path";
    private static final String SIZE = "size";
    private static final String SUFFIX = "suffix";
    private static final String CONTENTTYPE = "contentType";
    private static final String CREATETIME = "createTime";
    private static final String HASSUFFIX = "hassuffix";

    /**
     * 添加文件集合中的图片类型。
     *
     * @param filetype
     * @param type
     * @return
     */
    public static String fileTypeScreening(String filetype, String type) {
        if (filetype.indexOf(type) != -1)
            return filetype;
        else
            return filetype + type + ",";
    }


    /**
     * 获取文件的后缀名
     *
     * @param fileName
     * @return
     */
    public static String getFilePrefix(String fileName) {

        return fileName.substring(fileName.lastIndexOf("."));
    }


    /***
     * 将上传的文件进行重命名
     * @param name
     * @return
     */
    private static String rname(String name) {
        Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")
                .format(new Date()));
        Long random = (long) (Math.random() * now);
        String fileName = now + "" + random;

        if (name.indexOf(".") != -1) {
            fileName += name.substring(0, name.lastIndexOf(".")) + name.substring(name.lastIndexOf("."));
        }
        return fileName;

    }


    public static String uploadFile(File file, String fileName, String upLoadPath) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        Date date = new Date();
        File newFile = new File(upLoadPath + fileName);//新文件的目录
        copy(file, newFile);

        ImageTool imageTool = new ImageTool();
//		imageTool.compressPic(SystemConfig.getProjectPath() + "\\"
//				+ SystemConfig.getLinePath() + "\\", SystemConfig
//				.getProjectPath()
//				+ "\\" + SystemConfig.getLinePath() + "\\", fileName, "1_"
//				+ fileName, 200, 200, true);
        log.info("上传文件的路径：" + upLoadPath + fileName);

        return upLoadPath + fileName;
    }


    private static void copy(File src, File dst) {
        try {
            InputStream in = null;
            OutputStream out = null;
            try {
                in = new BufferedInputStream(new FileInputStream(src),
                        BUFFER_SIZE);
                // in = new BufferedInputStream( new FileInputStream(src),
                // BUFFER_SIZE);
                out = new BufferedOutputStream(new FileOutputStream(dst),
                        BUFFER_SIZE);
                // out = new BufferedOutputStream(new FileOutputStream(dst),
                // BUFFER_SIZE);
                byte[] buffer = new byte[BUFFER_SIZE];
                while (in.read(buffer) > 0) {
                    out.write(buffer);
                }
            } finally {
                if (null != in) {
                    in.close();
                }
                if (null != out) {
                    out.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 上传文件
     *
     * @param request
     * @param params
     * @param values
     * @return
     * @throws Exception
     */
    public static List<Map<String, Object>> upload(HttpServletRequest request,
                                                   String[] params, Map<String, Object[]> values, String UPLOADDIR, String[] filetype) throws Exception {

        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = mRequest.getFileMap();

        String uploadDir = request.getSession().getServletContext().getRealPath("/") + UPLOADDIR;
        File file = new File(uploadDir);
        if (!file.exists()) {
            file.mkdirs();
        }

        String fileName = null;
        boolean has = false;
        int i = 0;
        System.out.println("路径" + file.getPath());
        for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()
                .iterator(); it.hasNext(); i++) {

            Map.Entry<String, MultipartFile> entry = it.next();
            MultipartFile mFile = entry.getValue();
            fileName = mFile.getOriginalFilename();
            String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
            for (int a = 0; a < filetype.length; a++) {
                if (filetype[a].contains(extension)) {
                    has = true;
                }
            }


            if (has == false) {
                map.put(FileOperateUtil.HASSUFFIX, has);
                result.add(map);
                return result;
            }
            String path = file + "/" + rname(fileName);// 存放位置
            File destFile = new File(path);
            OutputStream outputStream = new FileOutputStream(destFile);
            FileCopyUtils.copy(mFile.getInputStream(), outputStream);

            // 固定参数值对
            map.put(FileOperateUtil.REALNAME, fileName);
            map.put(FileOperateUtil.PATH, path);
            //.put(FileOperateUtil.STORENAME, zipName(storeName));
            // map.put(FileOperateUtil.SIZE, new File(zipName).length());
            // map.put(FileOperateUtil.SUFFIX, "zip");
            map.put(FileOperateUtil.CONTENTTYPE, "application/octet-stream");
            map.put(FileOperateUtil.CREATETIME, new Date());
            map.put(FileOperateUtil.HASSUFFIX, has);
            result.add(map);
        }
        return result;
    }

    /***
     * 下载文件
     * @param request
     * @param response
     * @param storeName
     * @param contentType
     * @param realName
     * @throws Exception
     */
    public static void download(HttpServletRequest request,
                                HttpServletResponse response, String storeName, String contentType, String UPLOADDIR) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        String ctxPath = request.getSession().getServletContext().getRealPath("/") + UPLOADDIR;
        String downLoadPath = ctxPath + storeName;
        long fileLength = new File(downLoadPath).length();
        response.setContentType(contentType);
        response.setHeader("Content-disposition", "attachment; filename=" + new String(storeName.getBytes("utf-8"), "ISO8859-1"));
        response.setHeader("Content-Length", String.valueOf(fileLength));
        bis = new BufferedInputStream(new FileInputStream(downLoadPath));
        bos = new BufferedOutputStream(response.getOutputStream());
        byte[] buff = new byte[2048];
        int bytesRead;
        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
            bos.write(buff, 0, bytesRead);
        }
        bis.close();
        bos.close();
    }


}
