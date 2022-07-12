Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 657BE5712EB
	for <lists+linux-omap@lfdr.de>; Tue, 12 Jul 2022 09:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiGLHRD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Jul 2022 03:17:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbiGLHRC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Jul 2022 03:17:02 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788C576EB2
        for <linux-omap@vger.kernel.org>; Tue, 12 Jul 2022 00:17:01 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id os14so12731855ejb.4
        for <linux-omap@vger.kernel.org>; Tue, 12 Jul 2022 00:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=RFfitq6HdlB5eRkLMEXX672qKEcEEuQx2GKCLfLdA80=;
        b=evZvmixHeBQa/c9DGx6qlgjG8peS5LwJXge41WgKWQSVmwSvk8AuVJEFtsaD86OzuL
         vGql05AiyPTn1P3oPkN91GKi+GQLBWjiABmC2ScIYRU9u9TBkGPY1hZgLq1fSWWBzadd
         XrzQkL4YEbCLYSUXkGsS06WXZOnZkV46dhGJXXVnz/BTZ8NSZzy8Cf8Bv5LMyGARUCw1
         4kgq8ryfjxr/dxblZAVY1W569HnA5cKUOrevEjGli2FgU62XYoTmwPkW4ctztjl3lqFj
         /TGz2uAsOIZeKmsmFezpsD4KC49OegalnY0RFSjttUYE4QUFei0PX9rezY7mT/DTqL3k
         HnBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=RFfitq6HdlB5eRkLMEXX672qKEcEEuQx2GKCLfLdA80=;
        b=mwdF6Hkn/qCmcmYO1eW2eq9vtkxMFWs04UG+2AoWKbkiw8y2xVQ8+ucL7Jz94uF+oX
         YpSnjGqF+seSngN0/J4ROvQxupskepvKRIbam1RfB52xkLKbPXPUWbwSlsfb3Or9Ph7S
         JZuraIvlpLreLZWXO2bEwdqSB2M6NqQaADvEzJsjYuRLOev+joAd3ztVA0PHsmVo+WQf
         KVnIM9Gk5CWAGOBaVPm2fmxNcy5EHtnwaWoXR5yDQB1HyILrl0kFypNtRsaKldMZauI0
         8mO5nfey+XBt4fESVvailmZkR8sPogOsMISuvpZzeZH+3EU3ZnVNZsf+T59rT3WOAOHv
         PfdA==
X-Gm-Message-State: AJIora/JGiotFBtDmHsSizRUu7HiTLxubVqhClGS9Zixj19SRJVZkRdz
        TlJlHeq6AhyA++KV5bjgQR4iuVWA8npVYA==
X-Google-Smtp-Source: AGRyM1vbDdhTMhIUVarhO1OStStrcrL4TqZQSTY6WDKrW1xEiNNrUsjftKvRmC2EPZXTs8muUz+vOA==
X-Received: by 2002:a17:907:2d23:b0:72b:7c6a:24c with SMTP id gs35-20020a1709072d2300b0072b7c6a024cmr2772049ejc.44.1657610219552;
        Tue, 12 Jul 2022 00:16:59 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id fn15-20020a1709069d0f00b006fecf74395bsm3500222ejc.8.2022.07.12.00.16.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jul 2022 00:16:58 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: am335x-baltos: add GPIO names for ir3220 and ir5221 devices
Date:   Tue, 12 Jul 2022 09:16:47 +0200
Message-Id: <20220712071647.21551-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Yegor Yefremov <yegorslists@googlemail.com>

Add GPIO names for both SoC and TCA6416 lines.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos-ir3220.dts | 148 +++++++++++++++++++++
 arch/arm/boot/dts/am335x-baltos-ir5221.dts | 148 +++++++++++++++++++++
 2 files changed, 296 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir3220.dts b/arch/arm/boot/dts/am335x-baltos-ir3220.dts
index 2123bd589484..ca31733f90b1 100644
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
+		"I2C2_SDA",
+		"I2C2_SCL",
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
index 2f3872dbf4f4..950a07fc5a70 100644
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
+		"I2C2_SDA",
+		"I2C2_SCL",
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

