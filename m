Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCF721E68E
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 05:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgGNDwO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 23:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726771AbgGNDwN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jul 2020 23:52:13 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97D18C061755;
        Mon, 13 Jul 2020 20:52:13 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e8so7000822pgc.5;
        Mon, 13 Jul 2020 20:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GnebsxGNNiOoiYfiC1kn84gDhaBxaLqzjhEh/R1NZTU=;
        b=e4G57ei3UOCLalrDzEh03NxmlohXTZBoCCWSgitar/EZcG5UL6TMzs+o3S3UlSrZRL
         WsPz3wA5yv4n/ZTRT8Gy/fJEoiX4xNqx/ik9DBtnRfF6GENhPBQSVhdfbamlZ+WEUEiK
         rcCV8zYZlVCd+lSJWEQ2CovDKjcb/KPOAMYSF+TVwiqXMygwNKahum0rIeeGfI1goias
         QYKgjHSQTB6UxMxVECHo0WagC3j9owrRUJ+LnbY+FGnsFOTiRtpH4wLUcX48DiQIEBQp
         WEFAUOolpMCPgxsI1uC4vHxw+0AQoYtQG065bWm0wt4BXu7S7MaYc64T2zPbW0Gb7KqV
         k5LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GnebsxGNNiOoiYfiC1kn84gDhaBxaLqzjhEh/R1NZTU=;
        b=nHE+aJXps5s1Zf3WQa7rMEaxGYC9yEXIT7yyyYgbh03r0oxFU07Se7ZFXXckbAZv60
         NzTFBvqhkwdqrP2xaIwuBN45aj//raHJHZjeYEBvYN/HflyWHwoZzyQ4DKVtVMqevmAC
         zIQdGTRgoHILv2RoqyAxGvMb2riC9glIPAyYNpAIalZ9czW+BEmip/VmZv0MKJydoI/0
         0SpNFKXPrrpoaOXNVSKnSF4hBtaSkbArW0ZPGkgwDWLTjGay4mnTaMIPrH/ExOpNOj16
         /d8k6kXP5vUCmS2FNUommZY7izP1fk398+SIoSQUuR3G+P4Iv3aK6fQHPzohYM3uY22C
         8+7A==
X-Gm-Message-State: AOAM533P0hCNRCS81SAvQ5EOdZ2xDkp7UXnomvPWq2bdTCuYQkGtOWVR
        iMYqy9T4cIv6lqjR1b+huTFvDeL7llo=
X-Google-Smtp-Source: ABdhPJw9XxcIqQaocq0iMXTMvVlAUSgMG4zI17nmiqc325A24sn+tmIhqUFMdSHtOmt1ZJbCIh7j9g==
X-Received: by 2002:a63:2b91:: with SMTP id r139mr1946237pgr.61.1594698733164;
        Mon, 13 Jul 2020 20:52:13 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.8])
        by smtp.gmail.com with ESMTPSA id v11sm17595832pfc.108.2020.07.13.20.52.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 20:52:12 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     sfr@canb.auug.org.au, bcousson@baylibre.com, tony@atomide.com,
        robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v3] Since am437x have the same clock structure with am335x [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan probe failed on am437x platform.
Date:   Tue, 14 Jul 2020 11:52:06 +0800
Message-Id: <1594698726-4557-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594698726-4557-1-git-send-email-dillon.minfei@gmail.com>
References: <1594698726-4557-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>


[1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
Integration
[2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
Integration
[3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am335x")

Signed-off-by: dillon min <dillon.minfei@gmail.com>
Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to read revision")
---

Hi Stephen,

This changes correct commit messages based on your reviewing.
make Fixes tags to oneline.
make all commit message tags at the end of commit message
make Fixes tags after Signed-off-by line.

 arch/arm/boot/dts/am437x-l4.dtsi | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index 0d0f9fe4a882..4129affde54e 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1541,8 +1541,9 @@
 			reg = <0xcc020 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM4_L4LS_D_CAN0_CLKCTRL 0>;
-			clock-names = "fck";
+			clocks = <&l4ls_clkctrl AM4_L4LS_D_CAN0_CLKCTRL 0>,
+			<&dcan0_fck>;
+			clock-names = "fck", "osc";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xcc000 0x2000>;
@@ -1550,6 +1551,8 @@
 			dcan0: can@0 {
 				compatible = "ti,am4372-d_can", "ti,am3352-d_can";
 				reg = <0x0 0x2000>;
+				clocks = <&dcan0_fck>;
+				clock-names = "fck";
 				syscon-raminit = <&scm_conf 0x644 0>;
 				interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
@@ -1561,8 +1564,9 @@
 			reg = <0xd0020 0x4>;
 			reg-names = "rev";
 			/* Domains (P, C): per_pwrdm, l4ls_clkdm */
-			clocks = <&l4ls_clkctrl AM4_L4LS_D_CAN1_CLKCTRL 0>;
-			clock-names = "fck";
+			clocks = <&l4ls_clkctrl AM4_L4LS_D_CAN1_CLKCTRL 0>,
+			<&dcan1_fck>;
+			clock-names = "fck", "osc";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges = <0x0 0xd0000 0x2000>;
@@ -1570,6 +1574,8 @@
 			dcan1: can@0 {
 				compatible = "ti,am4372-d_can", "ti,am3352-d_can";
 				reg = <0x0 0x2000>;
+				clocks = <&dcan1_fck>;
+				clock-name = "fck";
 				syscon-raminit = <&scm_conf 0x644 1>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
-- 
2.7.4

