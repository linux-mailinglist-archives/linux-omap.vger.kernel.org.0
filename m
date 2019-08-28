Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3648CA057B
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 17:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbfH1PBR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 11:01:17 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:34427 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726394AbfH1PBR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Aug 2019 11:01:17 -0400
Received: by mail-io1-f68.google.com with SMTP id s21so225724ioa.1;
        Wed, 28 Aug 2019 08:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=I02anmGj4S9YRqFAlcHCi6doUcoEtL7IRdbmX6PMidk=;
        b=W937E6M1/3aGD86pktze21hmWXVXnR5Q1jTQYOIHz1ME1/HCzrY4VoLPr5bXDtptJM
         l0G6n8SS33Mt41/3NqSVimzOzaiY0ANI2qstCIZWvakBAlcoP8hjPT1DDEyGaiA2QagU
         UzzcpZ5i3UKA8PAIn10G2nT0JEhoadrZCz2kGZ+uiAZygn3yuDmE1nOoX6E1VOethwtK
         SmziPGXcE/lAKu8nANcYsI1cezKhsmDfl1nxPTtn0IUOkmZmNBvLj4iSxGmPY1HyDlWN
         MllmQVzai4Fo2qjjLQx8duDt0QjTJ+6tUF8BPjUKEgRq4ypEJd+K+oF5ew4jsCp9kgvK
         Xwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=I02anmGj4S9YRqFAlcHCi6doUcoEtL7IRdbmX6PMidk=;
        b=kiPULo+g9fxgSV0Px26qv/FSTjm5E1QVcaHplyE2nS3z9V/F8IiRHRXG5op1jUaR2J
         BKLv//nifb05d/i5TFcptEN0SjL27eXP1Br5MJjkVeeVrnPAzCQ8rZBhBpL3EM4cuDCZ
         auYAree8kRmqAIOcpVIo8Wofmhta7pqZ44C/ts/PbktSMpTu623z8TaJUJFa98yEqxNS
         rKwOe02ftA0KncBaExpgNO08X1TiwbIXs3GyDYfyVvWrvt6rpJCyG6UxwDOipg5QCeuG
         WJ4cL/Jvo8r5lu2QjMP63TasH0FueUfhOHaLN5fXxoNNe8ZMdd4HxFMH3UlPX1iuVtLe
         D/VA==
X-Gm-Message-State: APjAAAVoOGXo0KhsetWWb6LqYNTmQgevHpq/sL/c/CL7Q6nvdY8DJpaS
        mJB0nHVbsgqoCOx6b4lvpNH0lAP1ksxLKQ==
X-Google-Smtp-Source: APXvYqx5Aj1D6vL8dP3t9chNG93WuIFnEzdvfmVcbvK2YhKl8QfZue87AJSXNER131BK/7+PXrFCFQ==
X-Received: by 2002:a5e:c101:: with SMTP id v1mr4819198iol.231.1567004475549;
        Wed, 28 Aug 2019 08:01:15 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id i10sm2291519ioq.51.2019.08.28.08.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 08:01:14 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     pali.rohar@gmail.com, t-kristo@ti.com, aaro.koskinen@iki.fi,
        adam.ford@logicpd.com, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
Date:   Wed, 28 Aug 2019 10:00:37 -0500
Message-Id: <20190828150037.2640-1-aford173@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The datasheet for the AM3517 shows the RNG is connected to L4.
It shows the module address for the RNG is 0x480A0000, and it
matches the omap2.dtsi description.  Since the driver can support
omap2 and omap4, it seems reasonable to assume the omap3 would
use the same core for the RNG.

This RFC, mimics much of the omap2 hwmods on the OMAP3. It
also adds the necessary clock for driving the RNG.  Unfortunately,
it appears non-functional.  If anyone has any suggestions on how
to finish the hwmod (or port it to the newer l4 device tree
format), feedback is requested.

Currently the hwmods repond as follows:

[    0.245697] omap_hwmod: rng: _wait_target_ready failed: -22
[    0.245727] omap_hwmod: rng: cannot be enabled for reset (3)
[    6.780792] omap_hwmod: rng: _wait_target_ready failed: -22

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
index 945537aee3ca..05891dff7fa1 100644
--- a/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
+++ b/arch/arm/boot/dts/omap36xx-omap3430es2plus-clocks.dtsi
@@ -189,7 +189,7 @@
 			 <&mcspi2_ick>, <&mcspi1_ick>, <&i2c3_ick>, <&i2c2_ick>,
 			 <&i2c1_ick>, <&uart2_ick>, <&uart1_ick>, <&gpt11_ick>,
 			 <&gpt10_ick>, <&mcbsp5_ick>, <&mcbsp1_ick>,
