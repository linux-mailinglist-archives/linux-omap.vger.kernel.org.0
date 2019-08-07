Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87C15848CC
	for <lists+linux-omap@lfdr.de>; Wed,  7 Aug 2019 11:45:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbfHGJpA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Aug 2019 05:45:00 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51178 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbfHGJo7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 7 Aug 2019 05:44:59 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x779is95024666;
        Wed, 7 Aug 2019 04:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565171094;
        bh=D1ABe6UuCy+19McIAI+7AapSCDTHrhabTxuSk376CL4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GWKMwM7lSGzz5fj0mVYkYm+iuhFzLSFQSEIz8NEcqoKtfGST3r+Bhs/ihrDGkxwAA
         r9s+rNzrmWnqBtzmbYO1d0cc+HtjFIZmdZ2kcCWrTQrnWuOCMtk0URpIU9W8hdrqyi
         57gND1A6TmdSm3QZRBpkqYyA9U65jH/oE1Le7yEU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x779irYh096513
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 04:44:54 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 04:44:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 04:44:52 -0500
Received: from gomoku.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x779imdU037583;
        Wed, 7 Aug 2019 04:44:51 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 3/3] ARM: OMAP2+: omap-iommu.c conversion to ti-sysc
Date:   Wed, 7 Aug 2019 12:44:41 +0300
Message-ID: <1565171081-7899-4-git-send-email-t-kristo@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565171081-7899-1-git-send-email-t-kristo@ti.com>
References: <1565171081-7899-1-git-send-email-t-kristo@ti.com>
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
 arch/arm/mach-omap2/omap-iommu.c | 99 ++++++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 19 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-iommu.c b/arch/arm/mach-omap2/omap-iommu.c
index 8f6b6b8..f8cbf6b 100644
--- a/arch/arm/mach-omap2/omap-iommu.c
+++ b/arch/arm/mach-omap2/omap-iommu.c
@@ -16,19 +16,27 @@
 
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
@@ -39,34 +47,87 @@ static void omap_iommu_dra7_emu_swsup_config(struct platform_device *pdev,
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
1.9.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
