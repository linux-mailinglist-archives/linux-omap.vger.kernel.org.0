Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4BC5B89F3
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 16:09:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229666AbiINOIO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 10:08:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbiINOIM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 10:08:12 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8F9E29C
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 07:08:10 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id v185-20020a1cacc2000000b003b42e4f278cso12557261wme.5
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 07:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=BkAdeENHKwqWEpHuxRgoziL4TNybjrGvYGNqkfjZCBwMjRIOVUFvio4QsOiidm/7d9
         /TjD+GTV7C9L2GaIv7bhNS1hmzvK901pXgtRcO1MJe0YKuyvXEfr27I7c2v3botVkGV6
         CpH+nfu7E3StdgW/anuyUVuVYr4GQkVl4O8ps1LUeBtFz4759S2kZ1fQKdCs5nEspG+d
         P8RuQtQo31QnDE8QESjedSFVYGLwP2Z0VQ+MhrWgXCExPslxWPSFir6Lct4usiGsPqst
         SFSVWineq+l7ocPNwi6eqHQce/qK60QeKIPGfUnWVpErttM9RPjU6lk582hA5rWfZw66
         0i1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=26mHhiEWRCmHQANhFIxdEE/iPWuTtIYaTzT3xv6hslo=;
        b=63JYVunrbBq6d2Aq7E9thPqMnl8k22YSBR6w5WxgMlVFMttGiUEw/bBR+nokPF6u74
         YHqGbDsmOyFflqp0wK5FHcPwH6gX/NOTWO1FVWbi6/crfcqkxhr+T09cqVKPVZdgyoJV
         LT5qcwLfQ5ga1QhzFe5sOpiBTV9xPp775W1hufgqesVwdRxrgAU8+LLDzQtpYDGY8PpF
         iFne6EHaABtwhr0hUKHZvI6ju6h+ANOcF+mUe75Sjp15nAaDA7ighe3jM+XMe1a9AH2j
         m3UIfdRB4ovK+d9cYb1eMXW9WIYPU5NPjNMg5ARah1wCGK+afaZNUVLH/gFptNA1+OHt
         xVgw==
X-Gm-Message-State: ACgBeo2iqGWQYGWUCe5CEQ1X9Ngty14QF9Xq/MpJENNIxGHpaG9qQQ88
        f9LqRAy4jhtU0fbHzJCr/rk39Q==
X-Google-Smtp-Source: AA6agR6TUHCMwiJKndbdkVqQDxuo5HYtwVj3rRDxrOU54gZ8pAYbDeOFD4zB08JWHVAQ5Px7gCpCtA==
X-Received: by 2002:a05:600c:4ec9:b0:3a5:a567:137f with SMTP id g9-20020a05600c4ec900b003a5a567137fmr3388739wmq.46.1663164489272;
        Wed, 14 Sep 2022 07:08:09 -0700 (PDT)
Received: from jerome-BL.theccd.local ([89.101.193.66])
        by smtp.gmail.com with ESMTPSA id z12-20020a5d654c000000b00228e1e90822sm13303767wrv.112.2022.09.14.07.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 07:08:08 -0700 (PDT)
From:   Jerome Neanne <jneanne@baylibre.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee.jones@linaro.org, tony@atomide.com,
        vigneshr@ti.com, bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, jneanne@baylibre.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v5 2/6] DONOTMERGE: arm64: dts: ti: Add pinmux and irq mapping for TPS65219 external interrupts
Date:   Wed, 14 Sep 2022 16:07:54 +0200
Message-Id: <20220914140758.7582-3-jneanne@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220914140758.7582-1-jneanne@baylibre.com>
References: <20220914140758.7582-1-jneanne@baylibre.com>
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

