Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77E8F11CDC8
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 14:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729344AbfLLNGR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 08:06:17 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34582 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfLLNGR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 08:06:17 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCD6Dp7046812;
        Thu, 12 Dec 2019 07:06:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155973;
        bh=rnV8JdXQ9GTFl1cl3Aa4lIj+D8r8uXWsRNJQGRsuJ+0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ePmbsAU1VK6Mp0pOn7iA32xV3TapPzjHUm7CalSirI6iK9K8zlah5nJ7dAPlHNzOk
         POh+SuWMbOnxIe/i7XBmKT3x/0cugMenHg2e5bIPTUO2/VO7bj2lXhexwFoY3XPSti
         j5eY2wQoqnzRr7f3SkWNeIshqT66P+mb9SpB2ppE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCD6DYj052276
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 07:06:13 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:06:10 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:06:10 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCD66KD069503;
        Thu, 12 Dec 2019 07:06:09 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 2/5] ARM: OMAP4+: remove pdata quirks for omap4+ iommus
Date:   Thu, 12 Dec 2019 15:05:38 +0200
Message-ID: <20191212130541.3657-3-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212130541.3657-1-t-kristo@ti.com>
References: <20191212130541.3657-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

IOMMU driver will be using ti-sysc bus driver for power management control
going forward, and the pdata quirks are not needed for anything anymore.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/pdata-quirks.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index d8260e61ef92..88ca7f82510a 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -261,16 +261,6 @@ static void __init omap3_pandora_legacy_init(void)
 }
 #endif /* CONFIG_ARCH_OMAP3 */
 
-#if defined(CONFIG_ARCH_OMAP4) || defined(CONFIG_SOC_OMAP5)
-static struct iommu_platform_data omap4_iommu_pdata = {
-	.reset_name = "mmu_cache",
-	.assert_reset = omap_device_assert_hardreset,
-	.deassert_reset = omap_device_deassert_hardreset,
-	.device_enable = omap_device_enable,
-	.device_idle = omap_device_idle,
-};
-#endif
-
 #if defined(CONFIG_SOC_AM33XX) || defined(CONFIG_SOC_AM43XX)
 static struct wkup_m3_platform_data wkup_m3_data = {
 	.reset_name = "wkup_m3",
@@ -495,10 +485,6 @@ static struct of_dev_auxdata omap_auxdata_lookup[] = {
 		       &wkup_m3_data),
 #endif
 #if defined(CONFIG_ARCH_OMAP4) || defined(CONFIG_SOC_OMAP5)
-	OF_DEV_AUXDATA("ti,omap4-iommu", 0x4a066000, "4a066000.mmu",
-		       &omap4_iommu_pdata),
-	OF_DEV_AUXDATA("ti,omap4-iommu", 0x55082000, "55082000.mmu",
-		       &omap4_iommu_pdata),
 	OF_DEV_AUXDATA("ti,omap4-smartreflex-iva", 0x4a0db000,
 		       "4a0db000.smartreflex", &omap_sr_pdata[OMAP_SR_IVA]),
 	OF_DEV_AUXDATA("ti,omap4-smartreflex-core", 0x4a0dd000,
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
