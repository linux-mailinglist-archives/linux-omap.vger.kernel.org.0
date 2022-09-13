Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 310D65B6CEF
	for <lists+linux-omap@lfdr.de>; Tue, 13 Sep 2022 14:15:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231615AbiIMMOj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Sep 2022 08:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232029AbiIMMOe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Sep 2022 08:14:34 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC7C5FD8
        for <linux-omap@vger.kernel.org>; Tue, 13 Sep 2022 05:14:32 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso9360713wmr.3
        for <linux-omap@vger.kernel.org>; Tue, 13 Sep 2022 05:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=fmRqIQSsCHZiGIEbB2N/fhkz+gQlMbzxAWCGOQmGCfa0S6PNK6a8tKuvGPtno7YKjP
         N9/HKOBjDFwTOn4slv2AvUG5aKZlDv+rXjxK86P2C0g8KjXd8EzTsc4vNJ9wEShJz7kT
         sgi7QcDf8g2nyAWAvknVMbo/OJiyV8+dofZlceGvQMhMqCyHqhgRX3MeQgwfb7m6icwj
         0lxF5zUjaGty7Uwt/CYFkHRnRHl4nTwZkBLufxYmLbaL9ghqcr6+sNPtAeBkngQt00Sj
         pargyyxxmVjPYnzZPdmjnb7YYZvT0BfrPOdWMdBI98KFP++xvkO3AnsI5ZD8/cxrtMRf
         RjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=QDHaCQOyz7wYmtnlpwIe238wLXOcabRr7hw5kXaGtWl9J1lA1XVyBtN2VyReZbJYLQ
         iZRatE+4YPIdt13XKoA3R9I19xHgmnyhnapDp3jFEAib7d53nG1oQOJYNNM8SgbNSdkn
         i4aXxqgaRrc31WXiilsSiPJ9+SfcJ7IO+q8JoC3XJjJdyIKzJfHVsJF34kxF3+/BBL8N
         A29BRKz57Hn8Kvs48AS72FwgYgCg0a+S658KHZ7yeUVHK8+N6vlrYmIJ93hA8ouRXr16
         V0rkFMXXNTbaup6Yfp91D2DWYh3VgZ5Fhkp0O1jVqxlfcYRICBxqH14Dqp48DePSgQTE
         M/GQ==
X-Gm-Message-State: ACgBeo0BnBQdeI1VolKHtDsqhqk5B99vxHVBbubjmUFXL2djbqiSKcfp
        i5lSaQgMAC7CHSLhgDmEGtbD7Q==
X-Google-Smtp-Source: AA6agR4sVzhJVQGHj5sc/ss58KHQEIEDet4+td1dfYJmeDPZn+Jt3xx/nMavoTn4AOzBcVaOWVJWlw==
X-Received: by 2002:a05:600c:4211:b0:3b4:6334:9940 with SMTP id x17-20020a05600c421100b003b463349940mr2252285wmh.166.1663071271080;
        Tue, 13 Sep 2022 05:14:31 -0700 (PDT)
Received: from localhost.localdomain (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id p10-20020adf9d8a000000b00228634628f1sm10512230wre.110.2022.09.13.05.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:14:30 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee.jones@linaro.org, tony@atomide.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Tue, 13 Sep 2022 14:14:15 +0200
Message-Id: <20220913121419.15420-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913121419.15420-1-jneanne@baylibre.com>
References: <20220913121419.15420-1-jneanne@baylibre.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
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
index 565b50810579..1f7ce60ecb57 100644
--- a/arch/arm64/boot/dts/ti/k3-am642-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am642-sk.dts
@@ -294,6 +294,12 @@
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
@@ -352,6 +358,10 @@
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
2.17.1

