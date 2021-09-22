Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1143414523
	for <lists+linux-omap@lfdr.de>; Wed, 22 Sep 2021 11:31:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234256AbhIVJci (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Sep 2021 05:32:38 -0400
Received: from muru.com ([72.249.23.125]:36058 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234203AbhIVJch (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 22 Sep 2021 05:32:37 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id E15D080F0;
        Wed, 22 Sep 2021 09:31:35 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] ARM: OMAP2+: Drop old unused omap5_uevm_legacy_init()
Date:   Wed, 22 Sep 2021 12:31:01 +0300
Message-Id: <20210922093102.12748-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is no longer needed, the function does nothing nowadays.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -274,12 +274,6 @@ static void __init omap3_pandora_legacy_init(void)
 }
 #endif /* CONFIG_ARCH_OMAP3 */
 
-#ifdef CONFIG_SOC_OMAP5
-static void __init omap5_uevm_legacy_init(void)
-{
-}
-#endif
-
 #ifdef CONFIG_SOC_DRA7XX
 static struct iommu_platform_data dra7_ipu1_dsp_iommu_pdata = {
 	.set_pwrdm_constraint = omap_iommu_set_pwrdm_constraint,
@@ -549,9 +543,6 @@ static struct pdata_init pdata_quirks[] __initdata = {
 	{ "openpandora,omap3-pandora-600mhz", omap3_pandora_legacy_init, },
 	{ "openpandora,omap3-pandora-1ghz", omap3_pandora_legacy_init, },
 #endif
-#ifdef CONFIG_SOC_OMAP5
-	{ "ti,omap5-uevm", omap5_uevm_legacy_init, },
-#endif
 #ifdef CONFIG_SOC_DRA7XX
 	{ "ti,dra7-evm", dra7x_evm_mmc_quirk, },
 #endif
-- 
2.33.0
