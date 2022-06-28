Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAE3555C2B6
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239459AbiF1MnP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 08:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346019AbiF1MnI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 08:43:08 -0400
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1CB3FDE0
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 05:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gyIBh
        VRs/HOkqeY/di+EbRPR4i8CMUCw47c0FCrcw5k=; b=ESS+GOBZoEUGMcYyGo+9G
        rxv3vwyd1RH0IITxxAMHlh9mnjEdJElVEpjs7oovwSImPVIxRrKAm+fkL/3nFywE
        sRZDZZ7j+U0MLXp39ZeDlQPqa7jtPfR9lZIfSvH6J2NrctQ7xC8aoGcLbSVBdRLb
        yq+pfShU/RPudRHtLaVG7I=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp7 (Coremail) with SMTP id DsmowAD3OPhP97piaNZsEA--.49239S2;
        Tue, 28 Jun 2022 20:42:57 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux-omap@vger.kernel.org, windhl@126.com
Subject: [PATCH v4] arm: omap2: hwmon: Fix refcount bugs and memory leak bugs
Date:   Tue, 28 Jun 2022 20:42:55 +0800
Message-Id: <20220628124255.162315-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAD3OPhP97piaNZsEA--.49239S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF1xAr48Wr1xZw4fXryrZwb_yoWrJF4rpF
        y8KrZ8tryUWFsrGF92y34vvrW7twn5KFW0yFy7C3Z7Ca98Ar1ruw1IqFyY9FnxWrW8Z3WF
        yry0y3WrXan8X3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEjg4dUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBIuF2JVkF2NjAAAso
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There are following bugs:

*refcount bugs*:
(1) In _init(), we need to use of_node_put() for of_find_node_by_name()
    and of_get_next_child();
(2) In omap_hwmod_setup_earlycon_flags(), we need to use of_node_put()
    for of_find_node_by_path();
(3) In omap_hwmod_fix_mpu_rt_idx(), we need to use of_node_put() for
    of_get_next_child().
(4) In _setup_clkctrl_provider(), we need to use of_node_get() for
    a new reference escaped out into 'provider->node'

NOTE: (4) is a |GET| missing, not a |PUT| missing

*memory leak*:
(1) In _setup_clkctrl_provider(), we need to call memblock_free() in
    fail path.

Signed-off-by: Liang He <windhl@126.com>
---
 v4: merge all bugs in omap_hwmon.c into one commit
 v3: only refcount bugs
 v2: merge all omap2 missing |PUT| bugs
 v1: fix missing |PUT| only in single file

 Patched file has been compiled test with multi_v7_defconfig in 5.19rc2


 arch/arm/mach-omap2/omap_hwmod.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 31d1a21f6041..16f49ea4d634 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -715,7 +715,7 @@ static int __init _setup_clkctrl_provider(struct device_node *np)
 	if (!provider)
 		return -ENOMEM;
 
-	provider->node = np;
+	provider->node = of_node_get(np);
 
 	provider->num_addrs =
 		of_property_count_elems_of_size(np, "reg", sizeof(u32)) / 2;
@@ -723,14 +723,21 @@ static int __init _setup_clkctrl_provider(struct device_node *np)
 	provider->addr =
 		memblock_alloc(sizeof(void *) * provider->num_addrs,
 			       SMP_CACHE_BYTES);
-	if (!provider->addr)
+	if (!provider->addr) {
+		of_node_put(np);
+		memblock_free(provider, sizeof(*provider));
 		return -ENOMEM;
+	}
 
 	provider->size =
 		memblock_alloc(sizeof(u32) * provider->num_addrs,
 			       SMP_CACHE_BYTES);
-	if (!provider->size)
+	if (!provider->size) {
+		of_node_put(np);
+		memblock_free(provider->addr, sizeof(void *) * provider->num_addrs);
+		memblock_free(provider, sizeof(*provider));
 		return -ENOMEM;
+	}
 
 	for (i = 0; i < provider->num_addrs; i++) {
 		addrp = of_get_address(np, i, &size, NULL);
@@ -2179,6 +2186,7 @@ static void omap_hwmod_fix_mpu_rt_idx(struct omap_hwmod *oh,
 	if (error)
 		pr_err("%s: error mapping mpu_rt_idx: %i\n",
 		       __func__, error);
+	of_node_put(child);
 }
 
 /**
@@ -2365,6 +2373,7 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
 	r = _init_mpu_rt_base(oh, NULL, index, np);
 	if (r < 0) {
+		of_node_put(bus);
 		WARN(1, "omap_hwmod: %s: doesn't have mpu register target base\n",
 		     oh->name);
 		return 0;
@@ -2372,6 +2381,7 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
 	r = _init_clocks(oh, np);
 	if (r < 0) {
+		of_node_put(bus);
 		WARN(1, "omap_hwmod: %s: couldn't init clocks\n", oh->name);
 		return -EINVAL;
 	}
@@ -2381,10 +2391,14 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
 		parse_module_flags(oh, np);
 		child = of_get_next_child(np, NULL);
-		if (child)
+		if (child) {
 			parse_module_flags(oh, child);
+			of_node_put(child);
+		}
 	}
 
+	of_node_put(bus);
+
 	oh->_state = _HWMOD_STATE_INITIALIZED;
 
 	return 0;
@@ -3648,6 +3662,7 @@ static void __init omap_hwmod_setup_earlycon_flags(void)
 	np = of_find_node_by_path("/chosen");
 	if (np) {
 		uart = of_get_property(np, "stdout-path", NULL);
+		of_node_put(np);
 		if (uart) {
 			np = of_find_node_by_path(uart);
 			if (np) {
@@ -3661,6 +3676,7 @@ static void __init omap_hwmod_setup_earlycon_flags(void)
 				}
 				if (oh)
 					oh->flags |= DEBUG_OMAPUART_FLAGS;
+				of_node_put(np);
 			}
 		}
 	}
-- 
2.25.1

