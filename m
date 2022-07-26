Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1606F580F23
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jul 2022 10:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238545AbiGZIfC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jul 2022 04:35:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238555AbiGZIe5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jul 2022 04:34:57 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D2230F59
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:56 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id z23so24617523eju.8
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pwfHwwPoipMAt+FzM0J4eEZ+R+++ABQMXdscP1duHJc=;
        b=RojzscHVtblO/jXIKxk2zsGYbRnBE+fPkycy+qHV85a5fRXQAHoZltNwlJqBPiO4UA
         xMaIs2g1L1Gl7mOmnd4uXJNEPYhwFQpgjSleaOuAz+4OZYdpOl2aMGJ0MVmiksF4vKIg
         EPftgdjy2jFwFdEYGjUltZPfvKAVOAkm9rn+OCJXuoT0cq/5YJY1g0YC9BPy7zohBYNz
         E4tEcXZGLZbf2zsNdEY5hq5m6Gr+85BCYD5cZcW28IrY05JXkHmpRCi3e0UvQ2vZQDXH
         I21uUZH6/QVyHYncHgnu1Y68N6U3c0pPZx3t7gIsVumUkC+WV62edPKwWg1jb87VnXes
         pKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pwfHwwPoipMAt+FzM0J4eEZ+R+++ABQMXdscP1duHJc=;
        b=JFX6hYUegt+zVs1SFuezNFU22erKgltGTnmOtZAGoJonwoidtfCfa8RrfESmPY01GH
         paw2UadEdBBdG3H8OtCne4WxPkCEAoaGyWNBmt7wdTCglEn038Wv4rLYv7dT7K1spLkA
         Rn5vR6zY4YQF9cZ6/aAuxkCaVnlYLvq2OppysTGqXHxUvtFO+vBqnlOCdjKBYGg0ppra
         kTd1v+1Ay8xWHjJtW+8d8Ksh9G5rt4u2Ey56aSGZV/b6V2Y8l8e6fn6++dau3PjmXbCB
         no6JIQA8XgSbyLfaFO3P8D0QyTzAoRDv5215LKYFiGDutBKMcEJ5TpMDy1obX87Vwiom
         Ppiw==
X-Gm-Message-State: AJIora/zNP6MKPGFGE3Kq5Cv45mIh2yXdne+SCixL24QXzC18xwlzuE/
        /FZPF7KzDgWVRsQ9UrHh/pT8XH30uL4=
X-Google-Smtp-Source: AGRyM1vuuirCroPDafyOn3+ZsoPYl/7/F7ybSTsfF8KROgmC2wcokfqZflGOGpNw7Tw86dogKhh/Eg==
X-Received: by 2002:a17:906:dc95:b0:72f:ab47:1692 with SMTP id cs21-20020a170906dc9500b0072fab471692mr12919807ejc.319.1658824494510;
        Tue, 26 Jul 2022 01:34:54 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id rh9-20020a17090720e900b006f3ef214ddesm6171848ejb.68.2022.07.26.01.34.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jul 2022 01:34:54 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH v2 4/5] ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 8-port devices
Date:   Tue, 26 Jul 2022 10:34:43 +0200
Message-Id: <20220726083444.10159-4-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20220726083444.10159-1-yegorslists@googlemail.com>
References: <20220726083444.10159-1-yegorslists@googlemail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Add GPIO names for both SoC and TCA6416 lines.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v1 -> v2: no changes

 arch/arm/boot/dts/am335x-netcom-plus-8xx.dts | 156 +++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
index 96dffd3ffd85..ad3adc7679f9 100644
--- a/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
+++ b/arch/arm/boot/dts/am335x-netcom-plus-8xx.dts
@@ -71,6 +71,10 @@
 		interrupts = <20 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tca6416_pins>;
+		gpio-line-names = "GP_IN0", "GP_IN1", "GP_IN2", "GP_IN3",
+				  "GP_IN4", "GP_IN5", "GP_IN6", "GP_IN7",
+				  "GP_OUT0", "GP_OUT1", "GP_OUT2", "GP_OUT3",
+				  "GP_OUT4", "GP_OUT5", "GP_OUT6", "GP_OUT7";
 	};
 };
 
