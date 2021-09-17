Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02FAB40F113
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 06:24:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244526AbhIQEZq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 00:25:46 -0400
Received: from mx22.baidu.com ([220.181.50.185]:54524 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244497AbhIQEZq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Sep 2021 00:25:46 -0400
Received: from BC-Mail-Ex28.internal.baidu.com (unknown [172.31.51.22])
        by Forcepoint Email with ESMTPS id 3CADBB485E86C57D5AE5;
        Fri, 17 Sep 2021 12:24:23 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex28.internal.baidu.com (172.31.51.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 17 Sep 2021 12:24:22 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 12:24:22 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     <linux-fbdev@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] fbdev: omapfb: lcd_ams_delta: Make use of the helper function dev_err_probe()
Date:   Fri, 17 Sep 2021 12:24:11 +0800
Message-ID: <20210917042414.17787-2-caihuoqing@baidu.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917042414.17787-1-caihuoqing@baidu.com>
References: <20210917042414.17787-1-caihuoqing@baidu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.31.63.8]
X-ClientProxiedBy: BC-Mail-Ex15.internal.baidu.com (172.31.51.55) To
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When possible use dev_err_probe help to properly deal with the
PROBE_DEFER error, the benefit is that DEFER issue will be logged
in the devices_deferred debugfs file.
Using dev_err_probe() can reduce code size, and the error value
gets printed.

Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
---
 drivers/video/fbdev/omap/lcd_ams_delta.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/omap/lcd_ams_delta.c b/drivers/video/fbdev/omap/lcd_ams_delta.c
index 8e54aae544a0..bbf871f9d862 100644
--- a/drivers/video/fbdev/omap/lcd_ams_delta.c
+++ b/drivers/video/fbdev/omap/lcd_ams_delta.c
@@ -131,18 +131,14 @@ static int ams_delta_panel_probe(struct platform_device *pdev)
 	int ret;
 
 	gpiod_vblen = devm_gpiod_get(&pdev->dev, "vblen", GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod_vblen)) {
-		ret = PTR_ERR(gpiod_vblen);
-		dev_err(&pdev->dev, "VBLEN GPIO request failed (%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(gpiod_vblen))
+		return dev_err_probe(&pdev->dev, PTR_ERR(gpiod_vblen),
+				     "VBLEN GPIO request failed\n");
 
 	gpiod_ndisp = devm_gpiod_get(&pdev->dev, "ndisp", GPIOD_OUT_LOW);
-	if (IS_ERR(gpiod_ndisp)) {
-		ret = PTR_ERR(gpiod_ndisp);
-		dev_err(&pdev->dev, "NDISP GPIO request failed (%d)\n", ret);
-		return ret;
-	}
+	if (IS_ERR(gpiod_ndisp))
+		return dev_err_probe(&pdev->dev, PTR_ERR(gpiod_ndisp),
+				     "NDISP GPIO request failed\n");
 
 #ifdef CONFIG_LCD_CLASS_DEVICE
 	lcd_device = lcd_device_register("omapfb", &pdev->dev, NULL,
-- 
2.25.1

