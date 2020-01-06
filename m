Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DFEA1312C1
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 14:22:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgAFNWj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jan 2020 08:22:39 -0500
Received: from lnfm1.sai.msu.ru ([93.180.26.255]:44550 "EHLO lnfm1.sai.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725821AbgAFNWj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 6 Jan 2020 08:22:39 -0500
X-Greylist: delayed 764 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jan 2020 08:22:37 EST
Received: from dragon.sai.msu.ru (dragon.sai.msu.ru [93.180.26.172])
        by lnfm1.sai.msu.ru (8.14.1/8.12.8) with ESMTP id 006D9OYS023161;
        Mon, 6 Jan 2020 16:09:29 +0300
Received: from oak.local (unknown [188.123.231.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client did not present a certificate)
        by dragon.sai.msu.ru (Postfix) with ESMTPSA id 6DD565737;
        Mon,  6 Jan 2020 16:09:25 +0300 (MSK)
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-omap@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        devicetree@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Cc:     matwey.kornilov@gmail.com,
        "Matwey V. Kornilov" <matwey@sai.msu.ru>,
        linux-omap@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        devicetree@vger.kernel.org (open list:OMAP DEVICE TREE SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm: dts: am335x-boneblack-common: fix memory size
Date:   Mon,  6 Jan 2020 16:09:08 +0300
Message-Id: <20200106130909.7697-1-matwey@sai.msu.ru>
X-Mailer: git-send-email 2.16.4
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

BeagleBone Black series is equipped with 512MB RAM
whereas only 256MB is included from am335x-bone-common.dtsi

This leads to an issue with unusual setups when devicetree
is loaded by GRUB2 directly.

Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
---
 arch/arm/boot/dts/am335x-boneblack-common.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
index 7ad079861efd..91f93bc89716 100644
--- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
+++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
@@ -131,6 +131,11 @@
 };
 
 / {
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x20000000>; /* 512 MB */
+	};
+
 	clk_mcasp0_fixed: clk_mcasp0_fixed {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
-- 
2.16.4

