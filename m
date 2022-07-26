Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3639580F20
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jul 2022 10:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbiGZIe4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jul 2022 04:34:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238545AbiGZIey (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jul 2022 04:34:54 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E46730F7F
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:51 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id b11so24787751eju.10
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=oxMe95mJDdFDKShhYpfA9lzs8EwLfAxOTaV/SZ2cGj8=;
        b=RuPRvjVDr243qHFB+DFAuEyxk14SEA5UDc8BvTBUwPI5l/mBZ9DHxgs+FtGl8er2pd
         ZGOVW4OHkjrO5ufMLwKbccKh8KGBAl5VypK4aCxEpF6HoqTJgGBuueOyzcRRv9cDevSo
         nMYhkt4ihxyQ2GJDxBdO6F05p3J/pAmJ0DDArIvd3YhZF29z/P4pnt75DAwnO+HuIVIU
         MHwqQZ9eeLPYRrq5kxCWJiS+3GP48ppevxu+Yyq7xIYT0IxGVW51mXIsFOgZe3hdALd6
         F4ZLB4KYiqrIpdy/HuRwPENgnHoqxrCG6MGFaVgEy1kmCKUz7/jfG96X7n9V5DaPJKkt
         ZTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oxMe95mJDdFDKShhYpfA9lzs8EwLfAxOTaV/SZ2cGj8=;
        b=D7nNHpMWnMcmfZprm4cC4wT3uxm3AmG5+STrYL5DjDosIbueQHe2eBLikUKb7/dXe8
         Pwrr6Uk4NqTdmw3xz8TDC961ccPvTk+q9LkliA1qgfV2nqhCy6znjQmmH246Ui2Y4XJp
         2xoGYRTuPGfkMJVhNy1A36v+esqDCbMAiDf0/L95jXv/kTMlv40i2bK67rcOzHnkTl3j
         VPJ+9LSmB6eH26+fEb8OtgXV0ON9gYiLEqogqUobcx8hoFIf6nJWlZdv9rh59UoEIkLy
         GoUpHSuV3ngXDCTKZnGpZtuAUvHwlqM4sj2/xc3nmoBGr0B/8fhrjQCY8bVKIX16OnyI
         uRLg==
X-Gm-Message-State: AJIora+6HLkDXq1og/JipTPO6zIoaIuEze81JK1k0cTvIBvmlbZpMA5N
        oF779btp4kjdDEoKow+ySz85Z7R0OZA=
X-Google-Smtp-Source: AGRyM1vi90HuBYRRzfZbzVpLZqd5zgVEWpDcn104eJ7yKF47+ghkkFhCBRF8o9DSHTGFtiX2X4T+vg==
X-Received: by 2002:a17:907:a0c7:b0:72f:b205:112 with SMTP id hw7-20020a170907a0c700b0072fb2050112mr12958030ejc.559.1658824489828;
        Tue, 26 Jul 2022 01:34:49 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id rh9-20020a17090720e900b006f3ef214ddesm6171848ejb.68.2022.07.26.01.34.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jul 2022 01:34:49 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH v2 1/5] ARM: dts: am335x-baltos: add GPIO names for ir3220 and ir5221 devices
Date:   Tue, 26 Jul 2022 10:34:40 +0200
Message-Id: <20220726083444.10159-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no
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

 arch/arm/boot/dts/am335x-baltos-ir3220.dts | 148 +++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir5221.dts | 148 +++++++++++++++++++++
 2 files changed, 296 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index 2123bd589484..087e084506d2 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir3220.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
@@ -91,6 +91,10 @@
 		interrupts = <20 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tca6416_pins>;
+		gpio-line-names = "GP_IN0", "GP_IN1", "GP_IN2", "GP_IN3",
+				  "GP_OUT0", "GP_OUT1", "GP_OUT2", "GP_OUT3",
+				  "ModeA0", "ModeA1", "ModeA2", "ModeA3",
+				  "ModeB0", "ModeB1", "ModeB2", "ModeB3";
 	};
 };
 
@@ -123,3 +127,147 @@
 	pinctrl-0 = <&mmc1_pins>;
 	cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
 };
