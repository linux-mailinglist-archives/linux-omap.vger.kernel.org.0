Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E45696492
	for <lists+linux-omap@lfdr.de>; Tue, 14 Feb 2023 14:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232312AbjBNNXi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Feb 2023 08:23:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231801AbjBNNXh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Feb 2023 08:23:37 -0500
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CA67D8C
        for <linux-omap@vger.kernel.org>; Tue, 14 Feb 2023 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1676381001; x=1678973001;
        h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=6c0i+MLtkbNcdLJusCQdNuh7Aa5KRDchlsfnTXfJzuk=;
        b=bA4QQTervjzqz8sHZEj35GX2cROAYM0/lnnAGcwDbTKw8FtJkFcAxDDEFQCR+VN2
        E4frqPDFJlFe+IL5IiI+HdAtqoBLbItxfAoQVh7zOILmGHI+yesOiX2iY7BrqTV2
        GGHfjYvmwGhtNg9fOZSBZNdro0eF/JJocktiDEVYd3Y=;
X-AuditID: ac14000a-325f924000007ecb-eb-63eb8b49e02d
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
        (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 6F.C9.32459.94B8BE36; Tue, 14 Feb 2023 14:23:21 +0100 (CET)
Received: from llp-Hemer.phytec.de (172.25.0.11) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 14 Feb
 2023 14:23:21 +0100
From:   Steffen Hemer <s.hemer@phytec.de>
To:     <linux-omap@vger.kernel.org>
CC:     <upstream@lists.phytec.de>, <krzysztof.kozlowski+dt@linaro.org>,
        <robh+dt@kernel.org>, <tony@atomide.com>, <bcousson@baylibre.com>
Subject: [PATCH 2/8] ARM: dts: am335x-wega: Fix audio codec by using simple-audio-card driver.
Date:   Tue, 14 Feb 2023 14:22:56 +0100
Message-ID: <20230214132302.39087-2-s.hemer@phytec.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214132302.39087-1-s.hemer@phytec.de>
References: <20230214132302.39087-1-s.hemer@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.25.0.11]
X-ClientProxiedBy: Berlix.phytec.de (172.25.0.12) To Florix.phytec.de
 (172.25.0.13)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrELMWRmVeSWpSXmKPExsWyRpKBV9ez+3Wywde9BhZ35v9lteh78ZDZ
        YvaSfhaL1r1H2C32X/Gy6H6n7sDm8e3rJBaP9zda2T02repk87hzbQ+bR393C6vH501yAWxR
        XDYpqTmZZalF+nYJXBn/jpxnKjgpXLF8xwK2BsY7/F2MnBwSAiYSN2Z0M3cxcnEICSxmkrgy
        aSE7hPOYUeLxvB9MIFVsAuoS8/d+ZwexRQQUJI4caWIFKWIW6GCUaJ7ZDZYQFoiTuDS1hxnE
        ZhFQlZhw4SQLiM0rYCbR3fWeEWKdvMT+g2fBajgFzCWWT3jDBmILAdW0H74DVS8ocXLmEzCb
        Gai+eetsZghbQuLgixfMEPVyEnNOfWSGmTnt3GsoO1Si8899lgmMQrOQjJqFZNQsJKMWMDKv
        YhTKzUzOTi3KzNYryKgsSU3WS0ndxAiKBxEGrh2MfXM8DjEycTAeYpTgYFYS4RV++iJZiDcl
        sbIqtSg/vqg0J7X4EKM0B4uSOO/9HqZEIYH0xJLU7NTUgtQimCwTB6dUA+N+qeLigJd3rwvM
        8Sxwk9E5sMXgTJOx7aLV++eGbJm788anL28YWy0/Szsd/3m1xtngwwrZ437LWvWFolzlF5xe
        InZ+37wLFhIPJmZtY5rgJax624F/RZPDz6mS/4KtLt33n2LomWBm2XKl5XhgQ/KmtunRccqL
        fB6UHSwSCj7hdEsldzpnmokSS3FGoqEWc1FxIgC/j2ofdQIAAA==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Sound did not work with the previous EVM sound card binding, EVM dts
switched to using 'simple-audio-card', so this fixes audio codec by using
simple-audio-card driver.

Signed-off-by: Steffen Hemer <s.hemer@phytec.de>
---
 arch/arm/boot/dts/am335x-wega.dtsi | 46 ++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-wega.dtsi b/arch/arm/boot/dts/am335x-wega.dtsi
index f957fea8208e..6c5d26bbe952 100644
--- a/arch/arm/boot/dts/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/am335x-wega.dtsi
@@ -8,8 +8,34 @@ / {
 	model = "Phytec AM335x phyBOARD-WEGA";
 	compatible = "phytec,am335x-wega", "phytec,am335x-phycore-som", "ti,am33xx";
 
-	sound: sound_iface {
-		compatible = "ti,da830-evm-audio";
+	sound: sound-iface {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "snd-wega";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sound_iface_main>;
+		simple-audio-card,frame-master = <&sound_iface_main>;
+		simple-audio-card,mclk-fs = <32>;
+		simple-audio-card,widgets =
+					"Line", "Line In",
+					"Line", "Line Out",
+					"Speaker", "Speaker";
+		simple-audio-card,routing =
+					"Line Out", "LLOUT",
+					"Line Out", "RLOUT",
+					"Speaker", "SPOP",
+					"Speaker", "SPOM",
+					"LINE1L", "Line In",
+					"LINE1R", "Line In";
+
+		simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+		};
+
+		sound_iface_main: simple-audio-card,codec {
+			sound-dai = <&tlv320aic3007>;
+			clocks = <&mcasp0_fck>;
+		};
+
 	};
 
 	vcc3v3: fixedregulator1 {
@@ -36,6 +62,7 @@ AM33XX_PADCONF(AM335X_PIN_MCASP0_AXR1, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
 
 &i2c0 {
 	tlv320aic3007: tlv320aic3007@18 {
+		#sound-dai-cells = <0>;
 		compatible = "ti,tlv320aic3007";
 		reg = <0x18>;
 		AVDD-supply = <&vcc3v3>;
@@ -47,6 +74,7 @@ tlv320aic3007: tlv320aic3007@18 {
 };
 
 &mcasp0 {
+	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mcasp0_pins>;
 	op-mode = <0>; /* DAVINCI_MCASP_IIS_MODE */
@@ -59,19 +87,6 @@ &mcasp0 {
 	status = "okay";
 };
 
-&sound {
-	ti,model = "AM335x-Wega";
-	ti,audio-codec = <&tlv320aic3007>;
-	ti,mcasp-controller = <&mcasp0>;
-	ti,audio-routing =
-		"Line Out",		"LLOUT",
-		"Line Out",		"RLOUT",
-		"LINE1L",		"Line In",
-		"LINE1R",		"Line In";
-	clocks = <&mcasp0_fck>;
-	clock-names = "mclk";
-	status = "okay";
-};
 
 /* CAN Busses */
 &am33xx_pinmux {
-- 
2.34.1

