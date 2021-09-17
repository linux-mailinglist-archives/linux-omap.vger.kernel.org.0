Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65AE640F168
	for <lists+linux-omap@lfdr.de>; Fri, 17 Sep 2021 06:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244720AbhIQElr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Sep 2021 00:41:47 -0400
Received: from mx24.baidu.com ([111.206.215.185]:38236 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244719AbhIQElZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Sep 2021 00:41:25 -0400
Received: from BC-Mail-Ex27.internal.baidu.com (unknown [172.31.51.21])
        by Forcepoint Email with ESMTPS id 3F31A86BEF9686DE023E;
        Fri, 17 Sep 2021 12:24:25 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex27.internal.baidu.com (172.31.51.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 17 Sep 2021 12:24:24 +0800
Received: from LAPTOP-UKSR4ENP.internal.baidu.com (172.31.63.8) by
 BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.14; Fri, 17 Sep 2021 12:24:24 +0800
From:   Cai Huoqing <caihuoqing@baidu.com>
To:     <caihuoqing@baidu.com>
CC:     <linux-fbdev@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/4] fbdev: omapfb: panel-sharp-ls037v7dw01: Make use of the helper function dev_err_probe()
Date:   Fri, 17 Sep 2021 12:24:12 +0800
Message-ID: <20210917042414.17787-3-caihuoqing@baidu.com>
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
 .../fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c  | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
index 602324c5c9f9..f1072c319de8 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
@@ -211,10 +211,9 @@ static int sharp_ls_probe_of(struct platform_device *pdev)
 	int r;
 
 	ddata->vcc = devm_regulator_get(&pdev->dev, "envdd");
-	if (IS_ERR(ddata->vcc)) {
-		dev_err(&pdev->dev, "failed to get regulator\n");
-		return PTR_ERR(ddata->vcc);
-	}
+	if (IS_ERR(ddata->vcc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(ddata->vcc),
+				     "failed to get regulator\n");
 
 	/* lcd INI */
 	r = sharp_ls_get_gpio_of(&pdev->dev, 0, 0, "enable", &ddata->ini_gpio);
-- 
2.25.1

