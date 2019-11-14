Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7959EFC3CC
	for <lists+linux-omap@lfdr.de>; Thu, 14 Nov 2019 11:16:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbfKNKQK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Nov 2019 05:16:10 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49696 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725977AbfKNKQK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 14 Nov 2019 05:16:10 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAEAG5gx072653;
        Thu, 14 Nov 2019 04:16:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1573726565;
        bh=LspHk1aChH4ufLzmXgiqvdBWcKeyK8U16diJVB/oWIU=;
        h=From:To:CC:Subject:Date;
        b=Kob0uFVDJBQR/hu1uILa+de9/e9alHQc+MMf97iLVFHDk7W2GXFV0rH4LC3pDw5J/
         0GgMpSODh891evB2MKYyFi3RRZeQ4MXsjb9B6XKvts6mQyOtvNNs0MCBWbfqScjYND
         EynsIQnQWeZNNVc9PLYkgAXVcVEbraUMCkj/7CzI=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAEAG5Z0005854
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 14 Nov 2019 04:16:05 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 14
 Nov 2019 04:16:04 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 14 Nov 2019 04:16:04 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAEAG2C8022278;
        Thu, 14 Nov 2019 04:16:02 -0600
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <t-kristo@ti.com>, <mturquette@baylibre.com>
CC:     <sboyd@kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tony@atomide.com>
Subject: [PATCH] clk: ti: dra7-atl: Remove pm_runtime_irq_safe()
Date:   Thu, 14 Nov 2019 12:17:18 +0200
Message-ID: <20191114101718.20619-1-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is not needed for anything, and prevents proper PM transitions for
parent devices which is bad in case of ti-sysc; this effectively kills
PM completely. Thus, remove the flag.

Suggested-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/clk/ti/clk-dra7-atl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/ti/clk-dra7-atl.c b/drivers/clk/ti/clk-dra7-atl.c
index f65e16c4f3c4..8d4c08b034bd 100644
--- a/drivers/clk/ti/clk-dra7-atl.c
+++ b/drivers/clk/ti/clk-dra7-atl.c
@@ -233,7 +233,6 @@ static int of_dra7_atl_clk_probe(struct platform_device *pdev)
 	cinfo->iobase = of_iomap(node, 0);
 	cinfo->dev = &pdev->dev;
 	pm_runtime_enable(cinfo->dev);
-	pm_runtime_irq_safe(cinfo->dev);
 
 	pm_runtime_get_sync(cinfo->dev);
 	atl_write(cinfo, DRA7_ATL_PCLKMUX_REG(0), DRA7_ATL_PCLKMUX);
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

