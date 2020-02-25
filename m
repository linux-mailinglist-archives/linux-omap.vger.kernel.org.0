Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9895616F063
	for <lists+linux-omap@lfdr.de>; Tue, 25 Feb 2020 21:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729992AbgBYUrN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 25 Feb 2020 15:47:13 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:39068 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729760AbgBYUq7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 25 Feb 2020 15:46:59 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01PKku4t045220;
        Tue, 25 Feb 2020 14:46:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582663616;
        bh=jt1b9+pwL+VDoUt+ggAPbWiuUp8lXp87zn9gGt4fxns=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=cJHecR48TlOvrVp2VeMcycRAUwnsTqtysXr5o9fMTR3uiZRzE65hWiFiDyYCBRXUB
         O43JwZe8S0sPW7OaVWXtgATyDGZPv1+e19CXugldpUTnEc/qZDAY8a2Hgbg+0uD63r
         P39TroCRmzB5/km9Bm5fooy245IvR71Bs0mwjEvc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PKkuQd033125;
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 25
 Feb 2020 14:46:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 25 Feb 2020 14:46:56 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com [10.247.120.73])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01PKkuSa094912;
        Tue, 25 Feb 2020 14:46:56 -0600
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
        by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id 01PKkuVK025482;
        Tue, 25 Feb 2020 14:46:56 -0600
From:   Suman Anna <s-anna@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     Roger Quadros <rogerq@ti.com>, Tero Kristo <t-kristo@ti.com>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Suman Anna <s-anna@ti.com>
Subject: [PATCH 08/12] ARM: dts: am335x-evmsk: Enable PRU-ICSS interconnect node
Date:   Tue, 25 Feb 2020 14:46:45 -0600
Message-ID: <20200225204649.28220-9-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200225204649.28220-1-s-anna@ti.com>
References: <20200225204649.28220-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The PRU-ICSS target module node was left in disabled state in the
base am33xx-l4.dtsi file. PRU-ICSS is supported on the AM335x SK
EVM board, so enable this node to support PRUSS on this board.

Signed-off-by: Suman Anna <s-anna@ti.com>
---
 arch/arm/boot/dts/am335x-evmsk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-evmsk.dts b/arch/arm/boot/dts/am335x-evmsk.dts
index 32f515a295ee..f0dd66649877 100644
--- a/arch/arm/boot/dts/am335x-evmsk.dts
+++ b/arch/arm/boot/dts/am335x-evmsk.dts
@@ -717,3 +717,7 @@
 	clocks = <&clk_32768_ck>, <&clk_24mhz_clkctrl AM3_CLK_24MHZ_CLKDIV32K_CLKCTRL 0>;
 	clock-names = "ext-clk", "int-clk";
 };
+
+&pruss_tm {
+	status = "okay";
+};
-- 
2.23.0

