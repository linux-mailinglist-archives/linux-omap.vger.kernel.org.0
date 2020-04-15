Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDE71A96DD
	for <lists+linux-omap@lfdr.de>; Wed, 15 Apr 2020 10:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894700AbgDOIic (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Apr 2020 04:38:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2894688AbgDOIiZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Apr 2020 04:38:25 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8E8AC061A10;
        Wed, 15 Apr 2020 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586939903;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Yq6hgnjHR7Rm0pXOfRm3OsZIBIP2cqxLTjaSlwPQ/iI=;
        b=HzxhlhrYs2+oO70LKVC7HcjHOvqJBXVGu1KWV7Tk3zgyIMEwHM4QctnmfskmPYcf9B
        smdSPEQBrprYm4FMvT/xm+j9KeZiA8UexRHbwQ1ckSP4xkv70XkDNZIsEy/V4cVwKvRB
        D7ImMiHJutWZrO3dmOoTTpeLwwzDqUJl0QJ4IoZgezd+3cl9TUeS7gmIZlaxEatHUIYs
        fRtEZM9zPE56J1lP71aSs2gekQRlNbDlp0rShTjDE3fVuZnx+Mdn9VsV28qZ7EKPRG7K
        EAeXzVB/qPqSSQ6jsAd+DVMJ+cqWzQ42CQDgJ7ggbIFaPyJ5nIKaHlrIdUGbDXRJwSvk
        9HBA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3F8ZO0In
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:35:24 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        James Hogan <jhogan@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Philipp Rossak <embed3d@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        openpvrsgx-devgroup@letux.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        "Andrew F . Davis" <afd@ti.com>
Subject: [PATCH v6 04/12] ARM: DTS: omap34xx: add sgx gpu child node
Date:   Wed, 15 Apr 2020 10:35:11 +0200
Message-Id: <170b0ee4c97f68852b8fc15c92d53e86b566c8a5.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

and add interrupt.

According to omap3530 TRM the SGX register block is 64kB.
See: 13.4  SGX Register Mapping, Table 13-2

Reported-by: Andrew F. Davis <afd@ti.com>	# register size
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # OpenPandora 600 MHz.
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap34xx.dtsi | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap34xx.dtsi b/arch/arm/boot/dts/omap34xx.dtsi
index c4dd9801840d..51c60ee2b68d 100644
--- a/arch/arm/boot/dts/omap34xx.dtsi
+++ b/arch/arm/boot/dts/omap34xx.dtsi
@@ -167,12 +167,13 @@ sgx_module: target-module@50000000 {
 			clock-names = "fck", "ick";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0 0x50000000 0x4000>;
+			ranges = <0 0x50000000 0x10000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			gpu: gpu@0 {
+				compatible = "ti,omap3-sgx530-121", "img,sgx530-121", "img,sgx530";
+				reg = <0x0 0x10000>;	/* 64kB */
+				interrupts = <21>;
+			};
 		};
 	};
 
-- 
2.25.1

