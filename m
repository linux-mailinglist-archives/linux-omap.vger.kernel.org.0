Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136EE202B65
	for <lists+linux-omap@lfdr.de>; Sun, 21 Jun 2020 17:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730389AbgFUPfb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 21 Jun 2020 11:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730349AbgFUPfa (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 21 Jun 2020 11:35:30 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE953C061794;
        Sun, 21 Jun 2020 08:35:29 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id u8so6791257pje.4;
        Sun, 21 Jun 2020 08:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=pCHSO+WWOM+ps87QztUyed218HlARFnSKn3UarLknuw=;
        b=PY9WTGS698AWPNlIZ2ydJOC3WIkKx4mq7mzBsm6rl5svXf+ctQikUYz4OhhmjGFpMH
         mG2tDzkzHlrI4cqrRGuyAC8ySLq0X6RGcEVZLsMQBUpZNYTeeYbLieSEcZ5+2ttnD0/2
         4Uy6Ct/XxIkrg5hWjFWqdQ4SvjTvwi1sOzXidhSf2GAtIpswYdUIbl8EuX/xQUdy0V88
         GdhF/DLCdZ77nhe3C2FyR3kKon1Oc6vgMCqQNPebB7qN/8oObPiMmyYVxyUyeKTZwg/a
         nvWJx5w5+Gj93i8EZvr7Bz8d8Zr0x3KJPQ50P5tj1td12xR1a9f59MPOzj/7GZC1Su7q
         0weg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=pCHSO+WWOM+ps87QztUyed218HlARFnSKn3UarLknuw=;
        b=SmU0AkIAHorpZxnP5zPSHYIo9d//BfBEkoKGHywcTpqXklM9t1iR+HpMMJ5/zuXpCS
         ayRaFpIavRNrq1t+6xLDipp4iIBCMzLScA1vQaoRKRIbEGIE4qIaAhZWt8xF28BXSzRB
         YJCmjBWvh+MSRmBx6alhsWXl3dKRnZXDHhrssU4ubGNAZ4yFaxngiT6G6KhGFlrG9XCu
         LDtJ/QcNb0xkUta2OQog3gRGwf54fmB3ORqI4lhf9cd9kQDnsiWUTfTyl1R/ZnavTzAr
         uZcDeg4ONDvE+ze7aDHpGjpf2bU46Hhnm0tYkkAjLL+J80OFeifon46zCTXa7VRoYm47
         337w==
X-Gm-Message-State: AOAM530rK9dVL42wu9ZrTKixqvQHasRvu/wmDrWCClyd3EiYEAcj483R
        SlKZprtngn3QllVCeiwHnuI=
X-Google-Smtp-Source: ABdhPJwP3w252XfkHZtP9jnyeQFmLzdXW60LQUWzwN0iUW0Gkv9zjiw6q3NtX/4O58pAviVvTQ+X2g==
X-Received: by 2002:a17:902:aa0c:: with SMTP id be12mr16373566plb.45.1592753729397;
        Sun, 21 Jun 2020 08:35:29 -0700 (PDT)
Received: from localhost.localdomain ([106.121.157.185])
        by smtp.gmail.com with ESMTPSA id e124sm11127129pfh.140.2020.06.21.08.35.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Jun 2020 08:35:29 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     bcousson@baylibre.com, tony@atomide.com, robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH] ARM: dts: Configure osc clock for d_can on am437x
Date:   Sun, 21 Jun 2020 23:34:01 +0800
Message-Id: <1592753641-5205-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1592753641-5205-1-git-send-email-dillon.minfei@gmail.com>
References: <1592753641-5205-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

Since am437x have the same clock structure with am335x [1][2],
reuse the code from Tony Lindgren's patch [3] to fix dcan probe
failed on am437x platform.

[1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
Integration
[2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
Integration
[3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on
am335x")

Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to
read revision")

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---
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
1.9.1

