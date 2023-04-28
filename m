Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 178186F1614
	for <lists+linux-omap@lfdr.de>; Fri, 28 Apr 2023 12:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjD1KzJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Apr 2023 06:55:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345699AbjD1KzA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 28 Apr 2023 06:55:00 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B504A2735
        for <linux-omap@vger.kernel.org>; Fri, 28 Apr 2023 03:54:56 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3f19a80a330so48213545e9.2
        for <linux-omap@vger.kernel.org>; Fri, 28 Apr 2023 03:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682679295; x=1685271295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFNBJS20WLgq1YWyfU1SnWpJA65lDW01dwN6L86FEiI=;
        b=Uja4PbpFNjG0tUrWzV09vLbGbxy8/XMyaRlpnY3ur3T4I31yDWe6lI+tDUCB7ZRQgw
         wKktKgeKeY9r/rtr6ND+Tyxq8CfoAZG/TOIxEL9HCum80TT2EZ3djIAPJxECmr13rzGA
         hWQSzjg44ObkZ4UmDX68wPFnFJyplsR9kXT5iiUUqis1H+ZugoybNAjr5xvm7hQXK64l
         /wwVh/UoO44nN8KWR+ZNdW0MEaHuoUhVyS2rVzfrQ6uDNEyt2J98448fQ4FUE5rMikUl
         xGzAn4opGhPtOvyVKfTl1Uik6WT6VDUv0pl2inM93MxyMi3tjYcyUROvR383dkmVaFun
         71zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682679295; x=1685271295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFNBJS20WLgq1YWyfU1SnWpJA65lDW01dwN6L86FEiI=;
        b=WKWgZB8MnifOyKAd7BlMZmdvAwbqJ6VPh03AKZeFYMcTZcF2JabnA5ucrPqpnnarcV
         Kl+x6oy0erG30C8j5kAAmy9tyyvySESmwTn6+6QMXADurnCYozy/6kDsPfw/AY+yK3+y
         tNlCvbaE5Iqn6zYaxnHs2Fewh9DeZLgC5rgkev58bFDqA/Jsv8qANnzdg3b2f4ZI7JFx
         ajBHNTPClhM+TvM7hAardJMDtUtwemuGvxCoIZTUIYaXd1kvT/q2B94NVl9Gf5C6RHlf
         nKfJcjFEdCcYHVyvm8+4A85AiZUrptw+MhF/DKyAE82xI5o6YJDkthYU1/UyOFIJIMWF
         5KtA==
X-Gm-Message-State: AC+VfDwrgZfEe8Hq9i0FlW9KY/w5lpA9yebDxSuRzMK3h9roomJsUD1h
        1IUU3Ky/VzcYydQe36fQxXsh/w==
X-Google-Smtp-Source: ACHHUZ7pVr9Uf8iWfR262MteoPdvkPdUB1g3VnlbDTqQ6Aacto3mpYT36+LLcoSnXyQC7MluFI1Vlw==
X-Received: by 2002:a05:600c:2042:b0:3f1:7e3a:2ef2 with SMTP id p2-20020a05600c204200b003f17e3a2ef2mr3895061wmg.14.1682679295180;
        Fri, 28 Apr 2023 03:54:55 -0700 (PDT)
Received: from baylibre-ThinkPad-T14s-Gen-2i.. (151.31.102.84.rev.sfr.net. [84.102.31.151])
        by smtp.gmail.com with ESMTPSA id z9-20020a05600c114900b003f1745c7df3sm703323wmz.23.2023.04.28.03.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 03:54:54 -0700 (PDT)
From:   Julien Panis <jpanis@baylibre.com>
To:     arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, tony@atomide.com
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH] arm: dts: Add am335x-boneblack-pps.dts
Date:   Fri, 28 Apr 2023 12:54:53 +0200
Message-Id: <20230428105453.110254-1-jpanis@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Lokesh Vutla <lokeshvutla@ti.com>

Add a new am335x-boneblack-pps.dts that can be used to configure TIMER7
in PWM mode. This PWM signal can be used as a PPS signal when
synchronized to PTP clock. Typically this synchronization is done by a
userspace program. This PPS signal can be observed on pin P8.8.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 arch/arm/boot/dts/Makefile                 |  1 +
 arch/arm/boot/dts/am335x-boneblack-pps.dts | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 arch/arm/boot/dts/am335x-boneblack-pps.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe4152e5846..d74158aae72d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -939,6 +939,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-base0033.dtb \
 	am335x-bone.dtb \
 	am335x-boneblack.dtb \
+	am335x-boneblack-pps.dtb \
 	am335x-boneblack-wireless.dtb \
 	am335x-boneblue.dtb \
 	am335x-bonegreen.dtb \
diff --git a/arch/arm/boot/dts/am335x-boneblack-pps.dts b/arch/arm/boot/dts/am335x-boneblack-pps.dts
new file mode 100644
index 000000000000..88d2bc3fd759
--- /dev/null
+++ b/arch/arm/boot/dts/am335x-boneblack-pps.dts
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 Texas Instruments Incorporated - http://www.ti.com/
+ */
+
+#include "am335x-boneblack.dts"
+
+&am33xx_pinmux {
+	pwm7_pins: pinmux_pwm7_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_OEN_REN, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+		>;
+	};
+};
+
+/{
+	pwm7: dmtimer-pwm7 {
+		compatible = "ti,omap-dmtimer-pwm";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwm7_pins>;
+		#pwm-cells = <3>;
+		ti,timers = <&timer7>;
+		ti,clock-source = <0x00>; /* timer_sys_ck */
+	};
+};

base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
-- 
2.37.3

