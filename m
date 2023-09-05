Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91D4F79246C
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231139AbjIEP66 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:58:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354596AbjIEMuh (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 08:50:37 -0400
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE3FDF
        for <linux-omap@vger.kernel.org>; Tue,  5 Sep 2023 05:50:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693918225; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=gnAtcqaSnLnNewn37hFtNxhUlKvlEqrF0GxeXBrRfU3cc1VG3SuIC8Fq+1mu3YDJyE
    IyA5e3CfCQh/ioX9UZIg8C5KAhI3CGWil3dhm3CimdAT82sdal2yohcOyOrFt3CUrX0X
    dyMzfrV8KkH3J0O36IYpjXPeh7Qw5TNBeKvhFDCOQ9M26zspBJ1I2zAsvAIPR6kBPUqv
    fwF54/gaXvJkQCgE04e2kIiJtCC4ScXizbkoekKCD0G9cQUDKsezv/fhX3UU5wMbyPu4
    q7EcKSd8NbquBTx+vMVgd8hBXxS1hdQJzJSPnDdYRyV6YpbeDl6d/YFgQZSziV65U1la
    PPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918225;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=97jgT7ubO9fpCR8zFFXRO0momnaATvtViaPFm0jve0w=;
    b=tVUp4f1jtaHE2lzYIJsW5jKLV5CA+Le5AbTZwZ9e1/uRBmgydlkL1HtGTTxYshdbWP
    r7znGa/0Z5U3mtI9T3sXJtliKkIA38TF/bDCXl/yFOOz5+v9R6AyRBumYYFzGXd+Z8of
    +43erfxUAydbQdAsfquFaHRhgMF+WGu4wzanS+a2sJpO5ZWrBTQNMW13JnUUZX160die
    k4FbFJ36Qbildm7T6hC1MxxlJ6dsTjQ/v2HAGOvuRgNo8BsulQEQOZd+n/FI4njRQYFO
    ohHlW//hPVGEI7gvBDfdzml6Jezv2Ckx5apRaw2TFBSa1HWP1b82SfB+NmnLQa9Uu87C
    Ibbw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1693918225;
    s=strato-dkim-0002; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=97jgT7ubO9fpCR8zFFXRO0momnaATvtViaPFm0jve0w=;
    b=Ds1cJMt4ahHcR2AZZ8lNdXWJXIs+gG5xv5EDi/Wvqdaa9R3KmmYd19cwRqfhGNsLbv
    OcAGfM+3SwrPVPUwGMccMoPLVaViUTpvSKIU4fa9zg+JiG5BUV0QI5x6XMftmrlpnUQ/
    ZXSChx+A7CaNu67LdNamx8fG+8LoAbHDNGeHlRjL8cTTptBZJKepmHifrkXiWUHdq+Rb
    DN/Bp1ZHGSrS/hyk0+yEitv2j3nmYRUD13Fnqdw1XVylmjn8YQtxE3GnhdRZXW5qvn9E
    DN9LKQYIt5HQD38nvyJgC84LWkzfyPAeSbJdYZW3XXTqdcMuOtT/00dIR1fOqTSmnhl4
    56Zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1693918225;
    s=strato-dkim-0003; d=goldelico.com;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=97jgT7ubO9fpCR8zFFXRO0momnaATvtViaPFm0jve0w=;
    b=deZKFfkkyK+dN4fnWvCS1Rd6+bs6kmP+MsT3Zz+578kuDwaCpKVxV05Finue49h+Jk
    U3izE+XnnN9sVx/mF+Cg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1iTDUhfN4hi3qVZrW7J"
Received: from localhost.localdomain
    by smtp.strato.de (RZmta 49.8.2 DYNA|AUTH)
    with ESMTPSA id 04cbadz85CoOLbK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 5 Sep 2023 14:50:24 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>,
        peter.ujfalusi@gmail.com
Cc:     letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        linux-omap@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [RFC 5/6] ARM: DTS: omap4-l4-abe: add an aess (audio DSP of OMAP4 and OMAP5) child
Date:   Tue,  5 Sep 2023 14:50:14 +0200
Message-ID: <535d7f940a97ec12f6551fd2ca8a9343d8ae3674.1693918215.git.hns@goldelico.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1693918214.git.hns@goldelico.com>
References: <cover.1693918214.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

make the aess module a child of the target-module.

Define ranges, register names, interrupts, dmas.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi | 75 +++++++++++++++------
 1 file changed, 56 insertions(+), 19 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
index a8d66240d17d5..7ca7b369b4e59 100644
--- a/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap4-l4-abe.dtsi
@@ -41,12 +41,14 @@ segment@0 {					/* 0x40100000 */
 			 <0x0003d000 0x0003d000 0x001000>,	/* ap 23 */
 			 <0x0003e000 0x0003e000 0x001000>,	/* ap 24 */
 			 <0x0003f000 0x0003f000 0x001000>,	/* ap 25 */
-			 <0x00080000 0x00080000 0x010000>,	/* ap 26 */
-			 <0x00080000 0x00080000 0x001000>,	/* ap 27 */
-			 <0x000a0000 0x000a0000 0x010000>,	/* ap 28 */
-			 <0x000a0000 0x000a0000 0x001000>,	/* ap 29 */
-			 <0x000c0000 0x000c0000 0x010000>,	/* ap 30 */
-			 <0x000c0000 0x000c0000 0x001000>,	/* ap 31 */
+			 <0x00080000 0x00080000 0x010000>,	/* dmem */
+			 <0x00090000 0x00090000 0x001000>,	/* dmem */
+			 <0x000a0000 0x000a0000 0x010000>,	/* cmem */
+			 <0x000b0000 0x000b0000 0x001000>,	/* cmem */
+			 <0x000c0000 0x000c0000 0x010000>,	/* smem */
+			 <0x000d0000 0x000d0000 0x001000>,	/* smem */
+			 <0x000e0000 0x000e0000 0x010000>,	/* pmem */
+			 <0x000f0000 0x000f0000 0x001000>,	/* pmem */
 			 <0x000f1000 0x000f1000 0x001000>,	/* ap 32 */
 			 <0x000f2000 0x000f2000 0x001000>,	/* ap 33 */
 
@@ -77,12 +79,14 @@ segment@0 {					/* 0x40100000 */
 			 <0x4903d000 0x4903d000 0x001000>,	/* ap 23 */
 			 <0x4903e000 0x4903e000 0x001000>,	/* ap 24 */
 			 <0x4903f000 0x4903f000 0x001000>,	/* ap 25 */
-			 <0x49080000 0x49080000 0x010000>,	/* ap 26 */
-			 <0x49080000 0x49080000 0x001000>,	/* ap 27 */
-			 <0x490a0000 0x490a0000 0x010000>,	/* ap 28 */
-			 <0x490a0000 0x490a0000 0x001000>,	/* ap 29 */
-			 <0x490c0000 0x490c0000 0x010000>,	/* ap 30 */
-			 <0x490c0000 0x490c0000 0x001000>,	/* ap 31 */
+			 <0x49080000 0x49080000 0x010000>,	/* dmem */
+			 <0x49090000 0x49090000 0x001000>,	/* dmem */
+			 <0x490a0000 0x490a0000 0x010000>,	/* cmem */
+			 <0x490b0000 0x490b0000 0x001000>,	/* cmem */
+			 <0x490c0000 0x490c0000 0x010000>,	/* smem */
+			 <0x490d0000 0x490d0000 0x001000>,	/* smem */
+			 <0x490e0000 0x490e0000 0x010000>,	/* pmem */
+			 <0x490f0000 0x490f0000 0x001000>,	/* pmem */
 			 <0x490f1000 0x490f1000 0x001000>,	/* ap 32 */
 			 <0x490f2000 0x490f2000 0x001000>;	/* ap 33 */
 
@@ -482,14 +486,47 @@ target-module@f1000 {			/* 0x401f1000, ap 32 20.0 */
 			clock-names = "fck";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x0 0xf1000 0x1000>,
-				 <0x490f1000 0x490f1000 0x1000>;
 
-			/*
-			 * No child device binding or driver in mainline.
-			 * See Android tree and related upstreaming efforts
-			 * for the old driver.
-			 */
+			/* CHECKME: OMAP4 and OMAP5 may differ in memory sizes, here we define more than available... */
+			ranges = <0 0xf1000 0x1000>, /* MPU private access */
+				 <0x80000 0x80000 0x10000>, /* DMEM 64KiB - MPU */
+				 <0xa0000 0xa0000 0x10000>, /* CMEM 6KiB - MPU */
+				 <0xc0000 0xc0000 0x10000>, /* SMEM 64KiB - MPU */
+				 <0xe0000 0xe0000 0x10000>, /* PMEM 8KiB - MPU */
+				 <0x490f1000 0x490f1000 0x10000>, /* L3 Interconnect */
+				 <0x49080000 0x49080000 0x10000>, /* DMEM 64KiB - L3 */
+				 <0x490a0000 0x490a0000 0x10000>, /* CMEM 6KiB - L3 */
+				 <0x490ce000 0x490c0000 0x10000>, /* SMEM 64KiB - L3 */
+				 <0x490e0000 0x490e0000 0x10000>; /* PMEM 8KiB - L3 */
+
+			aess: aess {
+				compatible = "ti,omap4-aess";
+				status = "disabled";
+				reg = <0 0xfff>, /* MPU private access */
+				      <0x80000 0xffff>, /* DMEM - MPU */
+				      <0xa0000 0xffff>, /* CMEM - MPU */
+				      <0xc0000 0xffff>, /* SMEM - MPU */
+				      <0xe0000 0xffff>, /* PMEM - MPU */
+				      <0x490f1000 0xfff>, /* L3 Interconnect */
+				      <0x49080000 0xffff>, /* DMEM - L3 */
+				      <0x490a0000 0xffff>, /* CMEM - L3 */
+				      <0x490ce000 0xffff>, /* SMEM - L3 */
+				      <0x490e0000 0xffff>; /* PMEM - L3 */
+				reg-names = "mpu", "dmem", "cmem", "smem", "pmem",
+				      "dma", "dmem_dma", "cmem_dma", "smem_dma",
+				      "pmem_dma";
+				interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+				dmas = <&sdma 101>,
+				      <&sdma 102>,
+				      <&sdma 103>,
+				      <&sdma 104>,
+				      <&sdma 105>,
+				      <&sdma 106>,
+				      <&sdma 107>,
+				      <&sdma 108>;
+				dma-names = "fifo0", "fifo1", "fifo2", "fifo3", "fifo4",
+				      "fifo5", "fifo6", "fifo7";
+			};
 		};
 	};
 };
-- 
2.42.0

