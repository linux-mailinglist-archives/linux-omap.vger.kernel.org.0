Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 31D5111DD10
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2019 05:16:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727778AbfLMEQW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 12 Dec 2019 23:16:22 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:43358 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731843AbfLMEQW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 12 Dec 2019 23:16:22 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBD4GGFw110197;
        Thu, 12 Dec 2019 22:16:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576210576;
        bh=0AbqVTil4TcgNv1O7dB3P3Pn9JhVAEIHCDhhlxPpQmc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=r4S4p/dqHWa5OI5+6n2Z+Vp42VCD/Qz97deBXTmYXfEkcK5G6DtW5fdGAFgAB+4qW
         ZxhoorO/uyfj9oS7IGpi5CXOuVqA/hqLa4XgithUORDZnbFr+jfT30Z6kjC5+KcF/e
         Yv9hpX2kNH2AqzCU3LhuYk2lIs+t1JuA5RLu+/uQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD4GGk8005413;
        Thu, 12 Dec 2019 22:16:16 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 12
 Dec 2019 22:16:15 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 12 Dec 2019 22:16:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBD4GFmE126743;
        Thu, 12 Dec 2019 22:16:15 -0600
From:   Dave Gerlach <d-gerlach@ti.com>
To:     Tony Lindgren <tony@atomide.com>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Dave Gerlach <d-gerlach@ti.com>
Subject: [PATCH 2/2] ARM: dts: am4372: Add idle_states for cpuidle
Date:   Thu, 12 Dec 2019 22:17:25 -0600
Message-ID: <20191213041725.16831-3-d-gerlach@ti.com>
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

Add idle_states table for CPU on am437x. Currently just add C1 state
which gates the MPU clock domain.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
---
 arch/arm/boot/dts/am4372.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index ca0aa3f26c0a..71ff2bf68d56 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -45,6 +45,7 @@
 		#size-cells = <0>;
 		cpu: cpu@0 {
 			compatible = "arm,cortex-a9";
+			enable-method = "ti,am4372";
 			device_type = "cpu";
 			reg = <0>;
 
@@ -54,6 +55,17 @@
 			operating-points-v2 = <&cpu0_opp_table>;
 
 			clock-latency = <300000>; /* From omap-cpufreq driver */
+			cpu-idle-states = <&mpu_gate>;
+		};
+
+		idle-states {
+			mpu_gate: mpu_gate {
+				compatible = "arm,idle-state";
+				entry-latency-us = <40>;
+				exit-latency-us = <100>;
+				min-residency-us = <300>;
+				local-timer-stop;
+			};
 		};
 	};
 
-- 
2.20.1

