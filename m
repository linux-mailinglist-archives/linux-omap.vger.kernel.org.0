Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83C5031B08F
	for <lists+linux-omap@lfdr.de>; Sun, 14 Feb 2021 14:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbhBNNhl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Feb 2021 08:37:41 -0500
Received: from smtp-17.italiaonline.it ([213.209.10.17]:42182 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229642AbhBNNhk (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Feb 2021 08:37:40 -0500
X-Greylist: delayed 381 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Feb 2021 08:37:39 EST
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id BHTnlH3C4lChfBHTtlSRDk; Sun, 14 Feb 2021 14:30:38 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2014;
        t=1613309438; bh=qkWp20AtpEuGNqbGNTXPOIoWBZsHRc1VmZLJjjdccCM=;
        h=From;
        b=XVsEKVyyYAbYU9CDwJwEr+FHvB2BJfOQo73SesfUCYaSvT24CYHNKPrjsmzlfHcCQ
         x6I/5u2b7x5i8Y+WfmIvrnrf37YzZMQ3/cbJNMMPrhBzArhS2Fh2eNp1ZC0hPTCnlD
         LD9ig1IXU1bQOomzizIvK+cIrzLCOpkojIqflAd6bgJRU0v9s+3xSFL4sSDa37GvLg
         gEP/72awy9pZLDgiUZpUwK1i2sUw1JvRrNtn9bOAast6CcRJNICxXycspNfH1tqC0U
         3pV5+HYIQNt97D/SxXxCP2xRERXB6CdbwN2qrCp0lRh5JoOUbLZvVd0vrSQAYYAbbA
         4tBdpQmtv+CVA==
X-CNFS-Analysis: v=2.4 cv=S6McfKgP c=1 sm=1 tr=0 ts=602925fe cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=hN1Y6PlX_eMEyabRrE4A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH] ARM: dts: am33xx-l4: fix tscadc@0 node indentation
Date:   Sun, 14 Feb 2021 14:30:20 +0100
Message-Id: <20210214133020.10766-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfGRUyz5EcWl8espVBbAuyJvbtjfyN4d/vmBdG5u7dVSesdkJ5jVuuTqypRY98NQr81Cxk9LQYWBMloEipwPyL9sF4jHk3Eq2bmtVrvuu7Z166WRDyI/l
 5NFmXwl36vu4b/uevefFott5Grrppzu7dynghN8xm+8TiTQ1HradeGIgDp7yRyAydyExVYz41xCrl39fdBqax784emFBvlhqZTZBxAuAr7MPi1xI/5ix4FyT
 +7wSgclfCl/o1iE5lFIP5BCqSkX9uxKBig+YCB8DCVIRdt/bw+idrllDfvpBZW+siKY1+gVeSA45fphaeEDYhnbLBhWRz45KvAZXxFnNpPfSLEFNOK3D02U1
 ugVdCcXSVhtmm0WgKNc2qIvJXWhXEclkHPzapKrnd2PXCgsXOMd56PiwLwA3vzQzYNNve9onW0xABQwh+rnzWaUggU1OTA==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the broken indentation of tscadc@0 node.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 arch/arm/boot/dts/am33xx-l4.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 78088506d25b..9963eeb57f69 100644
--- a/arch/arm/boot/dts/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/am33xx-l4.dtsi
@@ -259,22 +259,22 @@
 			ranges = <0x00000000 0x0000d000 0x00001000>,
 				 <0x00001000 0x0000e000 0x00001000>;
 
-				tscadc: tscadc@0 {
-					compatible = "ti,am3359-tscadc";
-					reg = <0x0 0x1000>;
-					interrupts = <16>;
-					status = "disabled";
-					dmas = <&edma 53 0>, <&edma 57 0>;
-					dma-names = "fifo0", "fifo1";
+			tscadc: tscadc@0 {
+				compatible = "ti,am3359-tscadc";
+				reg = <0x0 0x1000>;
+				interrupts = <16>;
+				status = "disabled";
+				dmas = <&edma 53 0>, <&edma 57 0>;
+				dma-names = "fifo0", "fifo1";
 
-					tsc {
-						compatible = "ti,am3359-tsc";
-					};
-					am335x_adc: adc {
-						#io-channel-cells = <1>;
-						compatible = "ti,am3359-adc";
-					};
+				tsc {
+					compatible = "ti,am3359-tsc";
+				};
+				am335x_adc: adc {
+					#io-channel-cells = <1>;
+					compatible = "ti,am3359-adc";
 				};
+			};
 		};
 
 		target-module@10000 {			/* 0x44e10000, ap 22 0c.0 */
-- 
2.17.1

