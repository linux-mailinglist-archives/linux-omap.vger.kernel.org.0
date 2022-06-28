Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B5155D1D3
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:10:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234573AbiF1Ley (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Jun 2022 07:34:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234831AbiF1Lex (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Jun 2022 07:34:53 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 001502FFCA
        for <linux-omap@vger.kernel.org>; Tue, 28 Jun 2022 04:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=IQkBX
        7fDFbSXLwpvxw1OC8gM3chqOOAgTNNpxWZzFaM=; b=A2KB2ONwaIs7bn2NY63eO
        cPLgG552DmUNpGLOHuKjG2v9gc3BZh/Zb8+e8/cc1HP8BotohJyno/bQ4YWWGwmn
        uu0+kYlWQNqXlNq9EvZ0XXTE51CE7z8xJ1RkZRVBlS9C/dj/SZNyVqvINCpYaIIE
        ndj/vmIubhV4uhyOpWq9QE=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgCHEn9X57piBJ_DGg--.13891S2;
        Tue, 28 Jun 2022 19:34:47 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tony@atomide.com, linux-omap@vger.kernel.org, windhl@126.com
Subject: [PATCH v3] arm: mach-omap2: omap_hwmod: Fix refcount leak bug
Date:   Tue, 28 Jun 2022 19:34:46 +0800
Message-Id: <20220628113446.161021-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgCHEn9X57piBJ_DGg--.13891S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1rGF1fWw1kAF45Jr4kXrb_yoW8uFWrp3
        9akrZYyryUWws7JayktFyjvrW2kw1DCrWUZr9xG3Z7C3WDCr4fAr4Sqa4YkF98XFW8ua4F
        yF40y3W7X3WDZ37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRt3kNUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbizhguF18RPZIGZQAAst
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In _init(), of_find_node_by_name() andof_get_next_child()  will
return a node pointer with refcount incremented. We should use
of_node_put() in fail path or when it is not used anymore.

NOTE: As the ref will be passed from 'bus' to 'np' by the xx_lookup(),
in normal exit path, we should call of_node_put() at the end use of 'np',
not the end use of 'bus'.

Signed-off-by: Liang He <windhl@126.com>
---
 changelog:

 v3: add missing of_node_put() for of_get_xx based on tony's
advice
 v2: merge similar bugs of omap2 into one commit
 v1: fix missing of_node_put() for of_find_xx


 arch/arm/mach-omap2/omap_hwmod.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
index 31d1a21f6041..c7f83bcac136 100644
--- a/arch/arm/mach-omap2/omap_hwmod.c
+++ b/arch/arm/mach-omap2/omap_hwmod.c
@@ -2365,6 +2365,7 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
 	r = _init_mpu_rt_base(oh, NULL, index, np);
 	if (r < 0) {
+		of_node_put(bus);
 		WARN(1, "omap_hwmod: %s: doesn't have mpu register target base\n",
 		     oh->name);
 		return 0;
@@ -2372,6 +2373,7 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
 	r = _init_clocks(oh, np);
 	if (r < 0) {
+		of_node_put(bus);
 		WARN(1, "omap_hwmod: %s: couldn't init clocks\n", oh->name);
 		return -EINVAL;
 	}
@@ -2381,10 +2383,14 @@ static int __init _init(struct omap_hwmod *oh, void *data)
 
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
@@ -3648,6 +3654,7 @@ static void __init omap_hwmod_setup_earlycon_flags(void)
 	np = of_find_node_by_path("/chosen");
 	if (np) {
 		uart = of_get_property(np, "stdout-path", NULL);
+		of_node_put(np);
 		if (uart) {
 			np = of_find_node_by_path(uart);
 			if (np) {
@@ -3661,6 +3668,7 @@ static void __init omap_hwmod_setup_earlycon_flags(void)
 				}
 				if (oh)
 					oh->flags |= DEBUG_OMAPUART_FLAGS;
+				of_node_put(np);
 			}
 		}
 	}
-- 
2.25.1

