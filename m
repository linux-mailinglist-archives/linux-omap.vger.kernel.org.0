Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F30324362A8
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 15:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhJUNVV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 09:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbhJUNVS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Oct 2021 09:21:18 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129A0C061224
        for <linux-omap@vger.kernel.org>; Thu, 21 Oct 2021 06:19:01 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2c41:c2bf:5c8f:53c5])
        by xavier.telenet-ops.be with bizsmtp
        id 8dJy2600B1Z5S4H01dJynV; Thu, 21 Oct 2021 15:19:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mdXyE-006ZAE-7g; Thu, 21 Oct 2021 15:18:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mdXyD-00GQ88-Jy; Thu, 21 Oct 2021 15:18:57 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] ARM: dts: am335x: Fix TDA998x ports addressing
Date:   Thu, 21 Oct 2021 15:18:51 +0200
Message-Id: <9b31ebb7bfcb57a5a712a380b67b6ce8fd67492a.1634822085.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634822085.git.geert+renesas@glider.be>
References: <cover.1634822085.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix addressing in the NXP TDA998x HDMI transmitters' subnodes:
  - Add missing #{address,size}-cells properties to ports capsule,
  - Add missing reg properties to port child nodes,
  - Drop bogus unit addresses from endpoint grandchildren nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi | 7 ++++++-
 arch/arm/boot/dts/am335x-myirtech-myd.dts    | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi b/arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
index 7cfddada934861bc..486f24deb875c688 100644
--- a/arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-hdmi.dtsi
@@ -85,8 +85,13 @@ tda19988: tda19988@70 {
 		audio-ports = <	TDA998x_I2S	0x03>;
 
 		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			port@0 {
-				hdmi_0: endpoint@0 {
+				reg = <0>;
+
+				hdmi_0: endpoint {
 					remote-endpoint = <&lcdc_0>;
 				};
 			};
diff --git a/arch/arm/boot/dts/am335x-myirtech-myd.dts b/arch/arm/boot/dts/am335x-myirtech-myd.dts
index 1479fd95dec2441c..4120bfb351bd9e69 100644
--- a/arch/arm/boot/dts/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/am335x-myirtech-myd.dts
@@ -161,8 +161,13 @@ tda9988: tda9988@70 {
 		#sound-dai-cells = <0>;
 
 		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
 			port@0 {
-				hdmi_0: endpoint@0 {
+				reg = <0>;
+
+				hdmi_0: endpoint {
 					remote-endpoint = <&lcdc_0>;
 				};
 			};
-- 
2.25.1

