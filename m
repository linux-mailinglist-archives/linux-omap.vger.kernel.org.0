Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C33DA580F22
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jul 2022 10:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230218AbiGZIfB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jul 2022 04:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238460AbiGZIe4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jul 2022 04:34:56 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34EF531212
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:55 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id mf4so24908950ejc.3
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GXilQ+OPAeFe/iC0g4c+nKlt4iXDssXeIzGINlYOLV0=;
        b=Wg/+b4dKRJnvk19CCd5kv9hwswQesIBthHfqLjXM7/dQjhbpkX8YPHB6ztLuZkew45
         rMUMdflw0/DwMpQ6NiCHZSfYev5d/a8S+lyMO4/Wve7EgvD2KODx256RnEX8it/58RYB
         YrhlWamJb/fvMmuErkgr+v3dnS8WWvc/vBqQAiv5bSQLHmg4PMRIl55uqSyhmJFPpBHo
         JJcQNwVTsD7j5EpLiYhMNFl0yBJKGzTTyIgdRSgFk74GSxU6wO2DtWHctbmPi6RPD0IU
         +AZi2XKVUQq7Q/pMpS/HqLlBNYih8u5dFWzv/8ey1V4zQieLj9trreZWv4Lz4k3GOq/4
         6OLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GXilQ+OPAeFe/iC0g4c+nKlt4iXDssXeIzGINlYOLV0=;
        b=FvRxk32uycxrARB5nXfA2kS8t4cYIwFlHFO6NF3s5rl2dlJf9fyYgMvjmbW2DEnaH3
         CE5cFby8IiENJpGPyCpuJdxAHcG3HszXIsNTIkDhL4pMPY7+4xVrzaLEjWb6qqAgJjvH
         3wRWl6iT8YdMdBcuP7GCXtLXlBxQxEWG03JpJdwjEhrKnu7yAhtA5Vio80JScuwZ/Qeu
         CiZcEbiJa5lPznLzr5MM6SpH2j6Dt4Nw5c8C/EnKGQY4YPIaxf+h55LGkpgKeesWusju
         e/efK0VjKdL+yd2sGdh46xdYkTgt8oGimpqwzNQm1+qZagaUmM9t30QUezbpm4bJaeap
         Z6EQ==
X-Gm-Message-State: AJIora/F1WLv/p19V3MDIel/mfbcx/UxLPuvwfybsvhD2j8UY++mdmDr
        MV2iZU7MkuDqW1aVUy8zotznbnZ9BDY=
X-Google-Smtp-Source: AGRyM1uk4huz4tjNNTqjLo2Lsfh0TsdkjLijaTV57Ak69Sgs8E+RUNxdJkd1MAI83BEmK2Ic5TJ6sA==
X-Received: by 2002:a17:907:7fa5:b0:72b:755a:b77e with SMTP id qk37-20020a1709077fa500b0072b755ab77emr13098115ejc.474.1658824493258;
        Tue, 26 Jul 2022 01:34:53 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id rh9-20020a17090720e900b006f3ef214ddesm6171848ejb.68.2022.07.26.01.34.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jul 2022 01:34:52 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH v2 3/5] ARM: dts: am335x-netcan: add GPIO names for NetCAN Plus device
Date:   Tue, 26 Jul 2022 10:34:42 +0200
Message-Id: <20220726083444.10159-3-yegorslists@googlemail.com>
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
	v1 -> v2: no changes

 arch/arm/boot/dts/am335x-netcan-plus-1xx.dts | 144 +++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
index 57e756b0f192..2e049489ac06 100644
--- a/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
+++ b/arch/arm/boot/dts/am335x-netcan-plus-1xx.dts
@@ -85,3 +85,147 @@
 
 	status = "okay";
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
+		"NC",
+		"NC",
+		"can_data",
+		"can_error",
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
+		"DCAN1_TX",
+		"DCAN1_RX",
+		"CONSOLE_RX",
+		"CONSOLE_TX",
+		"NC",
+		"NC",
+		"NC",
+		"NC",
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

