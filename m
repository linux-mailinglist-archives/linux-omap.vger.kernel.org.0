Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA6D29902
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 15:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403778AbfEXNfW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 09:35:22 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55744 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391549AbfEXNfW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 09:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1558704004; x=1561296004;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zTue6fDgJesKsY8LkGGVfgOtIsQ8SjFxkDyJKT2pZ/U=;
        b=uGrKDJ9OPxKD1t15JG5I7fIzMogZ77w3LfaU1hhxxvJdAfD1t+TrMJOq9Y92fbGq
        fBwSMeUvOLKhsVQFBddUrpRgGAvoN3CHIctHNYDfmpv/dlRAW/8txKDT7zfWeAwn
        8zFqPDnp0WfMLQ0GBN5mTSw6P/m/tLQOAs3EAiricgM=;
X-AuditID: c39127d2-6d5ff70000000df6-ba-5ce7ef84c2fd
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 8A.81.03574.48FE7EC5; Fri, 24 May 2019 15:20:04 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.21.122])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2019052415200372-20933 ;
          Fri, 24 May 2019 15:20:03 +0200 
From:   Teresa Remmet <t.remmet@phytec.de>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 1/7] ARM: dts: am335x phytec boards: Fix cd-gpios active level
Date:   Fri, 24 May 2019 15:19:57 +0200
Message-Id: <1558704003-393769-2-git-send-email-t.remmet@phytec.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
References: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:03,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:03,
        Serialize complete at 24.05.2019 15:20:03
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrILMWRmVeSWpSXmKPExsWyRoCBS7fl/fMYgyeH+S3uzP/LajH/yDlW
        i02Pr7FazF7Sz2Kx9PpFJovWvUfYLfZf8XJg91gzbw2jx7evk1g83t9oZffYtKqTzWPzknqP
        z5vkAtiiuGxSUnMyy1KL9O0SuDJ6H/9lKZjFWdG2axJbA+Md9i5GTg4JAROJ782PWboYuTiE
        BHYwSqyc+poZwrnAKHF//yNmkCo2AQ2JpytOM3UxcnCICCRI3HopBFLDLHCGUeJu/zI2kBph
        AT+JK38eM4LYLAKqEov+r2MCsXkFnCUWNrUyQ2yTk7h5rhPM5hRwkfh9+BkriC0EVPN0/VFW
        kKESAo1MEtufn4JqEJI4vfgs8wRGvgWMDKsYhXIzk7NTizKz9QoyKktSk/VSUjcxAgPu8ET1
        SzsY++Z4HGIU4GBU4uFNuPw8Rog1say4MvcQowQHs5IIb+z+ZzFCvCmJlVWpRfnxRaU5qcWH
        GKU5WJTEeTfwloQJCaQnlqRmp6YWpBbBZJk4OKUaGP1WMdZPKm/ZPatEV9G9vGmhcvtx3Q2K
        RodEOJfJO54uTYu6a/1w2nzm3y4njdYUeQRtsb4Y9fRLXe6bkw4PXLZXWk9fyXZ/W+VBqdJ1
        MYn/cz63NUj5vD+621nD49IF5rjKK8/WNIruvtjPpOsvrnz+Q2/Jplvd7ceCNq/W/nSjqsj6
        w7KSiUosxRmJhlrMRcWJANOOLVg0AgAA
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Active level of the mmc1 cd gpio needs to be low instead of high.
Fix PCM-953 and phyBOARD-WEGA.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm/boot/dts/am335x-pcm-953.dtsi | 2 +-
 arch/arm/boot/dts/am335x-wega.dtsi    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
index baceaa7bb33b..20a3d9827692 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -197,7 +197,7 @@
 	bus-width = <4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
-	cd-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/am335x-wega.dtsi b/arch/arm/boot/dts/am335x-wega.dtsi
index b7d28a20341f..84581fed3d06 100644
--- a/arch/arm/boot/dts/am335x-wega.dtsi
+++ b/arch/arm/boot/dts/am335x-wega.dtsi
@@ -157,7 +157,7 @@
 	bus-width = <4>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc1_pins>;
-	cd-gpios = <&gpio0 6 GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&gpio0 6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-- 
2.7.4

