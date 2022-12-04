Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFF62641C78
	for <lists+linux-omap@lfdr.de>; Sun,  4 Dec 2022 11:59:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiLDK7M convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Sun, 4 Dec 2022 05:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbiLDK7J (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 4 Dec 2022 05:59:09 -0500
Received: from sender11-of-o51.zoho.eu (sender11-of-o51.zoho.eu [31.186.226.237])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B00D218344;
        Sun,  4 Dec 2022 02:59:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670150631; cv=none; 
        d=zohomail.eu; s=zohoarc; 
        b=XV8U0fIewNZMDyRQfh1ndXul/l8myE4FgPeN4LNja3joTSpD4lNJcZOuseOn2/jGzL1R50D3rO6q+AiWnDUWOJ5/ImWPS+wiSVGNc9ixEZu57mfjA0D7Q80aL2emm46nb2IqVMbqmvl2sPQYH5Da68QLWVtssk40JH2eU+YCZrw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
        t=1670150631; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=tnqaXZrkk+J8/iyv+u9EIdqT2hYanUoFYILAn5CMJ+s=; 
        b=jcM+O5KfnvMwtltAZzCXjVerZB/7026DlMRRtF2PjXnD2UtYHmi0tvBmtEKehDlcOu9Qm2PgrcW4vkO+LLhSqE8KZXWDvibQPxf+iWjY60vueIVIw2VqEQQG76SCv02GMg84YI1RpMRfzqrqy9mFVhADTNEq9K8q08KoXmjhfLI=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
        spf=pass  smtp.mailfrom=philipp@uvos.xyz;
        dmarc=pass header.from=<philipp@uvos.xyz>
Received: from localhost.localdomain (ip-095-222-026-199.um34.pools.vodafone-ip.de [95.222.26.199]) by mx.zoho.eu
        with SMTPS id 1670150628750701.5439332715536; Sun, 4 Dec 2022 11:43:48 +0100 (CET)
From:   Carl Philipp Klemm <philipp@uvos.xyz>
To:     linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org
Cc:     devicetree@vger.kernel.org, Carl Philipp Klemm <philipp@uvos.xyz>
Message-ID: <20221204104313.17478-4-philipp@uvos.xyz>
Subject: [PATCH 4/4] arch: arm: dts: cpcap-mapphone: Move cpcap leds from common dts file to devices as apropriate
Date:   Sun,  4 Dec 2022 11:43:13 +0100
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204104313.17478-1-philipp@uvos.xyz>
References: <20221204104313.17478-1-philipp@uvos.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
X-ZohoMailClient: External
Content-Type: text/plain; charset=utf8
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,FROM_SUSPICIOUS_NTLD,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Removes non-functional leds from xt875 and adds its touchscreen
button light

Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
---
 .../arm/boot/dts/motorola-cpcap-mapphone.dtsi | 47 ++++++++-----------
 .../arm/boot/dts/omap4-droid-bionic-xt875.dts |  7 +++
 arch/arm/boot/dts/omap4-droid4-xt894.dts      | 14 ++++++
 3 files changed, 41 insertions(+), 27 deletions(-)

diff --git a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
index ea02fd403a9b..f7ddcf122404 100644
--- a/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/motorola-cpcap-mapphone.dtsi
@@ -115,36 +115,29 @@ cpcap_usb2_phy: phy {
 			io-channel-names = "vbus", "id";
 			vusb-supply = <&vusb>;
 		};
+	};
+};
 
-		led_red: led-red {
-			compatible = "motorola,cpcap-led-red";
-			vdd-supply = <&sw5>;
-			label = "status-led:red";
-		};
-
-		led_green: led-green {
-			compatible = "motorola,cpcap-led-green";
-			vdd-supply = <&sw5>;
-			label = "status-led:green";
-		};
-
-		led_blue: led-blue {
-			compatible = "motorola,cpcap-led-blue";
-			vdd-supply = <&sw5>;
-			label = "status-led:blue";
-		};
+/ {
+	led_red: led-red {
+		compatible = "motorola,cpcap-led-red";
+		vdd-supply = <&sw5>;
+		label = "status-led:red";
+		cpcap-phandle = <&cpcap>;
+	};
 
-		led_adl: led-adl {
-			compatible = "motorola,cpcap-led-adl";
-			vdd-supply = <&sw5>;
-			label = "button-backlight";
-		};
+	led_green: led-green {
+		compatible = "motorola,cpcap-led-green";
+		vdd-supply = <&sw5>;
+		label = "status-led:green";
+		cpcap-phandle = <&cpcap>;
+	};
 
-		led_cp: led-cp {
-			compatible = "motorola,cpcap-led-cp";
-			vdd-supply = <&sw5>;
-			label = "shift-key-light";
-		};
+	led_blue: led-blue {
+		compatible = "motorola,cpcap-led-blue";
+		vdd-supply = <&sw5>;
+		label = "status-led:blue";
+		cpcap-phandle = <&cpcap>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
index ccf03a743678..eae69ec9b3f1 100644
--- a/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
+++ b/arch/arm/boot/dts/omap4-droid-bionic-xt875.dts
@@ -6,6 +6,13 @@
 / {
 	model = "Motorola Droid Bionic XT875";
 	compatible = "motorola,droid-bionic", "ti,omap4430", "ti,omap4";
+
+	led_kl: led-kl {
+		compatible = "motorola,cpcap-led-kl";
+		vdd-supply = <&sw5>;
+		label = "button-backlight";
+		cpcap-phandle = <&cpcap>;
+	};
 };
 
 &keypad {
diff --git a/arch/arm/boot/dts/omap4-droid4-xt894.dts b/arch/arm/boot/dts/omap4-droid4-xt894.dts
index e833c21f1c01..a590f28edbf6 100644
--- a/arch/arm/boot/dts/omap4-droid4-xt894.dts
+++ b/arch/arm/boot/dts/omap4-droid4-xt894.dts
@@ -31,6 +31,20 @@ slider {
 			debounce-interval = <10>;
 		};
 	};
+
+	led_adl: led-adl {
+		compatible = "motorola,cpcap-led-adl";
+		vdd-supply = <&sw5>;
+		label = "button-backlight";
+		cpcap-phandle = <&cpcap>;
+	};
+
+	led_cp: led-cp {
+		compatible = "motorola,cpcap-led-cp";
+		vdd-supply = <&sw5>;
+		label = "shift-key-light";
+		cpcap-phandle = <&cpcap>;
+	};
 };
 
 / {
-- 
2.38.1


