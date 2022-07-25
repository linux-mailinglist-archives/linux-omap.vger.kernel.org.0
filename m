Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A2C580025
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jul 2022 15:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233546AbiGYNtM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jul 2022 09:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbiGYNtL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jul 2022 09:49:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B153910550
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id z15so2196295edc.7
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=9vJpwipY3BsRrzaFEj+/uk1v1T6Ymir/45Mc/TW17jQ=;
        b=Zrk4DjmXQTknFjAxYcGDNsypVTNITiirI2wEfc5M9STGUvh7ZL2kIqptaSdhJutvOk
         xvm5jXZ2881Aw9Enbl/bo7yIHTfn1wAIV1mP8sQuzK2bUFWCi/0TbU1xfQA5v/sBkvYV
         Bu0Vvi8/slYCPqgOwD/3DsIKcNmL1dLYlmYWLED+b8tTeqPulZY2gayC208yF+kQlvXG
         XKXOQqPzt0866EjmEVvUj/lYhAudS2kOXpyxRJ5/TtX4aAG+mEBDU+SsK27dUo9T4x90
         vdGCZiHP3eHYqgQaefeegJvnBpN6fqRV7qG1tOUxSBcCnde2j8yDQjoFLr9Fz0jk6NXu
         QJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=9vJpwipY3BsRrzaFEj+/uk1v1T6Ymir/45Mc/TW17jQ=;
        b=jYW9EFwyPXblIxDD1IuiL7b1+jrRg+rNyJjmYyqexiwcHlcp41JZ2o7Z7tr+EMuYfx
         xNSig2QSAEcvfSTLYKpwN21fffLUXi/t/AS2iCaIHTadp+DSNYBV/DsfHSax1LeNUKBQ
         VDQg2XBIBIwAHd0Q8dEw8wkioG85n8GbyDCmkVL8/nDAQuIFw+nh8U8tU5082Jepuca+
         cQwZ58HDKKmKZ2kPjee+2BcUepSIp2HtwXaVjvDAuomOXrLcEz2vIHEZPvklWRzdBs0o
         zcHM/4j82EosHb+39KDUrLf2rh43tDrdhO2974bvAl9J0QZkgMgFK4oKfhEPo/DHycRM
         9TLQ==
X-Gm-Message-State: AJIora9c/KgymLJgjmAGR7MWfDtjxqUPq+x2joG/MriNzr3Jxmv773U4
        /T9xc6qjHc/LLHo6lwmnUgPzPvfRln4=
X-Google-Smtp-Source: AGRyM1t3StXF3xcSUgoO0RkL58RxmD+ztNVFepPoIaFJmd73kq1qxJ+nZiqWy2nK2epJM2juAbPPFA==
X-Received: by 2002:a05:6402:189:b0:437:8a8a:d08a with SMTP id r9-20020a056402018900b004378a8ad08amr13100562edv.241.1658756949018;
        Mon, 25 Jul 2022 06:49:09 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id k20-20020a17090632d400b006fee7b5dff2sm5404670ejk.143.2022.07.25.06.49.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jul 2022 06:49:08 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 5/5] ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices
Date:   Mon, 25 Jul 2022 15:48:57 +0200
Message-Id: <20220725134857.855-5-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20220725134857.855-1-yegorslists@googlemail.com>
References: <20220725134857.855-1-yegorslists@googlemail.com>
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

Add GPIO names for SoC lines.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
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

