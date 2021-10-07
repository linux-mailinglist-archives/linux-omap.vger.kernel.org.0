Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE814252B0
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 14:09:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241384AbhJGMLG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 08:11:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:50882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241306AbhJGMKt (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 08:10:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B305F61251;
        Thu,  7 Oct 2021 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633608536;
        bh=3+cLcaMOC8CpQ4MJQGuyQwQiXVuVoqjfIy0pWhuayzc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dxPodFD7BiDjUdlu32qc5MSFmO1PnjHT1jGhDne2NFGTXLbfOuHJb+pVi57xFq6a7
         izpC/TffdJjefh4NDbhIXeTzsRKquXMPaodDCX7rEiszZDVS9IHhgOgYam60EK33QP
         W6SekICiAak+HGe8cK04+azAnfNe2HYzKBmDlcS/BH+R5mbESP7nUYgBkJxhj5ADfn
         tHhygTKqaE9SN68d0mr52rErXEW5ylh3g84/Zbo1ZeteON3wEMCsWpamWrFvlfJgLg
         5JWhiRLQzYosmTf4KQssbbuzlqUhBEosJFjod8X13RnFg1e/+Za9PAVs/vohnXcU3I
         FLxdXc8K4bE0Q==
From:   Roger Quadros <rogerq@kernel.org>
To:     tony@atomide.com
Cc:     robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
        lokeshvutla@ti.com, nsekhar@ti.com,
        krzysztof.kozlowski@canonical.com, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v5 7/8] ARM: dts: omap: Fix boolean properties gpmc,cycle2cycle-{same|diff}csen
Date:   Thu,  7 Oct 2021 15:08:29 +0300
Message-Id: <20211007120830.17221-8-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007120830.17221-1-rogerq@kernel.org>
References: <20211007120830.17221-1-rogerq@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

gpmc,cycle2cycle-{same|diff}csen are boolean properties. Fix them
to prevent dtbs_check errors.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi      | 4 ++--
 arch/arm/boot/dts/omap-zoom-common.dtsi        | 4 ++--
 arch/arm/boot/dts/omap2430-sdp.dts             | 4 ++--
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi | 4 ++--
 arch/arm/boot/dts/omap3-sb-t35.dtsi            | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
index ded7e8fec9eb..ce6c235f68ec 100644
--- a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
+++ b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
@@ -25,8 +25,8 @@
 		compatible = "smsc,lan9221", "smsc,lan9115";
 		bank-width = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <150>;
 		gpmc,cs-wr-off-ns = <150>;
diff --git a/arch/arm/boot/dts/omap-zoom-common.dtsi b/arch/arm/boot/dts/omap-zoom-common.dtsi
index d4ad9e58b199..1e96c865d41d 100644
--- a/arch/arm/boot/dts/omap-zoom-common.dtsi
+++ b/arch/arm/boot/dts/omap-zoom-common.dtsi
@@ -27,8 +27,8 @@
 		gpmc,mux-add-data = <0>;
 		gpmc,device-width = <1>;
 		gpmc,wait-pin = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <155>;
 		gpmc,cs-wr-off-ns = <155>;
diff --git a/arch/arm/boot/dts/omap2430-sdp.dts b/arch/arm/boot/dts/omap2430-sdp.dts
index 7d27e907533f..207070677e3a 100644
--- a/arch/arm/boot/dts/omap2430-sdp.dts
+++ b/arch/arm/boot/dts/omap2430-sdp.dts
@@ -43,8 +43,8 @@
 		gpmc,sync-clk-ps = <0>;
 		gpmc,mux-add-data = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <6>;
 		gpmc,cs-rd-off-ns = <187>;
 		gpmc,cs-wr-off-ns = <187>;
diff --git a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
index 2c19d6e255bd..5e55198e4576 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
@@ -267,8 +267,8 @@
 		gpmc,mux-add-data = <0>;
 		gpmc,device-width = <1>;
 		gpmc,wait-pin = <0>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 
 		gpmc,cs-on-ns = <6>;
 		gpmc,cs-rd-off-ns = <180>;
diff --git a/arch/arm/boot/dts/omap3-sb-t35.dtsi b/arch/arm/boot/dts/omap3-sb-t35.dtsi
index fb9842fa922c..5ec0893415e0 100644
--- a/arch/arm/boot/dts/omap3-sb-t35.dtsi
+++ b/arch/arm/boot/dts/omap3-sb-t35.dtsi
@@ -108,8 +108,8 @@
 		reg = <4 0 0xff>;
 		bank-width = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <150>;
 		gpmc,cs-wr-off-ns = <150>;
-- 
2.17.1

