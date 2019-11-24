Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB23108465
	for <lists+linux-omap@lfdr.de>; Sun, 24 Nov 2019 18:43:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbfKXRnT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 24 Nov 2019 12:43:19 -0500
Received: from muru.com ([72.249.23.125]:43382 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbfKXRnT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 24 Nov 2019 12:43:19 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 05DD780E4;
        Sun, 24 Nov 2019 17:43:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH] ARM: dts: Fix sgx sysconfig register for omap4
Date:   Sun, 24 Nov 2019 09:43:16 -0800
Message-Id: <20191124174316.29090-1-tony@atomide.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Looks like we've had the sgx sysconfig register and revision register
always wrong for omap4, including the old platform data. Let's fix the
offsets to what the TRM says. Otherwise the sgx module may never idle
depending on the state of the real sysconfig register.

Fixes: d23a163ebe5a ("ARM: dts: Add nodes for missing omap4 interconnect target modules")
Cc: H. Nikolaus Schaller <hns@goldelico.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -330,8 +330,8 @@
 
 		target-module@56000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
-			reg = <0x5601fc00 0x4>,
-			      <0x5601fc10 0x4>;
+			reg = <0x5600fe00 0x4>,
+			      <0x5600fe10 0x4>;
 			reg-names = "rev", "sysc";
 			ti,sysc-midle = <SYSC_IDLE_FORCE>,
 					<SYSC_IDLE_NO>,
-- 
2.24.0
