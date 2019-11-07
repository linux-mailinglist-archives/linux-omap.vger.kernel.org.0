Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81B6EF2D12
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2019 12:07:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388133AbfKGLGV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Nov 2019 06:06:21 -0500
Received: from mo4-p04-ob.smtp.rzone.de ([85.215.255.121]:29508 "EHLO
        mo4-p04-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727707AbfKGLGV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 7 Nov 2019 06:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1573124779;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=24fF1xUH22DnXnm6wMQiB8qNar/ohuK/dXnbgHGAvcQ=;
        b=MOfDJW94TnCRRCTHR1FoTvwICt2ptXsgf2KJonk1VEg8x8F01fF5X9xD9Jqmc9fiZn
        gwirBATlQZCKk6+L31qT7i2WR60xSc9dxWTf2wEcaz4qmLXCb0WUJ1hhdesTIy/I+bma
        mxMqNzXNsU2A9IbBoc3iQ98hgGEI5vCfl0ubSBef7U8dKyhjQAl3tNRH/r7/sK/rf3Du
        mtyhqS7zLPQKQENlR2r8yF4f9xDb6JbFQoHsNU4zkgA+5+dERWvLvOcMgFdraQic/o9G
        XmT7CJGePS8IoMv9WDqbJBKkzjeawGeHxOVR6fvoQqhmVPbC7vEMyXHAjQlFDsIWIxHj
        g9kQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7PR5/L9P0"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.29.0 DYNA|AUTH)
        with ESMTPSA id L09db3vA7B6Ddgt
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 7 Nov 2019 12:06:13 +0100 (CET)
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
Subject: [PATCH v2 2/8] ARM: DTS: am33xx: add sgx gpu child node
Date:   Thu,  7 Nov 2019 12:06:05 +0100
Message-Id: <fbe9f4a20fd55d111afe8f09d03c154a82cf5ba5.1573124770.git.hns@goldelico.com>
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

Tested on BeagleBone Black.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index a9d848d50b20..dbfb9d5aa915 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -480,10 +480,11 @@
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x1000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: gpu@0 {
+				compatible = "ti,am335x-sgx530-125", "img,sgx530-125", "img,sgx530";
+				reg = <0x00 0x1000000>;	/* 16 MB */
+				interrupts = <37>;
+			};
 		};
 	};
 };
-- 
2.23.0

