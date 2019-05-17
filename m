Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D093211AC
	for <lists+linux-omap@lfdr.de>; Fri, 17 May 2019 03:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfEQBNx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 May 2019 21:13:53 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36004 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbfEQBNx (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 May 2019 21:13:53 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4H1Dlqa046219;
        Thu, 16 May 2019 20:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1558055627;
        bh=oPtmQ4RF/4TLWu0VvUpE4jMXHceQOUouC9LQljY2Pd4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=RIazemnsIupWpKUP0UqspAMooKrwGkji07O6bVlgryColxKIlCFEFVmkQdGL/Wjh4
         WxHxyLoJ4uthSTQ9gAepbA0F95Ixs6BJyZpu5EHr4BvkR5cf4CkGPr7JYovqt34fGV
         ylwHL0alIK+/OhuUwE4x5hpzK8qCh8G8GCI2z1hQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4H1DlW5061845
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 May 2019 20:13:47 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 16
 May 2019 20:13:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 16 May 2019 20:13:47 -0500
Received: from a0393675ula.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4H1Dch2032414;
        Thu, 16 May 2019 20:13:45 -0500
From:   Keerthy <j-keerthy@ti.com>
To:     <tony@atomide.com>, <robh+dt@kernel.org>
CC:     <devicetree@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <t-kristo@ti.com>, <j-keerthy@ti.com>
Subject: [PATCH v2 3/4] arm: dts: dra71x: Disable rtc target module
Date:   Fri, 17 May 2019 06:44:08 +0530
Message-ID: <20190517011409.22167-4-j-keerthy@ti.com>
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

Introduce dra71x.dtsi to include dra71x specific changes.
rtc is fused out on dra71 and accessing target module
register is causing a boot crash hence disable it.

Fixes: 549fce068a3112 ("ARM: dts: dra7: Add l4 interconnect hierarchy and ti-sysc data")
Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts |  2 +-
 arch/arm/boot/dts/dra71x.dtsi   | 13 +++++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/dra71x.dtsi

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 82cc7ec37af0..c496ae83e27e 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -6,7 +6,7 @@
  * published by the Free Software Foundation.
  */
 
-#include "dra72-evm-common.dtsi"
+#include "dra71x.dtsi"
 #include "dra7-mmc-iodelay.dtsi"
 #include "dra72x-mmc-iodelay.dtsi"
 #include <dt-bindings/net/ti-dp83867.h>
diff --git a/arch/arm/boot/dts/dra71x.dtsi b/arch/arm/boot/dts/dra71x.dtsi
new file mode 100644
index 000000000000..aad7394902a6
--- /dev/null
+++ b/arch/arm/boot/dts/dra71x.dtsi
@@ -0,0 +1,13 @@
+/*
+ * Copyright (C) 2019 Texas Instruments Incorporated - http://www.ti.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "dra72-evm-common.dtsi"
+
+&rtctarget {
+	status = "disabled";
+};
-- 
2.17.1