-			 <&omapctrl_ick>, <&aes2_ick>, <&sha12_ick>,
+			 <&omapctrl_ick>, <&aes2_ick>, <&sha12_ick>, <&rng_ick>,
 			 <&ssi_ick>;
 	};
 };
diff --git a/arch/arm/mach-omap2/cm-regbits-34xx.h b/arch/arm/mach-omap2/cm-regbits-34xx.h
index 037529a9e969..82330a66e35c 100644
--- a/arch/arm/mach-omap2/cm-regbits-34xx.h
+++ b/arch/arm/mach-omap2/cm-regbits-34xx.h
@@ -17,6 +17,7 @@
 #define OMAP3430_CLKACTIVITY_IVA2_MASK			(1 << 0)
 #define OMAP3430_CLKTRCTRL_MPU_MASK			(0x3 << 0)
 #define OMAP3430_ST_AES2_SHIFT				28
+#define OMAP34XX_ST_RNG_SHIFT                           2
 #define OMAP3430_ST_SHA12_SHIFT				27
 #define AM35XX_ST_UART4_SHIFT				23
 #define OMAP3430_ST_HDQ_SHIFT				22
diff --git a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
index f52438bdfc14..bae4487383b6 100644
--- a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
@@ -1627,6 +1627,42 @@ static struct omap_hwmod omap3xxx_gpmc_hwmod = {
 	.flags		= HWMOD_NO_IDLEST | DEBUG_OMAP_GPMC_HWMOD_FLAGS,
 };
 
+/* RNG */
+
+static struct omap_hwmod_class_sysconfig omap3_rng_sysc = {
+	.rev_offs	= 0x3c,
+	.sysc_offs	= 0x40,
+	.syss_offs	= 0x44,
+	.sysc_flags	= (SYSC_HAS_SOFTRESET | SYSC_HAS_AUTOIDLE |
+			   SYSS_HAS_RESET_STATUS),
+	.sysc_fields	= &omap_hwmod_sysc_type1,
+};
+
+static struct omap_hwmod_class omap3_rng_hwmod_class = {
+	.name		= "rng",
+	.sysc		= &omap3_rng_sysc,
+};
+
+struct omap_hwmod omap3xxx_rng_hwmod = {
+	.name		= "rng",
+	.main_clk	= "rng_ick",
+	.prcm		= {
+		.omap2 = {
+			.module_offs = CORE_MOD,
+			.idlest_reg_id = 4,
+			.idlest_idle_bit = OMAP34XX_ST_RNG_SHIFT,
+		},
+	},
+	/*
+	 * XXX The first read from the SYSSTATUS register of the RNG
+	 * after the SYSCONFIG SOFTRESET bit is set triggers an
+	 * imprecise external abort.  It's unclear why this happens.
+	 * Until this is analyzed, skip the IP block reset.
+	 */
+	.flags		= HWMOD_INIT_NO_RESET,
+	.class		= &omap3_rng_hwmod_class,
+};
+
 /*
  * interfaces
  */
@@ -2508,6 +2544,13 @@ static struct omap_hwmod omap3xxx_sham_hwmod = {
 	.class		= &omap3xxx_sham_class,
 };
 
+/* l4_core -> rng */
+struct omap_hwmod_ocp_if omap3xxx_l4_core__rng = {
+	.master		= &omap3xxx_l4_core_hwmod,
+	.slave		= &omap3xxx_rng_hwmod,
+	.clk		= "rng_ick",
+	.user		= OCP_USER_MPU | OCP_USER_SDMA,
+};
 
 static struct omap_hwmod_ocp_if omap3xxx_l4_core__sham = {
 	.master		= &omap3xxx_l4_core_hwmod,
@@ -2769,6 +2812,7 @@ static struct omap_hwmod_ocp_if *omap36xx_hwmod_ocp_ifs[] __initdata = {
 	&omap3xxx_l4_core__mmu_isp,
 	&omap3xxx_l3_main__mmu_iva,
 	&omap3xxx_l4_core__ssi,
+	&omap3xxx_l4_core__rng,
 	NULL,
 };
 
@@ -2788,6 +2832,7 @@ static struct omap_hwmod_ocp_if *am35xx_hwmod_ocp_ifs[] __initdata = {
 	&am35xx_l4_core__mdio,
 	&am35xx_emac__l3,
 	&am35xx_l4_core__emac,
+	&omap3xxx_l4_core__rng,
 	NULL,
 };
 
-- 
2.17.1

