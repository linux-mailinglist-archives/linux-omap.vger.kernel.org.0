Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85A3511DC6D
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 04:07:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731985AbfLMDHQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 22:07:16 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36464 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731938AbfLMDHQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 22:07:16 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD379TO088034;
        Thu, 12 Dec 2019 21:07:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576206429;
        bh=kRlRIYsKt+gU3zZwmSb+MUKolQB9jPrnYnytPpI7jEc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=TYNeKFCwEFTrCp6rFmaTzTWPN7UL2owBNI2rKN1k1kJvC+LN12eoBPqc2gzDFhFWH
         B10WPXEOedDhchMvd/xqqL7xyzxevAI5ygpsyNvb09lpphgaTRZ7zXRX5yOSF+3wV9
         meTF+z7ZkQZ0FM/yDX/kSxj3E6gOst0CjKug8mUA=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD379QX026680;
        Thu, 12 Dec 2019 21:07:09 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 21:07:08 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 21:07:08 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD378f8025240;
        Thu, 12 Dec 2019 21:07:08 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH 3/5] ARM: OMAP2+: pm33xx-core: Extend platform_data ops for cpuidle
Date:   Thu, 12 Dec 2019 21:07:53 -0600
Message-ID: <20191213030755.16096-4-d-gerlach@ti.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213030755.16096-1-d-gerlach@ti.com>
References: <20191213030755.16096-1-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

In order for am335x and am437x to properly enter deeper c-states in
cpuidle they must always call into the sleep33/43xx suspend code and
also sometimes invoke the wkup_m3_ipc driver. These are both controlled
by the pm33xx module so we must provide a method for the platform code
to call back into the module when it is available as the core cpuidle
ops that are invoked by the cpuidle-arm driver must remain as built in.

Extend the init platform op to take an idle function as an argument so
that we can use this to call into the pm33xx module for c-states that
need it. Also add a deinit op so we can unregister this idle function
from the PM core when the pm33xx module gets unloaded.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/mach-omap2/pm33xx-core.c    | 20 +++++++++++++++-----
 drivers/soc/ti/pm33xx.c              |  2 +-
 include/linux/platform_data/pm33xx.h |  3 ++-
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index dc43736f0ae6..388808e90677 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -78,7 +78,7 @@ static int am43xx_check_off_mode_enable(void)
 	return 0;
 }
 
-static int amx3_common_init(void)
+static int amx3_common_init(int (*idle)(u32 wfi_flags))
 {
 	gfx_pwrdm = pwrdm_lookup("gfx_pwrdm");
 	per_pwrdm = pwrdm_lookup("per_pwrdm");
@@ -98,10 +98,12 @@ static int amx3_common_init(void)
 	else
 		omap_set_pwrdm_state(cefuse_pwrdm, PWRDM_POWER_OFF);
 
+	idle_fn = idle;
+
 	return 0;
 }
 
-static int am33xx_suspend_init(void)
+static int am33xx_suspend_init(int (*idle)(u32 wfi_flags))
 {
 	int ret;
 
@@ -112,12 +114,12 @@ static int am33xx_suspend_init(void)
 		return -ENODEV;
 	}
 
-	ret = amx3_common_init();
+	ret = amx3_common_init(idle);
 
 	return ret;
 }
 
-static int am43xx_suspend_init(void)
+static int am43xx_suspend_init(int (*idle)(u32 wfi_flags))
 {
 	int ret = 0;
 
@@ -127,11 +129,17 @@ static int am43xx_suspend_init(void)
 		return ret;
 	}
 
-	ret = amx3_common_init();
+	ret = amx3_common_init(idle);
 
 	return ret;
 }
 
+static int amx3_suspend_deinit(void)
+{
+	idle_fn = NULL;
+	return 0;
+}
+
 static void amx3_pre_suspend_common(void)
 {
 	omap_set_pwrdm_state(gfx_pwrdm, PWRDM_POWER_OFF);
@@ -277,6 +285,7 @@ static void am43xx_prepare_rtc_resume(void)
 
 static struct am33xx_pm_platform_data am33xx_ops = {
 	.init = am33xx_suspend_init,
+	.deinit = amx3_suspend_deinit,
 	.soc_suspend = am33xx_suspend,
 	.cpu_suspend = am33xx_cpu_suspend,
 	.begin_suspend = amx3_begin_suspend,
@@ -292,6 +301,7 @@ static struct am33xx_pm_platform_data am33xx_ops = {
 
 static struct am33xx_pm_platform_data am43xx_ops = {
 	.init = am43xx_suspend_init,
+	.deinit = amx3_suspend_deinit,
 	.soc_suspend = am43xx_suspend,
 	.cpu_suspend = am43xx_cpu_suspend,
 	.begin_suspend = amx3_begin_suspend,
diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index ccc6d53fe788..19bdcaca1f21 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -503,7 +503,7 @@ static int am33xx_pm_probe(struct platform_device *pdev)
 	suspend_wfi_flags |= WFI_FLAG_WAKE_M3;
 #endif /* CONFIG_SUSPEND */
 
-	ret = pm_ops->init();
+	ret = pm_ops->init(NULL);
 	if (ret) {
 		dev_err(dev, "Unable to call core pm init!\n");
 		ret = -ENODEV;
diff --git a/include/linux/platform_data/pm33xx.h b/include/linux/platform_data/pm33xx.h
index 8e59f2db2adc..644af1d89cfa 100644
--- a/include/linux/platform_data/pm33xx.h
+++ b/include/linux/platform_data/pm33xx.h
@@ -46,7 +46,8 @@ struct am33xx_pm_sram_addr {
 };
 
 struct am33xx_pm_platform_data {
-	int	(*init)(void);
+	int     (*init)(int (*idle)(u32 wfi_flags));
+	int     (*deinit)(void);
 	int	(*soc_suspend)(unsigned int state, int (*fn)(unsigned long),
 			       unsigned long args);
 	int	(*cpu_suspend)(int (*fn)(unsigned long), unsigned long args);
-- 
2.20.1

