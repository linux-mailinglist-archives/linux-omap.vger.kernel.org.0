Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD9C341726
	for <lists+linux-omap@lfdr.de>; Tue, 11 Jun 2019 23:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436633AbfFKVtL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 11 Jun 2019 17:49:11 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37286 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407169AbfFKVtK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 11 Jun 2019 17:49:10 -0400
Received: by mail-lf1-f66.google.com with SMTP id d11so2620324lfb.4
        for <linux-omap@vger.kernel.org>; Tue, 11 Jun 2019 14:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=i6GhLaflHxtAwL6Ad6Dr/C5ELNhP+vqOwXCPihJeLM8=;
        b=mF/ELEtx8NPOPG3GZNMj3xXssQs8CPSw6r9xXfmVWR6vI50hpVCFF8E++nxCQxBQty
         w1mqcgctM/qAYXwueTcmLS9XTrg9obZ0X9Z327VRyQK40aEuuqUysUhpRYW8PawxNHNy
         fzt9hcqJPCgMwkqup/JcNPCQt5Kq9clL6C7j6HhdRs+oH8OV2VgTQBC5eTjbGd/WN/tq
         vjw2gTYLwvqmwZDH6qYhRzUcNvSHLV7aRINd+jsgUmp2DSI0V6XgOwjNKJ+rdsrTc/jQ
         kLHDaBT3/z1E41YMfT7XPfdK57pKtlKK/9UsVkmWZgW0DRN9UIY4dQf5zKQv93moT2ZT
         vAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=i6GhLaflHxtAwL6Ad6Dr/C5ELNhP+vqOwXCPihJeLM8=;
        b=cM43zCnTkkE1knOzD9ieyukVURF4oWhiip+o6bQ2147XYwGQl4OT5cq3684liTdl3I
         xShM1Zs4/sQ49WkXhTjJrrMCVoqi5EeJzvwRUDcqJjsG9T0rzAQyvwOTegWZf37d3ztQ
         WMunqcvn+qBF9afWPYzBMeFOTGVTviJGXiREwPUn+TgquT6q/beVFmgG+9VTMRF52j5U
         1Tsn1VtqWVBF5maWnuen2V00+TKtdARGKScO+ifhVQMwj+TS1PDDS6j1y90jg0bVxpVo
         1RJWwVwI611853v5y567iDldZrwyGS+u9UIOpg10hppE6EJxjIqWxKyji/BgKlqcgdxI
         LudQ==
X-Gm-Message-State: APjAAAWm6UGnTjFMf3AL5sbhBX58N1favZrWDV08SmsHqLQKRAP5ERbR
        VTuQip6SXdFuu1HmKKTuJdGEIw==
X-Google-Smtp-Source: APXvYqw+qg4jwlO0JzvRQuQMV9ByejZJE+uZatTs0aps96wZ6LLBeiY1URuP4dn41RtClXDZDIa/dw==
X-Received: by 2002:ac2:514b:: with SMTP id q11mr5226108lfd.33.1560289748726;
        Tue, 11 Jun 2019 14:49:08 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id e26sm2787342ljl.33.2019.06.11.14.49.07
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 14:49:08 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, davem@davemloft.net
Cc:     linux-omap@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH net-next] net: ethernet: ti: cpsw: use cpsw as drv data
Date:   Wed, 12 Jun 2019 00:49:03 +0300
Message-Id: <20190611214903.32146-1-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

No need to set ndev for drvdata when mainly cpsw reference is needed,
so correct this legacy decision.

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---

Based on net-next/master

 drivers/net/ethernet/ti/cpsw.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 6d3f1f3f90cb..3430503e1053 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -2265,8 +2265,7 @@ static int cpsw_probe_dt(struct cpsw_platform_data *data,
 
 static void cpsw_remove_dt(struct platform_device *pdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct cpsw_common *cpsw = ndev_to_cpsw(ndev);
+	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
 	struct cpsw_platform_data *data = &cpsw->data;
 	struct device_node *node = pdev->dev.of_node;
 	struct device_node *slave_node;
@@ -2477,7 +2476,7 @@ static int cpsw_probe(struct platform_device *pdev)
 		goto clean_cpts;
 	}
 
-	platform_set_drvdata(pdev, ndev);
+	platform_set_drvdata(pdev, cpsw);
 	priv = netdev_priv(ndev);
 	priv->cpsw = cpsw;
 	priv->ndev = ndev;
@@ -2570,9 +2569,8 @@ static int cpsw_probe(struct platform_device *pdev)
 
 static int cpsw_remove(struct platform_device *pdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct cpsw_common *cpsw = ndev_to_cpsw(ndev);
-	int ret;
+	struct cpsw_common *cpsw = platform_get_drvdata(pdev);
+	int i, ret;
 
 	ret = pm_runtime_get_sync(&pdev->dev);
 	if (ret < 0) {
@@ -2580,9 +2578,9 @@ static int cpsw_remove(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (cpsw->data.dual_emac)
-		unregister_netdev(cpsw->slaves[1].ndev);
-	unregister_netdev(ndev);
+	for (i = 0; i < cpsw->data.slaves; i++)
+		if (cpsw->slaves[i].ndev)
+			unregister_netdev(cpsw->slaves[i].ndev);
 
 	cpts_release(cpsw->cpts);
 	cpdma_ctlr_destroy(cpsw->dma);
-- 
2.17.1