@@ -86,6 +90,10 @@
 		reg = <0x20>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "CH1_M0", "CH1_M1", "CH1_M2", "CH1_M3",
+				  "CH2_M0", "CH2_M1", "CH2_M2", "CH2_M3",
+				  "CH3_M0", "CH3_M1", "CH3_M2", "CH3_M3",
+				  "CH4_M0", "CH4_M1", "CH4_M2", "CH4_M3";
 	};
 
 	tca6416c: gpio@21 {
@@ -93,6 +101,10 @@
 		reg = <0x21>;
 		gpio-controller;
 		#gpio-cells = <2>;
+		gpio-line-names = "CH5_M0", "CH5_M1", "CH5_M2", "CH5_M3",
+				  "CH6_M0", "CH6_M1", "CH6_M2", "CH6_M3",
+				  "CH7_M0", "CH7_M1", "CH7_M2", "CH7_M3",
+				  "CH8_M0", "CH8_M1", "CH8_M2", "CH8_M3";
 	};
 };
 
@@ -113,3 +125,147 @@
 	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
 };
+
+&gpio0 {
+	gpio-line-names =
+		"MDIO",
+		"MDC",
+		"NC",
+		"NC",
+		"I2C1_SDA",
+		"I2C1_SCL",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"I2C2_SDA",
+		"I2C2_SCL",
+		"NC",
+		"NC",
+		"onrisc:blue:wlan",
+		"onrisc:green:app",
+		"USB0_DRVVBUS",
+		"ETH2_INT",
+		"NC",
+		"NC",
+		"MMC1_DAT0",
+		"MMC1_DAT1",
+		"NC",
+		"NC",
+		"MMC1_DAT2",
+		"MMC1_DAT3",
+		"NC",
+		"NC",
+		"GPMC_WAIT0",
+		"GPMC_WP_N";
+};
+
+&gpio1 {
+	gpio-line-names =
+		"GPMC_AD0",
+		"GPMC_AD1",
+		"GPMC_AD2",
+		"GPMC_AD3",
+		"GPMC_AD4",
+		"GPMC_AD5",
+		"GPMC_AD6",
+		"GPMC_AD7",
+		"NC",
+		"NC",
+		"CONSOLE_RX",
+		"CONSOLE_TX",
+		"SW2_0_alt",
+		"SW2_1_alt",
+		"SW2_2_alt",
+		"SW2_3_alt",
+		"RGMII2_TCTL",
+		"RGMII2_RCTL",
+		"RGMII2_TD3",
+		"RGMII2_TD2",
+		"RGMII2_TD1",
+		"RGMII2_TD0",
+		"RGMII2_TCLK",
+		"RGMII2_RCLK",
+		"RGMII2_RD3",
+		"RGMII2_RD2",
+		"RGMII2_RD1",
+		"RGMII2_RD0",
+		"PMIC_INT1",
+		"GPMC_CSN0_Flash",
+		"MMC1_CLK",
+		"MMC1_CMD";
+};
+
+&gpio2 {
+	gpio-line-names =
+		"GPMC_CSN3_BUS",
+		"GPMC_CLK",
+		"GPMC_ADVN_ALE",
+		"GPMC_OEN_RE_N",
+		"GPMC_WE_N",
+		"GPMC_BEN0_CLE",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"SW2_0",
+		"SW2_1",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"MMC0_DAT3",
+		"MMC0_DAT2",
+		"MMC0_DAT1",
+		"MMC0_DAT0",
+		"MMC0_CLK",
+		"MMC0_CMD";
+};
+
+&gpio3 {
+	gpio-line-names =
+		"onrisc:red:power",
+		"NC",
+		"NC",
+		"NC",
+		"3G_PWR_EN",
+		"NC",
+		"NC",
+		"WLAN_IRQ",
+		"WLAN_EN",
+		"SW2_2",
+		"SW2_3",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"NC";
+};
-- 
2.17.0

