Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2577B21E644
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 05:23:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgGNDX1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 13 Jul 2020 23:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgGNDX0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 13 Jul 2020 23:23:26 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B70FC061755;
        Mon, 13 Jul 2020 20:23:26 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id s189so1924484pgc.13;
        Mon, 13 Jul 2020 20:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xW5/BabNEIvpDOfbtUR9xY+c9eab4OK4y+/ElG/HHWo=;
        b=I3Ozj2LdraXWTsbMzEfYCxicSyC/Sa7NMra7F1PtGAGy9xQZj+TC61P3+F9caJO819
         QDws7LMCyA/0it6sG30unvvKnxU55JR+zndf0Gozr7NVKte/zyNwbaHotdglzIKmeStv
         IkJHwcyCQ2pCWNBhWzfZlVLIdAELN5FkHm7KiaOXwjsUQBag2g4DlP2Qp5qHw2vi/HWh
         ZchcetBT9Y+hiP4LjVclRVQA4q2WNUyqo1/srwUgEIchWX5Lr3hjzR6hW/ktHZFVR+5m
         5VIoOEk0OsZ5tXB8mHhnjPBHuT5P48vdDsSoHXrIlUxjCx6mTdnm4WS7KRFFRI6B+z4n
         JiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xW5/BabNEIvpDOfbtUR9xY+c9eab4OK4y+/ElG/HHWo=;
        b=qiatt0cI0Mn6JHAfqTAJu7GdvVLSbWfMQ9AvW5BKC4/Cgl3mnH9j5PXKQDSucXXF/g
         G0fP3/Kru6fFbAll4nYJxK8FsLojkRc+nG/t10YKqddZpecAeFxLGMFzRkpfCYFj8ZV9
         fXyxv43FetGRM9jYtCn6Fe+gRWcK++9WtJzVrF8BpF1x2G7KB6ZKaKSScWDIm/sefkgt
         fInKDuBPT+T0+8lLxI/D0DlR5meNzDo17yW74SlyiRu6X9duS1VsQxcshOcwSLqlpFdV
         dko1K8d+itGdPStuTTp/esw3BpbaNGU+dthxla5pTLIIL22iR5TUZsr8I+WjKGvsni2o
         Ye1A==
X-Gm-Message-State: AOAM5309WhYtpOMhwYIdMWRmRX70eMLvaPL5rjtIkJJh81yyDJOpaMJc
        Lod7mYGvX3TsURhJWKOPOVUNbXkSaZg=
X-Google-Smtp-Source: ABdhPJxxORme6Q3TuPJzp9CBnVooakCTgBJw/bYUDbA95N5iNpBAUOq8mPtWEX4loWdX/M44VdDqdg==
X-Received: by 2002:a63:d74c:: with SMTP id w12mr1852456pgi.260.1594697005581;
        Mon, 13 Jul 2020 20:23:25 -0700 (PDT)
Received: from fmin-OptiPlex-7060.nreal.work ([103.206.191.8])
        by smtp.gmail.com with ESMTPSA id c139sm15243184pfb.65.2020.07.13.20.23.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jul 2020 20:23:25 -0700 (PDT)
From:   dillon.minfei@gmail.com
To:     sfr@canb.auug.org.au, bcousson@baylibre.com, tony@atomide.com,
        robh+dt@kernel.org
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dillon min <dillon.minfei@gmail.com>
Subject: [PATCH v2] Since am437x have the same clock structure with am335x [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan probe failed on am437x platform.
Date:   Tue, 14 Jul 2020 11:23:18 +0800
Message-Id: <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
References: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: dillon min <dillon.minfei@gmail.com>

Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during init to read revision")

[1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
Integration
[2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
Integration
[3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am335x")

Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Hi Stephen,

This changes correct commit messages based on your reviewing.
make Fixes tags to oneline.
make all commit message tags at the end of commit message


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

