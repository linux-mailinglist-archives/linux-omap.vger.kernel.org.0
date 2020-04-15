Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06F61A9750
	for <lists+linux-omap@lfdr.de>; Wed, 15 Apr 2020 10:48:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895031AbgDOIr1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Apr 2020 04:47:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2895009AbgDOIrX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Apr 2020 04:47:23 -0400
Received: from mo6-p04-ob.smtp.rzone.de (mo6-p04-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5304::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E0B2C061A0C;
        Wed, 15 Apr 2020 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1586940441;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=iwq6f4uxoyZcQOQDzwMpNIO6Xy6nAFRtGvlqeQKWcIs=;
        b=lx5AZHoSkbByJ5HkXzowf0ozO8w6saKKVeioMMysFFtV8aamIb8xjnhg34SA5tQeMw
        7k1QywTj5rZdAxkPYmoSOVH07cfQEvoHiH7bCYowRM1MTcpZVOp1C4++9P4lX71VouM+
        kQZLpXQaQaCSV7ot2T9Zz5hOp2ZE78HdNU5xu8wr3i/i5utrm+6v/W3CFeGNCz9MqhG5
        bQ1mlUvak/ncPu4FDMql1x4Hxxjgd0RdZxqUONKcOtfaqM4jcORZDQdHQx8809+CPFA8
        w2p6p6aNLeQtsOf+9M1y2sSq2LcCvfl/GTPizazRNb4fEHyUgCmL5ar6hCGWmmwARcGG
        TGUw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1OAA2UNf2M7O2CKN9ej"
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 46.4.0 DYNA|AUTH)
        with ESMTPSA id 6028a2w3F8ZS0Iw
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 15 Apr 2020 10:35:28 +0200 (CEST)
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
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH v6 10/12] ARM: dts: sun6i: a31s: add sgx gpu child node
Date:   Wed, 15 Apr 2020 10:35:17 +0200
Message-Id: <fed0dc035c2e7cfe068588d7b5232924d2960ab1.1586939718.git.hns@goldelico.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1586939718.git.hns@goldelico.com>
References: <cover.1586939718.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Philipp Rossak <embed3d@gmail.com>

We are adding the devicetree binding for the PVR-SGX-544-115 gpu.

This driver is currently under development in the openpvrsgx-devgroup.
Right now the full binding is not figured out, so we provide here a
placeholder. It will be completed as soon as there is a demo available.

The currently used binding that is used during development is more
complete and was already verifyed by loading the kernelmodule successful.

Signed-off-by: Philipp Rossak <embed3d@gmail.com>
Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/sun6i-a31s.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/sun6i-a31s.dtsi b/arch/arm/boot/dts/sun6i-a31s.dtsi
index 97e2c51d0aea..669770d2934a 100644
--- a/arch/arm/boot/dts/sun6i-a31s.dtsi
+++ b/arch/arm/boot/dts/sun6i-a31s.dtsi
@@ -59,3 +59,13 @@ &pio {
 &tcon0 {
 	compatible = "allwinner,sun6i-a31s-tcon";
 };
+
+&gpu {
+	compatible = "allwinner,sun8i-a31s-sgx544-115",
+		     "img,sgx544-115", "img,sgx544";
+	/*
+	 * This node is currently a placeholder for the gpu.
+	 * This will be completed when a full demonstration
+	 * of the openpvrsgx driver is available for this board.
+	 */
+};
-- 
2.25.1

