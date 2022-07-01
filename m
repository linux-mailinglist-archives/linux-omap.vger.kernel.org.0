Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49B4A563371
	for <lists+linux-omap@lfdr.de>; Fri,  1 Jul 2022 14:23:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233585AbiGAMXV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Jul 2022 08:23:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233243AbiGAMXU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Jul 2022 08:23:20 -0400
Received: from m15111.mail.126.com (m15111.mail.126.com [220.181.15.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE7F413DF8
        for <linux-omap@vger.kernel.org>; Fri,  1 Jul 2022 05:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ORuWz
        JBauMevVL87lDDCuj55A/w146s/fTAVPX+iosY=; b=Iak8V12+E1mMOJgjdq9Ux
        YasiplOOOEeZyosg+c0sZzGCrDXVzQPfvz44XIDIdYZqkWvmPPk7VsHxYaUdmhJe
        wWq2hbxRVq1UkQ8o/oMlH2DPhyn8T/cFi2a8znZBoynkudX6eAQ42D0y/iVG2YpU
        zLRdXRuOXFXuidSyG6iLq0=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp1 (Coremail) with SMTP id C8mowACHVDW0375i9+4aFw--.42420S2;
        Fri, 01 Jul 2022 19:51:16 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, windhl@126.com
Subject: [PATCH] arm: omap2: control: Hold reference returned by of_get_child_by_name()
Date:   Fri,  1 Jul 2022 19:51:16 +0800
Message-Id: <20220701115116.233785-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8mowACHVDW0375i9+4aFw--.42420S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF4kurWUuw45JrWkZFy7ZFb_yoW8Xw1fpr
        ZFk39Iyr1UGrs3WasFyr1kWr97Kr97Ca1Yyw1fCrnrAwsaywsrAry8t3WfC3Z8JFWrZ3Wr
        Zr4rtF1Iqa1DAwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UY0PhUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi3BUxF1pED1yi-gAAs+
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In omap_control_init(), there are two bugs in fact:

(1) we need to call of_node_put() for 'scm_conf' in fail path and when
    it is not used anymore.
(2) we should hold refernece returned by of_get_child_by_name() for
    'clk_np' and then use it to call of_node_put() when it is not used
    anymore.


Signed-off-by: Liang He <windhl@126.com>
---
 arch/arm/mach-omap2/control.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/control.c b/arch/arm/mach-omap2/control.c
index c514a9602269..4c23ccfcee5d 100644
--- a/arch/arm/mach-omap2/control.c
+++ b/arch/arm/mach-omap2/control.c
@@ -793,7 +793,7 @@ int __init omap2_control_base_init(void)
  */
 int __init omap_control_init(void)
 {
-	struct device_node *np, *scm_conf;
+	struct device_node *np, *scm_conf, *clk_np;
 	const struct of_device_id *match;
 	const struct omap_prcm_init_data *data;
 	int ret;
@@ -817,13 +817,17 @@ int __init omap_control_init(void)
 				goto of_node_put;
 			}
 
-			if (of_get_child_by_name(scm_conf, "clocks")) {
+			clk_np = of_get_child_by_name(scm_conf, "clocks");
+			if (clk_np) {
+				of_node_put(clk_np);
 				ret = omap2_clk_provider_init(scm_conf,
 							      data->index,
 							      syscon, NULL);
 				if (ret)
 					goto of_node_put;
 			}
+
+			of_node_put(scm_conf);
 		} else {
 			/* No scm_conf found, direct access */
 			ret = omap2_clk_provider_init(np, data->index, NULL,
@@ -842,6 +846,7 @@ int __init omap_control_init(void)
 	return 0;
 
 of_node_put:
+	of_node_put(scm_conf);
 	of_node_put(np);
 	return ret;
 
-- 
2.25.1

