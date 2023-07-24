Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42BD975F39B
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jul 2023 12:40:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbjGXKkp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jul 2023 06:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232152AbjGXKkh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jul 2023 06:40:37 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25735E7B;
        Mon, 24 Jul 2023 03:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690195215; x=1721731215;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G1KXAjeQsGZ0kfCjhNN/h8xLaYtNWODa2JQRrUiSTvs=;
  b=iqhV00PO3nun8k/ntvzeZiO+UHOlNyFnR/rv/owCGoRE7+pVHkjiMKrz
   FRadkSo0gBaCHjSHvBWhy5ZzxWbYG3pI2HpDmkMn8IvbxMlvBMCi3DJKs
   6T1D3zt5fZUr9vXLAIUE4sVWVW1DCBkjc86KpGZ7uKCiJmSSyDx0MaWkj
   gK2vZvXSRrrNUr6cGssZj0IXgzHiZUtCCBdK/QTpzxhoa0101o2LKpHHJ
   KZVUBf1HtI+0l7xAeVmlLn3kdxidHLtNG9FxLwRkkwZU3TlpR3ntcJuIH
   HHn52q+QZOiDB2WGFz3RmUutIw/v39+aOxnFrFwKbOjMAb+0WCoENsN3m
   A==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32078485"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 12:39:19 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D43DE280087;
        Mon, 24 Jul 2023 12:39:18 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/6] arm64: dts: freescale: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio properties
Date:   Mon, 24 Jul 2023 12:39:11 +0200
Message-Id: <20230724103914.1779027-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
References: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Use id-gpios and vbus-gpios instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Shawn Guo <shawnguo@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi      | 2 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
index 5dbec71747c3..61c2a63efc6d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-msc-sm2s.dtsi
@@ -109,7 +109,7 @@ extcon_usb0: extcon-usb0 {
 		compatible = "linux,extcon-usb-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usb0_extcon>;
-		id-gpio = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
index fef62acd1152..fe492b773edb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dts
@@ -24,7 +24,7 @@ extcon_usbotg: extcon-usbotg0 {
 		compatible = "linux,extcon-usb-gpio";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_usbcon0>;
-		id-gpio = <&gpio1 10 GPIO_ACTIVE_HIGH>;
+		id-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;
 	};
 
 	pcie0_refclk: pcie0-refclk {
-- 
2.34.1

