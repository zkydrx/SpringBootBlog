package com.wip.api;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.exception.CosClientException;
import com.qcloud.cos.exception.CosServiceException;
import com.qcloud.cos.model.Bucket;
import com.qcloud.cos.model.CannedAccessControlList;
import com.qcloud.cos.model.CreateBucketRequest;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.model.PutObjectResult;
import com.qcloud.cos.region.Region;
import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * Author: zky
 * Date: 2019-08-02
 * Time: 16:38:16
 * Description:
 * 腾讯云服务
 * @author Administrator
 */
public class TencentCloudService
{
    Logger logger = LoggerFactory.getLogger(TencentCloudService.class);
    // 1 初始化用户身份信息（secretId, secretKey）。
    public static String secretId = "AKID0rX2RfbVzIj0dGlq7vYzstBJ5tWyMp9W";
    public static String secretKey = "PlhTzWv9ygkMrBLViglrEV1UhjaFmDXR";
    // 2 设置 bucket 的区域, COS 地域的简称请参照 https://cloud.tencent.com/document/product/436/6224
    // clientConfig 中包含了设置 region, https(默认 http), 超时, 代理等 set 方法, 使用可参见源码或者常见问题 Java SDK 部分。

    // 3 生成 cos 客户端。
    String bucket = "zky-1254028183"; //存储桶名称，格式：BucketName-APPID


    /**
     * 创建存储桶
     *
     * @return
     */
    public Bucket getCreateBucketRequest()
    {
        COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
        Region region = new Region("ap-shanghai");
        ClientConfig clientConfig = new ClientConfig(region);
        COSClient cosClient = new COSClient(cred, clientConfig);

        CreateBucketRequest createBucketRequest = new CreateBucketRequest(bucket);
        // 设置 bucket 的权限为 PublicRead(公有读私有写), 其他可选有私有读写, 公有读写
        createBucketRequest.withCannedAcl(CannedAccessControlList.PublicRead);
        try
        {
            Bucket bucketResult = cosClient.createBucket(createBucketRequest);
            return bucketResult;
        }
        catch (CosServiceException serverException)
        {
            serverException.printStackTrace();
        }
        catch (CosClientException clientException)
        {
            clientException.printStackTrace();
        }
        return null;
    }

    /**
     * 查询用户的存储桶列表
     *
     * @return
     */
    public static List<Bucket> getBuckets()
    {
        try
        {
            COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
            Region region = new Region("ap-shanghai");
            ClientConfig clientConfig = new ClientConfig(region);
            COSClient cosClient = new COSClient(cred, clientConfig);

            List<Bucket> buckets = cosClient.listBuckets();
            return buckets;
        }
        catch (CosServiceException serverException)
        {
            serverException.printStackTrace();
        }
        catch (CosClientException clientException)
        {
            clientException.printStackTrace();
        }
        return null;
    }

    /**
     * 上传对象
     *
     * @return
     */
    public static void uploadFiles(File file, String fileName)
    {
        try
        {
            COSCredentials cred = new BasicCOSCredentials(secretId, secretKey);
            Region region = new Region("ap-shanghai");
            ClientConfig clientConfig = new ClientConfig(region);
            COSClient cosClient = new COSClient(cred, clientConfig);
            // 指定要上传的文件
            File localFile = file;
            // 指定要上传到的存储桶
            String bucketName = "zky-1254028183";
            // 指定要上传到 COS 上对象键
            String key = "exampleobject"+ RandomStringUtils.random(6) +".pdf";
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, localFile);
            PutObjectResult putObjectResult = cosClient.putObject(putObjectRequest);
        }
        catch (CosServiceException serverException)
        {
            serverException.printStackTrace();
        }
        catch (CosClientException clientException)
        {
            clientException.printStackTrace();
        }
    }
}
