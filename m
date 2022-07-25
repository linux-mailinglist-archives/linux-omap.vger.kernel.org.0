Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB845580021
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jul 2022 15:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233500AbiGYNtI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jul 2022 09:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234269AbiGYNtH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jul 2022 09:49:07 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A5510550
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:05 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id oy13so20694265ejb.1
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=iNR+8bvTtJ1JNm1FULwRyfWVRLu7ziA8GWYkRRVOTEo=;
        b=DUSEaBTHhagj+Phydg9/Xbc7brln6S/EzSeTT2gghFyGr7B4AA2LYEV9oWgw9WagzP
         d7JIpd8Dw97cfQvTps8U1ztvddETpwyE0QMEWiwTRmgz0AKnK1JJNv5euJ1bkic2XY/1
         851mcrnwcCmGN10utIHAa4wP6R08zTeQKRdHh5R0K94Phj48cR6Msu4RVF/e3jjCDCD+
         nkgTUpTRwatjiq0cUtJ9ciJXUiEWmhYBRKQzgXAnuwwMrdwi43P+idHeF/7WiVNo8IJF
         95HbA7MTO2Dk/WLIfKNaMqNNXf/omIWBBB/NNqjvvzyfc1AM9jNIQVU2JnrAuRGZC3F4
         L9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iNR+8bvTtJ1JNm1FULwRyfWVRLu7ziA8GWYkRRVOTEo=;
        b=eeqdCJ0a2+LLZAiB5eMR65LwMUt+azfW6eps6iaMUBkaYCip0lMLqCrqRx/XoibJp6
         vJU0RYRR5ZrdqVbgqnZrGhcwYF7tYYhp0UUEemuBQf5spOTIKd79iw6VvXqck16XN5DM
         bsGJs7m1A1a83JPQnVRS/v0q3M29YGAhjw+ctnm1sm9xqTynpMzUfDofvWeRehJKeJ9N
         d4hHSVJhzU6EhOEA2SPBDyiLPoeWdDxdj+8vl3R6hDaaPtG/V1LOUidKTEG3+gew/0Va
         xpPRCCOIYyAPO7uj5TEYfGXFD7I5RwYT9L1Wr3UPPzGmg0jT5uY0k5huUQsfFf7wm8KQ
         dv5Q==
X-Gm-Message-State: AJIora98jggLDIalsOfRK4c3vrjvxtyJBgasTbRfmSknN+DuA4VQllGF
        mHnwFDwl3QcsjmyzBn/0GKu1QQWbLzI=
X-Google-Smtp-Source: AGRyM1sZpTwTaMLDpNLbUOYy4UOUJYroWLYRd7nqkQVbZZ4SouXcpUYsI5gjzRZLMRxbt1UsrSG/zg==
X-Received: by 2002:a17:907:160c:b0:72f:1031:2184 with SMTP id hb12-20020a170907160c00b0072f10312184mr9947870ejc.355.1658756944043;
        Mon, 25 Jul 2022 06:49:04 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id k20-20020a17090632d400b006fee7b5dff2sm5404670ejk.143.2022.07.25.06.49.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jul 2022 06:49:03 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 1/5] ARM: dts: am335x-baltos: add GPIO names for ir3220 and ir5221 devices
Date:   Mon, 25 Jul 2022 15:48:53 +0200
Message-Id: <20220725134857.855-1-yegorslists@googlemail.com>
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

