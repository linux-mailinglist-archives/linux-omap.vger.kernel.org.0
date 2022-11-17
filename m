Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54FBA62D32F
	for <lists+linux-omap@lfdr.de>; Thu, 17 Nov 2022 07:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbiKQGGL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 17 Nov 2022 01:06:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234664AbiKQGGK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 17 Nov 2022 01:06:10 -0500
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B61A02A706;
        Wed, 16 Nov 2022 22:06:08 -0800 (PST)
Received: from mxde.zte.com.cn (unknown [10.35.20.121])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxct.zte.com.cn (FangMail) with ESMTPS id 4NCTtl0C0Vz1Drr;
        Thu, 17 Nov 2022 14:06:07 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxde.zte.com.cn (FangMail) with ESMTPS id 4NCTtg39NFzBf6Kq;
        Thu, 17 Nov 2022 14:06:03 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxus.zte.com.cn (FangMail) with ESMTPS id 4NCTtb556Rzdmc15;
        Thu, 17 Nov 2022 14:05:59 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4NCTtX54thz8R040;
        Thu, 17 Nov 2022 14:05:56 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxct.zte.com.cn (FangMail) with ESMTPS id 4NCTtS3SDKz4y0vK;
        Thu, 17 Nov 2022 14:05:52 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl2.zte.com.cn with SMTP id 2AH65mHN083361;
        Thu, 17 Nov 2022 14:05:48 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp01[null])
        by mapi (Zmail) with MAPI id mid31;
        Thu, 17 Nov 2022 14:05:50 +0800 (CST)
Date:   Thu, 17 Nov 2022 14:05:50 +0800 (CST)
X-Zmail-TransId: 2af96375cf3e43e4b876
X-Mailer: Zmail v1.0
Message-ID: <202211171405502792797@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <stern@rowland.harvard.edu>
Cc:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSB1c2I6IGVoY2ktb21hcDogdXNlIGRldm1fcGxhdGZvcm1fZ2V0X2FuZF9pb3JlbWFwX3Jlc291cmNlKCk=?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AH65mHN083361
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 6375CF4D.000 by FangMail milter!
X-FangMail-Envelope: 1668665167/4NCTtl0C0Vz1Drr/6375CF4D.000/10.35.20.121/[10.35.20.121]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6375CF4D.000/4NCTtl0C0Vz1Drr
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,UNPARSEABLE_RELAY autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Minghao Chi <chi.minghao@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/usb/host/ehci-omap.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/ehci-omap.c b/drivers/usb/host/ehci-omap.c
index 7dd984722a7f..962e3e6ab4d8 100644
--- a/drivers/usb/host/ehci-omap.c
+++ b/drivers/usb/host/ehci-omap.c
@@ -113,8 +113,7 @@ static int ehci_hcd_omap_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;

-	res =  platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	regs = devm_ioremap_resource(dev, res);
+	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);

-- 
2.25.1
