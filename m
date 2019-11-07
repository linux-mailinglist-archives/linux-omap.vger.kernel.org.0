Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2926BF2CF9
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2019 12:06:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388071AbfKGLGV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Nov 2019 06:06:21 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:30961 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388022AbfKGLGV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Nov 2019 06:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573124779;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=NjEWunQz10C58eQ0gQdyDLr+7iljKIOVsgB4xAjyIIk=;
        b=rFKGuEviAle7jCPFCN64E0GL7Unk7HBwCHJd6qC0e4KSmoVxC1XQDCOT9PoPWqHGiu
        Qt/JyCu8piuBfKY95H/aum5LKYaba3PuCvESmNGzdHaM65sEhx8BmkuHovhU9ywMPxUO
        13++Stu5ccmp3yho++r02KlMCWeLDvBfsD/A3zNk86y2jyVFS3DD7jCI60MfVRVMQlpu
        x9Sd9LVWTwx333GCjumEvW2Dzr2phCrQQZQq7wdTPKfX9SYz5a1mXUhXARlkVrhm6zuk
        IFR1Ppvp1GNHfkL7PglyP9Df1HslhS+/ZV2lUgd9MMBGbV6BulNVanBntyY0ijHELhWK
        IWIA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7B6Edgw
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 12:06:14 +0100 (CET)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v2 3/8] ARM: DTS: am3517: add sgx gpu child node
Date:   Thu,  7 Nov 2019 12:06:06 +0100
Message-Id: <68d38ec5a6e9bcfcc398994acdbe86e3e80865b3.1573124770.git.hns@goldelico.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <cover.1573124770.git.hns@goldelico.com>
References: <cover.1573124770.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

and add interrupt.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am3517.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index bf3002009b00..48d5a250fd40 100644
--- a/arch/arm/boot/dts/am3517.dtsi
+++ b/arch/arm/boot/dts/am3517.dtsi
@@ -97,7 +97,7 @@
 		 * revision register instead of the unreadable OCP revision
 		 * register.
 		 */
-		sgx_module: target-module@50000000 {
+		target-module@50000000 {
 			compatible = "ti,sysc-omap2", "ti,sysc";
 			reg = <0x50000014 0x4>;
 			reg-names = "rev";
@@ -107,10 +107,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x4000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: gpu@0 {
+				compatible = "ti,am3517-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x0 0x4000>;
+				interrupts = <21>;
+			};
 		};
 	};
 };
-- 
2.23.0

