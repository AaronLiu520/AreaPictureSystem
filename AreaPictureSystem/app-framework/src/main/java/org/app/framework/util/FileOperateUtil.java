package org.app.framework.util;
//package org.cored.framework.util;
//
//import java.io.BufferedInputStream;
//import java.io.BufferedOutputStream;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.FileOutputStream;
//import java.io.OutputStream;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.List;
//import java.util.Map;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.springframework.util.FileCopyUtils;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//@SuppressWarnings("unused")
//public class FileOperateUtil {
//
//	private static final String REALNAME = "realname";
//	private static final String PATH = "path";
//	private static final String SIZE = "size";
//	
//	private static final String SUFFIX = "suffix";
//	private static final String CONTENTTYPE = "contentType";
//	private static final String CREATETIME = "createTime";
//	private static final String HASSUFFIX = "hassuffix";
//	private static final String SAVEPATH="savepath";
//	private static final String NOIMG="noimg";
//
//
//	/***
//	 * 将上传的文件进行重命名
//	 * @param name
//	 * @return
//	 */
//	private static String rname(String name) {
//		Long now = Long.parseLong(new SimpleDateFormat("yyyyMMddHHmmss")
//				.format(new Date()));
//		Long random = (long) (Math.random() * now);
//		String fileName = now + "" + random;
//
//		if (name.indexOf(".") != -1) {
//			fileName += name.substring(0,name.lastIndexOf("."))+name.substring(name.lastIndexOf("."));
//		}
//		return fileName;
//
//	}
//	
//	
//	
//	/**
//	 * old 上传文件
//	 * @param request
//	 * @param params
//	 * @param values
//	 * @return
//	 * @throws Exception
//	 */
//	 public static List<Map<String, Object>> upload(HttpServletRequest request,  
//	            String[] params, Map<String, Object[]> values,String UPLOADDIR,String[] filetype) throws Exception {  
//	  
//	        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();  
//            Map<String, Object> map = new HashMap<String, Object>();  
//	        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;  
//	        Map<String, MultipartFile> fileMap = mRequest.getFileMap();  
//	  
//	        String uploadDir = request.getSession().getServletContext().getRealPath("/")+ UPLOADDIR; 
//	        File file = new File(uploadDir);  
//	        if (!file.exists()) {  
//	            file.mkdirs();  
//	        }  
//	  
//	        String fileName = null; 
//	        boolean has=false;
//	        System.out.println("路径"+file.getPath());
//	        for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()  
//	                .iterator(); it.hasNext();) {  
//	  
//	            Map.Entry<String, MultipartFile> entry = it.next();  
//	            MultipartFile mFile = entry.getValue();  
//	            fileName = mFile.getOriginalFilename();  
//	            String extension=fileName.substring(fileName.lastIndexOf(".")+1);
//	           for(int a=0;a<filetype.length;a++){
//	        	   if(filetype[a].contains(extension)){
//	        		   has=true;
//	        	   }
//	           }
//	            
//	            
//	            if(has==false){
//	             map.put(FileOperateUtil.HASSUFFIX, has);  
//	            	 result.add(map);  
//	            	return result;
//	            }	
//	            String path = file+"/"+rname(fileName);// 存放位置
//	            File destFile = new File(path);
//	            OutputStream outputStream=new FileOutputStream(destFile);
//	            FileCopyUtils.copy(mFile.getInputStream(), outputStream);  
//	  
//	            // 固定参数值对  
//	            map.put(FileOperateUtil.REALNAME, fileName);  
//	            map.put(FileOperateUtil.PATH, path);
//	           //.put(FileOperateUtil.STORENAME, zipName(storeName));  
//	           // map.put(FileOperateUtil.SIZE, new File(zipName).length());  
//	           // map.put(FileOperateUtil.SUFFIX, "zip");  
//	            map.put(FileOperateUtil.CONTENTTYPE, "application/octet-stream");  
//	            map.put(FileOperateUtil.CREATETIME, new Date());  
//	            map.put(FileOperateUtil.HASSUFFIX, has);  
//	            result.add(map);  
//	        }  
//	        return result;  
//	    }  
//	 
//	 
//	 
//	 
//	 
//	 /**
//		 * 上传文件  修改后的上传图片 （new） 
//		 * @param request
//		 * @param params
//		 * @param values
//		 * @return
//		 * @throws Exception
//		 */
//		 public static List<Map<String, Object>> upload(HttpServletRequest request,  
//		           String UPLOADDIR,String[] filetype) throws Exception {  
//		  
//		        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();  
//	            Map<String, Object> map = new HashMap<String, Object>();  
//		        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;  
//		        Map<String, MultipartFile> fileMap = mRequest.getFileMap();  
//		        String rname="";
//		        String path="";
//		        File destFile = null;
//		        String uploadDir = request.getSession().getServletContext().getRealPath("/")+ UPLOADDIR; 
//		        File file = new File(uploadDir);  
//		        if (!file.exists()) {  
//		            file.mkdirs();  
//		        }  
//		  
//		        String fileName = null; 
//		        boolean has=false;
//		        for (Iterator<Map.Entry<String, MultipartFile>> it = fileMap.entrySet()  
//		                .iterator(); it.hasNext();) {  
//		  
//		            Map.Entry<String, MultipartFile> entry = it.next();  
//		            MultipartFile mFile = entry.getValue();  
//		            fileName = mFile.getOriginalFilename();  
//		            if(fileName.equals("")||fileName.equals(null)){
//		                map.put(FileOperateUtil.NOIMG, true);  
//			            result.add(map);  
//			        return result;  
//		            }
//		         
//		            String extension=fileName.substring(fileName.lastIndexOf(".")+1);
//		            if(extension==""){
//		            		map.put(FileOperateUtil.NOIMG,true);
//		            }else{
//		            	for(int a=0;a<filetype.length;a++){
//		            		if(filetype[a].contains(extension)){
//		            			has=true;
//		            		}
//		            	}
//		            	  if(has==false){
//		            			  map.put(FileOperateUtil.HASSUFFIX, has);  
//		     	            	 result.add(map);  
//		     	            	return result;
//		     	            }
//		            		   rname=rname(fileName);
//		            		  path = file+"/"+rname;// 存放位置\
//		            		  destFile  = new File(path);
//		            	  }
//		  	         
//		  	            OutputStream outputStream=new FileOutputStream(destFile);
//		  	            FileCopyUtils.copy(mFile.getInputStream(), outputStream); 
//		  	            	map.put(FileOperateUtil.SAVEPATH,rname);
//		  	              map.put(FileOperateUtil.PATH, path);
//			            map.put(FileOperateUtil.REALNAME, fileName);  
//			          
//			            
//			            //判断上传文件是否修改过
//			            	map.put(FileOperateUtil.NOIMG,false);
//		            }
//		            
//		            // 固定参数值对  
//		           //.put(FileOperateUtil.STORENAME, zipName(storeName));  
//		           // map.put(FileOperateUtil.SIZE, new File(zipName).length());  
//		           // map.put(FileOperateUtil.SUFFIX, "zip");  
//		            map.put(FileOperateUtil.CONTENTTYPE, "application/octet-stream");  
//		            map.put(FileOperateUtil.CREATETIME, new Date());  
//		            map.put(FileOperateUtil.HASSUFFIX, has);  
//		            result.add(map);  
//		        return result;  
//		    }  
//	 
//	 
//	 /***
//	  * 下载文件
//	  * @param request
//	  * @param response
//	  * @param storeName
//	  * @param contentType
//	  * @param realName
//	  * @throws Exception
//	  */
//	 public static void download(HttpServletRequest request,  
//	            HttpServletResponse response, String storeName, String contentType,String UPLOADDIR) throws Exception {  
//	        response.setContentType("text/html;charset=UTF-8");  
//	        request.setCharacterEncoding("UTF-8");  
//	        BufferedInputStream bis = null;  
//	        BufferedOutputStream bos = null;  
//	        String ctxPath = request.getSession().getServletContext().getRealPath("/")+UPLOADDIR;  
//	        String downLoadPath = ctxPath + storeName;  
//	        long fileLength = new File(downLoadPath).length();  
//	        response.setContentType(contentType);  
//	        response.setHeader("Content-disposition", "attachment; filename="+ new String(storeName.getBytes("utf-8"), "ISO8859-1"));  
//	        response.setHeader("Content-Length", String.valueOf(fileLength));  
//	        bis = new BufferedInputStream(new FileInputStream(downLoadPath));  
//	        bos = new BufferedOutputStream(response.getOutputStream());  
//	        byte[] buff = new byte[2048];  
//	        int bytesRead;  
//	        while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {  
//	            bos.write(buff, 0, bytesRead);  
//	        }  
//	        bis.close();  
//	        bos.close();  
//	    }   
//	 
//	 
//	 
//	 
//	 
//	 
//	 
//	
//
//}
