Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4B53DAF58
	for <lists+linux-omap@lfdr.de>; Fri, 30 Jul 2021 00:46:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233260AbhG2Wqg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 29 Jul 2021 18:46:36 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35826 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbhG2Wqf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 29 Jul 2021 18:46:35 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkMDX128788;
        Thu, 29 Jul 2021 17:46:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1627598782;
        bh=kTrRxnuZxtGwqcbqXWDw/iARQqORWPPcO/vAb7NhsXU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ejgirpc1t1i6vzCEDgjpF9/zybVXg6+snZB2eZLA4jO2ERhLvgAJx628SP3uRCGWj
         ozXupU4mXm/Q6gsKSWL8PzHPcl+3KH2oWR8q/s2asUaBxpHOF1z0ycR4ZQhbrcFG9D
         WWxAoDpjDDlVl1BdpjqsgxoiFhZOZnRTb56+SLi4=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16TMkLW2125300
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 29
 Jul 2021 17:46:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 29 Jul 2021 17:46:21 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16TMkLZd024703;
        Thu, 29 Jul 2021 17:46:21 -0500
Received: from localhost ([10.250.38.176])
        by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 16TMkLtB016258;
        Thu, 29 Jul 2021 17:46:21 -0500
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Grygorii Strashko <grygorii.strashko@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-omap@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 03/11] ARM: dts: am335x-bone-common: Enable PRU-ICSS node
Date:   Thu, 29 Jul 2021 17:46:13 -0500
Message-ID: <20210729224621.2295-4-s-anna@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210729224621.2295-1-s-anna@ti.com>
References: <20210729224621.2295-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRU-ICSS target module node was left in disabled state in the base
am33xx-l4.dtsi file. Enable this node on all the AM335x beaglebone
boards as they mostly use a AM3358 or a AM3359 SoC which do contain
the PRU-ICSS IP. The PRUSS node and most of its child nodes are already
enabled in the base dts file, and so become effective automatically
with the enabling of this PRU-ICSS target-module node.

The corresponding PRU nodes can be disabled later on if there are
no use-cases defined to use a particular PRU core or the whole
PRU-ICSS subsystem itself if both its PRU cores are unused.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am335x-bone-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-bone-common.dtsi b/arch/arm/boot/dts/am335x-bone-common.dtsi
index 2d51d4bba6d4..34a0045b5f65 100644
--- a/arch/arm/boot/dts/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/am335x-bone-common.dtsi
@@ -397,3 +397,7 @@ &rtc {
 	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
+
+&pruss_tm {
+	status = "okay";
+};
-- 
2.32.0

