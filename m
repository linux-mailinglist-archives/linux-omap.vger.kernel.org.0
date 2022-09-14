Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656055B8AA5
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 16:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230150AbiINOeB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 10:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbiINOeA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 10:34:00 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1BB7F085
        for <linux-omap@vger.kernel.org>; Wed, 14 Sep 2022 07:33:57 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:e925:8cbe:2e99:b03b])
        by baptiste.telenet-ops.be with bizsmtp
        id KqZi280123vs4GX01qZiPZ; Wed, 14 Sep 2022 16:33:55 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTSP-005B5L-WE; Wed, 14 Sep 2022 16:33:42 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oYTS7-000zX5-0F; Wed, 14 Sep 2022 16:33:23 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] ARM: dts: am335x: Fix TDA998x ports addressing
Date:   Wed, 14 Sep 2022 16:33:20 +0200
Message-Id: <4e22d085aec6e7e9e79f7f3a0a13a4ea91374ddc.1663165552.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1663165552.git.geert+renesas@glider.be>
References: <cover.1663165552.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix addressing in the NXP TDA998x HDMI transmitters' subnodes:
  - Add missing #{address,size}-cells properties to ports capsule,
  - Add missing reg properties to port child nodes,
  - Drop bogus unit addresses from endpoint grandchildren nodes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
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
index 9d81d4cc6890eea9..425ad9b81a68ab18 100644
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