+
+&gpio0 {
+	gpio-line-names =
+		"MDIO",
+		"MDC",
+		"UART2_RX",
+		"UART2_TX",
+		"I2C1_SDA",
+		"I2C1_SCL",
+		"WLAN_BTN",
+		"W_DISABLE",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"UART1_CTSN",
+		"UART1_RTSN",
+		"UART1_RX",
+		"UART1_TX",
+		"onrisc:blue:wlan",
+		"onrisc:green:app",
+		"USB0_DRVVBUS",
+		"ETH2_INT",
+		"TCA6416_INT",
+		"RMII1_TXD1",
+		"MMC1_DAT0",
+		"MMC1_DAT1",
+		"NC",
+		"NC",
+		"MMC1_DAT2",
+		"MMC1_DAT3",
+		"RMII1_TXD0",
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
+		"UART2_DTR",
+		"UART2_DSR",
+		"UART2_DCD",
+		"UART2_RI",
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
+		"SD_CD",
+		"SD_WP",
+		"RMII1_RXD1",
+		"RMII1_RXD0",
+		"UART1_DTR",
+		"UART1_DSR",
+		"UART1_DCD",
+		"UART1_RI",
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
+		"RMII1_CRS_DV",
+		"RMII1_RXER",
+		"RMII1_TXEN",
+		"3G_PWR_EN",
+		"UART2_CTSN",
+		"UART2_RTSN",
+		"WLAN_IRQ",
+		"WLAN_EN",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"USB1_DRVVBUS",
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
diff --git a/arch/arm/boot/dts/am335x-baltos-ir5221.dts b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
index 2f3872dbf4f4..faeb39aab60a 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir5221.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir5221.dts
@@ -99,6 +99,10 @@
 		interrupts = <20 IRQ_TYPE_EDGE_RISING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&tca6416_pins>;
+		gpio-line-names = "GP_IN0", "GP_IN1", "GP_IN2", "GP_IN3",
+				  "GP_OUT0", "GP_OUT1", "GP_OUT2", "GP_OUT3",
+				  "ModeA0", "ModeA1", "ModeA2", "ModeA3",
+				  "ModeB0", "ModeB1", "ModeB2", "ModeB3";
 	};
 };
 
@@ -147,3 +151,147 @@
 	pinctrl-0 = <&mmc1_pins>;
 	cd-gpios = <&gpio2 18 GPIO_ACTIVE_LOW>;
 };
+
+&gpio0 {
+	gpio-line-names =
+		"MDIO",
+		"MDC",
+		"UART2_RX",
+		"UART2_TX",
+		"I2C1_SDA",
+		"I2C1_SCL",
+		"WLAN_BTN",
+		"W_DISABLE",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"UART1_CTSN",
+		"UART1_RTSN",
+		"UART1_RX",
+		"UART1_TX",
+		"onrisc:blue:wlan",
+		"onrisc:green:app",
+		"USB0_DRVVBUS",
+		"ETH2_INT",
+		"TCA6416_INT",
+		"RMII1_TXD1",
+		"MMC1_DAT0",
+		"MMC1_DAT1",
+		"NC",
+		"NC",
+		"MMC1_DAT2",
+		"MMC1_DAT3",
+		"RMII1_TXD0",
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
+		"DCAN1_TX",
+		"DCAN1_RX",
+		"CONSOLE_RX",
+		"CONSOLE_TX",
+		"UART2_DTR",
+		"UART2_DSR",
+		"UART2_DCD",
+		"UART2_RI",
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
+		"SD_CD",
+		"SD_WP",
+		"RMII1_RXD1",
+		"RMII1_RXD0",
+		"UART1_DTR",
+		"UART1_DSR",
+		"UART1_DCD",
+		"UART1_RI",
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
+		"RMII1_CRS_DV",
+		"RMII1_RXER",
+		"RMII1_TXEN",
+		"3G_PWR_EN",
+		"UART2_CTSN",
+		"UART2_RTSN",
+		"WLAN_IRQ",
+		"WLAN_EN",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"USB1_DRVVBUS",
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

