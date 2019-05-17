Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0787211A8
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2019 03:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbfEQBNr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 21:13:47 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:50158 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbfEQBNr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 21:13:47 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4H1Dh4H000715;
        Thu, 16 May 2019 20:13:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558055623;
        bh=Ngksf0n/xKW+E1hF98581azvptJfIZP74fhPiN2cr8M=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VoMqQ4LXcJJVzt5t0h0FrsXiopITirZPvGMefJRrHOZmG+qwNv+Jpt6Wfv6udxkfj
         tmAJfmjTqHaNx9u9GSD1vgyRxBhYzQExqDDsIUKIgXA07eylwJGee/IGBVJ0c9y+YI
         yKvIb3mls25kJqy2jKEIQqJbX7pfBTlizv+aWbcw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4H1DhFv003721
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 20:13:43 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 20:13:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 20:13:42 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4H1Dch0032414;
        Thu, 16 May 2019 20:13:41 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 1/4] arm: dts: dra76x: Disable rtc target module
Date:   Fri, 17 May 2019 06:44:06 +0530
Message-ID: <20190517011409.22167-2-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517011409.22167-1-j-keerthy@ti.com>
References: <20190517011409.22167-1-j-keerthy@ti.com>
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
 arch/arm/boot/dts/dra7-l4.dtsi | 2 +-
 arch/arm/boot/dts/dra76x.dtsi  | 4 ++++
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
diff --git a/arch/arm/boot/dts/dra76x.dtsi b/arch/arm/boot/dts/dra76x.dtsi
index 9ee45aa365d8..5c437271d307 100644
--- a/arch/arm/boot/dts/dra76x.dtsi
+++ b/arch/arm/boot/dts/dra76x.dtsi
@@ -81,3 +81,7 @@
 		reg = <0x3fc>;
 	};
 };
+
+&rtctarget {
+	status = "disabled";
+};
-- 
2.17.1

