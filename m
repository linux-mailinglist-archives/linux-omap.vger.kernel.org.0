Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7979368EF1
	for <lists+linux-omap@lfdr.de>; Fri, 23 Apr 2021 10:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbhDWIif (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Apr 2021 04:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbhDWIif (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Apr 2021 04:38:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F040DC061574;
        Fri, 23 Apr 2021 01:37:58 -0700 (PDT)
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB9E4332;
        Fri, 23 Apr 2021 10:37:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619167076;
        bh=0rd+UTx3QxJ9CgU0e/oDrXH8eao+nlDFKoj0BYc9x2Q=;
        h=From:To:Cc:Subject:Date:From;
        b=IGgFWn1nFhFnk3W3q+ojXQAxAzcS0arqV3cfinCN0ZMbB549z/KcQHkklTNhd6VSw
         eJMuM/K25GTeVVX5LgtSsKUgTJDnTGxeFLnUxAG1ejOV6UeliZFH2kOPRNRK9dS9Rw
         BhNCxS/VGDHMl2OPUxy7qWX+1icJqP1ScwW9XiRg=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2] ARM: dts: dra76-evm: remove ov5640
Date:   Fri, 23 Apr 2021 11:37:12 +0300
Message-Id: <20210423083712.74676-1-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DRA76 EVM boards are not shipped with OV5640 sensor module, it is a
separate purchase. OV5640 module is also just one of the possible
sensors or capture boards you can connect.

However, for some reason, OV5640 has been added to the board dts file,
making it cumbersome to use other sensors.

Remove the OV5640 from the dts file so that it is easy to use other
sensors via DT overlays.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---

Changes in v2:
- Dropped empty i2c5 and csi2_0 nodes

A DT overlay with OV5640 can be found from:

https://git.kernel.org/pub/scm/linux/kernel/git/tomba/linux-dt.git/commit/?h=multistream/work&id=ac6b5065be54bb32322fcb8d04cda9a0eb10610c

 arch/arm/boot/dts/dra76-evm.dts | 35 ---------------------------------
 1 file changed, 35 deletions(-)

diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 9bd01ae40b1d..4508f7ffde0d 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -158,12 +158,6 @@ aic_dvdd: fixedregulator-aic_dvdd {
 		regulator-max-microvolt = <1800000>;
 	};
 
-	clk_ov5640_fixed: clock {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <24000000>;
-	};
-
 	hdmi0: connector {
 		compatible = "hdmi-connector";
 		label = "hdmi";
@@ -406,27 +400,6 @@ tlv320aic3106: tlv320aic3106@19 {
 	};
 };
 
-&i2c5 {
-	status = "okay";
-	clock-frequency = <400000>;
-
-	ov5640@3c {
-		compatible = "ovti,ov5640";
-		reg = <0x3c>;
-
-		clocks = <&clk_ov5640_fixed>;
-		clock-names = "xclk";
-
-		port {
-			csi2_cam0: endpoint {
-				remote-endpoint = <&csi2_phy0>;
-				clock-lanes = <0>;
-				data-lanes = <1 2>;
-			};
-		};
-	};
-};
-
 &cpu0 {
 	vdd-supply = <&buck10_reg>;
 };
@@ -573,14 +546,6 @@ can-transceiver {
 	};
 };
 
-&csi2_0 {
-	csi2_phy0: endpoint {
-		remote-endpoint = <&csi2_cam0>;
-		clock-lanes = <0>;
-		data-lanes = <1 2>;
-	};
-};
-
 &ipu2 {
 	status = "okay";
 	memory-region = <&ipu2_cma_pool>;
-- 
2.25.1

