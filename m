Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 646A370455
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2019 17:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730053AbfGVPqY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 Jul 2019 11:46:24 -0400
Received: from vern.gendns.com ([98.142.107.122]:44126 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729302AbfGVPqX (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 22 Jul 2019 11:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=References:In-Reply-To:Message-Id:Date:Subject
        :Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nK9bOkcM1q9VVuhzkyupsEpjrNzM/n6WC+6bn/WV2yE=; b=QhU9m/MWtQ95UceZj7cx/wj0n
        nP9fNZ+1G5aq6dPhweq7UXIpSfjIHZMhzeidTEQYkfXH1dsKLmzg1WEggKIatqzG1MU3vsJ42EU0h
        Ii8UnLf5fC8Bk4ixrssWJzvV3H3X+pwklSuB1/FlCSqTKnvb5ytJSyBAs3Zkm0z5Ri5OScNyfmXs7
        knYCVhMa3t6rVkYl5YqFpB7E3seF+ty3ruWIk2dgiC7mpRs1lKCbxClGXsrRu4KvF4M/2BCoWhXsj
        MOk2jaCHzOU3AQY4GhcVZ8/GznJ2mXDH4JEzBcQoPAm8PH+WeioJCJC8zjyRcR9HUiT19B+upK1Mw
        zEEqY0HAQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net ([108.198.5.147]:44690 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <david@lechnology.com>)
        id 1hpaW4-006p1O-Ii; Mon, 22 Jul 2019 11:46:20 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: am33xx: Add nodes for eQEP
Date:   Mon, 22 Jul 2019 10:45:37 -0500
Message-Id: <20190722154538.5314-4-david@lechnology.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722154538.5314-1-david@lechnology.com>
References: <20190722154538.5314-1-david@lechnology.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This adds new nodes for the Texas Instruments Enhanced Quadrature
Encoder Pulse (eQEP) module in the PWM subsystem on AM33XX.

Signed-off-by: David Lechner <david@lechnology.com>
---
 arch/arm/boot/dts/am33xx-l4.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 3b1fb2ba4dff..7fdc2f61c553 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1908,6 +1908,15 @@
 					status = "disabled";
 				};
 
+				eqep0: eqep@180 {
+					compatible = "ti,am3352-eqep";
+					reg = <0x180 0x80>;
+					clocks = <&l4ls_gclk>;
+					clock-names = "fck";
+					interrupts = <79>;
+					status = "disabled";
+				};
+
 				ehrpwm0: pwm@200 {
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
@@ -1961,6 +1970,15 @@
 					status = "disabled";
 				};
 
+				eqep1: eqep@180 {
+					compatible = "ti,am3352-eqep";
+					reg = <0x180 0x80>;
+					clocks = <&l4ls_gclk>;
+					clock-names = "fck";
+					interrupts = <88>;
+					status = "disabled";
+				};
+
 				ehrpwm1: pwm@200 {
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
@@ -2014,6 +2032,15 @@
 					status = "disabled";
 				};
 
+				eqep2: eqep@180 {
+					compatible = "ti,am3352-eqep";
+					reg = <0x180 0x80>;
+					clocks = <&l4ls_gclk>;
+					clock-names = "fck";
+					interrupts = <89>;
+					status = "disabled";
+				};
+
 				ehrpwm2: pwm@200 {
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
-- 
2.17.1

