Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5281A3C8DC9
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jul 2021 21:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237306AbhGNTpj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Jul 2021 15:45:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:38106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236973AbhGNTo6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 14 Jul 2021 15:44:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A455F613F2;
        Wed, 14 Jul 2021 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626291699;
        bh=kZF8/ieUsXrMmaq/wXqVUkL5F7XLLCOj7SNQ9omZ0V4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FwFZPakPFzNs+TVGwWLrBfz2OGgwLNovZAWI+tUnvrb8PkE3Go/fqUPawn3fE/Lc5
         JLMaw9G1FsDvvHl41TRjPfPCzlJF5PBwdR8T31KignxoSGp0+hxsStV9AS6Uw2GbFI
         7/WtnIzNuUegapDCDdEcL2xHEh+hsE4tuekM4jzZdVhe3iFCPWoBIrATNw+rinPzAW
         2S6E4hlNPiJZzOziymUaklIsbvy3TUc1+D2ld585EZ6xQMh2LwxdJScvlSX4vIbL3D
         JXANEBxXiuuLAueiaGQo/PGXKCElGYE0jAgbPmhoDbg8PzDxjNtG7ZzdA76pNEHCTl
         tF8an5TOz2NpA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Sasha Levin <sashal@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH AUTOSEL 5.12 045/102] ARM: dts: am57xx-cl-som-am57x: fix ti,no-reset-on-init flag for gpios
Date:   Wed, 14 Jul 2021 15:39:38 -0400
Message-Id: <20210714194036.53141-45-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194036.53141-1-sashal@kernel.org>
References: <20210714194036.53141-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Grygorii Strashko <grygorii.strashko@ti.com>

[ Upstream commit b644c5e01c870056e13a096e14b9a92075c8f682 ]

The ti,no-reset-on-init flag need to be at the interconnect target module
level for the modules that have it defined.
The ti-sysc driver handles this case, but produces warning, not a critical
issue.

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/am57xx-cl-som-am57x.dts | 5 ++---
 arch/arm/boot/dts/dra7-l4.dtsi            | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
index 0d5fe2bfb683..39eba2bc36dd 100644
--- a/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
+++ b/arch/arm/boot/dts/am57xx-cl-som-am57x.dts
@@ -610,12 +610,11 @@ &mcasp3 {
 	>;
 };
 
-&gpio3 {
-	status = "okay";
+&gpio3_target {
 	ti,no-reset-on-init;
 };
 
-&gpio2 {
+&gpio2_target {
 	status = "okay";
 	ti,no-reset-on-init;
 };
diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index a294a02f2d23..d1ff8a4121f5 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -1315,7 +1315,7 @@ gpio8: gpio@0 {
 			};
 		};
 
-		target-module@55000 {			/* 0x48055000, ap 13 0e.0 */
+		gpio2_target: target-module@55000 {		/* 0x48055000, ap 13 0e.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x55000 0x4>,
 			      <0x55010 0x4>,
@@ -1348,7 +1348,7 @@ gpio2: gpio@0 {
 			};
 		};
 
-		target-module@57000 {			/* 0x48057000, ap 15 06.0 */
+		gpio3_target: target-module@57000 {		/* 0x48057000, ap 15 06.0 */
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x57000 0x4>,
 			      <0x57010 0x4>,
-- 
2.30.2

