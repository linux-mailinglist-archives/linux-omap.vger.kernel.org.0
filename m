Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E851E1F7C71
	for <lists+linux-omap@lfdr.de>; Fri, 12 Jun 2020 19:23:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgFLRXp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 Jun 2020 13:23:45 -0400
Received: from muru.com ([72.249.23.125]:57790 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbgFLRXp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 12 Jun 2020 13:23:45 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id C5FF380CC;
        Fri, 12 Jun 2020 17:24:36 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: Fix omap4 system timer source clocks
Date:   Fri, 12 Jun 2020 10:23:40 -0700
Message-Id: <20200612172340.61177-1-tony@atomide.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I accidentally flipped the system timer to use system clock instead of
the 32k source clock.

Fixes: 14b1925a7219 ("ARM: dts: Configure system timers for omap4")
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -683,6 +683,6 @@ &timer1_target {
 	ti,no-idle;
 	timer@0 {
 		assigned-clocks = <&l4_wkup_clkctrl OMAP4_TIMER1_CLKCTRL 24>;
-		assigned-clock-parents = <&sys_clkin_ck>;
+		assigned-clock-parents = <&sys_32k_ck>;
 	};
 };
-- 
2.27.0
