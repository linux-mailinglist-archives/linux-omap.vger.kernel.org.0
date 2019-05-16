Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C49C120226
	for <lists+linux-omap@lfdr.de>; Thu, 16 May 2019 11:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfEPJGh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 05:06:37 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:60990 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbfEPJGh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 05:06:37 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4G96YMx067455;
        Thu, 16 May 2019 04:06:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1557997594;
        bh=2bXBA227ltopsVHbCB4q/c5nFWkvQJZNqHyUbKP4uwU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=h6JLS3x9Zze+aCDTO3TabT9BN5CAkbZQwVwGkv5i4pGUkrg2xSFBRLWGDDylxAr4B
         8teY9dQz4HMIjaDRY9m6dR5kz5pUFSXKBefoRUDYma9W3/iWqgZcHPItMatOMkOSow
         43Dic1gFKJLmAg+S962nGyB3eAkdeA+wcNjRLEV8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4G96YYZ024099
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 04:06:34 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 04:06:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 04:06:34 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4G96Tg3057199;
        Thu, 16 May 2019 04:06:32 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH 2/2] arm: dts: dra76-evm: Disable rtc target module
Date:   Thu, 16 May 2019 14:36:57 +0530
Message-ID: <20190516090657.25211-2-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516090657.25211-1-j-keerthy@ti.com>
References: <20190516090657.25211-1-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

rtc is fused out on dra76 and accessing target module
register is causing a boot crash hence disable it.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi  | 2 +-
 arch/arm/boot/dts/dra76-evm.dts | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index fe9f0bc29fec..3b4cba9da91f 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3543,7 +3543,7 @@
 			};
 		};
 
-		target-module@38000 {			/* 0x48838000, ap 29 12.0 */
+		rtctarget: target-module@38000 {			/* 0x48838000, ap 29 12.0 */
 			compatible = "ti,sysc-omap4-simple", "ti,sysc";
 			ti,hwmods = "rtcss";
 			reg = <0x38074 0x4>,
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index 6607fbe3c67c..644fe1961d28 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -363,6 +363,10 @@
 	pinctrl-3 = <&mmc4_pins_hs &mmc4_iodelay_manual1_conf>;
 };
 
+&rtctarget {
+	status = "disabled";
+};
+
 /* No RTC on this device */
 &rtc {
 	status = "disabled";
-- 
2.17.1

