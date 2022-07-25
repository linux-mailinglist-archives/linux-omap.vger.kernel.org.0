Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5806B580023
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jul 2022 15:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233197AbiGYNtL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jul 2022 09:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbiGYNtK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jul 2022 09:49:10 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E2514083
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:07 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id z23so20521964eju.8
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2/9wAkGl/F7U4Q3bTlnbSaDZIotaoUUqFKE8YOdHq98=;
        b=UHHFGCFwfbA2LKr77r6QlaJTp1npBIgIcBBMTBPKZ2wTZFaWQ85ceJ+bo9p80Nv8XE
         +13hIIdLIv8Zxr2tmWqS3hnej8bxHKM3vklDSmTTbM7co/oSghamcaEKSL9ckR2kDyyd
         PAV48B9iWgbbASOyZLDddSa5Q5pO0JFufs6JBvtL+GizhEkSlCMpTm3pBdZJ3ifEuIUW
         dezy4t7EehZTzGdeQGOm7B1qmUN2pRtxIDHO+t++js1mhFEhDS8ha6ki4wIyFqhJktI+
         BKYI9Mpnnjm51XkFbqf0foBL4ZyGTGrZ/kb7qvvkGRPp6NOhaIF0OCU0JxENvT9Pw7lZ
         0AEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2/9wAkGl/F7U4Q3bTlnbSaDZIotaoUUqFKE8YOdHq98=;
        b=t+lAhb2GQoexS+HQ7AE4jRDII//7ZEVsPVpMufYLPLhLIoi0McC0H/byDbAZVDzG0I
         HaiY0shmYoOb4VJPY84QltChZnoxgTuW10dAZUeCF0SJljc0Xepy2luxxogP2eJiJgHB
         jn9GufiWFK4zlygLns9ux5GtZTFLpZ1DofLPMgDl7rQ/Qz/yz5CcCGJlAVod812d3oPk
         Fy4MdqdztBrvba0JlANRMS6KwHxCbIX2R1P4n/FD3DCm52pCoCDV9s1c+j9CJQ9W907R
         IUNmi36fNnIU3wFhm/1iAlMh65XZOtESkhtaynVnwpxpg+gz1RCEZ5rv3sPr6r4xFKLP
         qgfQ==
X-Gm-Message-State: AJIora97hzhnKA2qx3ho8IpdMqYPfFJpv2jGDfsz6dT+xj6bjafjMZH+
        93PH2iv16kmdqhdfpogcx4PRGibWM1M=
X-Google-Smtp-Source: AGRyM1tgbaqoh4Hq9ZnV4awgt+uskybRLepVCZSuXztzlTyeAk0SF/1YZZSWd5IH5eOH+mp+XQjrjA==
X-Received: by 2002:a17:907:2c54:b0:72b:64bd:cbf7 with SMTP id hf20-20020a1709072c5400b0072b64bdcbf7mr10205516ejc.116.1658756945598;
        Mon, 25 Jul 2022 06:49:05 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id k20-20020a17090632d400b006fee7b5dff2sm5404670ejk.143.2022.07.25.06.49.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jul 2022 06:49:05 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 2/5] ARM: dts: am335x-baltos: add GPIO names for ir2110 device
Date:   Mon, 25 Jul 2022 15:48:54 +0200
Message-Id: <20220725134857.855-2-yegorslists@googlemail.com>
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

Add GPIO names for SoC lines.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/am335x-baltos-ir2110.dts | 146 ++++++++++++++++++++-
 1 file changed, 145 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am335x-baltos-ir2110.dts b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
index daf4cb398070..133fbe48109c 100644
--- a/arch/arm/boot/dts/am335x-baltos-ir2110.dts
+++ b/arch/arm/boot/dts/am335x-baltos-ir2110.dts
@@ -79,5 +79,149 @@
 &mmc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
-	cd-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;
+	/*cd-gpios = <&gpio1 15 GPIO_ACTIVE_LOW>;*/
+};
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
 };
-- 
2.17.0

