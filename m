Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC624DCEA2
	for <lists+linux-omap@lfdr.de>; Fri, 18 Oct 2019 20:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443075AbfJRSqp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Oct 2019 14:46:45 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:14766 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2443052AbfJRSqp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Oct 2019 14:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571424401;
        s=strato-dkim-0002; d=goldelico.com;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=gtyubCOUKX62yjckzgCBhxqFuJTOFG0uFwZSKZS4Ls4=;
        b=AlSV/ueSAeFhxd2yRcigy8e5fxB1LCBewDPc70MMMAF7StMPRYZMA1PK7GbHYCPXE+
        jOj6EI3fb7Om/r/AuVzcS3GEwl2o2vk8F5g+9DXPV1GeG2wZvnh+JcLRZ+EcH2B5ywej
        uWYpzdayYbAFiDDJf3rNjvXglg1rUxYB9bnEfWXKAcPnsa/UOqdrIPvw4UfPeKMg/aMB
        V8wQxiMdzGoIG3NQb+OsSUwWDdbCmJm15V/ByicmCiuezS9JbY9rXQGBdYbUR+JQ4pe7
        f4ksH9fp5Eb7XtRj87Uxcf5KFl0qT0cQRYDtEHJU56rwsIjALjfB9oMRJd7G6PgCkv8B
        H6rw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o1mfYzBGHXH6F3CFF60="
X-RZG-CLASS-ID: mo00
Received: from iMac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9IIkXDLE
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
Subject: [PATCH 3/7] ARM: DTS: am3517: add sgx gpu child node
Date:   Fri, 18 Oct 2019 20:46:26 +0200
Message-Id: <8102dc33bcf21d653539cb43fb41ce600c1f9e74.1571424390.git.hns@goldelico.com>
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

Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
---
 arch/arm/boot/dts/am3517.dtsi | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/am3517.dtsi b/arch/arm/boot/dts/am3517.dtsi
index bf3002009b00..5716bb33d7fe 100644
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
@@ -107,10 +107,13 @@
 			#size-cells = <1>;
 			ranges = <0 0x50000000 0x4000>;
 
-			/*
-			 * Closed source PowerVR driver, no child device
-			 * binding or driver in mainline
-			 */
+			sgx: sgx@0 {
+				compatible = "img,sgx530-125", "img,sgx530", "ti,omap-am3517-sgx530-125";
+				reg = <0x0 0x4000>;
+				reg-names = "sgx";
+				interrupts = <21>;
+				timer = <&timer11>;
+			};
 		};
 	};
 };
-- 
2.19.1

