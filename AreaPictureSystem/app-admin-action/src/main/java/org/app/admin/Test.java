package org.app.admin;

import java.io.BufferedReader;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.InputStreamReader;  
import java.nio.charset.StandardCharsets;  
import java.nio.file.FileVisitResult;  
import java.nio.file.Files;  
import java.nio.file.LinkOption;  
import java.nio.file.OpenOption;  
import java.nio.file.Path;  
import java.nio.file.Paths;  
import java.nio.file.SimpleFileVisitor;  
import java.nio.file.attribute.BasicFileAttributes;  
  
import org.apache.lucene.analysis.Analyzer;  
import org.apache.lucene.analysis.standard.StandardAnalyzer;  
import org.apache.lucene.document.Document;  
import org.apache.lucene.document.Field;  
import org.apache.lucene.document.LongField;  
import org.apache.lucene.document.StringField;  
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;  
import org.apache.lucene.index.IndexWriterConfig;  
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;  
import org.apache.lucene.store.FSDirectory;  

public class Test {
	
    public static void main(String[] args) throws IOException, ParseException {  
        String dirPath = "/Persion/lucene/docPath";  
        String indexPath = "/Persion/lucene/lucenedir";  
        createIndex(dirPath, indexPath);  
    }  
      
    /** 
     * 创建索引 
     * @param dirPath       需要读取的文件所在文件目录 
     * @param indexPath     索引存放目录 
     * @throws IOException 
     * @throws ParseException 
     */  
    public static void createIndex(String dirPath, String indexPath) throws IOException, ParseException {  
        createIndex(dirPath, indexPath, false);  
    }  
      
    /** 
     * 创建索引 
     * @param dirPath         需要读取的文件所在文件目录 
     * @param indexPath       索引存放目录 
     * @param createOrAppend  始终重建索引/不存在则追加索引 
     * @throws IOException 
     * @throws ParseException 
     */  
    public static void createIndex(String dirPath, String indexPath,  
            boolean createOrAppend) throws IOException, ParseException {  
    	//开始时间
        long start = System.currentTimeMillis();  
        
        Directory dir = FSDirectory.open(Paths.get(indexPath, new String[0]));  
        
        Path docDirPath = Paths.get(dirPath, new String[0]);  
        //创新分词器
        Analyzer analyzer = new StandardAnalyzer();  
        IndexWriterConfig indexWriterConfig = new IndexWriterConfig(analyzer);  
  
        if (createOrAppend) {  
            indexWriterConfig.setOpenMode(IndexWriterConfig.OpenMode.CREATE);  
        } else {  
            indexWriterConfig.setOpenMode(IndexWriterConfig.OpenMode.CREATE_OR_APPEND);  
        }  
        
        IndexWriter writer = new IndexWriter(dir, indexWriterConfig);  
        //读取文件。
        indexDocs(writer, docDirPath);  
        writer.close();  
        long end = System.currentTimeMillis();  
        System.out.println("Time consumed:" + (end - start) + " ms");  
        
        //查询
        
        //读取某个索引池。
        DirectoryReader reader = DirectoryReader.open(dir);
        		
        IndexSearcher searcher= new IndexSearcher(reader);
        
        // 默认搜索content域 使用标准分词器  
        QueryParser parser = new QueryParser("content", new StandardAnalyzer());  
        Query query = parser.parse("11.jpg");  
        TopDocs docs = searcher.search(query, 10);  
        System.out.println("一共搜索到结果:" + docs.totalHits + "条");  
        System.out.println("一共搜索到结果:" + docs.totalHits + "条");  
        for (ScoreDoc scoreDoc : docs.scoreDocs)  
        {  
            System.out.print("序号为:" + scoreDoc.doc);  
            System.out.print(" 评分为:" + scoreDoc.score);  
            Document document = searcher.doc(scoreDoc.doc);  
            System.out.print(" 文件名:" + document.get("fileName"));  
            System.out.print(" 内容为:" + document.get("content"));  
            System.out.print(" 文件大小:" + document.get("fileSize"));  
            System.out.print(" 文件日期:" + document.get("fileLastModified"));  
            System.out.println();  
        }  
        
    }  
    
