Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1227FBD06A
	for <lists+linux-omap@lfdr.de>; Tue, 24 Sep 2019 19:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439014AbfIXRPt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 24 Sep 2019 13:15:49 -0400
Received: from muru.com ([72.249.23.125]:34438 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437027AbfIXRPt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 24 Sep 2019 13:15:49 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8C83780E2;
        Tue, 24 Sep 2019 17:16:20 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Jyri Sarha <jsarha@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH] ARM: OMAP2+: Add missing LCDC midlemode for am335x
Date:   Tue, 24 Sep 2019 10:15:43 -0700
Message-Id: <20190924171543.345-1-tony@atomide.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

TRM "Table 13-34. SYSCONFIG Register Field Descriptions" lists both
standbymode and idlemode that should be just the sidle and midle
registers where midle is currently unconfigured for lcdc_sysc. As
the dts data has been generated based on lcdc_sysc, we now have an
empty "ti,sysc-midle" property.

And so we currently get a warning for lcdc because of a difference
with dts provided configuration compared to the legacy platform
data. This is because lcdc has SYSC_HAS_MIDLEMODE configured in
the platform data without configuring the modes.

Let's fix the issue by adding the missing midlemode to lcdc_sysc,
and configuring the "ti,sysc-midle" property based on the TRM
values.

Fixes: f711c575cfec ("ARM: dts: am335x: Add l4 interconnect hierarchy and ti-sysc data")
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Keerthy <j-keerthy@ti.com>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Suman Anna <s-anna@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi           | 4 +++-
 arch/arm/mach-omap2/omap_hwmod_33xx_data.c | 5 +++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -2038,7 +2038,9 @@
 			reg = <0xe000 0x4>,
 			      <0xe054 0x4>;
 			reg-names = "rev", "sysc";
-			ti,sysc-midle ;
+			ti,sysc-midle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
 			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>;
diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
@@ -231,8 +231,9 @@ static struct omap_hwmod am33xx_control_hwmod = {
 static struct omap_hwmod_class_sysconfig lcdc_sysc = {
 	.rev_offs	= 0x0,
 	.sysc_offs	= 0x54,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
+	.sysc_flags	= SYSC_HAS_SIDLEMODE | SYSC_HAS_MIDLEMODE,
+	.idlemodes	= SIDLE_FORCE | SIDLE_NO | SIDLE_SMART |
+			  MSTANDBY_FORCE | MSTANDBY_NO | MSTANDBY_SMART,
 	.sysc_fields	= &omap_hwmod_sysc_type2,
 };
 
-- 
2.23.0
