Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C463580F1F
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jul 2022 10:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238543AbiGZIe5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jul 2022 04:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238565AbiGZIez (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jul 2022 04:34:55 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EAA031209
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:54 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ss3so24740843ejc.11
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=OMRkpNgu5S+nvpLzhFipQUup2HgjOsZquv3zjAuxoik=;
        b=NZd6Bq+SkY4aRfNpHecwExElzalhCtMCehtI7Q9W2K7f6K42yAduja6hQDFmCY26+C
         GfiS4kEiJ9OHCZs5Hiniecfkm8D3rYhUuWrTKjMuvVsmiPpQGhlt6Xdzcbn19pLStaNo
         ZWGuJ/zp3X+3Gaivk7wornKUQnKwXVgp0kJI2HvHcwt6TT2rSlKysv7o+gJT8EKptImM
         gT/A35XyErYTQJQGtRkmuulTa0qnD90H3mC3UzBAFvf3HLDSSs6LQeRFbTnjEnUGE9E3
         oVcFleqay/IwLjK42SZRTH5LzA1dfSS0xvf7dXM4YjQ2Fy71tq6DHKdPCfWH7KLPB/Yl
         izvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OMRkpNgu5S+nvpLzhFipQUup2HgjOsZquv3zjAuxoik=;
        b=nB0rxV1Upy8TY5irBnvtRGjDTl4BA3C/6tJj9AQaU+3hV69SLlXlp86e8gFARqveJ1
         Fkb83j6YL3NYztDV11qukjNttUDw+TUD6I1BKwKwfT+CKiH5AfbU78BFu6xmGyMCRIQK
         BxqmV44KbB/uFxYGWuq/CfzRLgxQCEmkUjAF4JLMxaRRZUsG+tWk5zjxxbMxND4SMIo2
         Yvg0ReHm9/KylkxYyEvokFazy8Ac6QONE3+da7ZgiP1j/ucwIljUfhtXkgcQ9/HjgMvm
         7m2U/zj5N0kPIzGXNXADbp8bCZj4Nyo6c7cCXq92Ho3QwYdUpSmY0ngmKJvSx61CxNiv
         S7Bw==
X-Gm-Message-State: AJIora/qgoYt8kR/nsjopzYEVVB0m1aNgcL2hO8pQz+ZPyznm5IluzNc
        9blKyn7DP0a2rkfnzPlEEylC9ZkCapY=
X-Google-Smtp-Source: AGRyM1v7UTn5Bb/u9GRKm7RJlVFa2tIA+BlPvYtYuPkQ52ovTdKB72wlKkr8eTwOR4mbW91NH9GZ8Q==
X-Received: by 2002:a17:907:97c2:b0:72b:9ec4:9a60 with SMTP id js2-20020a17090797c200b0072b9ec49a60mr13396501ejc.154.1658824491954;
        Tue, 26 Jul 2022 01:34:51 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id rh9-20020a17090720e900b006f3ef214ddesm6171848ejb.68.2022.07.26.01.34.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jul 2022 01:34:51 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH v2 2/5] ARM: dts: am335x-baltos: add GPIO names for ir2110 device
Date:   Tue, 26 Jul 2022 10:34:41 +0200
Message-Id: <20220726083444.10159-2-yegorslists@googlemail.com>
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

Add GPIO names for SoC lines.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
Changes:
	v1 -> v2: remove unrelated changes i.e. commenting MMC CD pin

 arch/arm/boot/dts/am335x-baltos-ir2110.dts | 144 +++++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index daf4cb398070..75992eec830f 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -81,3 +81,147 @@
 	pinctrl-0 = <&mmc1_pins>;
 	cd-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
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
+		"UART1_CTSN",
+		"UART1_RTSN",
+		"UART1_RX",
+		"UART1_TX",
+		"onrisc:blue:wlan",
+		"onrisc:green:app",
+		"USB0_DRVVBUS",
+		"ETH2_INT",
+		"NC",
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
+		"NC",
+		"NC",
+		"NC",
+		"SD_CD",
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
+		"NC",
+		"NC",
+		"NC",
+		"WLAN_IRQ",
+		"WLAN_EN",
+		"SW2_2",
+		"SW2_3",
+		"NC",
+		"NC",
+		"NC",
+		"ModeA0",
+		"ModeA1",
+		"ModeA2",
+		"ModeA3",
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

