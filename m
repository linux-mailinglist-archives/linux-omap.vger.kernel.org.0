Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38CBA33ED9
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 08:13:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726606AbfFDGNS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 02:13:18 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:40518 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726488AbfFDGNS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 02:13:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x546DEPx008945;
        Tue, 4 Jun 2019 01:13:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1559628794;
        bh=u/BALELt1gi51fdTWElCfv9ApNJCaqkJ3slwOHkec3k=;
        h=From:To:CC:Subject:Date;
        b=vVtJICAMD4fIQEIW+OsqJ5W5Nr40K5re924DLGkEuN/0u6t5G0yDIdGimv8/p5/3N
         C1r4RYW1eB9uYi8b/jTL0Mp6u7gKFN632jwvVOie5P/R46Sr5qDlVOI7Ow7gWLL/jV
         yQ2J/aQjrGcbYWZ1ZhfLz5Ng6PFW58QdrVX6dZm8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x546DDKQ068713
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 4 Jun 2019 01:13:13 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 4 Jun
 2019 01:13:13 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 4 Jun 2019 01:13:13 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x546DAmR040385;
        Tue, 4 Jun 2019 01:13:11 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <t-kristo@ti.com>,
        <j-keerthy@ti.com>
Subject: [PATCH] arm: dts: dra72x: Disable usb4_tm target module
Date:   Tue, 4 Jun 2019 11:43:35 +0530
Message-ID: <20190604061335.8264-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

usb4_tm is unsed on dra72 and accessing the module
with ti,sysc is causing a boot crash hence disable its target
module.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Reported-by: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra72x.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra72x.dtsi b/arch/arm/boot/dts/dra72x.dtsi
index 89831552cd86..9c39c6b9b5d6 100644
--- a/arch/arm/boot/dts/dra72x.dtsi
+++ b/arch/arm/boot/dts/dra72x.dtsi
@@ -62,3 +62,7 @@
 &pcie2_rc {
 	compatible = "ti,dra726-pcie-rc", "ti,dra7-pcie";
 };
+
+&usb4_tm {
+	status = "disabled";
+};
-- 
2.17.1

