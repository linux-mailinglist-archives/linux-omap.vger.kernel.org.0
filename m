Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA21533A562
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 16:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbhCNPVa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 11:21:30 -0400
Received: from smtp-17-i2.italiaonline.it ([213.209.12.17]:53204 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231892AbhCNPVU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 11:21:20 -0400
X-Greylist: delayed 343 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Mar 2021 11:20:58 EDT
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id LSTmlDnzqtpGHLSTplAQtq; Sun, 14 Mar 2021 16:16:33 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1615734994; bh=wnjplnLdFDkHsfAUHmWTFQwLX0oNy1/Ru7raheFYmvw=;
        h=From;
        b=T5iYKy4Qdw1yFbqjt2iWO9y8qEAx/Ivi1TjhMj4g8oFErjLOs2uvZaBJGav5+37AE
         X8FDB7hRPLWhIhz34wxxvS8wdpptvbjqbe13yxqPOb8c/98K9v++m7S363IOBWpNUH
         RU5k97fQkQxmGFhqBERRAkNv25PxLvejBySEv+CLE7KCpwG31n9IrV1uZYUNq4FXtW
         mKekY2HpG2HsR+aipOnFTfC/wZfSsFfqyoiG5bfFU/IqL8DVko6RxyH9cSsmNGBu8v
         MSOuD+xMmCgx9D8k3y/fRzPFXU17V/1tf+yHdmGsBA46XB6kJlbaB9ITctYfrpaNi9
         J/Y16YR6Jv6Ig==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=604e28d2 cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=hN1Y6PlX_eMEyabRrE4A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [RESEND PATCH] ARM: dts: am33xx-l4: fix tscadc@0 node indentation
Date:   Sun, 14 Mar 2021 16:16:28 +0100
Message-Id: <20210314151629.23921-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfPsAJ64dxFd6GoGwuXh/hzuC6FohTjpOmOEZznpnv2nVI8hiAFZNIWDQZ2vCYjxxONpwZrv6RnSFFDZ7FFcsit0MIBGaKfuZux0SJb80Fa4dNlPt05RN
 rvJXXaDKkoCkO40aZDbC+3SZTuHuUHPw76UcDlXOLSw6TsuubqjBRYbiHLh23Dq6evDcD1+ldL3fd3/iC75AozqRVmp7CUUy12jmrSGoBMgyxTuj4MLLqtrS
 aM/2wbbreAHk2WvlCp1tsSdNjNbAQaKz87AVy0E2wEsTnvLV2kPWG7Yg/KoBFOrZA0MYUgUJZa7B6V1F27cR6fFlzTw+aEPd7tnZHmQpYwom0ijTm8xa328Y
 2vovDzklLkd9F9g7z1nkmp/PDviLO4PfSgC7YbtssaA6k8RPAvvU8Myhb7yPcogPbgywKJauNzUqhEi7+/lc2qLw7KTOfg==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fix the broken indentation of tscadc@0 node.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 arch/arm/boot/dts/am33xx-l4.dtsi | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-l4.dtsi b/arch/arm/boot/dts/am33xx-l4.dtsi
index 1fb22088caeb..039a9ab4c7ea 100644
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

