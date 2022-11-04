Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 262AA619B65
	for <lists+linux-omap@lfdr.de>; Fri,  4 Nov 2022 16:23:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiKDPXe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Nov 2022 11:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232304AbiKDPXc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Nov 2022 11:23:32 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F209F25EAD
        for <linux-omap@vger.kernel.org>; Fri,  4 Nov 2022 08:23:30 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id k8so7572263wrh.1
        for <linux-omap@vger.kernel.org>; Fri, 04 Nov 2022 08:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/JcQzwTq3F2cPz/dBTtVzSx7a/XbMf65bEQnjK3KU8=;
        b=2XN/wq17Mtw02Br20Jgq3ZZoPBBitH45n7CF2omLr5pvBbJxEjBeWNXEwj1om4MIys
         eoDF82JlQo1Hj+hYXHnFyh4bJFhtQZCZ4J4tZllmTtC80WRkJiB+GI5zImMPRnGfLzZ7
         Gshcn7fASYcV5X7OMl4yGHV9vX2lHgiTz2glwg5GqjFiBF8kIcuHCw81P4XKbigZRnx+
         v/2MD9vuRrwN8p0DHhc/5KSeDpAm47brGEt6lqYJPnOhzCTDg6deb5quXlFtJvPqacwf
         lw2XRP4KhBNa0TSJnam7obSCHGmEhtnC9o4JP/3hL80M4AiynIUAcgSAcyBshWE7vpil
         sP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/JcQzwTq3F2cPz/dBTtVzSx7a/XbMf65bEQnjK3KU8=;
        b=O/lqSi3xrLxy6HgHt0Zfzgx/jO5zMm8mI1prspXHkOoj+7JdFQ5IcgUZtGSu4x0IhR
         t445MWLNJ96fQRnsEY1aGwPCT6XEE+v39SfFXQ+1dGlv6PWveeFgIT5TGdnAX9l62QHf
         V778ZYAC28kV6B7jKEhoZ3svDRCszTJxvP2b/WPBJFma+LbmMugbSRbWoTBJxvjjy0o3
         ICabuHDjZ4bJ8JQFQvIFl0bG0p3+SsMKhfIsZczcOmpekH17pijSTUagF+38aiHsmeoX
         FA3rNkjFCtVNlKawd6eJH5YOprdygJZR0K1cAsTV0o/Vc92aI5YwhKILyda208HcNLN7
         aIUA==
X-Gm-Message-State: ACrzQf1+waVUY+6sjELsm54JyBeUY/f1TerYdOnvk3sf2EOGnvQSqMij
        b5bKd6ruuwfU9w54M//v8L39wg==
X-Google-Smtp-Source: AMsMyM4+rmp2WGRQ+hSL12Bb4uZePByCMcW84JsTuiTP4VxgYTVRmJU7qGxVn13Uz2CBMRugQoAXOg==
X-Received: by 2002:a05:6000:a09:b0:236:6b18:6b30 with SMTP id co9-20020a0560000a0900b002366b186b30mr24056646wrb.356.1667575409189;
        Fri, 04 Nov 2022 08:23:29 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l41-20020a05600c08a900b003b4935f04a4sm3689764wmp.5.2022.11.04.08.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 08:23:28 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Fri,  4 Nov 2022 16:23:07 +0100
Message-Id: <20221104152311.1098603-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104152311.1098603-1-jneanne@baylibre.com>
References: <20221104152311.1098603-1-jneanne@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Interrupt occurring on PMIC TPS65219 is propagated to SOC
through EXTINTn pin connected to gic500 interrupt controller

Needed for driver testing but official board support pending.
TI commitment is required before board upstream kick-off.

Signed-off-by: Jerome Neanne <jneanne@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am642-sk.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am642-sk.dts b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
index d0121976491a..441bc746bda0 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -363,6 +363,12 @@ vsel_sd_nddr_pins_default: vsel-sd-nddr-pins-default {
 			AM64X_IOPAD(0x00b8, PIN_INPUT, 7) /* (Y7) PRG1_PRU0_GPO0.GPIO0_45 */
 		>;
 	};
+
+	pmic_irq_pins_default: pmic-irq-pins-default {
+		pinctrl-single,pins = <
+			AM64X_IOPAD(0x0278, PIN_INPUT, 0) /* (C19) EXTINTn */
+		>;
+	};
 };
 
 &mcu_uart0 {
@@ -421,6 +427,10 @@ tps65219: pmic@30 {
 		compatible = "ti,tps65219";
 		reg = <0x30>;
 		system-power-controller;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_irq_pins_default>;
+		interrupt-parent = <&gic500>;
+		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
 
 		buck1-supply = <&vcc_3v3_sys>;
 		buck2-supply = <&vcc_3v3_sys>;
-- 
2.25.1

