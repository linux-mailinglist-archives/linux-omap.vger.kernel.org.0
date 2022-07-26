Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF67580F21
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jul 2022 10:35:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238549AbiGZIfD (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jul 2022 04:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238578AbiGZIfA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jul 2022 04:35:00 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D34131208
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:57 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id fy29so24756144ejc.12
        for <linux-omap@vger.kernel.org>; Tue, 26 Jul 2022 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3yBQznUo5RrVPIUPYF/c/MTxWoEmNrCVbSj4iz/iGKk=;
        b=k8W6Wajk90v6PvqZQy3IzDjM05pItr5jI8T3PwnO90/PJxkO5/2V/4+3dZtqcfmWuG
         s+xjDWAUn6I4pmAn69rx2zRyq6qxChXSZY2kwCX0LX9EF30tLDpVNUgx8/BQR1iTA9Ng
         ay6FXAqrtN0J7zSWh8R2cfel0FM4dvE/++FD7sPAD0Ua2pNvV+UbCXEPu54WKMB19joc
         U+450kKuWdFxirrbQfjcXQDKmY4dcOmS7BJ966h444jRkxrOnMyUuLCpgNzsFzPvgsGe
         kvMxAEKNrYtQ2RIYxvxwZLuuvsToEsRrjZ+Gdrgsth2RqG4F0P5gxd2PGHYUZTiAopfZ
         Hz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3yBQznUo5RrVPIUPYF/c/MTxWoEmNrCVbSj4iz/iGKk=;
        b=B66uzGoW22AufyLm0VxtLxWXoFAonMB+GAj7jwdk5y4CtssKLEIYzt+KL5vo3/jqJ2
         DuqeItK7qpLDiH50N0BFHshlZgJP8+0MI9BYRmLgu2iv7Vz71BMsK+DmyWv5KLBoaaJD
         zYNJakKH92n52xDQy0UqwyZdmkG0sHCIWt4Cl5BHaZeMwS3/Ok8u6iaNYdXWDBoH0JWI
         X8FnQ7ymhzI2M1G+n1UFmxm/t5LX9thpWjewKZHRehVzYzWEYFuqXIdzkDQ45LvnAWgV
         QwhiOmi7eUzkmacpgoVWB0GC2m28IzISwgMVnu4rU7VZ2+XJTS0ZfUOXxxW3gMqDIUkE
         ddnQ==
X-Gm-Message-State: AJIora+XPgsXffpWjZpbRQSIyAdJcn5h+GWix1h4NdGcB/Tzgr6g4bVb
        /NW0v2Sa33RRK7g0Hr5SP1zI2bDnC+Q=
X-Google-Smtp-Source: AGRyM1t9M+JDP+6ft0yB1coRGONFetDHt3qq/2PGyT79+IkRVdU8PKY6Z4KeylhnrQjWpglsrCUWbA==
X-Received: by 2002:a17:906:fc6:b0:72f:d080:416 with SMTP id c6-20020a1709060fc600b0072fd0800416mr8577547ejk.1.1658824495618;
        Tue, 26 Jul 2022 01:34:55 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id rh9-20020a17090720e900b006f3ef214ddesm6171848ejb.68.2022.07.26.01.34.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jul 2022 01:34:55 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH v2 5/5] ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices
Date:   Tue, 26 Jul 2022 10:34:44 +0200
Message-Id: <20220726083444.10159-5-yegorslists@googlemail.com>
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

 arch/arm/boot/dts/am335x-netcom-plus-2xx.dts | 144 +++++++++++++++++++
 1 file changed, 144 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
index c6cc1c6218a9..6ed886c3306b 100644
--- a/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
+++ b/arch/arm/boot/dts/am335x-netcom-plus-2xx.dts
@@ -93,3 +93,147 @@
 	ti,dual-emac-pvid = <2>;
 	phy-handle = <&phy1>;
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
+		"SW2_0",
+		"SW2_1",
+		"NC",
+		"NC",
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
+		"NC",
+		"NC",
+		"NC",
+		"NC",
+		"UART2_CTSN",
+		"UART2_RTSN",
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

