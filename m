Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44F72D2AF0
	for <lists+linux-omap@lfdr.de>; Tue,  8 Dec 2020 13:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727463AbgLHMa6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Dec 2020 07:30:58 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:44994 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727992AbgLHMa6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Dec 2020 07:30:58 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTkT8066616;
        Tue, 8 Dec 2020 06:29:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607430586;
        bh=wbXNMafqm+H4Ot7y4k9lHFPPoLIUKb4M6mQEddffijU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Ak7mdCelO5e6xV9bPWmkvz8TkAV4/P1H3cAFrYMLrT+YHwHNccKpdgCz1R81Mm80X
         BNkNFU4iw/eP96lu8pwHfEYl2lVwNqZ0caDdCR6tUI+7LCs6Op704fAEwzOgh9mTYA
         kWHucRc1uRs6cK9wP3UEFImL+0XF1FiPDLkYs3XI=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTkWK086314
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Dec 2020 06:29:46 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:46 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:46 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjG095068;
        Tue, 8 Dec 2020 06:29:44 -0600
From:   Tomi Valkeinen <tomi.valkeinen@ti.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>,
        <dri-devel@lists.freedesktop.org>
CC:     <linux-omap@vger.kernel.org>, Sekhar Nori <nsekhar@ti.com>,
        Tony Lindgren <tony@atomide.com>, <hns@goldelico.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v5 02/29] ARM: dts: omap5: add address-cells & size-cells to dsi
Date:   Tue, 8 Dec 2020 14:28:28 +0200
Message-ID: <20201208122855.254819-3-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add address-cells & size-cells to DSI nodes so that board files do not
need to define them.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Tony Lindgren <tony@atomide.com>
Acked-by: Tony Lindgren <tony@atomide.com>
---
 arch/arm/boot/dts/omap5.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/omap5.dtsi b/arch/arm/boot/dts/omap5.dtsi
index 2bf2e5839a7f..e6f6947965ef 100644
--- a/arch/arm/boot/dts/omap5.dtsi
+++ b/arch/arm/boot/dts/omap5.dtsi
@@ -517,6 +517,9 @@ dsi1: encoder@0 {
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
 							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
 						clock-names = "fck", "sys_clk";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
@@ -549,6 +552,9 @@ dsi2: encoder@0 {
 						clocks = <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 8>,
 							 <&dss_clkctrl OMAP5_DSS_CORE_CLKCTRL 10>;
 						clock-names = "fck", "sys_clk";
+
+						#address-cells = <1>;
+						#size-cells = <0>;
 					};
 				};
 
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

