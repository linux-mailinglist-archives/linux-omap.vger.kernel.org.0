Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A96C22BF92
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jul 2020 09:41:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgGXHla (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jul 2020 03:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:34776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726993AbgGXHla (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 24 Jul 2020 03:41:30 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F089020748;
        Fri, 24 Jul 2020 07:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595576489;
        bh=/sVQ6Qs2MSo/q671FEFn3iBfByKrfJOQxVRwoAYK3I0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=djI1/lyUrlI05PHAI5MZJiuMT5SKXPZfNk5+Xt/AuZC7p7F9kEe88EBRd3vvLItMO
         CP2mw4vEJyZBW4Icwc8UbTEgwVqYBGZF+O3bjPk9U7oNgYRNjU5M7d5fynzUkd95Vk
         4Eu5gf8cHIFngIiSAtaksK5Br+naaySpqQ0+pNlo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Markus Mayer <mmayer@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Roger Quadros <rogerq@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kukjin Kim <kgene@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 04/29] memory: ti-aemif: Rename SS to SSTROBE to avoid name conflicts
Date:   Fri, 24 Jul 2020 09:40:13 +0200
Message-Id: <20200724074038.5597-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200724074038.5597-1-krzk@kernel.org>
References: <20200724074038.5597-1-krzk@kernel.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

SS conflicts with compile test build on i386:

    drivers/memory/ti-aemif.c:40:0: warning: "SS" redefined
    In file included from arch/x86/include/uapi/asm/ptrace.h:6:0,
                     from arch/x86/include/asm/ptrace.h:7,
                     from arch/x86/include/asm/math_emu.h:5,
                     from arch/x86/include/asm/processor.h:13,
                     from include/linux/mutex.h:19,
                     from include/linux/notifier.h:14,
                     from include/linux/clk.h:14,
                     from drivers/memory/ti-aemif.c:12:
    arch/x86/include/uapi/asm/ptrace-abi.h:23:0: note: this is the location of the previous definition
     #define SS   16

Use more descriptive name (SSTROBE) to avoid the conflict.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/memory/ti-aemif.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/ti-aemif.c b/drivers/memory/ti-aemif.c
index db526dbf71ee..159a16f5e7d6 100644
--- a/drivers/memory/ti-aemif.c
+++ b/drivers/memory/ti-aemif.c
@@ -27,7 +27,7 @@
 #define WSTROBE_SHIFT	20
 #define WSETUP_SHIFT	26
 #define EW_SHIFT	30
-#define SS_SHIFT	31
+#define SSTROBE_SHIFT	31
 
 #define TA(x)		((x) << TA_SHIFT)
 #define RHOLD(x)	((x) << RHOLD_SHIFT)
@@ -37,7 +37,7 @@
 #define WSTROBE(x)	((x) << WSTROBE_SHIFT)
 #define WSETUP(x)	((x) << WSETUP_SHIFT)
 #define EW(x)		((x) << EW_SHIFT)
-#define SS(x)		((x) << SS_SHIFT)
+#define SSTROBE(x)	((x) << SSTROBE_SHIFT)
 
 #define ASIZE_MAX	0x1
 #define TA_MAX		0x3
@@ -48,7 +48,7 @@
 #define WSTROBE_MAX	0x3f
 #define WSETUP_MAX	0xf
 #define EW_MAX		0x1
-#define SS_MAX		0x1
+#define SSTROBE_MAX	0x1
 #define NUM_CS		4
 
 #define TA_VAL(x)	(((x) & TA(TA_MAX)) >> TA_SHIFT)
@@ -59,7 +59,7 @@
 #define WSTROBE_VAL(x)	(((x) & WSTROBE(WSTROBE_MAX)) >> WSTROBE_SHIFT)
 #define WSETUP_VAL(x)	(((x) & WSETUP(WSETUP_MAX)) >> WSETUP_SHIFT)
 #define EW_VAL(x)	(((x) & EW(EW_MAX)) >> EW_SHIFT)
-#define SS_VAL(x)	(((x) & SS(SS_MAX)) >> SS_SHIFT)
+#define SSTROBE_VAL(x)	(((x) & SSTROBE(SSTROBE_MAX)) >> SSTROBE_SHIFT)
 
 #define NRCSR_OFFSET	0x00
 #define AWCCR_OFFSET	0x04
@@ -67,7 +67,7 @@
 
 #define ACR_ASIZE_MASK	0x3
 #define ACR_EW_MASK	BIT(30)
-#define ACR_SS_MASK	BIT(31)
+#define ACR_SSTROBE_MASK	BIT(31)
 #define ASIZE_16BIT	1
 
 #define CONFIG_MASK	(TA(TA_MAX) | \
@@ -77,7 +77,7 @@
 				WHOLD(WHOLD_MAX) | \
 				WSTROBE(WSTROBE_MAX) | \
 				WSETUP(WSETUP_MAX) | \
-				EW(EW_MAX) | SS(SS_MAX) | \
+				EW(EW_MAX) | SSTROBE(SSTROBE_MAX) | \
 				ASIZE_MAX)
 
 /**
@@ -204,7 +204,7 @@ static int aemif_config_abus(struct platform_device *pdev, int csnum)
 	if (data->enable_ew)
 		set |= ACR_EW_MASK;
 	if (data->enable_ss)
-		set |= ACR_SS_MASK;
+		set |= ACR_SSTROBE_MASK;
 
 	val = readl(aemif->base + offset);
 	val &= ~CONFIG_MASK;
@@ -246,7 +246,7 @@ static void aemif_get_hw_params(struct platform_device *pdev, int csnum)
 	data->wstrobe = aemif_cycles_to_nsec(WSTROBE_VAL(val), clk_rate);
 	data->wsetup = aemif_cycles_to_nsec(WSETUP_VAL(val), clk_rate);
 	data->enable_ew = EW_VAL(val);
-	data->enable_ss = SS_VAL(val);
+	data->enable_ss = SSTROBE_VAL(val);
 	data->asize = val & ASIZE_MAX;
 }
 
-- 
2.17.1

