Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9186228C414
	for <lists+linux-omap@lfdr.de>; Mon, 12 Oct 2020 23:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729791AbgJLVaA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 12 Oct 2020 17:30:00 -0400
Received: from vern.gendns.com ([98.142.107.122]:50638 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729671AbgJLVaA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 12 Oct 2020 17:30:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=gevjuBxhJ8qR+l5M7mQtJrL9Xg42LvdIKNWXno25LAw=; b=COhBNwjVZa1EsCz1toVP4Ob9lu
        3saSyayXo16dXw0UwFcPudhkx6IzKhJTxV9nJ/sBXQoeNRqdjvjD2C1dm+78QL+qrwd8eOAaTauYz
        uPHo6APDCBB13/TGtL0AqzGliePLSfeCQTEnhGMgWzCHAE4FmBj1rSGSecGemPxe0dREtAcI0G7C6
        OO7hSP4wyQswPzoWtxp+9hPn0PJuSmL0mlwsc3VKdqu6U3lxIkhM81j3Zozsw1zbrpNkvRUg1IiV2
        d1irhBKcsSLrAzFLpBzloC8Pyi48T/9lqORqo4e4Vxq7JgrNvyiJlYflowR866hSLSe5fNo/VT11e
        v4469zmQ==;
Received: from [2600:1700:4830:165f::19e] (port=52666 helo=freyr.lechnology.com)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <david@lechnology.com>)
        id 1kS57s-0004Ih-Tr; Mon, 12 Oct 2020 17:13:01 -0400
From:   David Lechner <david@lechnology.com>
To:     linux-omap@vger.kernel.org
Cc:     David Lechner <david@lechnology.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Robert Nelson <robertcnelson@gmail.com>,
        Drew Fustini <drew@beagleboard.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: am33xx: Add nodes for eQEP
Date:   Mon, 12 Oct 2020 16:12:27 -0500
Message-Id: <20201012211229.3282128-2-david@lechnology.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201012211229.3282128-1-david@lechnology.com>
References: <20201012211229.3282128-1-david@lechnology.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index b88d0caa4b2d..17910268df82 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -1924,6 +1924,15 @@ ecap0: ecap@100 {
 					status = "disabled";
 				};
 
+				eqep0: counter@180 {
+					compatible = "ti,am3352-eqep";
+					reg = <0x180 0x80>;
+					clocks = <&l4ls_gclk>;
+					clock-names = "sysclkout";
+					interrupts = <79>;
+					status = "disabled";
+				};
+
 				ehrpwm0: pwm@200 {
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
@@ -1976,6 +1985,15 @@ ecap1: ecap@100 {
 					status = "disabled";
 				};
 
+				eqep1: counter@180 {
+					compatible = "ti,am3352-eqep";
+					reg = <0x180 0x80>;
+					clocks = <&l4ls_gclk>;
+					clock-names = "sysclkout";
+					interrupts = <88>;
+					status = "disabled";
+				};
+
 				ehrpwm1: pwm@200 {
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
@@ -2028,6 +2046,15 @@ ecap2: ecap@100 {
 					status = "disabled";
 				};
 
+				eqep2: counter@180 {
+					compatible = "ti,am3352-eqep";
+					reg = <0x180 0x80>;
+					clocks = <&l4ls_gclk>;
+					clock-names = "sysclkout";
+					interrupts = <89>;
+					status = "disabled";
+				};
+
 				ehrpwm2: pwm@200 {
 					compatible = "ti,am3352-ehrpwm",
 						     "ti,am33xx-ehrpwm";
-- 
2.25.1

