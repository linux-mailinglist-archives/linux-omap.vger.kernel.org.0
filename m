Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B77E5B9245
	for <lists+linux-omap@lfdr.de>; Thu, 15 Sep 2022 03:43:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbiIOBnm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 21:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbiIOBnj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 21:43:39 -0400
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0282C8D3EE
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 18:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=26gGZ
        Tw4OQNkXxJ3ttJM4G7oxdRW1/QI2logWeIh9Kg=; b=I9KcWGGB4aQup4YrXdBHs
        xqBowB94+Rnm+RhXWZqD72qUQWyBeQYmcXTF1grdd8MBBp1R2ZWFFMcv1gembVZQ
        ekHfklCoUWow0iIBpF7T4JKVbG7+K92T8LO3F8EUeeVDMcR0SA65Geb/4HQuwM1i
        Vn9n3DDJJI/l+ko2Rnzg7M=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp10 (Coremail) with SMTP id NuRpCgD3+jolgyJj993WBg--.27316S2;
        Thu, 15 Sep 2022 09:43:03 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     windhl@126.com, chenmengda2009@163.com
Subject: [PATCH] ARM: OMAP2+: Hold reference returned from of_find_xxx API
Date:   Thu, 15 Sep 2022 09:42:58 +0800
Message-Id: <20220915014258.3999504-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NuRpCgD3+jolgyJj993WBg--.27316S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrurykJFy5tF4xAw1rCFyrCrg_yoWkZwc_A3
        Z2gws3Xr1FyF40gw1DCr45ursYkws5Cr47Wa4IqrW5Ka1aqw43XFsFvr9rJrW5ua17GrW3
        AFn7ur4rA34DGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRWWl97UUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gd9F1uwMvZ1YAAAsN
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In omap4_twl_init(), we should hold the reference returned from
of_find_compatible_node() which has increased the refcount and
then call of_node_put() with it when done.

Fixes: ccd369455a23 ("ARM: OMAP2+: Remove bogus warnings for machines without twl PMIC")
Signed-off-by: Liang He <windhl@126.com>
Signed-off-by: Mengda Chen <chenmengda2009@163.com>
---
 arch/arm/mach-omap2/omap_twl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_twl.c b/arch/arm/mach-omap2/omap_twl.c
index d4dab041324d..07b5f17066ce 100644
--- a/arch/arm/mach-omap2/omap_twl.c
+++ b/arch/arm/mach-omap2/omap_twl.c
@@ -213,11 +213,13 @@ static struct omap_voltdm_pmic omap4_core_pmic = {
 int __init omap4_twl_init(void)
 {
 	struct voltagedomain *voltdm;
+	struct device_node *np;
 
 	if (!cpu_is_omap44xx() ||
-	    of_find_compatible_node(NULL, NULL, "motorola,cpcap"))
+	    (np = of_find_compatible_node(NULL, NULL, "motorola,cpcap"))) {
+		of_node_put(np);
 		return -ENODEV;
-
+	}
 	voltdm = voltdm_lookup("mpu");
 	omap_voltage_register_pmic(voltdm, &omap4_mpu_pmic);
 
-- 
2.25.1

