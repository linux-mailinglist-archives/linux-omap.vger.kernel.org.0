Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72AE54BCAEA
	for <lists+linux-omap@lfdr.de>; Sat, 19 Feb 2022 22:59:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243212AbiBSV4N (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 16:56:13 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243175AbiBSV4L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 16:56:11 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8C55541A9
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 13:55:45 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id w37so4517754pga.7
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 13:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=DZiOtxBgoTtwB9UJCoY4ZWmHfqn+dNPJ6H+DmBuShUo=;
        b=VsBO4YCWPc6ib471hmScxdPkd5daMf5/3q37Dx+GlNpIVyuhM1J3OTEnzAq3ifa2Nk
         ThSiij4+tIN2Dd/oF+tW6xv2JAJqAmURHr4Ny+pX9XNRQYFyIBL1mGJ953LQ0GCTSKUO
         uoNTgpN5gGcy7yeBAPELm0gJMt+qeTXLf/RkPjoIDpdVlreCHJu0HEBwnvEx5IpZJW14
         D2EOiCLdJvp4lwuPO8Qitwkd6x+sikjvvc/wyk/Wutdh1YYpPBEvR+fOQTy7lcSjP4ZV
         WniLF2oSAtEmrfQfRWq2tnzfGF4X5+hk3oWPKLo76jIl3SPcNdt1CFQS89M/v9zjIUUM
         m6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DZiOtxBgoTtwB9UJCoY4ZWmHfqn+dNPJ6H+DmBuShUo=;
        b=tlOF67fUjHQUGLceFps7cKUuqqkGDvBrTxsFXMQlmCxoAk7BT7woDLkqGMYcSp9umF
         X4dJrQ41TmNN/7lc5A6zFTB8tRGTeGeaGuoGWCkKf9gTJoVIsVuvDDFPkgftPWSbPY47
         UmyadRoz2qkS8p9u69okDQLObYTvbchuDeZyv5Q8cZ6sdCQACVPxbbtwihaTl3GSZhEX
         oO0654jwY7Ao8DVal+eesbjy2442oXh6C5kkV+2LYuW3tICBkgkf3v6l/rIBYIRZCiRr
         o26lxS9fVK2couggWs4mc+j5xwMPv3EZdIDWEMyqK++rcBfGU1y/1AfmBuJvawhRYQPL
         9Olw==
X-Gm-Message-State: AOAM533IUpMmWGXte7sKpprlFM94lV+3DsFECrDu4CYYRFII0bs9kw65
        Uimogi7sMPHUm7uxOClyLYmyDw==
X-Google-Smtp-Source: ABdhPJyoFjeAb5/4d7KaIVBfHrlpcRCkYuPnEHCv4zupG3KFWCHinQulVyzNGCV+KsSAPxCBwWg1TQ==
X-Received: by 2002:a63:e403:0:b0:365:5657:7b4d with SMTP id a3-20020a63e403000000b0036556577b4dmr10908413pgi.130.1645307745264;
        Sat, 19 Feb 2022 13:55:45 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1001:7090:31ab:1e81:9550:f30a])
        by smtp.gmail.com with ESMTPSA id i17sm13447337pgn.82.2022.02.19.13.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 13:55:44 -0800 (PST)
From:   Drew Fustini <dfustini@baylibre.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Gerlach <d-gerlach@ti.com>, devicetree@vger.kernel.org,
        Drew Fustini <dfustini@baylibre.com>,
        Keerthy <j-keerthy@ti.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, s-anna@ti.com,
        khilman@baylibre.com
Subject: [PATCH 04/11] dt-bindings: wkup_m3_ipc: Add ti,io-isolation property
Date:   Sat, 19 Feb 2022 13:53:21 -0800
Message-Id: <20220219215328.485660-5-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219215328.485660-1-dfustini@baylibre.com>
References: <20220219215328.485660-1-dfustini@baylibre.com>
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

From: Dave Gerlach <d-gerlach@ti.com>

Add documentation for the ti,io-isolation DT property on the wkup_m3_ipc
node which tells the wkup_m3_ipc driver to use the wkup_m3 to enable
IO Isolation during low power mode transitions on am43xx platforms.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../bindings/soc/ti/wkup_m3_ipc.txt           | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt b/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
index 4cdbb60fd0d0..df6b600abf4c 100644
--- a/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
+++ b/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
@@ -89,3 +89,49 @@ Example:
 		ti,vtt-gpio-pin = <7>;
 		...
 	};
+
+
+IO Isolation
+============
+Supported by: AM43xx SoCs
+
+It is possible to configure any pin with a corresponding CTRL_CONF_*
+register in the control module to use the states defined in the DS_PAD_CONFIG
+bits by enabling IO isolation on the SoC. The 'ti,set-io-isolation' property
+tells the wkup_m3_ipc driver to enable IO isolation late in the suspend path
+after all drivers have been disabled.
+
+Optional properties:
+- ti,set-io-isolation:	Indicates that the IO's should be placed into
+			isolation and the DS_PAD_CONFIG values should be
+			used during suspend.
+
+Example (VTT Toggle using any GPIO on am437x-gp-evm):
+-----------------------------------------------------
+
+On the AM437x GP EVM, the VTT enable line must be held low to disable VTT
+regulator and held high to enable, so the following pinctrl entry is used.
+The DS pull is enabled which uses a pull down by default and DS off mode is
+used which outputs a low by default. For the normal state, a pull up is
+specified so that the VTT enable line gets pulled high immediately after
+the DS states are removed upon exit from DeepSleep0.
+
+	&am43xx_pinmux {
+		pinctrl-names = "default";
+		pinctrl-0 = <&ddr3_vtt_toggle_default>;
+
+		ddr3_vtt_toggle_default: ddr_vtt_toggle_default {
+		pinctrl-single,pins = <
+			0x25C (DS0_PULL_UP_DOWN_EN | PIN_OUTPUT_PULLUP |
+			       DS0_FORCE_OFF_MODE | MUX_MODE7)>;
+		};
+		...
+	};
+
+	wkup_m3_ipc: wkup_m3_ipc@1324 {
+		compatible = "ti,am4372-wkup-m3-ipc";
+		...
+		...
+		ti,set-io-isolation;
+		...
+	};
-- 
2.32.0

