Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96EF4B280C
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 00:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731231AbfIMWJ3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 13 Sep 2019 18:09:29 -0400
Received: from muru.com ([72.249.23.125]:60706 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfIMWJ2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 13 Sep 2019 18:09:28 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 088098161;
        Fri, 13 Sep 2019 22:09:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/6] ARM: OMAP2+: Check omap3-rom-rng for GP device instead of HS device
Date:   Fri, 13 Sep 2019 15:09:17 -0700
Message-Id: <20190913220922.29501-2-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190913220922.29501-1-tony@atomide.com>
References: <20190913220922.29501-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In general we should check for GP device instead of HS device unless
the other options such as EMU are also checked. Otherwise omap3-rom-rng
won't probe on few of the old n900 macro boards still in service in
automated build and boot test systems.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Adam Ford <aford173@gmail.com>
Cc: Pali Rohár <pali.rohar@gmail.com>
Cc: Tero Kristo <t-kristo@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -276,7 +276,7 @@ static void __init nokia_n900_legacy_init(void)
 	mmc_pdata[0].name = "external";
 	mmc_pdata[1].name = "internal";
 
-	if (omap_type() == OMAP2_DEVICE_TYPE_SEC) {
+	if (omap_type() != OMAP2_DEVICE_TYPE_GP) {
 		if (IS_ENABLED(CONFIG_ARM_ERRATA_430973)) {
 			pr_info("RX-51: Enabling ARM errata 430973 workaround\n");
 			/* set IBE to 1 */
-- 
2.23.0
