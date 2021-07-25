Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2963D4E9E
	for <lists+linux-omap@lfdr.de>; Sun, 25 Jul 2021 18:11:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbhGYPbJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Jul 2021 11:31:09 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:36746 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229584AbhGYPbI (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 25 Jul 2021 11:31:08 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.45.45.231])
        by smtp-34.iol.local with ESMTPA
        id 7gb5mU7LcLCum7gbAmo0vu; Sun, 25 Jul 2021 18:03:28 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1627229008; bh=NgG/94EQMSDd3GhiH3834pqgbqxX8Ft4C3Xhwr0gzrM=;
        h=From;
        b=oOG1TUMCWyhfs+/bi7HvtxM9TlEM45ywFkzxoHc3a4zcB2Xnqbnu0RdrDNcAy29mt
         D+yq6/nsMUnT/jkvF/9eLBEUatJ3JR+cmnJdPII06TQLHDPNpxyYIg5xhLlRxdbs2m
         DEaA3ULiOImFYGGaTJL3M5n7srofbM169QkXyuTJygiVSS2KhXNtY/Jl5mGHxfgjgv
         GBPSk+G9DcSEKXWTUuF0bO49aY0X8zzk1b/DgnA7hJ8dB5KNNZlypOv/VSGHEdoC0U
         0tUTFoEzn1X6wBBu91S747oEhg8z0ZlxtXndcrfPNh83jY1sQoZTg2ncVvPIv3snQ9
         O15lbsVdkMMMg==
X-CNFS-Analysis: v=2.4 cv=a8D1SWeF c=1 sm=1 tr=0 ts=60fd8b50 cx=a_exe
 a=TX8r+oJM0yLPAmPh5WrBoQ==:117 a=TX8r+oJM0yLPAmPh5WrBoQ==:17
 a=UNFpN4EEUbz4bbRXVrcA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: am437x-l4: fix typo in can@0 node
Date:   Sun, 25 Jul 2021 18:03:17 +0200
Message-Id: <20210725160318.9312-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfEGZliEpEUTG8sPjgPPrcnoiWqpSiOtEa3BHZJxDuCK5SeZUmDMOqo7Kb4u5mGONDwzW1VcwIYYnYhiI3c6ho2Fr6OZHnVK8BsKJzRW1NHZ+bGE7nvfk
 poux59G1APUr/A5RDQEC+aH2Hl+e4UW4S9kVhi9cZkpyGx2oqa7CfHDMZRDnEV/twPuARr8gbbxPVp1JMKr6mjTTAciDCMUVSQZujmMPh+iBg8oti+gRQ/wy
 ClusvaQjhWByEuiZlKGRUL7jEKnAGu2PNPb3koX+qGgrjArQCL3YSZmjuHn+BE239dE2nQ8dHN84i4tXi9KsIYCCSyIPcsC/sV/i4X0Efczg1S/dVXAywDHD
 Crdze0hBggt2QaRDEvURMzg4BRK8JkGxC86/AopSiz2pKTKHNw6/K2QO9vDse/mDjGlAbpSDN/pZSP/RsWFIe8V1+Mec9A==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace clock-name with clock-names.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 arch/arm/boot/dts/am437x-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/am437x-l4.dtsi b/arch/arm/boot/dts/am437x-l4.dtsi
index 40ef3973f2a9..ba58e6b0da1d 100644
--- a/arch/arm/boot/dts/am437x-l4.dtsi
+++ b/arch/arm/boot/dts/am437x-l4.dtsi
@@ -1595,7 +1595,7 @@
 				compatible = "ti,am4372-d_can", "ti,am3352-d_can";
 				reg = <0x0 0x2000>;
 				clocks = <&dcan1_fck>;
-				clock-name = "fck";
+				clock-names = "fck";
 				syscon-raminit = <&scm_conf 0x644 1>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
-- 
2.17.1

