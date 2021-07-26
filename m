Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C506F3D5A20
	for <lists+linux-omap@lfdr.de>; Mon, 26 Jul 2021 15:15:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233194AbhGZMfG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Jul 2021 08:35:06 -0400
Received: from smtp-34.italiaonline.it ([213.209.10.34]:59588 "EHLO libero.it"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232813AbhGZMfG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 26 Jul 2021 08:35:06 -0400
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.45.45.231])
        by smtp-34.iol.local with ESMTPA
        id 80S8mb4Z4LCum80SCmrOeM; Mon, 26 Jul 2021 15:15:33 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1627305333; bh=NJ4HHuDW/MKBYj0ynRy/npByuCR2zLQDVCES1MiLQJs=;
        h=From;
        b=fXCNWx3mGRwBYvxwT9SXbLKdX14tf+X4y6oTunMx7gLrYRoTUKS8zYx79TT1MTwxH
         2xdcsuVH3Ii9qdcUJ85Rrgu9mPG8PmHr7cYvY8hgBGs5rFQ6y7rlfqJQm+FuTU6vlf
         ZdrXjTdTpXPkUsBFHLafh2B73hpdUTduOk8d5kQkhCfD95uyaScWABel5xLRFOma2G
         i0zQqv58bKb/iX5/whUYd4kWZQ9TOeIrtKT3ZG0vGqWHmNhHxhUIMtdCKz0dpJOv67
         bRZ5LgWHXQV8/zkwJ3VELBiGNFxLxpX87d/RBdLn9nRUUg3PKZX+QUUVcKGI4yeFlA
         SLg0bsDtZ4csQ==
X-CNFS-Analysis: v=2.4 cv=a8D1SWeF c=1 sm=1 tr=0 ts=60feb575 cx=a_exe
 a=TX8r+oJM0yLPAmPh5WrBoQ==:117 a=TX8r+oJM0yLPAmPh5WrBoQ==:17
 a=UNFpN4EEUbz4bbRXVrcA:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v2 1/2] ARM: dts: am437x-l4: fix typo in can@0 node
Date:   Mon, 26 Jul 2021 15:15:25 +0200
Message-Id: <20210726131526.17542-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfEyKZJA5qUgUKgSfM0JNvrUHX2LcZO29xC728zeFLp+fgWkMezQdsSZ0NzHmv6zj6Logr8HKkx5p2frjRD+/XtoA9FjwaWbHkMm8tnlnYQ3ON4L1nS8x
 VMWez0OxNMJIyn/VRknC5GpQLVa9kDspJ3XzJlOggRwDmiW+s1gAKIdfzwxv9/la8oerZv8PKJYdwOl0ZBthlTN4zjkD/h9Vhn9J9qiP+J603z2I4bXMoAUH
 wKlkN0APeiARfvTud8vQxYJmjEtBwfDMYYSeI6RYnOzQ9qtWhUnHw+znb1rvDpBA+eZIE/YVND9Q5ZTYqcOL+8WcJMtn7LCbpQ4fTtdwkW9DRIGdvsj75KGE
 3ZBw/4LyZhI9muv+ERFN4cw93RN4tcD3UwI0wnE6g5t4Ix7liLrkeDy8C84yZqFjN0G2b08DKwJuMEm2HZsZk3DesR+sig==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace clock-name with clock-names.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

(no changes since v1)

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

