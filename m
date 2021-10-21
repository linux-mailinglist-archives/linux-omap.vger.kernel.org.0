Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D9D74362AA
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 15:19:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhJUNVW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 09:21:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbhJUNVT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Oct 2021 09:21:19 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C62FC061228
        for <linux-omap@vger.kernel.org>; Thu, 21 Oct 2021 06:19:03 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2c41:c2bf:5c8f:53c5])
        by baptiste.telenet-ops.be with bizsmtp
        id 8dJy2600L1Z5S4H01dJyWi; Thu, 21 Oct 2021 15:19:01 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mdXyE-006ZAF-6s; Thu, 21 Oct 2021 15:18:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mdXyD-00GQ8E-LI; Thu, 21 Oct 2021 15:18:57 +0200
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
Subject: [PATCH 2/3] [RFC] arm64: dts: renesas: cat874: Drop bogus clocks property
Date:   Thu, 21 Oct 2021 15:18:52 +0200
Message-Id: <a554460f8a66842fdd7f73375d9c490a45813491.1634822085.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1634822085.git.geert+renesas@glider.be>
References: <cover.1634822085.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The NXP TDA998x HDMI transmitter Device Tree binding documentation does
not mention a clocks property.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is this property just missing from the bindings?
The driver doesn't seem to use it.
---
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 4e72e4f2bab055a5..c6fb684814bc290e 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -239,7 +239,6 @@ tda19988: tda19988@70 {
 
 		#sound-dai-cells = <0>;
 		audio-ports = <TDA998x_I2S 0x03>;
-		clocks = <&rcar_sound 1>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.25.1

