Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD6F0590C1E
	for <lists+linux-omap@lfdr.de>; Fri, 12 Aug 2022 08:53:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234033AbiHLGxb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Aug 2022 02:53:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiHLGxa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 Aug 2022 02:53:30 -0400
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3F9D9A5986;
        Thu, 11 Aug 2022 23:53:27 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id 4CCBA1E80D0F;
        Fri, 12 Aug 2022 14:51:15 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id xfrGYnJuGCDS; Fri, 12 Aug 2022 14:51:12 +0800 (CST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        (Authenticated sender: yuzhe@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 3D51E1E80CB7;
        Fri, 12 Aug 2022 14:51:12 +0800 (CST)
From:   Yu Zhe <yuzhe@nfschina.com>
To:     deller@gmx.de
Cc:     linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        liqiong@nfschina.com, kernel-janitors@vger.kernel.org,
        Yu Zhe <yuzhe@nfschina.com>
Subject: [PATCH] fbdev: omap: fix tests for platform_get_irq() failure
Date:   Fri, 12 Aug 2022 14:52:23 +0800
Message-Id: <20220812065223.27471-1-yuzhe@nfschina.com>
X-Mailer: git-send-email 2.11.0
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The platform_get_irq() returns negative error codes.  It can't actually
return zero.

Signed-off-by: Yu Zhe <yuzhe@nfschina.com>
---
 drivers/video/fbdev/omap/omapfb_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
index dfb4ddc45701..fbb3af883d4d 100644
--- a/drivers/video/fbdev/omap/omapfb_main.c
+++ b/drivers/video/fbdev/omap/omapfb_main.c
@@ -1642,14 +1642,14 @@ static int omapfb_do_probe(struct platform_device *pdev,
 		goto cleanup;
 	}
 	fbdev->int_irq = platform_get_irq(pdev, 0);
-	if (!fbdev->int_irq) {
+	if (fbdev->int_irq < 0) {
 		dev_err(&pdev->dev, "unable to get irq\n");
 		r = ENXIO;
 		goto cleanup;
 	}
 
 	fbdev->ext_irq = platform_get_irq(pdev, 1);
-	if (!fbdev->ext_irq) {
+	if (fbdev->ext_irq < 0) {
 		dev_err(&pdev->dev, "unable to get irq\n");
 		r = ENXIO;
 		goto cleanup;
-- 
2.11.0

