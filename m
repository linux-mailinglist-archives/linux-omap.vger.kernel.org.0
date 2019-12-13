Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2428811DD0D
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 05:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731845AbfLMEQW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 23:16:22 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46908 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfLMEQV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 23:16:21 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD4GFTW025897;
        Thu, 12 Dec 2019 22:16:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576210575;
        bh=is0XV6R8x9+p7EAoh9G88BnL+6qXK2KkvRi1VbaNltM=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GZ7F9olWazDCBxDma303KRmULxD2RNcpjUG3qUIpth52F9MWzzQfkMhFGjzAQ+vVg
         L7W/w1yebCL+nAEzG59Ue5BGu/JD3dUhT6vlOjGGd7uTuxAxeM2BD9v57/80SKXOPC
         j9UQ69Srw4l7VgEZFYXepOFou4EiH2nnavH0mPDw=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBD4GFA0064867
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 12 Dec 2019 22:16:15 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 22:16:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 22:16:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD4GEqD126706;
        Thu, 12 Dec 2019 22:16:14 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH 1/2] ARM: dts: am33xx: Add idle_states for cpuidle
Date:   Thu, 12 Dec 2019 22:17:24 -0600
Message-ID: <20191213041725.16831-2-d-gerlach@ti.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191213041725.16831-1-d-gerlach@ti.com>
References: <20191213041725.16831-1-d-gerlach@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Add idle_states table for CPU on am335x. Currently just add C1 state
which gates the MPU clock domain.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index 646f11430dad..66d102efa93f 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -47,6 +47,7 @@
 		#size-cells = <0>;
 		cpu@0 {
 			compatible = "arm,cortex-a8";
+			enable-method = "ti,am3352";
 			device_type = "cpu";
 			reg = <0>;
 
@@ -56,6 +57,17 @@
 			clock-names = "cpu";
 
 			clock-latency = <300000>; /* From omap-cpufreq driver */
+			cpu-idle-states = <&mpu_gate>;
+		};
+
+		idle-states {
+			mpu_gate: mpu_gate {
+				compatible = "arm,idle-state";
+				entry-latency-us = <40>;
+				exit-latency-us = <90>;
+				min-residency-us = <300>;
+				ti,idle-wkup-m3;
+			};
 		};
 	};
 
-- 
2.20.1

