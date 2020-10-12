Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F1428C40E
	for <lists+linux-omap@lfdr.de>; Mon, 12 Oct 2020 23:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgJLV3z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Oct 2020 17:29:55 -0400
Received: from vern.gendns.com ([98.142.107.122]:50622 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726348AbgJLV3y (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Oct 2020 17:29:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=V/8YPloHyYG1XKpnC2sh40gij8eXC+HkgKuPce2btkQ=; b=ebMi2qL+TF13DR/MtS953UdtKU
        nrvlQ8ERYzA2lHrX+gFkpXttOJG8pjNI2juVo+hQxaNyCqraNEKhTfSA7waIZYA9lC/2xIPnIwUjP
        7xHX2EKSNXTbxnaOZHlRu/nq9bdlG48pgh7+WZKtF/N3p7U9PIOsa3LC+iVutTmqvzDXce7FXuhN2
        6Y1Gz1SoyF/6WXSQu480tfAR2mBAEwI35u8k+2w+OfRr+/MvCNYkjKPowC+5giz/QdFGcISgh0kLk
        237pVXSgoqBhaNskpicOXCtwpbDJ7BskvYeG7N5DDLS0ZLHJ56OSYk+zbMlb2odz13wC+myak9Wm1
        Thp5O87Q==;
Received: from [2600:1700:4830:165f::19e] (port=52666 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kS57u-0004Ih-D3; Mon, 12 Oct 2020 17:13:02 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-omap@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] ARM: dts: am335x-boneblue: Enable eQEP
Date:   Mon, 12 Oct 2020 16:12:28 -0500
Message-Id: <20201012211229.3282128-3-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012211229.3282128-1-david@lechnology.com>
References: <20201012211229.3282128-1-david@lechnology.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This enables the Enhanced Quadrature Encoder Pulse (eQEP) module for
connectors E1, E2 and E3 on BeagleBone Blue.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/am335x-boneblue.dts | 54 +++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-boneblue.dts b/arch/arm/boot/dts/am335x-boneblue.dts
index c696d57cf364..69acaf4ea0f3 100644
--- a/arch/arm/boot/dts/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/am335x-boneblue.dts
@@ -241,6 +241,30 @@ AM33XX_PADCONF(AM335X_PIN_UART0_CTSN, PIN_OUTPUT, MUX_MODE2)		/* (E18) uart0_cts
 			AM33XX_PADCONF(AM335X_PIN_MII1_RXD0, PIN_OUTPUT, MUX_MODE7)		/* (M16) gmii1_rxd0.gpio2[21] */
 		>;
 	};
+
+	/* E1 */
+	eqep0_pins: pinmux_eqep0_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AXR0, PIN_INPUT, MUX_MODE1)		/* (B12) mcasp0_aclkr.eQEP0A_in */
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSR, PIN_INPUT, MUX_MODE1)		/* (C13) mcasp0_fsr.eQEP0B_in */
+		>;
+	};
+
+	/* E2 */
+	eqep1_pins: pinmux_eqep1_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_INPUT, MUX_MODE2)		/* (V2) lcd_data12.eQEP1A_in */
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_INPUT, MUX_MODE2)		/* (V3) lcd_data13.eQEP1B_in */
+		>;
+	};
+
+	/* E3 */
+	eqep2_pins: pinmux_eqep2_pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD12, PIN_INPUT, MUX_MODE4)		/* (T12) gpmc_ad12.eQEP2A_in */
+			AM33XX_PADCONF(AM335X_PIN_GPMC_AD13, PIN_INPUT, MUX_MODE4)		/* (R12) gpmc_ad13.eQEP2B_in */
+		>;
+	};
 };
 
 &uart0 {
@@ -419,3 +443,33 @@ ls_buf_en {
 		line-name = "LS_BUF_EN";
 	};
 };
+
+&epwmss0 {
+	status = "okay";
+};
+
+&eqep0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eqep0_pins>;
+	status = "okay";
+};
+
+&epwmss1 {
+	status = "okay";
+};
+
+&eqep1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eqep1_pins>;
+	status = "okay";
+};
+
+&epwmss2 {
+	status = "okay";
+};
+
+&eqep2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&eqep2_pins>;
+	status = "okay";
+};
-- 
2.25.1

