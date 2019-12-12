Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7AA311CDC9
	for <lists+linux-omap@lfdr.de>; Thu, 12 Dec 2019 14:06:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726263AbfLLNGR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 08:06:17 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57886 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729297AbfLLNGR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 08:06:17 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCD6CsP123031;
        Thu, 12 Dec 2019 07:06:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576155972;
        bh=DsV2XUtRQKQqXfzHmMrAeUB1kt+fzxattmAUdnmpsB8=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=LI3VLNtazdMdzWoJFEdVq+fvA79hZQzlixMACtMUD2GgJomNN5HNk5r3eRWV8UUYB
         wPm9uCVUPOZx6t3ctdv5i5nfexz0fBtuG2bQiHys3KeD+tqPzfd9hw+/NvYWf9dw+b
         3nGuPe252SCY5CKzOW4xn9pvo6451rUFbJ8O/Fmw=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCD6C4T052265
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 07:06:12 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 07:06:12 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 07:06:12 -0600
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCD66KE069503;
        Thu, 12 Dec 2019 07:06:11 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>, <s-anna@ti.com>
Subject: [PATCH 3/5] ARM: OMAP2+: Add workaround for DRA7 DSP MStandby errata i879
Date:   Thu, 12 Dec 2019 15:05:39 +0200
Message-ID: <20191212130541.3657-4-t-kristo@ti.com>
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

From: Suman Anna <s-anna@ti.com>

Errata Title:
i879: DSP MStandby requires CD_EMU in SW_WKUP

Description:
The DSP requires the internal emulation clock to be actively toggling
in order to successfully enter a low power mode via execution of the
IDLE instruction and PRCM MStandby/Idle handshake. This assumes that
other prerequisites and software sequence are followed.

Workaround:
The emulation clock to the DSP is free-running anytime CCS is connected
via JTAG debugger to the DSP subsystem or when the CD_EMU clock domain
is set in SW_WKUP mode. The CD_EMU domain can be set in SW_WKUP mode
via the CM_EMU_CLKSTCTRL [1:0]CLKTRCTRL field.

Implementation:
This patch implements this workaround by denying the HW_AUTO mode
for the EMU clockdomain during the power-up of any DSP processor
and re-enabling the HW_AUTO mode during the shutdown of the last
DSP processor (actually done during the enabling and disabling of
the respective DSP MDMA MMUs). Reference counting has to be used to
manage the independent sequencing between the multiple DSP processors.

This switching is done at runtime rather than a static clockdomain
flags value to meet the target power domain state for the EMU power
domain during suspend.

Note that the DSP MStandby behavior is not consistent across all
boards prior to this fix. Please see commit 45f871eec6c0 ("ARM:
OMAP2+: Extend DRA7 IPU1 MMU pdata quirks to DSP MDMA MMUs") for
details.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/mach-omap2/omap-iommu.c | 43 +++++++++++++++++++++++++++++---
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/omap-iommu.c b/arch/arm/mach-omap2/omap-iommu.c
index f1a6ece8108e..78247e6f4a72 100644
--- a/arch/arm/mach-omap2/omap-iommu.c
+++ b/arch/arm/mach-omap2/omap-iommu.c
@@ -11,14 +11,43 @@
 
 #include "omap_hwmod.h"
 #include "omap_device.h"
+#include "clockdomain.h"
 #include "powerdomain.h"
 
+static void omap_iommu_dra7_emu_swsup_config(struct platform_device *pdev,
+					     bool enable)
+{
+	static struct clockdomain *emu_clkdm;
+	static DEFINE_SPINLOCK(emu_lock);
+	static atomic_t count;
+	struct device_node *np = pdev->dev.of_node;
+
+	if (!of_device_is_compatible(np, "ti,dra7-dsp-iommu"))
+		return;
+
+	if (!emu_clkdm) {
+		emu_clkdm = clkdm_lookup("emu_clkdm");
+		if (WARN_ON_ONCE(!emu_clkdm))
+			return;
+	}
+
+	spin_lock(&emu_lock);
+
+	if (enable && (atomic_inc_return(&count) == 1))
+		clkdm_deny_idle(emu_clkdm);
+	else if (!enable && (atomic_dec_return(&count) == 0))
+		clkdm_allow_idle(emu_clkdm);
+
+	spin_unlock(&emu_lock);
+}
+
 int omap_iommu_set_pwrdm_constraint(struct platform_device *pdev, bool request,
 				    u8 *pwrst)
 {
 	struct powerdomain *pwrdm;
 	struct omap_device *od;
 	u8 next_pwrst;
+	int ret = 0;
 
 	od = to_omap_device(pdev);
 	if (!od)
@@ -31,13 +60,21 @@ int omap_iommu_set_pwrdm_constraint(struct platform_device *pdev, bool request,
 	if (!pwrdm)
 		return -EINVAL;
 
-	if (request)
+	if (request) {
 		*pwrst = pwrdm_read_next_pwrst(pwrdm);
+		omap_iommu_dra7_emu_swsup_config(pdev, true);
+	}
 
 	if (*pwrst > PWRDM_POWER_RET)
-		return 0;
+		goto out;
 
 	next_pwrst = request ? PWRDM_POWER_ON : *pwrst;
 
-	return pwrdm_set_next_pwrst(pwrdm, next_pwrst);
+	ret = pwrdm_set_next_pwrst(pwrdm, next_pwrst);
+
+out:
+	if (!request)
+		omap_iommu_dra7_emu_swsup_config(pdev, false);
+
+	return ret;
 }
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
