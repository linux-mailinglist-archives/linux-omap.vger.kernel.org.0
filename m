Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E85F87BC5A2
	for <lists+linux-omap@lfdr.de>; Sat,  7 Oct 2023 09:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343689AbjJGHhn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 7 Oct 2023 03:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343632AbjJGHhm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 7 Oct 2023 03:37:42 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 89B13B9;
        Sat,  7 Oct 2023 00:37:41 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8FB07809E;
        Sat,  7 Oct 2023 07:37:40 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: omap4-embt2ws: Fix pinctrl single node name warning
Date:   Sat,  7 Oct 2023 10:37:33 +0300
Message-ID: <20231007073733.45087-1-tony@atomide.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like one pinctrl single binding warning sneaked in while we were
implementing the yaml binding. Let's fix the 'pinmux-wl12xx-gpio' does not
match any of the regexes warning by adding -pins suffix.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---

Trivial patch to fix a warning, applying into omap-for-v6.7/dt

diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
--- a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
+++ b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
@@ -441,7 +441,7 @@ OMAP4_IOPAD(0x176, PIN_INPUT_PULLUP | MUX_MODE2) /* sdmmc3_clk */
 		>;
 	};
 
-	wl12xx_gpio: pinmux-wl12xx-gpio {
+	wl12xx_gpio: pinmux-wl12xx-gpio-pins {
 		pinctrl-single,pins = <
 			OMAP4_IOPAD(0x1c8, PIN_OUTPUT | MUX_MODE3)  /* gpio_24 / WLAN_EN */
 		>;
-- 
2.42.0
