Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6506C35DC5
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 15:21:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbfFENVA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Jun 2019 09:21:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33520 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728031AbfFENUS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Jun 2019 09:20:18 -0400
Received: by mail-lf1-f65.google.com with SMTP id y17so19062128lfe.0
        for <linux-omap@vger.kernel.org>; Wed, 05 Jun 2019 06:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CE8Iq8ZjUtNENgYj+FlGTMxcTQ2fFaeeS723D5LJTaU=;
        b=Ie/iVmmmXC6K55Uaa53Di3vSnNQfwFe1FvKFIdOAI2En/YaClJm3K8u2Hw01cBFi/b
         RytUn8xjSlb/3NQuDuoxQom0+Udw7r6FvZd18bSt7iyupgyOrRmKC+OMKowrKmAGRB63
         uBq2urzv3cyOApD2MKU65Q1u0P8ojAkvxcHiVqF/hBHGcihIQS4HMpqgWyZSZqd0nOo5
         8kESN0+fpHn6UddiWD8pg+cXV42hX8sHqS3r43SktDUC27osbBWxOGhPGHrNTC6FexB1
         pTr+tpVaOvaF68MfWcPNdljRzLk3X3EQymwMI5uA6DpySSsr+jKQRPsgpStETVz2sPXM
         w7nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CE8Iq8ZjUtNENgYj+FlGTMxcTQ2fFaeeS723D5LJTaU=;
        b=e1zCuKvxNJApv2FY9mk2ltIUg1zudXEz5P6uK9PISJjnc8uQtQ6LUlOOnEk6dH+ObM
         6etbzn1SoYy5WAdwKEtvRTuQVZIVa91SD6FRXyiRTtzpqI9aeKJV3YYwP2spm3h84UWp
         J1NVTQVvgDRyBO8ZepDqbVo9e6EOvgGEs+4MfEZATbYQaYbV5gckxD8ggMbhrTlYSrCc
         cxfM53hHHaQgsX5GuLnr4YIsaauW7YW3AdRxtMRlCK2DW+VNk8972+nWMuP+d/Bz5WGo
         C0TW4IFFI7jF861l3X+IryUIb3U6M0w57xS+qNVS07oEP8Ylyfp2ClTJMM4eei2hJgdG
         gzvw==
X-Gm-Message-State: APjAAAXSUL+9IfbwH7mMX9ET6Cx6iDX/io3o0fKWDJUr87K1eFDRA98j
        0SlKMv+iU5/6YE+ycLAJZxI43g==
X-Google-Smtp-Source: APXvYqwAg/kj6/eR/82+VKecddOJZ5/OhEi893jm44m9NIXKkIXEJmyM0m/IMzZ9j+Pv/4znmdaVOw==
X-Received: by 2002:a19:7110:: with SMTP id m16mr20414541lfc.4.1559740817213;
        Wed, 05 Jun 2019 06:20:17 -0700 (PDT)
Received: from localhost.localdomain (59-201-94-178.pool.ukrtel.net. [178.94.201.59])
        by smtp.gmail.com with ESMTPSA id t3sm1893259lfk.59.2019.06.05.06.20.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 05 Jun 2019 06:20:16 -0700 (PDT)
From:   Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
To:     grygorii.strashko@ti.com, hawk@kernel.org, davem@davemloft.net
Cc:     ast@kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, xdp-newbies@vger.kernel.org,
        ilias.apalodimas@linaro.org, netdev@vger.kernel.org,
        daniel@iogearbox.net, jakub.kicinski@netronome.com,
        john.fastabend@gmail.com,
        Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Subject: [PATCH v3 net-next 3/7] net: ethernet: ti: cpsw: use cpsw as drv data
Date:   Wed,  5 Jun 2019 16:20:05 +0300
Message-Id: <20190605132009.10734-4-ivan.khoronzhuk@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190605132009.10734-1-ivan.khoronzhuk@linaro.org>
References: <20190605132009.10734-1-ivan.khoronzhuk@linaro.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

No need to set ndev for drvdata when mainly cpsw reference is needed,
so correct this legacy decision.

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
---
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

