Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A607164A10
	for <lists+linux-omap@lfdr.de>; Wed, 19 Feb 2020 17:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726648AbgBSQVg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Feb 2020 11:21:36 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41102 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbgBSQVg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Feb 2020 11:21:36 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01JGLXoF115788;
        Wed, 19 Feb 2020 10:21:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1582129293;
        bh=2rM55LnHBCF5kOrJmBRTYav4czOoQDpFShDhWWp9Xlc=;
        h=From:To:CC:Subject:Date;
        b=nsGWNaQg5CieL9v+2Kx57V9Z705i52EF+uIhqnZXGZK8bEXIWBxW5bEtiJOZG1sXR
         e1nt6iiy1lUkHXkWKZvfg/ljqDlwCBwj+LB+tMgkTJmCFYBUhzHsbyxAs53z2vV5zu
         NhSgup6NAeuGScqBJm3wpHM+/lhxifGhf1d8Ak9M=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01JGLXR0043652
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 19 Feb 2020 10:21:33 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 10:21:32 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 10:21:32 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01JGLVIZ105359;
        Wed, 19 Feb 2020 10:21:32 -0600
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     <linux-omap@vger.kernel.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH] ARM: dts: dra7-l4: mark timer13-16 as pwm capable
Date:   Wed, 19 Feb 2020 18:21:26 +0200
Message-ID: <20200219162126.28671-1-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

DMTimers 13 - 16 are PWM capable and also can be used for CPTS input
signals generation. Hence, mark them as "ti,timer-pwm".

Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/dra7-l4.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/dra7-l4.dtsi b/arch/arm/boot/dts/dra7-l4.dtsi
index fc418834890d..2119a78e9c15 100644
--- a/arch/arm/boot/dts/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/dra7-l4.dtsi
@@ -3474,6 +3474,7 @@
 				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER13_CLKCTRL 24>;
 				clock-names = "fck";
 				interrupts = <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
 			};
 		};
 
@@ -3501,6 +3502,7 @@
 				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER14_CLKCTRL 24>;
 				clock-names = "fck";
 				interrupts = <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
 			};
 		};
 
@@ -3528,6 +3530,7 @@
 				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER15_CLKCTRL 24>;
 				clock-names = "fck";
 				interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
 			};
 		};
 
@@ -3555,6 +3558,7 @@
 				clocks = <&l4per3_clkctrl DRA7_L4PER3_TIMER16_CLKCTRL 24>;
 				clock-names = "fck";
 				interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
+				ti,timer-pwm;
 			};
 		};
 
-- 
2.17.1

