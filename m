Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C731FCB8B
	for <lists+linux-omap@lfdr.de>; Wed, 17 Jun 2020 12:58:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgFQK6x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 Jun 2020 06:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725964AbgFQK6w (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 Jun 2020 06:58:52 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CD7AC061573;
        Wed, 17 Jun 2020 03:58:52 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id t9so2151222ioj.13;
        Wed, 17 Jun 2020 03:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxVn3H7ApYz8vWif68BPp34H///ZtB/ukWPL5m2+yH4=;
        b=fP8lJR6BfimMtJ+TIxIyO7j0peG6PnIG1Up4/NdSC55WGXsK+lQkOHobB1WulLYmJ/
         EJIzoxKpozvEwYSXXYp+LmtivDLQKBO+jY+0D70whboDt9CG7TH6RxsQ28uNkwHbwZSO
         SPzkunITyA96XCitL0xEwUVvTZYNOYCMZQfsPViVWCtouMG0NsM7tcqpPyKUdYD1C6kP
         2ezfkC04p/MUfGqTgulR1dX/RItTN+ApL0ZSF5cO4kEhsQ8SKtZv7xA/nUpYDBOAC5hP
         pjD1tsorsfMOEGsnJrb56TWUpbLd6Coc/SihVgnW+Zag60GnJIEYtcFtzQCx4/M/JSSq
         Qh5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cxVn3H7ApYz8vWif68BPp34H///ZtB/ukWPL5m2+yH4=;
        b=mtOPdINvgRcErURuMTvToUwUvSIHxP5TRBU1FsCtMOjkg3YDgBss0f9JjmT+Ec2u+Z
         y2k7EePnHR17dxe+WmNJHOkCMhHx2gz5nKVEFcdfPhT1+SCxOB3Wuu3eXh+QI9UgV8XQ
         SiLsoGhIXeGEVwI6jZG3O0cYOh0yI2dYiWe6WiDattw/rJvvsdrIRkeod/u6YIq9da9g
         UX0iiWaD/FyvzkkNHlsImjXF4Q0uRpaJfrDU8+zHQ4Cr072uWG1NSDGGWms+6Yv/fVwa
         MT8SgFzRNqYPS20oXNHqKGhhzYpIL5xkoZ7Ak6sE5SO9CDStgcLV7U7Oq9JN91xZzjPv
         Djrg==
X-Gm-Message-State: AOAM533OtjxfHFKngtMZKkCrBYF7MgIo6LmBPJ4dVxk8ditiQFFL87bX
        /1enagyJ2ajG6NAmhq9pGschq5xW3oo=
X-Google-Smtp-Source: ABdhPJymwEQ9s0x9W06dBJhzO3V7m55SUhpi5g3msQyqJQ/h5l0aiAdHsG8drY69Uf0/zhy1Lf5/Ug==
X-Received: by 2002:a05:6638:5b9:: with SMTP id b25mr29016622jar.68.1592391531332;
        Wed, 17 Jun 2020 03:58:51 -0700 (PDT)
Received: from localhost.localdomain (c-73-37-219-234.hsd1.mn.comcast.net. [73.37.219.234])
        by smtp.gmail.com with ESMTPSA id n17sm11166274ilq.13.2020.06.17.03.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 03:58:50 -0700 (PDT)
From:   Adam Ford <aford173@gmail.com>
To:     linux-omap@vger.kernel.org
Cc:     aford@beaconembedded.com, Adam Ford <aford173@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: omap3: Migrate AES from hwmods to sysc-omap2
Date:   Wed, 17 Jun 2020 05:58:40 -0500
Message-Id: <20200617105840.22138-1-aford173@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Various OMAP3 boards have two AES blocks, but only one is currently
available, because the hwmods are only configured for one.

This patch migrates the hwmods for the AES engine to sysc-omap2
which allows the second AES crypto engine to become available.

  omap-aes 480a6000.aes1: OMAP AES hw accel rev: 2.6
  omap-aes 480a6000.aes1: will run requests pump with realtime priority
  omap-aes 480c5000.aes2: OMAP AES hw accel rev: 2.6
  omap-aes 480c5000.aes2: will run requests pump with realtime priority

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Fix DMA for AES1, and remove from AM3517.

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index dc8927f14b6c..6be310968c3a 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -10,6 +10,9 @@
 
 #include "omap3.dtsi"
 
+/* AM3517 doesn't appear to have the crypto engines defined in omap3.dtsi */
+/delete-node/ &aes1_target;
+
 / {
 	aliases {
 		serial3 = &uart4;
diff --git a/arch/arm/boot/dts/omap3.dtsi b/arch/arm/boot/dts/omap3.dtsi
index 1296d0643943..6e874ed64009 100644
--- a/arch/arm/boot/dts/omap3.dtsi
+++ b/arch/arm/boot/dts/omap3.dtsi
@@ -157,13 +157,56 @@ omap3_pmx_wkup: pinmux@a00 {
 			};
 		};
 
-		aes: aes@480c5000 {
-			compatible = "ti,omap3-aes";
-			ti,hwmods = "aes";
-			reg = <0x480c5000 0x50>;
-			interrupts = <0>;
-			dmas = <&sdma 65 &sdma 66>;
-			dma-names = "tx", "rx";
+		aes1_target: target-module@480a6000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x480a6044 0x4>,
+			      <0x480a6048 0x4>,
+			      <0x480a604c 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&aes1_ick>;
+			clock-names = "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x480a6000 0x2000>;
+
+			aes1: aes1@0 {
+				compatible = "ti,omap3-aes";
+				reg = <0 0x50>;
+				interrupts = <0>;
+				dmas = <&sdma 9 &sdma 10>;
+				dma-names = "tx", "rx";
+			};
+		};
+
+		aes2_target: target-module@480c5000 {
+			compatible = "ti,sysc-omap2", "ti,sysc";
+			reg = <0x480c5044 0x4>,
+			      <0x480c5048 0x4>,
+			      <0x480c504c 0x4>;
+			reg-names = "rev", "sysc", "syss";
+			ti,sysc-mask = <(SYSC_OMAP2_AUTOIDLE)>;
+			ti,sysc-sidle = <SYSC_IDLE_FORCE>,
+					<SYSC_IDLE_NO>,
+					<SYSC_IDLE_SMART>;
+			ti,syss-mask = <1>;
+			clocks = <&aes2_ick>;
+			clock-names = "ick";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x480c5000 0x2000>;
+
+			aes2: aes2@0 {
+				compatible = "ti,omap3-aes";
+				reg = <0 0x50>;
+				interrupts = <0>;
+				dmas = <&sdma 65 &sdma 66>;
+				dma-names = "tx", "rx";
+			};
 		};
 
 		prm: prm@48306000 {
diff --git a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
index ca02f91237e3..b6c7d98a9eff 100644
--- a/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
+++ b/arch/arm/mach-omap2/omap_hwmod_3xxx_data.c
@@ -2342,44 +2342,6 @@ static struct omap_hwmod_ocp_if omap3xxx_l4_core__sham = {
 	.user		= OCP_USER_MPU | OCP_USER_SDMA,
 };
 
-/* l4_core -> AES */
-static struct omap_hwmod_class_sysconfig omap3_aes_sysc = {
-	.rev_offs	= 0x44,
-	.sysc_offs	= 0x48,
-	.syss_offs	= 0x4c,
-	.sysc_flags	= (SYSC_HAS_SIDLEMODE | SYSC_HAS_SOFTRESET |
-			   SYSC_HAS_AUTOIDLE | SYSS_HAS_RESET_STATUS),
-	.idlemodes	= (SIDLE_FORCE | SIDLE_NO | SIDLE_SMART),
-	.sysc_fields	= &omap3xxx_aes_sysc_fields,
-};
-
-static struct omap_hwmod_class omap3xxx_aes_class = {
-	.name	= "aes",
-	.sysc	= &omap3_aes_sysc,
-};
-
-
-static struct omap_hwmod omap3xxx_aes_hwmod = {
-	.name		= "aes",
-	.main_clk	= "aes2_ick",
-	.prcm		= {
-		.omap2 = {
-			.module_offs = CORE_MOD,
-			.idlest_reg_id = 1,
-			.idlest_idle_bit = OMAP3430_ST_AES2_SHIFT,
-		},
-	},
-	.class		= &omap3xxx_aes_class,
-};
-
-
-static struct omap_hwmod_ocp_if omap3xxx_l4_core__aes = {
-	.master		= &omap3xxx_l4_core_hwmod,
-	.slave		= &omap3xxx_aes_hwmod,
-	.clk		= "aes2_ick",
-	.user		= OCP_USER_MPU | OCP_USER_SDMA,
-};
-
 /*
  * 'ssi' class
  * synchronous serial interface (multichannel and full-duplex serial if)
@@ -2473,20 +2435,11 @@ static struct omap_hwmod_ocp_if *omap34xx_sham_hwmod_ocp_ifs[] __initdata = {
 	NULL,
 };
 
-static struct omap_hwmod_ocp_if *omap34xx_aes_hwmod_ocp_ifs[] __initdata = {
-	&omap3xxx_l4_core__aes,
-	NULL,
-};
-
 static struct omap_hwmod_ocp_if *omap36xx_sham_hwmod_ocp_ifs[] __initdata = {
 	&omap3xxx_l4_core__sham,
 	NULL
 };
 
-static struct omap_hwmod_ocp_if *omap36xx_aes_hwmod_ocp_ifs[] __initdata = {
-	&omap3xxx_l4_core__aes,
-	NULL
-};
 
 /*
  * Apparently the SHA/MD5 and AES accelerator IP blocks are
@@ -2501,11 +2454,6 @@ static struct omap_hwmod_ocp_if *am35xx_sham_hwmod_ocp_ifs[] __initdata = {
 	NULL
 };
 
-static struct omap_hwmod_ocp_if *am35xx_aes_hwmod_ocp_ifs[] __initdata = {
-	/* &omap3xxx_l4_core__aes, */
-	NULL,
-};
-
 /* 3430ES1-only hwmod links */
 static struct omap_hwmod_ocp_if *omap3430es1_hwmod_ocp_ifs[] __initdata = {
 	&omap3430es1_dss__l3,
@@ -2641,7 +2589,6 @@ int __init omap3xxx_hwmod_init(void)
 {
 	int r;
 	struct omap_hwmod_ocp_if **h = NULL, **h_sham = NULL;
-	struct omap_hwmod_ocp_if **h_aes = NULL;
 	struct device_node *bus;
 	unsigned int rev;
 
@@ -2664,16 +2611,13 @@ int __init omap3xxx_hwmod_init(void)
 	    rev == OMAP3430_REV_ES3_1 || rev == OMAP3430_REV_ES3_1_2) {
 		h = omap34xx_hwmod_ocp_ifs;
 		h_sham = omap34xx_sham_hwmod_ocp_ifs;
-		h_aes = omap34xx_aes_hwmod_ocp_ifs;
 	} else if (rev == AM35XX_REV_ES1_0 || rev == AM35XX_REV_ES1_1) {
 		h = am35xx_hwmod_ocp_ifs;
 		h_sham = am35xx_sham_hwmod_ocp_ifs;
-		h_aes = am35xx_aes_hwmod_ocp_ifs;
 	} else if (rev == OMAP3630_REV_ES1_0 || rev == OMAP3630_REV_ES1_1 ||
 		   rev == OMAP3630_REV_ES1_2) {
 		h = omap36xx_hwmod_ocp_ifs;
 		h_sham = omap36xx_sham_hwmod_ocp_ifs;
-		h_aes = omap36xx_aes_hwmod_ocp_ifs;
 	} else {
 		WARN(1, "OMAP3 hwmod family init: unknown chip type\n");
 		return -EINVAL;
@@ -2696,11 +2640,6 @@ int __init omap3xxx_hwmod_init(void)
 			goto put_node;
 	}
 
-	if (h_aes && omap3xxx_hwmod_is_hs_ip_block_usable(bus, "aes")) {
-		r = omap_hwmod_register_links(h_aes);
-		if (r < 0)
-			goto put_node;
-	}
 	of_node_put(bus);
 
 	/*
-- 
2.25.1

