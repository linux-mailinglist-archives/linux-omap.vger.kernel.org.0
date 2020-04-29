Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE4F1BE0EC
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD2OaQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:30:16 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:44280 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgD2OaQ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:30:16 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU8BB053731;
        Wed, 29 Apr 2020 09:30:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588170608;
        bh=ey//PmdKfeyz5b819jnip6em7a8suXsJVF1VwUhpTKM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=ue8ZjUE74/gAShwFGtVblhBDMOjT9/ljMDbrjHiTVo5Saf5hSydzMZE7MRMOj5Dbc
         ZKKb8sCOoJmSF11gOXWa3KaQ0bnCS3qGOLx9evdJ82ZPmthu0KmljGo6FixgKX6jJB
         BwWZWVQOqSopR4Mwpchh65ULpnm6mUSw99uvghP0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEU9MK054681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:30:09 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:30:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:30:08 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU54l010784;
        Wed, 29 Apr 2020 09:30:07 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 1/8] ARM: dts: omap4: fix node names for the l4_cm clkctrl nodes
Date:   Wed, 29 Apr 2020 17:29:55 +0300
Message-ID: <20200429143002.5050-2-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429143002.5050-1-t-kristo@ti.com>
References: <20200429143002.5050-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The node name for these should be clk instead of clock. Otherwise the
clock driver won't be able to map the parent/child relationships
properly, and large number of clocks end up in orphaned state.

Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 arch/arm/boot/dts/omap44xx-clocks.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap44xx-clocks.dtsi b/arch/arm/boot/dts/omap44xx-clocks.dtsi
index 532868591107..b82b1ca0e557 100644
--- a/arch/arm/boot/dts/omap44xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap44xx-clocks.dtsi
@@ -1279,13 +1279,13 @@
 		#size-cells = <1>;
 		ranges = <0 0x1400 0x200>;
 
-		l4_per_clkctrl: clock@20 {
+		l4_per_clkctrl: clk@20 {
 			compatible = "ti,clkctrl-l4-per", "ti,clkctrl";
 			reg = <0x20 0x144>;
 			#clock-cells = <2>;
 		};
 
-		l4_secure_clkctrl: clock@1a0 {
+		l4_secure_clkctrl: clk@1a0 {
 			compatible = "ti,clkctrl-l4-secure", "ti,clkctrl";
 			reg = <0x1a0 0x3c>;
 			#clock-cells = <2>;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
