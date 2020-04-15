Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62B3B1A9761
	for <lists+linux-omap@lfdr.de>; Wed, 15 Apr 2020 10:48:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895000AbgDOIrs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Apr 2020 04:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895029AbgDOIr1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Apr 2020 04:47:27 -0400
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5304::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABDBEC061A0F;
        Wed, 15 Apr 2020 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586940444;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=dI0VDCpAYn4kjTlYFF4mkRzHkNsrf7BBn1IDt/EnVco=;
        b=fhxyR8NQ+rV6nK7QGZ2A5DG3a5IK36BhwQkVkkraDgdVQkcWSGt/Utnx5WgKhFz1TX
        shHtx3wHwwBRepEThJv3CYGth8GudY19PX6fL0gizalw2I+NytfQNQNkuPHvLFdRbz0n
        JRePSQiz40OQcrd5+yTmraftOIwNMguPspr9Vld4WzNg6A5rlCA+OnvNS0wLXI/izUXL
        etysD3fXlDvsMiXUB3ys2cKRsV2RxWoHF5Bu4IzK/koTLBQ8iKEAu900006hkAchPhVv
        icFG3qLUwvyGGv51IBuAKt7kwatPAxFrHUhQ0PMZ1ObzEOMVABEQUSbzfiE+a5aZBn57
        3uUA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3F8ZR0Iu
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:35:27 +0200 (CEST)
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
        Jonathan Bakker <xc-racer2@live.ca>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v6 08/12] arm: dts: s5pv210: Add G3D node
Date:   Wed, 15 Apr 2020 10:35:15 +0200
Message-Id: <b6733f80546bf3e6b3799f716b9c8e0f407de03d.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Jonathan Bakker <xc-racer2@live.ca>

to add support for SGX540 GPU.

Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/s5pv210.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/s5pv210.dtsi b/arch/arm/boot/dts/s5pv210.dtsi
index 2ad642f51fd9..e7fc709c0cca 100644
--- a/arch/arm/boot/dts/s5pv210.dtsi
+++ b/arch/arm/boot/dts/s5pv210.dtsi
@@ -512,6 +512,21 @@ vic3: interrupt-controller@f2300000 {
 			#interrupt-cells = <1>;
 		};
 
+		g3d: g3d@f3000000 {
+			compatible = "samsung,s5pv210-sgx540-120";
+			reg = <0xf3000000 0x10000>;
+			interrupt-parent = <&vic2>;
+			interrupts = <10>;
+			clock-names = "sclk";
+			clocks = <&clocks CLK_G3D>;
+
+			power-domains = <&pd S5PV210_PD_G3D>;
+
+			assigned-clocks = <&clocks MOUT_G3D>, <&clocks DOUT_G3D>;
+			assigned-clock-rates = <0>, <66700000>;
+			assigned-clock-parents = <&clocks MOUT_MPLL>;
+		};
+
 		fimd: fimd@f8000000 {
 			compatible = "samsung,s5pv210-fimd";
 			interrupt-parent = <&vic2>;
-- 
2.25.1

