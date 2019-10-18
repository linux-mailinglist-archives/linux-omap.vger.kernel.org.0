Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E583ADCE98
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 20:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502868AbfJRSqv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 14:46:51 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:23862 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443142AbfJRSqu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 14:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571424407;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=WRu/4Luy3zB9n/uNoqHwWsEwvyXUJ69VeOCpFcp5KEM=;
        b=K+7S8iBjjER3qwxqHR+0gbxplAdmCYTj2lzl8nYyVcbWRFla68p5QpWpT/5nzYS13C
        vSaTVEXZBqavMEnh9op01w07P7n8Di8fRKPP7WY8MdgOrjkQGNUoze/z5s5dYCGLcn/4
        Yp6Fy6wAFaLpdj9KF3FbCUdJKYRfoWixY98T32ACfRJvIAArhIAooSTjrHmfzRRc9Pnx
        aLzLEn0qjWzJdnMAuNpNTSM5wB+CL/89lOP0dsXkZ2ybD6ewY8jK/m6Jk7UIb3OeF71J
        pJBBjHR81Ov7qhq/g12iL2z7EC82BWJ5yrIJMiCcvWcSGJspEsh2T8vGDuwJOxKD94S2
        NXlQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IIkXDLG
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 20:46:33 +0200 (CEST)
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com,
        "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH 5/7] ARM: DTS: omap36xx: add sgx gpu child node
Date:   Fri, 18 Oct 2019 20:46:28 +0200
Message-Id: <e0021cc2a92ff07c31dc663150965416ad143e0f.1571424390.git.hns@goldelico.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1571424390.git.hns@goldelico.com>
References: <cover.1571424390.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

and add timer and interrupt.

Tested on GTA04 and BeagleBoard XM.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/omap36xx.dtsi | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/omap36xx.dtsi b/arch/arm/boot/dts/omap36xx.dtsi
index 1e552f08f120..4d813cce8676 100644
--- a/arch/arm/boot/dts/omap36xx.dtsi
+++ b/arch/arm/boot/dts/omap36xx.dtsi
@@ -145,7 +145,7 @@
 		 * "ti,sysc-omap4" type register with just sidle and midle bits
 		 * available while omap34xx has "ti,sysc-omap2" type sysconfig.
 		 */
-		sgx_module: target-module@50000000 {
+		target-module@50000000 {
 			compatible = "ti,sysc-omap4", "ti,sysc";
 			reg = <0x5000fe00 0x4>,
 			      <0x5000fe10 0x4>;
@@ -162,10 +162,13 @@
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x2000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: sgx@0 {
+				compatible = "img,sgx530-125", "img,sgx530", "ti,omap-omap3-sgx530-125";
+				reg = <0x0 0x10000>;	/* 64kB */
+				reg-names = "sgx";
+				interrupts = <21>;
+				timer = <&timer11>;
+			};
 		};
 	};
 
-- 
2.19.1

