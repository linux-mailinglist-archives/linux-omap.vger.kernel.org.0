Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16531478A7B
	for <lists+linux-omap@lfdr.de>; Fri, 17 Dec 2021 12:56:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235747AbhLQL4H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Dec 2021 06:56:07 -0500
Received: from muru.com ([72.249.23.125]:39426 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231258AbhLQL4H (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 17 Dec 2021 06:56:07 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9740E80FB;
        Fri, 17 Dec 2021 11:56:48 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>,
        Tero Kristo <kristo@kernel.org>
Subject: [PATCH 1/2] clk: ti: Move dra7 clock devices out of the legacy section
Date:   Fri, 17 Dec 2021 13:55:58 +0200
Message-Id: <20211217115559.15352-1-tony@atomide.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I accidentally added some dra7 clock defines to the legacy section that
we want to stop using. Let's move the defines to the right location.
Note that this is just a cosmetic fix.

Cc: linux-clk@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Tero Kristo <kristo@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 include/dt-bindings/clock/dra7.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/dt-bindings/clock/dra7.h b/include/dt-bindings/clock/dra7.h
--- a/include/dt-bindings/clock/dra7.h
+++ b/include/dt-bindings/clock/dra7.h
@@ -84,17 +84,10 @@
 #define DRA7_L3_MAIN_2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
 #define DRA7_L3_INSTR_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 
-/* iva clocks */
-#define DRA7_IVA_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
-#define DRA7_SL2IF_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
-
 /* dss clocks */
 #define DRA7_DSS_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
 #define DRA7_BB2D_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
 
-/* gpu clocks */
-#define DRA7_GPU_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
-
 /* l3init clocks */
 #define DRA7_MMC1_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 #define DRA7_MMC2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
@@ -267,10 +260,17 @@
 #define DRA7_L3INSTR_L3_MAIN_2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
 #define DRA7_L3INSTR_L3_INSTR_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 
+/* iva clocks */
+#define DRA7_IVA_CLKCTRL		DRA7_CLKCTRL_INDEX(0x20)
+#define DRA7_SL2IF_CLKCTRL		DRA7_CLKCTRL_INDEX(0x28)
+
 /* dss clocks */
 #define DRA7_DSS_DSS_CORE_CLKCTRL	DRA7_CLKCTRL_INDEX(0x20)
 #define DRA7_DSS_BB2D_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
 
+/* gpu clocks */
+#define DRA7_GPU_CLKCTRL		DRA7_CLKCTRL_INDEX(0x20)
+
 /* l3init clocks */
 #define DRA7_L3INIT_MMC1_CLKCTRL	DRA7_CLKCTRL_INDEX(0x28)
 #define DRA7_L3INIT_MMC2_CLKCTRL	DRA7_CLKCTRL_INDEX(0x30)
-- 
2.34.1
