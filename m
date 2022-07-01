Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D09705632E8
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 13:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235799AbiGALv2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 07:51:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235719AbiGALv1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 07:51:27 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2E6118239F
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 04:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=yBZrT
        uif9OaVzCq/OEPy8MkBjfaFCYAioQ3FuqDq1ZI=; b=RUo3M1LOlOlBtB9YZ1nY7
        13/KoLpBtaDDZSusoyYMn3N1xetYqMsBrJ4imQmDWo/qH+yLcRauseOYtM4ok0W/
        fUGhEfCGB2jot0QeDcBO6KipcCMY/HDh8L0Qmgeo1toJo7NkVChy3pZFI9ww+Aa9
        D6FtKeNpL0Ob3heBG0CGPM=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowABXSNCs375iLQITEQ--.51969S2;
        Fri, 01 Jul 2022 19:51:09 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, windhl@126.com
Subject: [PATCH] arm: omap2: cm_common: Fix refcount balance bugs
Date:   Fri,  1 Jul 2022 19:50:45 +0800
Message-Id: <20220701115045.233729-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowABXSNCs375iLQITEQ--.51969S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruw15Ar13GF47XF4DJr1kZrb_yoWfXFX_Zw
        n7Ka4kJF1xKw1Sgw4DJa1rWwsFqaykGrn7Ww1kX3WYga90qF429rZ0ya92v347WrW2krW7
        GrZrZryYkw1aqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUBWlJUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgkxF1-HZaxRxAABsw
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In omap2_cm_base_init(), for_each_matching_node_and_match() will
keep refcount balance. However, there is a reference escape into
data->np, so we should use the of_node_put() for the old reference
and of_node_get() for the new reference.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/arm/mach-omap2/cm_common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/cm_common.c b/arch/arm/mach-omap2/cm_common.c
index 87f2c2d2d754..9d5d92d00484 100644
--- a/arch/arm/mach-omap2/cm_common.c
+++ b/arch/arm/mach-omap2/cm_common.c
@@ -339,7 +339,8 @@ int __init omap2_cm_base_init(void)
 			mem->offset = data->offset;
 		}
 
-		data->np = np;
+		of_node_put(data->np);
+		data->np = of_node_get(np);
 
 		if (data->init && (data->flags & CM_SINGLE_INSTANCE ||
 				   (cm_base.va && cm2_base.va)))
-- 
2.25.1

