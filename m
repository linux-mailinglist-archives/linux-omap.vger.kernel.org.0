Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5955025D1BE
	for <lists+linux-omap@lfdr.de>; Fri,  4 Sep 2020 09:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728112AbgIDHC3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Sep 2020 03:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728118AbgIDHCY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Sep 2020 03:02:24 -0400
Received: from hillosipuli.retiisi.org.uk (hillosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::81:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780C3C061244
        for <linux-omap@vger.kernel.org>; Fri,  4 Sep 2020 00:02:23 -0700 (PDT)
Received: from lanttu.localdomain (lanttu-e.localdomain [192.168.1.64])
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTP id 674D7634C8C;
        Fri,  4 Sep 2020 10:01:46 +0300 (EEST)
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-omap@vger.kernel.org
Cc:     tony@atomide.com
Subject: [PATCH 1/1] ARM: dts: n9, n950: Remove nokia,nvm-size property
Date:   Fri,  4 Sep 2020 09:58:11 +0300
Message-Id: <20200904065811.9312-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Remove nokia,nvm-size property as it is no longer needed. The driver can
nowadays figure out the size so do not specify it in DT.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
Hi Tony,

Commit 33e17ea2d4f0 ("media: dt-bindings: smia: Remove documentation of
nokia,nvm-size") removed this from DT bindings and the driver support was
added by 941e1d36b5b6 ("media: smiapp: Support probing NVM size"). So we
can remove it from here, too, I think.

 arch/arm/boot/dts/omap3-n9.dts   | 1 -
 arch/arm/boot/dts/omap3-n950.dts | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/omap3-n9.dts b/arch/arm/boot/dts/omap3-n9.dts
index 2495a696cec6..d211bcc31174 100644
--- a/arch/arm/boot/dts/omap3-n9.dts
+++ b/arch/arm/boot/dts/omap3-n9.dts
@@ -23,7 +23,6 @@ smia_1: camera@10 {
 		vana-supply = <&vaux3>;
 		clocks = <&isp 0>;
 		clock-frequency = <9600000>;
-		nokia,nvm-size = <(16 * 64)>;
 		flash-leds = <&as3645a_flash &as3645a_indicator>;
 		port {
 			smia_1_1: endpoint {
diff --git a/arch/arm/boot/dts/omap3-n950.dts b/arch/arm/boot/dts/omap3-n950.dts
index 31d47a1fad84..1bac51e9a79e 100644
--- a/arch/arm/boot/dts/omap3-n950.dts
+++ b/arch/arm/boot/dts/omap3-n950.dts
@@ -76,7 +76,6 @@ smia_1: camera@10 {
 		vana-supply = <&vaux3>;
 		clocks = <&isp 0>;
 		clock-frequency = <9600000>;
-		nokia,nvm-size = <(16 * 64)>;
 		flash-leds = <&as3645a_flash &as3645a_indicator>;
 		port {
 			smia_1_1: endpoint {
-- 
2.27.0

