package com.wip.api;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.io.File;

import static org.junit.jupiter.api.Assertions.*;

/**
 * Created with IntelliJ IDEA.
 * Author: zky
 * Date: 2019-08-05
 * Time: 10:31:30
 * Description:
 */
class TencentCloudServiceTest
{

    TencentCloudService tencentCloudService = new TencentCloudService();
    @BeforeEach
    void setUp()
    {
        System.out.println("String...");
    }

    @AfterEach
    void tearDown()
    {
        System.out.println("Ending...");
    }

    @Test
    void getCreateBucketRequest()
    {
    }

    @Test
    void getBuckets()
    {
    }

    @Test
    void uploadFiles()
    {

        File file  = new File("./upload/2019/08/utjifsmm5khgvutjifsmm5khgv.pdf");
        TencentCloudService.uploadFiles(file,"");
    }
}