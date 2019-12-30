Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1D1D12D392
	for <lists+linux-omap@lfdr.de>; Mon, 30 Dec 2019 19:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727687AbfL3Sut (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Dec 2019 13:50:49 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:44338 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfL3Sut (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Dec 2019 13:50:49 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUIolJp033147;
        Mon, 30 Dec 2019 12:50:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1577731847;
        bh=4xHbqA2AvQ1Ph+xX9DQl0PYR8DUBmPi/SjnZd2OQaXo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hmtGRWwe99nSiVAY7NOrRcRI6K/imzEa+aArB2YWeCWRIkQzKu1JYG4UXk+wg70tZ
         HOWS6ntqXMO/Q8213txAmmMNJE0UxTIarbmK8H/b7ZGU58ATcif3V9QdC6EX355Ru+
         pmWpX7rs9azZ7mUbKxRiQvcLLLB4DPXsjwo5rwNY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUIoltZ035307;
        Mon, 30 Dec 2019 12:50:47 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 12:50:46 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 12:50:46 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com [128.247.22.53])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUIokq1055963;
        Mon, 30 Dec 2019 12:50:46 -0600
Received: from localhost ([10.250.65.50])
        by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id xBUIoju07076;
        Mon, 30 Dec 2019 12:50:46 -0600 (CST)
From:   "Andrew F. Davis" <afd@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v3 4/4] ARM: OMAP2+: sleep43xx: Call secure suspend/resume handlers
Date:   Mon, 30 Dec 2019 13:50:04 -0500
Message-ID: <20191230185004.32279-5-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230185004.32279-1-afd@ti.com>
References: <20191230185004.32279-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

During suspend CPU context may be lost in both non-secure and secure CPU
states. The kernel can handle saving and restoring the non-secure context
but must call into the secure side to allow it to save any context it may
lose. Add these calls here.

Note that on systems with OP-TEE available the suspend call is issued to
OP-TEE using the ARM SMCCC, but the resume call is always issued to the
ROM. This is because on waking from suspend the ROM is restored as the
secure monitor. It is this resume call that instructs the ROM to restore
OP-TEE, all subsequent calls will be handled by OP-TEE and should use the
ARM SMCCC.

Signed-off-by: Andrew F. Davis <afd@ti.com>
Acked-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/mach-omap2/omap-secure.h |  3 +++
 arch/arm/mach-omap2/pm33xx-core.c | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm/mach-omap2/omap-secure.h b/arch/arm/mach-omap2/omap-secure.h
index 736e594365f4..ba8c486c0454 100644
--- a/arch/arm/mach-omap2/omap-secure.h
+++ b/arch/arm/mach-omap2/omap-secure.h
@@ -53,6 +53,9 @@
 #define OMAP4_PPA_L2_POR_INDEX		0x23
 #define OMAP4_PPA_CPU_ACTRL_SMP_INDEX	0x25
 
+#define AM43xx_PPA_SVC_PM_SUSPEND	0x71
+#define AM43xx_PPA_SVC_PM_RESUME	0x72
+
 /* Secure RX-51 PPA (Primary Protected Application) APIs */
 #define RX51_PPA_HWRNG			29
 #define RX51_PPA_L2_INVAL		40
diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index f11442ed3eff..4a564f676ff9 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -28,6 +28,7 @@
 #include "prm33xx.h"
 #include "soc.h"
 #include "sram.h"
+#include "omap-secure.h"
 
 static struct powerdomain *cefuse_pwrdm, *gfx_pwrdm, *per_pwrdm, *mpu_pwrdm;
 static struct clockdomain *gfx_l4ls_clkdm;
@@ -166,6 +167,16 @@ static int am43xx_suspend(unsigned int state, int (*fn)(unsigned long),
 {
 	int ret = 0;
 
+	/* Suspend secure side on HS devices */
+	if (omap_type() != OMAP2_DEVICE_TYPE_GP) {
+		if (optee_available)
+			omap_smccc_smc(AM43xx_PPA_SVC_PM_SUSPEND, 0);
+		else
+			omap_secure_dispatcher(AM43xx_PPA_SVC_PM_SUSPEND,
+					       FLAG_START_CRITICAL,
+					       0, 0, 0, 0, 0);
+	}
+
 	amx3_pre_suspend_common();
 	scu_power_mode(scu_base, SCU_PM_POWEROFF);
 	ret = cpu_suspend(args, fn);
@@ -174,6 +185,12 @@ static int am43xx_suspend(unsigned int state, int (*fn)(unsigned long),
 	if (!am43xx_check_off_mode_enable())
 		amx3_post_suspend_common();
 
+	/* Resume secure side on HS devices */
+	if (omap_type() != OMAP2_DEVICE_TYPE_GP)
+		omap_secure_dispatcher(AM43xx_PPA_SVC_PM_RESUME,
+				       FLAG_START_CRITICAL,
+				       0, 0, 0, 0, 0);
+
 	return ret;
 }
 
-- 
2.17.1