    public void search(String queryStr, int num)  
    {  
//        // 默认搜索content域 使用标准分词器  
//        QueryParser parser = new QueryParser("content", new StandardAnalyzer());  
//        IndexSearcher searcher = getIndexSearcher();  
//        try  
//        {  
//            Query query = parser.parse(queryStr);  
//            TopDocs docs = searcher.search(query, num);  
//            System.out.println("一共搜索到结果:" + docs.totalHits + "条");  
//            for (ScoreDoc scoreDoc : docs.scoreDocs)  
//            {  
//                System.out.print("序号为:" + scoreDoc.doc);  
//                System.out.print(" 评分为:" + scoreDoc.score);  
//                Document document = searcher.doc(scoreDoc.doc);  
//                System.out.print(" 文件名:" + document.get("fileName"));  
//                System.out.print(" 内容为:" + document.get("content"));  
//                System.out.print(" 文件大小:" + document.get("fileSize"));  
//                System.out.print(" 文件日期:" + document.get("fileLastModified"));  
//                System.out.println();  
//            }  
//        } catch (ParseException e)  
//        {  
//            e.printStackTrace();  
//        } catch (IOException e)  
//        {  
//            e.printStackTrace();  
//        }  
    }  
    
    
  
    /** 
     *  
     * @param writer 
     *            索引写入器 
     * @param path 
     *            文件路径 
     * @throws IOException 
     */  
    @SuppressWarnings({ "unchecked", "rawtypes" })
	public static void indexDocs(final IndexWriter writer, Path path)  
            throws IOException {  
        // 如果是目录，查找目录下的文件  
        if (Files.isDirectory(path, new LinkOption[0])) {  
            System.out.println("directory");  
            Files.walkFileTree(path, new SimpleFileVisitor() {  
                @Override  
                public FileVisitResult visitFile(Object file,  
                        BasicFileAttributes attrs) throws IOException {  
                    Path path = (Path)file;  
                    System.out.println(path.getFileName());  
                    indexDoc(writer, path, attrs.lastModifiedTime().toMillis(),path.getFileName().toString());  
                    return FileVisitResult.CONTINUE;  
                }  
            });  
        } else {  
            indexDoc(writer, path,  Files.getLastModifiedTime(path, new LinkOption[0]) .toMillis(),path.getFileName().toString());  
        }  
    }  
  
    /** 
     * 读取文件创建索引 
     *  
     * @param writer 
     *            索引写入器 
     * @param file 
     *            文件路径 
     * @param lastModified 
     *            文件最后一次修改时间 
     * @throws IOException 
     */  
    public static void indexDoc(IndexWriter writer, Path file, long lastModified,String fileName)  
            throws IOException {  
        InputStream stream = Files.newInputStream(file, new OpenOption[0]);  
        Document doc = new Document();  
  
        Field pathField = new StringField("path", file.toString(),  
                Field.Store.YES);  
        doc.add(pathField);  
        
        doc.add( new TextField( "fileName", fileName, Field.Store.YES ) );
  
        doc.add(new LongField("modified", lastModified, Field.Store.NO));  
        doc.add(new TextField("contents", new BufferedReader(  
                new InputStreamReader(stream, StandardCharsets.UTF_8))));  
        
        if (writer.getConfig().getOpenMode() == IndexWriterConfig.OpenMode.CREATE) {  
            System.out.println("adding " + file);  
            writer.addDocument(doc);  
        } else {  
            System.out.println("updating " + file);  
            writer.updateDocument(new Term("path", file.toString()), doc);  
        }  
        writer.commit();  
    }  

}
