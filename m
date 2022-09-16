Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A689E5BA48C
	for <lists+linux-omap@lfdr.de>; Fri, 16 Sep 2022 04:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229820AbiIPCJW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 15 Sep 2022 22:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbiIPCJV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 15 Sep 2022 22:09:21 -0400
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CDC2D50052
        for <linux-omap@vger.kernel.org>; Thu, 15 Sep 2022 19:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=00UQj
        91QcI2u6oqdc4ozbRGnDjj3gxPzMJuGZ/j4xNw=; b=cy3nhJ/h6c7cM0NZMUG5T
        sotjUxh/gWldz+8n9zjk0KdAFBv3l7qTp9IAECHoELr5aV0BL15Y9jSonEQl5dpr
        N/X5oh0IWmQexlgTgp2/Y0xpKDyU5EfZA4m6JTyRaPw33CrA+cYFEQUw9szzRjfN
        XpX32ctruWB7ICC8Qgkz90=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp2 (Coremail) with SMTP id DMmowADn72O22iNjbo2ABg--.5998S2;
        Fri, 16 Sep 2022 10:08:56 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux@armlinux.org.uk, linux-omap@vger.kernel.org
Cc:     windhl@126.com, chenmengda2009@163.com
Subject: [PATCH v2] ARM: OMAP2+: Hold reference returned from of_find_xxx API
Date:   Fri, 16 Sep 2022 10:08:54 +0800
Message-Id: <20220916020854.4089679-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DMmowADn72O22iNjbo2ABg--.5998S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ww13CF1fXr4kGF4rWF17Jrb_yoW8XF4UpF
        9Ik3909ryUWw1xG3yqqr1xuFWjgw4kWr48ArZ8C34fXw4v9ayvv342va4Yvr1rXFWkAFWr
        JF12yFWxWFn0qr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U5WrZUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7Rl+F1pEAuXCeAAAse
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In omap4_twl_init(), we should hold the reference returned from
of_find_compatible_node() which has increased the refcount and
then call of_node_put() with it when done.

Note that we should initialize 'np' with NULL, otherwise there
will be a bug to call of_node_put() with uninitialized 'np'
when cpu_is_omap44xx() is false.

Fixes: ccd369455a23 ("ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC")
Co-developed-by: Mengda Chen <chenmengda2009@163.com>
Signed-off-by: Mengda Chen <chenmengda2009@163.com>
Signed-off-by: Liang He <windhl@126.com>
---

 v2: (1) initialize 'np' with NULL, advised by Russell King 
     (2) we use proper Co-developed-by tag based on kernel doc

 arch/arm/mach-omap2/omap_twl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
index d4dab041324d..d56b33187244 100644
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -213,10 +213,13 @@ static struct omap_voltdm_pmic omap4_core_pmic = {
 int __init omap4_twl_init(void)
 {
 	struct voltagedomain *voltdm;
+	struct device_node *np = NULL;
 
 	if (!cpu_is_omap44xx() ||
-	    of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	    (np = of_find_compatible_node(NULL, NULL, "motorola,cpcap"))) {
+		of_node_put(np);
 		return -ENODEV;
+	}
 
 	voltdm = voltdm_lookup("mpu");
 	omap_voltage_register_pmic(voltdm, &omap4_mpu_pmic);
-- 
2.25.1

