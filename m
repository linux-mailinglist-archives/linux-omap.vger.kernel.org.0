Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACA2DDCEA1
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 20:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443078AbfJRSqp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 14:46:45 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:20449 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfJRSqp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 14:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571424401;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=cJdq0SDEvpnBl8IRrj/mGYOVcbLhacfbQeiycT5TI1k=;
        b=kcskptyAnIOxyfwLxL4Zodi/q7OSXFjsNAoLXodoZcfxDJuqtKshMl31MW/3ZqgoD4
        hwPZx528qr3xkTYg6ZJtn2bRFSqXBV5+a+ry3+Xc0+D2wpUez+l4Y/ix6XRyYSEajCpj
        3coyHbuP/VdeC2/B4naDM7AZ90bW9YZfamdJDFIdMe2glXhl/Yd3Fw6vyHh++Dbhrrpc
        7lm0B2xrxbfIvfwkyHWmDQERbDGIRJCNAAqbwnqkIl9xxQ0xvnuKNiNPgoqGPh6pNnBJ
        ++uVc5yIOTDy3hOSKg1PnFjhfnRJHuUNgg7c/QSaN+mVo2b7QWv24DxSnPicJHHyuygK
        54Iw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IIkWDLD
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Fri, 18 Oct 2019 20:46:32 +0200 (CEST)
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
Subject: [PATCH 2/7] ARM: DTS: am33xx: add sgx gpu child node
Date:   Fri, 18 Oct 2019 20:46:25 +0200
Message-Id: <fd15fe04514a26ba308df040ea92cb864ebdffcd.1571424390.git.hns@goldelico.com>
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

Tested on BeagleBone Black.

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am33xx.dtsi | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am33xx.dtsi b/arch/arm/boot/dts/am33xx.dtsi
index a9d848d50b20..e76a47991de3 100644
--- a/arch/arm/boot/dts/am33xx.dtsi
+++ b/arch/arm/boot/dts/am33xx.dtsi
@@ -480,10 +480,13 @@
 			#size-cells = <1>;
 			ranges = <0 0x56000000 0x1000000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: sgx@0 {
+				compatible = "img,sgx530-125", "img,sgx530", "ti,omap-am335x-sgx530-125";
+				reg = <0x00 0x1000000>;	/* 16 MB */
+				reg-names = "sgx";
+				interrupts = <37>;
+				timer = <&timer7>;
+			};
 		};
 	};
 };
-- 
2.19.1

