Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC48920224
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 11:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726486AbfEPJGh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 05:06:37 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:57750 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726363AbfEPJGh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 05:06:37 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4G96WHt035094;
        Thu, 16 May 2019 04:06:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557997592;
        bh=PtwqDBAcsjYMr3oYa2dKM83AKeivaG/c0gzyWtFMuIc=;
        h=From:To:CC:Subject:Date;
        b=HzArvBA8U5hbnavqxIo89ZqnY78zWyfBGEyTbYlzSopXWetA8sdD+YGQAF3KDdzIT
         ztfdV/MkXwlhfQU5NFwBeZl8eOUAI/bx7OMF/woZ3ZXT6lVhEmKPh4URuW9RHBN6QU
         nJNRVZE4qIG8+K+qv+zwPqXZHkE3T5hr5OxTR0t4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4G96WRQ034043
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 04:06:32 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 04:06:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 04:06:32 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4G96Tg2057199;
        Thu, 16 May 2019 04:06:30 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH 1/2] arm: dts: dra76-evm: Disable usb4_tm target module
Date:   Thu, 16 May 2019 14:36:56 +0530
Message-ID: <20190516090657.25211-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

usb4_tm is unsed on dra76 and accessing the module
with ti,sysc is causing a boot crash hence disable its target
module.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra76-evm.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 8a57895fd8f3..6607fbe3c67c 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -431,6 +431,10 @@
 	phy-names = "pcie-phy0", "pcie-phy1";
 };
 
+&usb4_tm {
+	status = "disabled";
+};
+
 &pcie1_ep {
 	num-lanes = <2>;
 	phys = <&pcie1_phy>, <&pcie2_phy>;
-- 
2.17.1

