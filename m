Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF64330F9C
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:39:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhCHNj2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:28 -0500
Received: from muru.com ([72.249.23.125]:40876 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230511AbhCHNjU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:20 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 674A68117;
        Mon,  8 Mar 2021 13:40:02 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 07/12] ARM: dts: Move omap4 mmio-sram out of l3 interconnect
Date:   Mon,  8 Mar 2021 15:39:05 +0200
Message-Id: <20210308133910.12454-8-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We need mmio-sram early for omap4_sram_init() for IO barrier init, and
will be moving l3 interconnect to probe with simple-pm-bus that probes
at module_init() time. So let's move mmio-sram out of l3 to prepare for
that.

Otherwise we will get the following after probing the interconnects with
simple-pm-bus:

omap4_sram_init:Unable to get sram pool needed to handle errata I688

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -58,6 +58,15 @@ cpu@1 {
 		};
 	};
 
+	/*
+	 * Needed early by omap4_sram_init() for barrier, do not move to l3
+	 * interconnect as simple-pm-bus probes at module_init() time.
+	 */
+	ocmcram: sram@40304000 {
+		compatible = "mmio-sram";
+		reg = <0x40304000 0xa000>; /* 40k */
+	};
+
 	gic: interrupt-controller@48241000 {
 		compatible = "arm,cortex-a9-gic";
 		interrupt-controller;
@@ -136,11 +145,6 @@ mpu {
 		l4_abe: interconnect@40100000 {
 		};
 
-		ocmcram: sram@40304000 {
-			compatible = "mmio-sram";
-			reg = <0x40304000 0xa000>; /* 40k */
-		};
-
 		target-module@50000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x50000000 4>,
-- 
2.30.1
