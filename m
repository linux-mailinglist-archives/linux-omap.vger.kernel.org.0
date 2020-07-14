Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1604521E83C
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 08:35:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726856AbgGNGfQ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 02:35:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725788AbgGNGfP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jul 2020 02:35:15 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 996CAC061755;
        Mon, 13 Jul 2020 23:35:15 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id m22so7160361pgv.9;
        Mon, 13 Jul 2020 23:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ttRWYRpQA+ROyR/qt6rQ042N5BqhH7zwDEorOgcsIPw=;
        b=k+9CWDSBFyBA4uCZr9ZjCOxZFRn2+dG48OX0eM1HjXj+N2V3hERruL+Mcetjh8Hlpt
         E7Kig993b6wqk3ckBvtplrk7lOgpTlrQkGUU4hVLpBQ8DU0JX8kUyWsGw/1oFihjWn8j
         tOMVWjy/3bsyeOQEmqGIJwVQG3N4MzzY6pQGJm45d4PTng77FEjHi9ydbD00oFtV3uBK
         6h88I2wYeRACthoCuGcH5o39H9pcohzPC1p4GnKgNY5HNs3INFHXJ+YFVwDp4nBH39EU
         noOBxd+s93S/LK+u4xpFdIkMvLDfKt7ahXlfEzID58xF2tkrZon2MM9vEQVY4wJdqL0O
         n9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ttRWYRpQA+ROyR/qt6rQ042N5BqhH7zwDEorOgcsIPw=;
        b=FO3h5S44jmujNVPwVrhlRYp9DUvvPXVaJJQouiE0Wm18pvSd5CNsCKynNxtPylpms5
         mpN4cVz1OrUhmPz3xglyWkvNgiR0mKM+sTSdKlx53TDo0zDajsrenFHffm8XHamcyuPl
         B5PLwJo/UYj8tyS51Jc6Rm4LEULyEd0hzBqdonqv1mR3rMb1/MxK28hat7ENG+lp+29o
         qoWSkJ2h4HXLdkHKKC6xac4san1lP4vnF9T6YYwzCKW3YD8Wul06UxjshBRo3o3NylcH
         KEhlYUaILVHVSECmxsZKOhns70Jh20VPCmYeXv1g1aLA3Q2WUFaUfH1wl0aB9ctlTrfW
         TqFA==
X-Gm-Message-State: AOAM5339jiJcVO2+wHUgp08jBlf4tRJQhjES3S09SIICNBVWUK2GjxKz
        nRdFGGccSDwP+DvoBRAEAe2oe/bfdw4=
X-Google-Smtp-Source: ABdhPJxsXMb8aduQly7Mg4wx8VR76wGSzmEGY7JJaD/c4MxeTPvsNGUJRjc3/isijJ4jjqq1+Ci6/Q==
X-Received: by 2002:aa7:9609:: with SMTP id q9mr2892721pfg.269.1594708515214;
        Mon, 13 Jul 2020 23:35:15 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.8])
        by smtp.gmail.com with ESMTPSA id q29sm16041215pfl.77.2020.07.13.23.35.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 23:35:14 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     sfr@canb.auug.org.au, bcousson@baylibre.com, tony@atomide.com,
        robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v4] Fix dcan driver probe failed on am437x platform
Date:   Tue, 14 Jul 2020 14:35:07 +0800
Message-Id: <1594708507-6794-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594708507-6794-1-git-send-email-dillon.minfei@gmail.com>
References: <1594708507-6794-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

Got following d_can probe errors with kernel 5.8-rc1 on am437x

[   10.730822] CAN device driver interface
Starting Wait for Network to be Configured...
[  OK  ] Reached target Network.
[   10.787363] c_can_platform 481cc000.can: probe failed
[   10.792484] c_can_platform: probe of 481cc000.can failed with
error -2
[   10.799457] c_can_platform 481d0000.can: probe failed
[   10.804617] c_can_platform: probe of 481d0000.can failed with
error -2

actually, Tony has fixed this issue on am335x with the patch [3]

Since am437x has the same clock structure with am335x
[1][2], so reuse the code from Tony Lindgren's patch [3] to fix it.


[1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
Integration
[2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
Integration
[3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am335x")

Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to read revision")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Hi Stephen,

This changes correct commit messages based on your reviewing.
make Fixes tags to oneline.
make all commit message tags at the end of commit message
make Fixes tags before Signed-off-by line.
add probe failed log to commit message.

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

