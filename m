Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D789330F92
	for <lists+linux-omap@lfdr.de>; Mon,  8 Mar 2021 14:39:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbhCHNjX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 8 Mar 2021 08:39:23 -0500
Received: from muru.com ([72.249.23.125]:40852 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230327AbhCHNjO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 8 Mar 2021 08:39:14 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 1FD9E8117;
        Mon,  8 Mar 2021 13:39:55 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org
Subject: [PATCH 01/12] ARM: dts: Configure power-domain for omap4 gfx
Date:   Mon,  8 Mar 2021 15:38:59 +0200
Message-Id: <20210308133910.12454-2-tony@atomide.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308133910.12454-1-tony@atomide.com>
References: <20210308133910.12454-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Configure power-domain for omap4 dts gfx in preparation to
probing devices with simple-pm-bus and genpd.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap4.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/omap4.dtsi b/arch/arm/boot/dts/omap4.dtsi
--- a/arch/arm/boot/dts/omap4.dtsi
+++ b/arch/arm/boot/dts/omap4.dtsi
@@ -440,6 +440,7 @@ sgx_module: target-module@56000000 {
 					<SYSC_IDLE_NO>,
 					<SYSC_IDLE_SMART>,
 					<SYSC_IDLE_SMART_WKUP>;
+			power-domains = <&prm_gfx>;
 			clocks = <&l3_gfx_clkctrl OMAP4_GPU_CLKCTRL 0>;
 			clock-names = "fck";
 			#address-cells = <1>;
-- 
2.30.1
