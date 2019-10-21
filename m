Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE96DF2BF
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 18:18:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728375AbfJUQSB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 12:18:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:37928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727303AbfJUQSB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 21 Oct 2019 12:18:01 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB90D214B2;
        Mon, 21 Oct 2019 16:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571674680;
        bh=wuXiVSVhv0GuAFMI8jKpur+OW7AvMoJZSNiRXZZygDY=;
        h=From:To:Cc:Subject:Date:From;
        b=2J5EJLOUpiK8dnlh3Y2Ews/l7UoghzFyqIKPUdCNhLUhMRFNBW3K2KN8Fvg6B8dBh
         RCHc3eXnAUZvbtyiin9Ijn6WSWNP5V6uGjlYOWI5h/nBJ4dOWohIDB5i0tKUu9Wgnq
         +xJuleX6ojM0STnd0j+4weZkcRQRyhUF8U2xU0uI=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v4] ARM: dts: am: Rename "ocmcram" node to "sram"
Date:   Mon, 21 Oct 2019 18:17:52 +0200
Message-Id: <20191021161752.21502-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The device node name should reflect generic class of a device so rename
the "ocmcram" node and its children to "sram".  This will be also in
sync with upcoming DT schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v3:
1. Rename also children.

v3 is here:
https://lore.kernel.org/linux-arm-kernel/20191002164316.14905-9-krzk@kernel.org/
---
 arch/arm/boot/dts/am33xx.dtsi | 6 +++---
 arch/arm/boot/dts/am4372.dtsi | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index fb6b8aa12cc5..765963de5d41 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -393,20 +393,20 @@
 			};
 		};
 
-		ocmcram: ocmcram@40300000 {
+		ocmcram: sram@40300000 {
 			compatible = "mmio-sram";
 			reg = <0x40300000 0x10000>; /* 64k */
 			ranges = <0x0 0x40300000 0x10000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			pm_sram_code: pm-sram-code@0 {
+			pm_sram_code: pm-code-sram@0 {
 				compatible = "ti,sram";
 				reg = <0x0 0x1000>;
 				protect-exec;
 			};
 
-			pm_sram_data: pm-sram-data@1000 {
+			pm_sram_data: pm-data-sram@1000 {
 				compatible = "ti,sram";
 				reg = <0x1000 0x1000>;
 				pool;
diff --git a/arch/arm/boot/dts/am4372.dtsi b/arch/arm/boot/dts/am4372.dtsi
index 848e2a8884e2..3e3ae48c2e5a 100644
--- a/arch/arm/boot/dts/am4372.dtsi
+++ b/arch/arm/boot/dts/am4372.dtsi
@@ -349,20 +349,20 @@
 			};
 		};
 
-		ocmcram: ocmcram@40300000 {
+		ocmcram: sram@40300000 {
 			compatible = "mmio-sram";
 			reg = <0x40300000 0x40000>; /* 256k */
 			ranges = <0x0 0x40300000 0x40000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			pm_sram_code: pm-sram-code@0 {
+			pm_sram_code: pm-code-sram@0 {
 				compatible = "ti,sram";
 				reg = <0x0 0x1000>;
 				protect-exec;
 			};
 
-			pm_sram_data: pm-sram-data@1000 {
+			pm_sram_data: pm-data-sram@1000 {
 				compatible = "ti,sram";
 				reg = <0x1000 0x1000>;
 				pool;
-- 
2.17.1

