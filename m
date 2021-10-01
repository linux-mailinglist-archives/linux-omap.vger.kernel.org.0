Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 971DA41E864
	for <lists+linux-omap@lfdr.de>; Fri,  1 Oct 2021 09:34:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352567AbhJAHgX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 Oct 2021 03:36:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352570AbhJAHgV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 Oct 2021 03:36:21 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4077AC06177E;
        Fri,  1 Oct 2021 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=VhsqtsfjNgyHpyCbKl21yTB03JZ/scJRnZfa8O240gA=; b=V7wiHUByP+yv6+nyAlGvKS74kG
        aZGY9IiZ3xhh9cLtLr+M95u12kkE0OeLpZsW2aIYILEFIoVNZPDPyVXmHTVjsPTJ/8lb8nutW01U0
        8XVM76cOWgCiY6svHvnuCIORSoZluDhtGtOwoANvaYgl2Q2D9dqh6fKQWzq1Fp6+fUOE=;
Received: from p200300ccff0b42001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:4200:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3w-000142-HD; Fri, 01 Oct 2021 09:34:32 +0200
Received: from andi by aktux with local (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1mWD3r-00CBfS-2B; Fri, 01 Oct 2021 09:34:27 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org,
        hns@goldelico.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org
Cc:     Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 1/5] arm: dts: omap3-gta04: cleanup LCD definition
Date:   Fri,  1 Oct 2021 09:34:12 +0200
Message-Id: <20211001073416.2904733-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001073416.2904733-1-andreas@kemnade.info>
References: <20211001073416.2904733-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace depreciated nodenames, fix label name to match scheme.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
 arch/arm/boot/dts/omap3-gta04.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-gta04.dtsi b/arch/arm/boot/dts/omap3-gta04.dtsi
index 938cc691bb2f..9ccd45599104 100644
--- a/arch/arm/boot/dts/omap3-gta04.dtsi
+++ b/arch/arm/boot/dts/omap3-gta04.dtsi
@@ -104,16 +104,16 @@ gtm601_codec: gsm_codec {
 		#sound-dai-cells = <0>;
 	};
 
-	spi_lcd: spi_lcd {
+	spi_lcd: spi {
 		compatible = "spi-gpio";
 		#address-cells = <0x1>;
 		#size-cells = <0x0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&spi_gpio_pins>;
 
-		gpio-sck = <&gpio1 12 GPIO_ACTIVE_HIGH>;
-		gpio-miso = <&gpio1 18 GPIO_ACTIVE_HIGH>;
-		gpio-mosi = <&gpio1 20 GPIO_ACTIVE_HIGH>;
+		sck-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+		miso-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpio1 20 GPIO_ACTIVE_HIGH>;
 		cs-gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
 		num-chipselects = <1>;
 
-- 
2.30.2

