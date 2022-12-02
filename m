Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14ADE640B14
	for <lists+linux-omap@lfdr.de>; Fri,  2 Dec 2022 17:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234096AbiLBQuG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Dec 2022 11:50:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233823AbiLBQuE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Dec 2022 11:50:04 -0500
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3915CCFDD
        for <linux-omap@vger.kernel.org>; Fri,  2 Dec 2022 08:50:01 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
        by albert.telenet-ops.be with bizsmtp
        id rUpW2800C0ys3B706UpWC6; Fri, 02 Dec 2022 17:49:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E9-002K66-7w; Fri, 02 Dec 2022 17:49:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1p19E8-006Wb3-GZ; Fri, 02 Dec 2022 17:49:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        UNGLinuxDriver@microchip.com,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org
Subject: [PATCH 10/11] MIPS: mscc: jaguar2: Fix pca9545 i2c-mux node names
Date:   Fri,  2 Dec 2022 17:49:25 +0100
Message-Id: <5eb01c348c5dd90887b33e866555df8f1067e9df.1669999298.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669999298.git.geert+renesas@glider.be>
References: <cover.1669999298.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

"make dtbs_check":

    arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: pca9545@70: $nodename:0: 'pca9545@70' does not match '^(i2c-?)?mux'
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    arch/mips/boot/dts/mscc/jaguar2_pcb110.dtb: pca9545@70: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'i2c@0', 'i2c@1', 'i2c@2', 'i2c@3' were unexpected)
	    From schema: Documentation/devicetree/bindings/i2c/i2c-mux-pca954x.yaml
    ...

Fix this by renaming PCA9545 nodes to "i2c-mux", to match the I2C bus
multiplexer/switch DT bindings and the Generic Names Recommendation in
the Devicetree Specification.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/boot/dts/mscc/jaguar2_pcb110.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/mscc/jaguar2_pcb110.dts b/arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
index 0ea7bc5b5746842f..1813f4e32e55fadb 100644
--- a/arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
+++ b/arch/mips/boot/dts/mscc/jaguar2_pcb110.dts
@@ -208,7 +208,7 @@ i2cmux_3: i2cmux-3-pins {
 };
 
 &i2c0 {
-	pca9545@70 {
+	i2c-mux@70 {
 		compatible = "nxp,pca9545";
 		reg = <0x70>;
 		#address-cells = <1>;
@@ -236,7 +236,7 @@ i2c127: i2c@3 {
 			reg = <3>;
 		};
 	};
-	pca9545@71 {
+	i2c-mux@71 {
 		compatible = "nxp,pca9545";
 		reg = <0x71>;
 		#address-cells = <1>;
-- 
2.25.1

