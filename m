Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9EB33A561
	for <lists+linux-omap@lfdr.de>; Sun, 14 Mar 2021 16:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233389AbhCNPVZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 14 Mar 2021 11:21:25 -0400
Received: from smtp-17-i2.italiaonline.it ([213.209.12.17]:53204 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229539AbhCNPUx (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 14 Mar 2021 11:20:53 -0400
X-Greylist: delayed 339 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Mar 2021 11:20:53 EDT
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id LSPzlDn2etpGHLSQ7lAQ8p; Sun, 14 Mar 2021 16:12:43 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1615734763; bh=+FWtNBr6F5ufPynCRXYCrnqtuCpk2dKlZtIc6FJngYI=;
        h=From;
        b=AyMixakPjkjBZeMA6WGIqlBsoVZPs4zRjLnJYkGVL4Y0KbXDVAQ9/A9xSqDzDof5/
         Ag2cWtKtfFJaUxPSPaL2yjJgxoAa8WikCXbFFlqo1ZIQroR/nzxyiUqJqSEjYDKEkL
         g3f6KK0BeOTTvuHDel86ONE6cqWwOavRfzan0XDBibVBYhDqRhS1MASYVr4itJsnBT
         84gIxaCTHkorkWFTpFF6qdPLG84k/3WGsG8mmKALw1PDtd3CsmHtxnPJWheg4VioHu
         2djCPPkV8lGM/moJip/4gIAkXtl1Jy+yhEznoQBVp168c2vlavvQPqnmdzNkbW2jVU
         bUdQt6aw/Okhg==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=604e27eb cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=jCmRPZ0w5czJu0AXxT0A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Sun, 14 Mar 2021 16:12:32 +0100
Message-Id: <20210314151233.23243-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210314151233.23243-1-dariobin@libero.it>
References: <20210314151233.23243-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfDCcah2L8AiZCR5ZNO4FJMg4iLk9zRZZUojTuqIoj2FZ6RtybJAp3t7FPpY9nlLSe0KSZhldj17oQtRdGxJ6QMFSxI68/CtX0wWkyugPmaxEmuyrSxCK
 3ycIPrgQBC4i/FV9M8O1q2i50lsk9tbh4Q4JVn+tWGzn7JnqEqiC3odweimA9BzDAhSDzLFOis0b7dgOaUkBspI37obPqPhoZOLg1ir7ZjLLVBoGtrPnaHZb
 FYPEvBbLAWNY93lKArMDLK9vwzfZAv2OfXcs8tX1WShk2atDqIip5N+bB+VAKmJOnihW5ZTIGuJK7oeUhulIzD7ph0O4tQLaLMnDIH3LI5w0Lzp1Y9lHt2om
 LYCQLe83apLIIXcos2keulSCyfbuihrsAwaOmLxMg4ZApqn3oscfFE5xspCu/kOf6Xzw49GXwCAqbmxrY9d6vL2PAX/qEA==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Registers for adjusting the spread spectrum clocking (SSC) have been
added. As reported by the TI spruh73x RM, SSC is supported only for
LCD and MPU PLLs.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

 arch/arm/boot/dts/am33xx-clocks.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
index dced92a8970e..e7bbbf536a8c 100644
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -164,7 +164,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-core-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0490>, <0x045c>, <0x0468>;
+		reg = <0x0490>, <0x045c>, <0x0468>, <0x0460>, <0x0464>;
 	};
 
 	dpll_core_x2_ck: dpll_core_x2_ck {
@@ -244,7 +244,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-no-gate-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0498>, <0x0448>, <0x0454>;
+		reg = <0x0498>, <0x0448>, <0x0454>, <0x044c>, <0x0450>;
 	};
 
 	dpll_disp_m2_ck: dpll_disp_m2_ck@4a4 {
-- 
2.17.1

