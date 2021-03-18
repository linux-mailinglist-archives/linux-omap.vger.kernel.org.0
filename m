Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA084340BD0
	for <lists+linux-omap@lfdr.de>; Thu, 18 Mar 2021 18:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhCRR1k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 18 Mar 2021 13:27:40 -0400
Received: from smtp-17.italiaonline.it ([213.209.10.17]:37616 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232211AbhCRR1Z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 18 Mar 2021 13:27:25 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([87.20.116.197])
        by smtp-17.iol.local with ESMTPA
        id MwPulsZ9jtpGHMwQVlfgk8; Thu, 18 Mar 2021 18:27:23 +0100
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1616088443; bh=/JtNHFPQxpgEPu+dfDXNV+uLNsHLjDP8LHhRbZyB9o4=;
        h=From;
        b=CsoACI+N+Gku2yN3GvfBFJs95U2AWHIa9QEbTKQO8dBBHYLqH1EwHDOaGk4GvtjtJ
         Ma6CjEo5UJCKs9pLaMY4Ztji9to359sjUaecT2FLKIjRbD3WgiG294byZLd/nbwiKj
         fbkVf7zOpMIhA/NwfNuEcOcWkrrJySakwFowC15cXu6L5TLpk94aLbxXkjezz2S2h0
         aLpq906svWn1rAQimf3v3On3y+CR1Qx3yzBxsLwB5FhbFN/4lMkJfJHfwXB70xzK6o
         7CqRFLwFdv9Oq68LEmyQn9r96j9sXAJ9WTk4KiMT2c1z7PcHp8DQyzvWo0e4eF0s0W
         Mz3GIrrSsEZiA==
X-CNFS-Analysis: v=2.4 cv=Q7IXX66a c=1 sm=1 tr=0 ts=60538d7b cx=a_exe
 a=AVqmXbCQpuNSdJmApS5GbQ==:117 a=AVqmXbCQpuNSdJmApS5GbQ==:17
 a=jCmRPZ0w5czJu0AXxT0A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: dts: am33xx-clocks: add spread spectrum support
Date:   Thu, 18 Mar 2021 18:26:25 +0100
Message-Id: <20210318172627.12173-4-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210318172627.12173-1-dariobin@libero.it>
References: <20210318172627.12173-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfBCdEK8Y1/Vj+00whOzUoDwgiPoQiUtddJqsSj7ZsR1rfYkxgsJExNkbTWWxBnCa9tMBCOxCEMEjy/kBHPk+A2A0cczfFSUnmn/hKjgoIb4y4HybvQdR
 ua4UluzdhLJF1bn9FwwK7GwyNQiqJ2blkLP+lEu9o6A8OOOX3pYK3+k5AUrxNr7JzymM/mwDmZaWOMX2FQp0L9V6pP32ofifCyGeN9l6pgWl5w/SBOh+Qccv
 FFg8Qj8LuvCxYvG26rdz9ge266YvX/2Lh0+GClb0OfubBG63Q9rY8VZI+3FVU90tprCbd1UFWGUK/zySU3FEioOyHkzAwKocRy3yDE84B79RYYnE3Y2hmHcq
 GnZJetdlVhX6y6jAf/jGslzF8JvCJ1ov6OQ3fdTO36qj6f0Db4lMQLBlgbzn1DyoNv/EURgVoM+vkMvxH8ILkTNJNVJVf3Sbb81i1s56IY19N5xpOwLB12o+
 Bth48vJHQbC9lR3+
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Registers for adjusting the spread spectrum clocking (SSC) have been
added. As reported by the TI spruh73x RM, SSC is supported only for
LCD and MPU PLLs.

Signed-off-by: Dario Binacchi <dariobin@libero.it>

---

Changes in v2:
- Remove SSC registers from dpll_core_ck@490 node (SSC is not supported)
- Add SSC registers to dpll_mpu_ck@488 node.

 arch/arm/boot/dts/am33xx-clocks.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx-clocks.dtsi b/arch/arm/boot/dts/am33xx-clocks.dtsi
index dced92a8970e..a02e0b1229a4 100644
--- a/arch/arm/boot/dts/am33xx-clocks.dtsi
+++ b/arch/arm/boot/dts/am33xx-clocks.dtsi
@@ -204,7 +204,7 @@
 		#clock-cells = <0>;
 		compatible = "ti,am3-dpll-clock";
 		clocks = <&sys_clkin_ck>, <&sys_clkin_ck>;
-		reg = <0x0488>, <0x0420>, <0x042c>;
+		reg = <0x0488>, <0x0420>, <0x042c>, <0x0424>, <0x0428>;
 	};
 
 	dpll_mpu_m2_ck: dpll_mpu_m2_ck@4a8 {
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

