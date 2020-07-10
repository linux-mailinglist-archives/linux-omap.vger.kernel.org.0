Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2930A21BCAB
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 19:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726920AbgGJR7K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Jul 2020 13:59:10 -0400
Received: from muru.com ([72.249.23.125]:33330 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726820AbgGJR7K (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 10 Jul 2020 13:59:10 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1E5CA80E5;
        Fri, 10 Jul 2020 18:00:03 +0000 (UTC)
Date:   Fri, 10 Jul 2020 10:59:07 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 00/13] Add IPU & DSP remoteprocs on OMAP4 and OMAP5
Message-ID: <20200710175907.GH5849@atomide.com>
References: <20200709231954.1973-1-s-anna@ti.com>
 <20200710165814.GF5849@atomide.com>
 <41bd2bb4-06fe-5f70-22cf-ce9cedc8bbc3@ti.com>
 <4602b219-6822-4ebc-66c6-c64740793938@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4602b219-6822-4ebc-66c6-c64740793938@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200710 17:29]:
> FYI, the following one-line removal is enough for me to not see the error.
> 
> diff --git a/arch/arm/mach-omap2/vc.c b/arch/arm/mach-omap2/vc.c
> index 86f1ac4c2412..b80c9dff81c4 100644
> --- a/arch/arm/mach-omap2/vc.c
> +++ b/arch/arm/mach-omap2/vc.c
> @@ -44,7 +44,6 @@
>  #define OMAP4_VDD_DEFAULT_VAL  \
>         (OMAP4430_VDD_I2C_DISABLE_MASK | \
>          OMAP4430_VDD_IVA_PRESENCE | OMAP4430_VDD_MPU_PRESENCE | \
> -        OMAP4430_AUTO_CTRL_VDD_IVA(OMAP4430_AUTO_CTRL_VDD_RET) | \
>          OMAP4430_AUTO_CTRL_VDD_MPU(OMAP4430_AUTO_CTRL_VDD_RET) | \
>          OMAP4430_AUTO_CTRL_VDD_CORE(OMAP4430_AUTO_CTRL_VDD_RET))
> 

OK.

Below is an untested attempt to sync the 4460 opp values with
what earlier TI kernels had. Not sure if this help, might be worth
testing :) My pandaboard-es seems to have a corrupt sdio card.

Regards,

Tony

8< ---------------------
diff --git a/arch/arm/mach-omap2/opp4xxx_data.c b/arch/arm/mach-omap2/opp4xxx_data.c
--- a/arch/arm/mach-omap2/opp4xxx_data.c
+++ b/arch/arm/mach-omap2/opp4xxx_data.c
@@ -66,21 +66,23 @@ struct omap_volt_data omap443x_vdd_core_volt_data[] = {
 };
 
 #define OMAP4460_VDD_MPU_OPP50_UV		1025000
-#define OMAP4460_VDD_MPU_OPP100_UV		1200000
-#define OMAP4460_VDD_MPU_OPPTURBO_UV		1313000
-#define OMAP4460_VDD_MPU_OPPNITRO_UV		1375000
+#define OMAP4460_VDD_MPU_OPP100_UV		1203000
+#define OMAP4460_VDD_MPU_OPPTURBO_UV		1317000
+#define OMAP4460_VDD_MPU_OPPNITRO_UV		1380000
+#define OMAP4460_VDD_MPU_OPPNITROSB_UV		1390000
 
 struct omap_volt_data omap446x_vdd_mpu_volt_data[] = {
 	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPP50_UV, OMAP44XX_CONTROL_FUSE_MPU_OPP50, 0xf4, 0x0c),
 	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPP100_UV, OMAP44XX_CONTROL_FUSE_MPU_OPP100, 0xf9, 0x16),
 	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPPTURBO_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPTURBO, 0xfa, 0x23),
 	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPPNITRO_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPNITRO, 0xfa, 0x27),
+	VOLT_DATA_DEFINE(OMAP4460_VDD_MPU_OPPNITROSB_UV, OMAP44XX_CONTROL_FUSE_MPU_OPPNITROSB, 0xfa, 0x27),
 	VOLT_DATA_DEFINE(0, 0, 0, 0),
 };
 
-#define OMAP4460_VDD_IVA_OPP50_UV		1025000
-#define OMAP4460_VDD_IVA_OPP100_UV		1200000
-#define OMAP4460_VDD_IVA_OPPTURBO_UV		1313000
+#define OMAP4460_VDD_IVA_OPP50_UV		 950000
+#define OMAP4460_VDD_IVA_OPP100_UV		1140000
+#define OMAP4460_VDD_IVA_OPPTURBO_UV		1291000
 #define OMAP4460_VDD_IVA_OPPNITRO_UV		1375000
 
 struct omap_volt_data omap446x_vdd_iva_volt_data[] = {
@@ -91,8 +93,8 @@ struct omap_volt_data omap446x_vdd_iva_volt_data[] = {
 	VOLT_DATA_DEFINE(0, 0, 0, 0),
 };
 
-#define OMAP4460_VDD_CORE_OPP50_UV		1025000
-#define OMAP4460_VDD_CORE_OPP100_UV		1200000
+#define OMAP4460_VDD_CORE_OPP50_UV		 962000
+#define OMAP4460_VDD_CORE_OPP100_UV		1127000
 #define OMAP4460_VDD_CORE_OPP100_OV_UV		1250000
 
 struct omap_volt_data omap446x_vdd_core_volt_data[] = {
-- 
2.27.0
