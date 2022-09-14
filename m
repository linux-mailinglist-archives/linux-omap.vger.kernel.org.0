Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41F9C5B7F9F
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 05:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiINDqY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 23:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbiINDqU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 23:46:20 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D256AA28;
        Tue, 13 Sep 2022 20:46:19 -0700 (PDT)
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MS5mb16nzzHntJ;
        Wed, 14 Sep 2022 11:44:15 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 14 Sep 2022 11:46:16 +0800
From:   Gaosheng Cui <cuigaosheng1@huawei.com>
To:     <rostedt@goodmis.org>, <mingo@redhat.com>, <linux@armlinux.org.uk>,
        <tony@atomide.com>, <bcousson@baylibre.com>, <paul@pwsan.com>,
        <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
        <stefan@agner.ch>, <rmk+kernel@armlinux.org.uk>,
        <linus.walleij@linaro.org>, <broonie@kernel.org>,
        <sebastian.reichel@collabora.co.uk>, <cuigaosheng1@huawei.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH 1/3] ARM: OMAP2+: remove orphan declarations from omap2
Date:   Wed, 14 Sep 2022 11:46:13 +0800
Message-ID: <20220914034615.1240860-2-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914034615.1240860-1-cuigaosheng1@huawei.com>
References: <20220914034615.1240860-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove the following orphan declarations from omap_hwmod.h:
1. dra7xx_hwmod_init() was removed by
commit 54bc4edb3e52 ("ARM: OMAP2+: Drop legacy platform
data for dra7 hwmod").

2. omap44xx_hwmod_init() was removed by
commit 2584d7e7f87a ("ARM: OMAP2+: Drop legacy platform
data for omap4 hwmod").

3. am33xx_hwmod_init() was removed by
commit 68fc5990b8be ("ARM: OMAP2+: Drop legacy remaining
legacy platform data for am3").

4. omap_init_opp_table() was removed by
commit 99b3587debac ("ARM: OMAP2+: Remove unused legacy
code for opp").

5. omap2xxx_l4_core__timer2 was removed by
commit 64dbc3d55d60 ("ARM: dts: Configure system timers
for omap2").

6. omap_serial_board_init() and omap_serial_init_port() were
removed by commit f3b78f728955 ("ARM: OMAP2+: Remove legacy
serial.c").

7. omap3_gptimer_timer_init() and omap3_secure_sync32k_timer_init()
were removed by commit 2ee04b88547a ("ARM: OMAP2+: Drop old
timer code for dmtimer and 32k counter").

8. omap4_local_timer_init() was removed by
commit 036a3d42bb8f ("ARM: dts: Configure system timers for
omap5 and dra7").

9. usbhs_init_phys() was removed by
commit 9080b8dc761a ("ARM: OMAP2+: Remove legacy usb-host.c
platform init code").

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/arm/mach-omap2/common.h                 | 3 ---
 arch/arm/mach-omap2/omap_hwmod.h             | 3 ---
 arch/arm/mach-omap2/omap_hwmod_common_data.h | 1 -
 arch/arm/mach-omap2/omap_opp_data.h          | 5 -----
 arch/arm/mach-omap2/serial.h                 | 3 ---
 arch/arm/mach-omap2/usb.h                    | 1 -
 6 files changed, 16 deletions(-)

diff --git a/arch/arm/mach-omap2/common.h b/arch/arm/mach-omap2/common.h
index bd5981945239..a402b4931a65 100644
--- a/arch/arm/mach-omap2/common.h
+++ b/arch/arm/mach-omap2/common.h
@@ -93,9 +93,6 @@ static inline int amx3_common_pm_init(void)
 extern void omap2_init_common_infrastructure(void);
 
 extern void omap_init_time(void);
-extern void omap3_secure_sync32k_timer_init(void);
-extern void omap3_gptimer_timer_init(void);
-extern void omap4_local_timer_init(void);
 #ifdef CONFIG_CACHE_L2X0
 int omap_l2_cache_init(void);
 #define OMAP_L2C_AUX_CTRL	(L2C_AUX_CTRL_SHARED_OVERRIDE | \
diff --git a/arch/arm/mach-omap2/omap_hwmod.h b/arch/arm/mach-omap2/omap_hwmod.h
index 6962a8d267e7..7fd4231667ec 100644
--- a/arch/arm/mach-omap2/omap_hwmod.h
+++ b/arch/arm/mach-omap2/omap_hwmod.h
@@ -683,11 +683,8 @@ void omap_hwmod_rtc_lock(struct omap_hwmod *oh);
 extern int omap2420_hwmod_init(void);
 extern int omap2430_hwmod_init(void);
 extern int omap3xxx_hwmod_init(void);
-extern int omap44xx_hwmod_init(void);
-extern int am33xx_hwmod_init(void);
 extern int dm814x_hwmod_init(void);
 extern int dm816x_hwmod_init(void);
-extern int dra7xx_hwmod_init(void);
 int am43xx_hwmod_init(void);
 
 extern int __init omap_hwmod_register_links(struct omap_hwmod_ocp_if **ois);
diff --git a/arch/arm/mach-omap2/omap_hwmod_common_data.h b/arch/arm/mach-omap2/omap_hwmod_common_data.h
index 0045e6680a63..f64e73e4c21f 100644
--- a/arch/arm/mach-omap2/omap_hwmod_common_data.h
+++ b/arch/arm/mach-omap2/omap_hwmod_common_data.h
@@ -60,7 +60,6 @@ extern struct omap_hwmod_ocp_if omap2_l4_core__uart2;
 extern struct omap_hwmod_ocp_if omap2_l4_core__uart3;
 extern struct omap_hwmod_ocp_if omap2xxx_l4_core__mcspi1;
 extern struct omap_hwmod_ocp_if omap2xxx_l4_core__mcspi2;
-extern struct omap_hwmod_ocp_if omap2xxx_l4_core__timer2;
 extern struct omap_hwmod_ocp_if omap2xxx_l4_core__timer3;
 extern struct omap_hwmod_ocp_if omap2xxx_l4_core__timer4;
 extern struct omap_hwmod_ocp_if omap2xxx_l4_core__timer5;
diff --git a/arch/arm/mach-omap2/omap_opp_data.h b/arch/arm/mach-omap2/omap_opp_data.h
index 88375ab38e31..ed84fe95e857 100644
--- a/arch/arm/mach-omap2/omap_opp_data.h
+++ b/arch/arm/mach-omap2/omap_opp_data.h
@@ -71,11 +71,6 @@ struct omap_opp_def {
 	.vp_errgain	= _errgain				       \
 }
 
-/* Use this to initialize the default table */
-extern int __init omap_init_opp_table(struct omap_opp_def *opp_def,
-		u32 opp_def_size);
-
-
 extern struct omap_volt_data omap34xx_vddmpu_volt_data[];
 extern struct omap_volt_data omap34xx_vddcore_volt_data[];
 extern struct omap_volt_data omap36xx_vddmpu_volt_data[];
diff --git a/arch/arm/mach-omap2/serial.h b/arch/arm/mach-omap2/serial.h
index 7ca1fcff453b..1bfe67e0e93d 100644
--- a/arch/arm/mach-omap2/serial.h
+++ b/arch/arm/mach-omap2/serial.h
@@ -60,7 +60,4 @@ struct omap_board_data;
 struct omap_uart_port_info;
 
 extern void omap_serial_init(void);
-extern void omap_serial_board_init(struct omap_uart_port_info *platform_data);
-extern void omap_serial_init_port(struct omap_board_data *bdata,
-		struct omap_uart_port_info *platform_data);
 #endif
diff --git a/arch/arm/mach-omap2/usb.h b/arch/arm/mach-omap2/usb.h
index 740a499befce..b570bc8fac2f 100644
--- a/arch/arm/mach-omap2/usb.h
+++ b/arch/arm/mach-omap2/usb.h
@@ -63,7 +63,6 @@ struct usbhs_phy_data {
 
 extern void usb_musb_init(struct omap_musb_board_data *board_data);
 extern void usbhs_init(struct usbhs_omap_platform_data *pdata);
-extern int usbhs_init_phys(struct usbhs_phy_data *phy, int num_phys);
 
 extern void am35x_musb_reset(void);
 extern void am35x_musb_phy_power(u8 on);
-- 
2.25.1

