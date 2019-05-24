Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE89229903
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 15:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403801AbfEXNfX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 09:35:23 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55740 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403768AbfEXNfW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 09:35:22 -0400
X-Greylist: delayed 915 seconds by postgrey-1.27 at vger.kernel.org; Fri, 24 May 2019 09:35:20 EDT
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1558704005; x=1561296005;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0AvxtVk/ZzZnCeIX1qspRxwNNu7VhFGWSGUeAzIxEL4=;
        b=Co1iYzZm0TpxV1KJAuCFqtEmEgVi7xxms+RI96yeEZBfWrDYOf2kClRtZ1CpdCyI
        lq9rNrTIYVU9+gM2N2KzTM+tQ4FxS9iQciVHNq2b+vgE0+9GtIhTu30YRlq1+geu
        6aMCgYp+LAYKljEUfWGiBqX2Dn4wfC+Vj/ObZ+om64I=;
X-AuditID: c39127d2-6bdff70000000df6-c0-5ce7ef85f812
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id AC.81.03574.58FE7EC5; Fri, 24 May 2019 15:20:05 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.21.122])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2019052415200466-20937 ;
          Fri, 24 May 2019 15:20:04 +0200 
From:   Teresa Remmet <t.remmet@phytec.de>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 5/7] ARM: dts: am335x-pcm-953: Update user led names
Date:   Fri, 24 May 2019 15:20:01 +0200
Message-Id: <1558704003-393769-6-git-send-email-t.remmet@phytec.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
References: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:04,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:05,
        Serialize complete at 24.05.2019 15:20:05
X-TNEFEvaluated: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPLMWRmVeSWpSXmKPExsWyRoCBS7f1/fMYg8VLBC3uzP/LajH/yDlW
        i02Pr7FazF7Sz2Kx9PpFJovWvUfYLfZf8XJg91gzbw2jx7evk1g83t9oZffYtKqTzWPzknqP
        z5vkAtiiuGxSUnMyy1KL9O0SuDLWrn3CWPCTreLB/cNsDYwnWLsYOTkkBEwkFk7uYe5i5OIQ
        EtjBKPH53gV2kISQwAVGiRNt1iA2m4CGxNMVp5m6GDk4RAQSJG69FAKpZxY4wyhxt38ZG0iN
        sICLxOML25lBbBYBVYltd/aB2bwCzhL/br9nhFgmJ3HzXCdYnBOo/vfhZ6wQu5wlnq4/CnVQ
        I5PE+o08ELaQxOnFZ5knMPItYGRYxSiUm5mcnVqUma1XkFFZkpqsl5K6iREYbIcnql/awdg3
        x+MQowAHoxIPb8Ll5zFCrIllxZW5hxglOJiVRHhj9z+LEeJNSaysSi3Kjy8qzUktPsQozcGi
        JM67gbckTEggPbEkNTs1tSC1CCbLxMEp1cC48bx8p2KC4PZP97R9VaSjl7z+VaOvWX611+JI
        6vQizQYDG1XJ6yKl15mq6+eFFzHuzSuQCJuQINf1lz3083n1cD/eEF+FyZpFW+LmczBuWpH8
        5bSh6VYbDtbk14ptyaEV0ia9bLf6gxbNOSw5L/IV95/mpPJPE4+ul/gjUf/dvf1HVJVDoBJL
        cUaioRZzUXEiANii4XcyAgAA
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Rename user led nodes to match the phytec user leds name scheme.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm/boot/dts/am335x-pcm-953.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am335x-pcm-953.dtsi
index 20a3d9827692..70fb4a15cad9 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -39,15 +39,13 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&user_leds_pins>;
 
-		green {
-			label = "green:user";
+		user-led0 {
 			gpios = <&gpio1 30 GPIO_ACTIVE_HIGH>;
 			linux,default-trigger = "gpio";
 			default-state = "on";
 		};
 
-		yellow {
-			label = "yellow:user";
+		user-led1 {
 			gpios = <&gpio1 31 GPIO_ACTIVE_LOW>;
 			linux,default-trigger = "gpio";
 			default-state = "on";
-- 
2.7.4

