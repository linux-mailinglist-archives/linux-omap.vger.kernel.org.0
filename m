Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24F8239704E
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jun 2021 11:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233606AbhFAJ1R (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Jun 2021 05:27:17 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36470 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233586AbhFAJ1R (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Jun 2021 05:27:17 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1519PVri075224;
        Tue, 1 Jun 2021 04:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1622539531;
        bh=YRceyPQ/4/gy3J9dmu7qiWyuEuF0Rv2VKhQZ7+GX490=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=S+EqNa5PcRkhs5xht4hhzsVF30xVJ+hFt+I/p7aJbAJClIioJzWxc0voWwRz7JGtt
         Q2WIxTRRIdx0HniMrSReurGouXI5wXsRTvLfjnV5g8S6nRHGUfeKnPqVow89EvxIsX
         0Pvf1acSilG6bA1aOVFNpTSljO2QpawH81wchrYk=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1519PVIU043134
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 1 Jun 2021 04:25:31 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 1 Jun
 2021 04:25:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 1 Jun 2021 04:25:30 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1519Owrw127212;
        Tue, 1 Jun 2021 04:25:27 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>
CC:     Sekhar Nori <nsekhar@ti.com>, Vignesh R <vigneshr@ti.com>,
        Nishanth Menon <nm@ti.com>,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 3/3] ARM: dts: am33xx: Drop interrupt property from ecap nodes
Date:   Tue, 1 Jun 2021 14:54:57 +0530
Message-ID: <20210601092457.5039-4-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210601092457.5039-1-lokeshvutla@ti.com>
References: <20210601092457.5039-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Interrupts were never supported by ecap driver and the bindings
were never documented.Therefore drop the entries in preparation
to moving bindings to YAML schema.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 6359416b0fa7..50c79e59eecb 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -2001,8 +2001,6 @@ ecap0: pwm@100 {
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
 					clock-names = "fck";
-					interrupts = <31>;
-					interrupt-names = "ecap0";
 					status = "disabled";
 				};
 
@@ -2060,8 +2058,6 @@ ecap1: pwm@100 {
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
 					clock-names = "fck";
-					interrupts = <47>;
-					interrupt-names = "ecap1";
 					status = "disabled";
 				};
 
@@ -2119,8 +2115,6 @@ ecap2: pwm@100 {
 					reg = <0x100 0x80>;
 					clocks = <&l4ls_gclk>;
 					clock-names = "fck";
-					interrupts = <61>;
-					interrupt-names = "ecap2";
 					status = "disabled";
 				};
 
-- 
2.31.1

