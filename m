Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2FBA5A150E
	for <lists+linux-omap@lfdr.de>; Thu, 25 Aug 2022 17:02:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241489AbiHYPCh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Aug 2022 11:02:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242502AbiHYPCf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Aug 2022 11:02:35 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C28EBA2238
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:33 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b44so6231866edf.9
        for <linux-omap@vger.kernel.org>; Thu, 25 Aug 2022 08:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=QAeu8Ip/UVeW3X9UatnEX57POpwb7/cBI9QxTPqXbsg=;
        b=WlI6u1sAFeq4Vrhsg1L1+HrCLnPuC0iLwAyqNrYw/uTA6PAQe7+NkgYFVqMZ6CtXxA
         dv1zd8kQ+gLJNFeNhI+Sd8WzUUDqdZ8/sTAEb1OMRJEN7knHgPgH8FqXSUSLU4agrMKi
         VFq50BZIWWDnJISD3oKOluFTk6NH8PaJp184I7DkghLUVMolt3bdLPJfSq48ynQrnW0l
         +y1waZRJMWY0Tigamw9B+RK6nvAAxftB8sewjeOBAajnroZnuy9Y0APlGQWqGlHzW9Mc
         tBLHZSdE4cbnVFidQaSr1WhGyip66o2xG/nRxzBL6vFCDFRVD15GlZL6JbISNvvC8DGj
         jtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QAeu8Ip/UVeW3X9UatnEX57POpwb7/cBI9QxTPqXbsg=;
        b=42nLl2/0cf16eqoKeHleNkLqtf21DO2on2KQSB8zY49X61Bt7zpvxYXo7xQb5h5bYd
         A3WR+2cip5FvmOxvcG3t9MxwtX81+rBqzvHLLVTdi4XpMFFZ3j3f9b6mFbcZwkAWllaF
         Af59Dkw6HHzCMHiL+H86VxOVgVAKHRkx4qmqKIhdKWKO9FIQZyEjOA/r85cSjzWSeozP
         aJDPe2FChsCUTEF71CGyvoQOM8JekEZ+tZItFEoqrkabqzfEImvNvKovpJ7fW1ElRB0W
         M7EurvEemMSlT9Ef1ptRSlRr4DPFGC3u+kSFm7QZhQEGGUu7tTn9ehaJVkdM7/bAFtNK
         KYVQ==
X-Gm-Message-State: ACgBeo2fLS5YwSDIGOEuz7kP+3i12JBeryVb9xO9R8Zf8bqkm1x6HzIb
        EHJ+6V3zSjq8Q0SLqD7bnidSbg==
X-Google-Smtp-Source: AA6agR7vsUq8KjcCQ3AQDCiWFtXzD5CqGkiYSgtdHZGLmlSszHBgPMRdRAKvkUSQjFlQ0eyg5x7Ipw==
X-Received: by 2002:a05:6402:5106:b0:440:3693:e67b with SMTP id m6-20020a056402510600b004403693e67bmr3653140edd.226.1661439752401;
        Thu, 25 Aug 2022 08:02:32 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4090:a245:8020:2658:1f7c:362:3e99])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090609ca00b00732e3d94f4fsm2548771eje.124.2022.08.25.08.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 08:02:31 -0700 (PDT)
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
        nm@ti.com, kristo@kernel.org
Cc:     Jerome Neanne <jneanne@baylibre.com>, khilman@baylibre.com,
        narmstrong@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v4 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Thu, 25 Aug 2022 17:02:20 +0200
Message-Id: <20220825150224.826258-3-msp@baylibre.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220825150224.826258-1-msp@baylibre.com>
References: <20220825150224.826258-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jerome Neanne <jneanne@baylibre.com>

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
index 565b50810579..1f7ce60ecb57 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -294,6 +294,12 @@ vsel_sd_nddr_pins_default: vsel-sd-nddr-pins-default {
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
@@ -352,6 +358,10 @@ tps65219: pmic@30 {
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
2.37.2

