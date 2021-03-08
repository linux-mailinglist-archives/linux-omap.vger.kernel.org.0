Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065CB330F96
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:39:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230142AbhCHNjX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:23 -0500
Received: from muru.com ([72.249.23.125]:40856 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230342AbhCHNjP (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:15 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1DBB280D4;
        Mon,  8 Mar 2021 13:39:56 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 02/12] ARM: dts: Configure power-domain for omap4 dts iss
Date:   Mon,  8 Mar 2021 15:39:00 +0200
Message-Id: <20210308133910.12454-3-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Configure power-domain for omap4 dts iss in preparation to
probing devices with simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -203,6 +203,7 @@ target-module@52000000 {
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
 			ti,sysc-delay-us = <2>;
+			power-domains = <&prm_cam>;
 			clocks = <&iss_clkctrl OMAP4_ISS_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
-- 
2.30.1
