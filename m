Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8614011CDCA
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 14:06:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729359AbfLLNGU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 08:06:20 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42820 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbfLLNGT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 08:06:19 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCD6EPi105801;
        Thu, 12 Dec 2019 07:06:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155974;
        bh=ti51rTV6c8ZSMS8P9ZaZrX2hos6jao0jMbrGOB4FUbk=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kP0VI02D7shB2PJ+VamHrvEV3MSABBoVKktUX2cCdQoWaOwVLazROjboaBOiBRORS
         V/at1jwjyMdRVgdHSkVsGKNoLJQZEcoAXBesh1nEugetnV/W4oFVoK5qY3yz+XFANb
         j9LhXUHmKh+8As18NC9hk3z/jSbXDKqEjeEC1TBE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCD6ETS074439
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 07:06:14 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:06:13 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:06:13 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCD66KF069503;
        Thu, 12 Dec 2019 07:06:12 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 4/5] ARM: OMAP2+: omap-iommu.c conversion to ti-sysc
Date:   Thu, 12 Dec 2019 15:05:40 +0200
Message-ID: <20191212130541.3657-5-t-kristo@ti.com>
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

Convert omap2 iommu platform code to use ti-sysc instead of legacy
omap-device / hwmod interfaces.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/mach-omap2/omap-iommu.c | 99 ++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-iommu.c b/arch/arm/mach-omap2/omap-iommu.c
index 78247e6f4a72..54aff33e55e6 100644
--- a/arch/arm/mach-omap2/omap-iommu.c
+++ b/arch/arm/mach-omap2/omap-iommu.c
@@ -8,19 +8,27 @@
 
 #include <linux/platform_device.h>
 #include <linux/err.h>
+#include <linux/clk.h>
+#include <linux/list.h>
 
-#include "omap_hwmod.h"
-#include "omap_device.h"
 #include "clockdomain.h"
 #include "powerdomain.h"
 
+struct pwrdm_link {
+	struct device *dev;
+	struct powerdomain *pwrdm;
+	struct list_head node;
+};
+
+static DEFINE_SPINLOCK(iommu_lock);
+static struct clockdomain *emu_clkdm;
+static atomic_t emu_count;
+
 static void omap_iommu_dra7_emu_swsup_config(struct platform_device *pdev,
 					     bool enable)
 {
-	static struct clockdomain *emu_clkdm;
-	static DEFINE_SPINLOCK(emu_lock);
-	static atomic_t count;
 	struct device_node *np = pdev->dev.of_node;
+	unsigned long flags;
 
 	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
 		return;
@@ -31,34 +39,87 @@ static void omap_iommu_dra7_emu_swsup_config(struct platform_device *pdev,
 			return;
 	}
 
-	spin_lock(&emu_lock);
+	spin_lock_irqsave(&iommu_lock, flags);
 
-	if (enable && (atomic_inc_return(&count) == 1))
+	if (enable && (atomic_inc_return(&emu_count) == 1))
 		clkdm_deny_idle(emu_clkdm);
-	else if (!enable && (atomic_dec_return(&count) == 0))
+	else if (!enable && (atomic_dec_return(&emu_count) == 0))
 		clkdm_allow_idle(emu_clkdm);
 
-	spin_unlock(&emu_lock);
+	spin_unlock_irqrestore(&iommu_lock, flags);
+}
+
+static struct powerdomain *_get_pwrdm(struct device *dev)
+{
+	struct clk *clk;
+	struct clk_hw_omap *hwclk;
+	struct clockdomain *clkdm;
+	struct powerdomain *pwrdm = NULL;
+	struct pwrdm_link *entry;
+	unsigned long flags;
+	static LIST_HEAD(cache);
+
+	spin_lock_irqsave(&iommu_lock, flags);
+
+	list_for_each_entry(entry, &cache, node) {
+		if (entry->dev == dev) {
+			pwrdm = entry->pwrdm;
+			break;
+		}
+	}
+
+	spin_unlock_irqrestore(&iommu_lock, flags);
+
+	if (pwrdm)
+		return pwrdm;
+
+	clk = of_clk_get(dev->of_node->parent, 0);
+	if (!clk) {
+		dev_err(dev, "no fck found\n");
+		return NULL;
+	}
+
+	hwclk = to_clk_hw_omap(__clk_get_hw(clk));
+	clk_put(clk);
+	if (!hwclk || !hwclk->clkdm_name) {
+		dev_err(dev, "no hwclk data\n");
+		return NULL;
+	}
+
+	clkdm = clkdm_lookup(hwclk->clkdm_name);
+	if (!clkdm) {
+		dev_err(dev, "clkdm not found: %s\n", hwclk->clkdm_name);
+		return NULL;
+	}
+
+	pwrdm = clkdm_get_pwrdm(clkdm);
+	if (!pwrdm) {
+		dev_err(dev, "pwrdm not found: %s\n", clkdm->name);
+		return NULL;
+	}
+
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
+	if (entry) {
+		entry->dev = dev;
+		entry->pwrdm = pwrdm;
+		spin_lock_irqsave(&iommu_lock, flags);
+		list_add(&entry->node, &cache);
+		spin_unlock_irqrestore(&iommu_lock, flags);
+	}
+
+	return pwrdm;
 }
 
 int omap_iommu_set_pwrdm_constraint(struct platform_device *pdev, bool request,
 				    u8 *pwrst)
 {
 	struct powerdomain *pwrdm;
-	struct omap_device *od;
 	u8 next_pwrst;
 	int ret = 0;
 
-	od = to_omap_device(pdev);
-	if (!od)
-		return -ENODEV;
-
-	if (od->hwmods_cnt != 1)
-		return -EINVAL;
-
-	pwrdm = omap_hwmod_get_pwrdm(od->hwmods[0]);
+	pwrdm = _get_pwrdm(&pdev->dev);
 	if (!pwrdm)
-		return -EINVAL;
+		return -ENODEV;
 
 	if (request) {
 		*pwrst = pwrdm_read_next_pwrst(pwrdm);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
