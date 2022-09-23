Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4C85E7BED
	for <lists+linux-omap@lfdr.de>; Fri, 23 Sep 2022 15:35:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231346AbiIWNfS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Sep 2022 09:35:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiIWNfQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Sep 2022 09:35:16 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45E4C8E994;
        Fri, 23 Sep 2022 06:35:15 -0700 (PDT)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYtMk66cYzWh5P;
        Fri, 23 Sep 2022 21:31:14 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 23 Sep 2022 21:35:13 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 23 Sep
 2022 21:35:13 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <eller@gmx.de>
CC:     <linux-omap@vger.kernel.org>, <linux-fbdev@vger.kernel.org>
Subject: [PATCH -next] omapfb: dss: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Fri, 23 Sep 2022 21:38:44 +0800
Message-ID: <20220923133844.69659-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Using the newest pm_runtime_resume_and_get is more appropriate
for simplifing code here.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c   | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/dss.c   | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c | 6 ++----
 drivers/video/fbdev/omap2/omapfb/dss/venc.c  | 6 ++----
 6 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
index b2d6e6df2161..92fb6b7e1f68 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
@@ -519,11 +519,9 @@ int dispc_runtime_get(void)
 
 	DSSDBG("dispc_runtime_get\n");
 
-	r = pm_runtime_get_sync(&dispc.pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_sync(&dispc.pdev->dev);
+	r = pm_runtime_resume_and_get(&dispc.pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 EXPORT_SYMBOL(dispc_runtime_get);
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
index d43b081d592f..54b0f034c2ed 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
@@ -1136,11 +1136,9 @@ static int dsi_runtime_get(struct platform_device *dsidev)
 
 	DSSDBG("dsi_runtime_get\n");
 
-	r = pm_runtime_get_sync(&dsi->pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_sync(&dsi->pdev->dev);
+	r = pm_runtime_resume_and_get(&dsi->pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
index 45b9d3cf3860..335e0af4eec1 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
@@ -767,11 +767,9 @@ int dss_runtime_get(void)
 
 	DSSDBG("dss_runtime_get\n");
 
-	r = pm_runtime_get_sync(&dss.pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_sync(&dss.pdev->dev);
+	r = pm_runtime_resume_and_get(&dss.pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
index 800bd108e834..0f39612e002e 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
@@ -38,11 +38,9 @@ static int hdmi_runtime_get(void)
 
 	DSSDBG("hdmi_runtime_get\n");
 
-	r = pm_runtime_get_sync(&hdmi.pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_sync(&hdmi.pdev->dev);
+	r = pm_runtime_resume_and_get(&hdmi.pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 
 	return 0;
 }
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
index 2c03608addcd..bfccc2cb917a 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
@@ -42,11 +42,9 @@ static int hdmi_runtime_get(void)
 
 	DSSDBG("hdmi_runtime_get\n");
 
-	r = pm_runtime_get_sync(&hdmi.pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_sync(&hdmi.pdev->dev);
+	r = pm_runtime_resume_and_get(&hdmi.pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 
 	return 0;
 }
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
index 905d642ff9ed..78a7309d25dd 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
@@ -347,11 +347,9 @@ static int venc_runtime_get(void)
 
 	DSSDBG("venc_runtime_get\n");
 
-	r = pm_runtime_get_sync(&venc.pdev->dev);
-	if (WARN_ON(r < 0)) {
-		pm_runtime_put_sync(&venc.pdev->dev);
+	r = pm_runtime_resume_and_get(&venc.pdev->dev);
+	if (WARN_ON(r < 0))
 		return r;
-	}
 	return 0;
 }
 
-- 
2.25.1

