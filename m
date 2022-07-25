Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD38C580022
	for <lists+linux-omap@lfdr.de>; Mon, 25 Jul 2022 15:49:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiGYNtK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 25 Jul 2022 09:49:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbiGYNtK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 25 Jul 2022 09:49:10 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9094010550
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:08 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id c12so6641382ede.3
        for <linux-omap@vger.kernel.org>; Mon, 25 Jul 2022 06:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2+u7zJquGGX3GWaMzTOtc0Wrja94pxh3wsth/2j2g2k=;
        b=qBHqiuWClcb82Mvul1SVwd1/mXcvGtBNfQJHAmWH/JYdjFYY3soXPO772faw0nRBUn
         k7FJZPvd+HHJcvYoTcnqtmQTe56Yi7nfdkW7xT6/eVU3lPqgYogZ9TbubEXRElYAXQr1
         gtR0A4d/zmmYP0o5+qdJ8FvHB5A7ojfnZsECNF9xZ9XNDvkAcuPWNx5WvX5cK6vHXbJb
         DvwNHca36iYkooiiuCIWc+Jtlj6Ta9itL5tk28n+j6dMWCeDtT5+xUhh5gCL/nLbUSNl
         FsQrhFrufj0UUm3KWDsxThc70aMDb9YjRo/WFykqgJ6HBoHdQjJDox/O9iRqr2S5hMtY
         gXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2+u7zJquGGX3GWaMzTOtc0Wrja94pxh3wsth/2j2g2k=;
        b=09ul7B6wXwZiRa2fqaHXlf5k7kpDfC/p+DDC2ckQE2kuXyLlbNDiC061e/79g6CAUu
         WQSAwJHLYh6TqwXd8qTbIaQkGdj8Y1AGCJwImZi+tCH6OAX9BVHAvTWM8UqjMmRm5vLn
         1fdM/5nilVF6bGUdUl1AwCoKKVmdOyhFpk3qCksUCDYBcIc8iz4BQn7p8221UDJl9vbY
         w8xPA/UKJH5885Aj3FkDxXnE7kVHQ5dsRPreK1j9dUm/oFNzP++sJXjB0XZv4CCQqBks
         UnxNOMABJQdpptCB5+E/ScdATIXvIhd2TCdYCIiRlec4hFa7EYM4+p0A+mo5XvsfGF4c
         KNHw==
X-Gm-Message-State: AJIora/WjVC1TaXva7Oi6GAGk/MDoGF00RKIRESNvdQe/0z9cWAFwvwl
        BY/1noG0V/Hozptgb+Nz8/aKXZL6OzM=
X-Google-Smtp-Source: AGRyM1vl2GSWuC19bn4yvlqUJaGQAwZGAPpko91X8SOTPPzJ5lGMb8XXGCT2/k+1jc2Nbhr1Hs89Dg==
X-Received: by 2002:a05:6402:35c1:b0:43b:e079:83be with SMTP id z1-20020a05640235c100b0043be07983bemr10593209edc.80.1658756946761;
        Mon, 25 Jul 2022 06:49:06 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id k20-20020a17090632d400b006fee7b5dff2sm5404670ejk.143.2022.07.25.06.49.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jul 2022 06:49:06 -0700 (PDT)
From:   yegorslists@googlemail.com
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com, robh+dt@kernel.org,
        Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH 3/5] ARM: dts: am335x-netcan: add GPIO names for NetCAN Plus device
Date:   Mon, 25 Jul 2022 15:48:55 +0200
Message-Id: <20220725134857.855-3-yegorslists@googlemail.com>
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

