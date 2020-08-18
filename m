Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D337B24823E
	for <lists+linux-omap@lfdr.de>; Tue, 18 Aug 2020 11:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgHRJv1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 Aug 2020 05:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgHRJv0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 18 Aug 2020 05:51:26 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61BBEC061389
        for <linux-omap@vger.kernel.org>; Tue, 18 Aug 2020 02:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From; bh=izB3lSxNIgBSMrmcJsn+3r0RU+JGDTyckeVF0v0wdD8=;
        b=LloGJYOl9hCi4bY71m9NaCp8JHISdNZcLe7DL9nWrpMNBHoU+VweVAfy8f43lzeZnVPUPMbAH6OZsYrMxSgVKB2UHETYbOm3DqKHcQZUO73/IRle4Os4Rxgvm0HaQt0MCmevapQ06d+pIUlVKJ9pzERCGf2yQl+kgzZJKCs1m24=;
Received: from 97e0b068.skybroadband.com ([151.224.176.104] helo=localhost.localdomain)
        by ds0.me with esmtpa (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k7yH0-00045S-7Z; Tue, 18 Aug 2020 05:51:18 -0400
From:   David Shah <dave@ds0.me>
To:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org, tony@atomide.com
Subject: [PATCH] omap5: Fix DSI base address and clocks
Date:   Tue, 18 Aug 2020 10:51:00 +0100
Message-Id: <20200818095100.25412-1-dave@ds0.me>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DSI was not probing due to base address off by 0x1000, and sys_clk
missing.

With this patch, the Pyra display works if HDMI is disabled in the
device tree.

Signed-off-by: David Shah <dave@ds0.me>
---
 arch/arm/boot/dts/omap5.dtsi | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index c96e19a15c52..849a2dd9fef7 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -388,11 +388,11 @@ rfbi: encoder@0  {
 					};
 				};
 
-				target-module@5000 {
+				target-module@4000 {
 					compatible = "ti,sysc-omap2", "ti,sysc";
-					reg = <0x5000 0x4>,
-					      <0x5010 0x4>,
-					      <0x5014 0x4>;
+					reg = <0x4000 0x4>,
+					      <0x4010 0x4>,
+					      <0x4014 0x4>;
 					reg-names = "rev", "sysc", "syss";
 					ti,sysc-sidle = <SYSC_IDLE_FORCE>,
 							<SYSC_IDLE_NO>,
@@ -404,7 +404,7 @@ SYSC_OMAP2_SOFTRESET |
 					ti,syss-mask = <1>;
 					#address-cells = <1>;
 					#size-cells = <1>;
-					ranges = <0 0x5000 0x1000>;
+					ranges = <0 0x4000 0x1000>;
 
 					dsi1: encoder@0 {
 						compatible = "ti,omap5-dsi";
@@ -414,8 +414,9 @@ dsi1: encoder@0 {
 						reg-names = "proto", "phy", "pll";
 						interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
-						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
-						clock-names = "fck";
+						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
+						clock-names = "fck", "sys_clk";
 					};
 				};
 
@@ -445,8 +446,9 @@ dsi2: encoder@0 {
 						reg-names = "proto", "phy", "pll";
 						interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
 						status = "disabled";
-						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>;
-						clock-names = "fck";
+						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
+							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
+						clock-names = "fck", "sys_clk";
 					};
 				};
 
-- 
2.28.0

