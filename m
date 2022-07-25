Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 045FA580024
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jul 2022 15:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbiGYNtM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jul 2022 09:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233546AbiGYNtL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jul 2022 09:49:11 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90D3140F9
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:09 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ss3so20579758ejc.11
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=CdWPqVHzX025sp18UvcY3B5vaZmFmggRjX5EUVNfDZs=;
        b=m2F6GC2Au5VZDTZwZ0YR6F5a0UQqr8cVa77sMG4vva0OvTrb+leKLE6N3rnMU6y4BY
         e/ORGjZ1vUt4j8tXMmb1B1fpgwYzn9LgedtJnPITIFKZENAiyVVSeCJIUh3xt5wqGWvn
         n1K75vyEuToazUJ7J7cmRiTwZzAdCVBlqNJuyePpnPcH3CKioNnlzJnw/wnJP7bB8O3B
         H2f9W5Xa0DRzlb8lltoUD2VPD5EnAZ60kr9ikZEZC6kqfiXfWNCyTcdRFIG6+uZoDeLX
         jLcHuz+xB7gNFk960I5rMgOasWJkMXTkdDzwWy0YThC21GlqVxIHfprgcrfHYy2sJmTj
         aFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=CdWPqVHzX025sp18UvcY3B5vaZmFmggRjX5EUVNfDZs=;
        b=1do3kl6madUJzOkoJlhkXE1qy1c5tLeROwWL0+WMKXjETVY0paz2Dx40k8yFY8Yjin
         W7xKHIpc45N/UtOdCM9XPsv/rVbij6fTeOjBs546U6Xf+o21+qkvSi9XMk6QHOSkIzye
         BjxZRL9MgtZDngx9aTLbYJnHqftrobcNKP4lFPNN7lUeUVTYSqHZZSLNmmIPkjcjd6wL
         JZ8tAl30VSKlr7HgsSvKNI9yh4MXhELhKIGfxKvva33vLgITldSootiFiPk6xzSYediI
         c6DUJfbLL9H2Ux0mPZg0+NarfCBcENGMf8+u0pDJ3emYsGsY5gHIlUYEc47JocT/ciR0
         TqWg==
X-Gm-Message-State: AJIora+Rt2tHGKtLWK+opGvdFgEgL7UmBxOUy+k8UbCd/QZvXWrR6cxY
        sRW4gKjtJ+z8aHdndsK41IliX9bGvEE=
X-Google-Smtp-Source: AGRyM1tIMW4w9aeHp+7HQylp/5CF6mo70pI1FjwAf7kTIC77gPVJyDPC4Ya/QFaOBzJ+qIjLhxiSHw==
X-Received: by 2002:a17:906:93f0:b0:72e:d01f:b882 with SMTP id yl16-20020a17090693f000b0072ed01fb882mr10344279ejb.273.1658756947900;
        Mon, 25 Jul 2022 06:49:07 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id k20-20020a17090632d400b006fee7b5dff2sm5404670ejk.143.2022.07.25.06.49.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jul 2022 06:49:07 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 4/5] ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 8-port devices
Date:   Mon, 25 Jul 2022 15:48:56 +0200
Message-Id: <20220725134857.855-4-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20220725134857.855-1-yegorslists@googlemail.com>
References: <20220725134857.855-1-yegorslists@googlemail.com>
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

