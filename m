Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 125451BE0F3
	for <lists+linux-omap@lfdr.de>; Wed, 29 Apr 2020 16:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726773AbgD2Oa3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 29 Apr 2020 10:30:29 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:53956 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726741AbgD2Oa3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 29 Apr 2020 10:30:29 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03TEUPJW098764;
        Wed, 29 Apr 2020 09:30:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1588170625;
        bh=Rr3yRU7e+WZwUMxKj3OhbM3FhcVrnhefKHLL5Wt8jQQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hFFJ0mkfIwiXeKCKyJHSOfghox4x95BF+ivhTL2/d47rnKZBjxJMvvCxcKFscvO+3
         mzqUDGfVDIZRIa/g+kyPlNaCPTd2xxtscaoPSXP8K0s2nAPE9jceM1d7nV+zTHz1hG
         5HwmrjOyHDVcOXk1xuz3JL7cLgj5yAvQGJ+OhuSc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03TEUPeB062979
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 29 Apr 2020 09:30:25 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 29
 Apr 2020 09:30:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 29 Apr 2020 09:30:10 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03TEU54m010784;
        Wed, 29 Apr 2020 09:30:09 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <linux-omap@vger.kernel.org>, <tony@atomide.com>
CC:     <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 2/8] ARM: dts: omap5: fix node names for the l4_cm clkctrl nodes
Date:   Wed, 29 Apr 2020 17:29:56 +0300
Message-ID: <20200429143002.5050-3-t-kristo@ti.com>
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
 arch/arm/boot/dts/omap54xx-clocks.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap54xx-clocks.dtsi b/arch/arm/boot/dts/omap54xx-clocks.dtsi
index 42f2c447727d..746048813a12 100644
--- a/arch/arm/boot/dts/omap54xx-clocks.dtsi
+++ b/arch/arm/boot/dts/omap54xx-clocks.dtsi
@@ -1125,13 +1125,13 @@
 		#size-cells = <1>;
 		ranges = <0 0x1000 0x200>;
 
-		l4per_clkctrl: clock@20 {
+		l4per_clkctrl: clk@20 {
 			compatible = "ti,clkctrl-l4per", "ti,clkctrl";
 			reg = <0x20 0x15c>;
 			#clock-cells = <2>;
 		};
 
-		l4sec_clkctrl: clock@1a0 {
+		l4sec_clkctrl: clk@1a0 {
 			compatible = "ti,clkctrl-l4sec", "ti,clkctrl";
 			reg = <0x1a0 0x3c>;
 			#clock-cells = <2>;
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
