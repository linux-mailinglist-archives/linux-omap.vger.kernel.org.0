Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A800829906
	for <lists+linux-omap@lfdr.de>; Fri, 24 May 2019 15:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403800AbfEXNfX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 May 2019 09:35:23 -0400
Received: from mickerik.phytec.de ([195.145.39.210]:55744 "EHLO
        mickerik.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403772AbfEXNfW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 May 2019 09:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a1; c=relaxed/simple;
        q=dns/txt; i=@phytec.de; t=1558704005; x=1561296005;
        h=From:Sender:Reply-To:Subject:Date:Message-Id:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=NYdOw3xLCcJk9B4HDUN0mOmZh9/CEB4GcXXSIRBzQrg=;
        b=tzEzrm9I1zFijt2/5HBQjaeTgMuXFxomAsY6y3pgfVEycq0AjnSTu4Vxn61Fi5Tc
        eDFhNrsCq3wX58Rk8rc7AtwLpwycrIh4IDrHbbFlPQs+VlVHD156grhCGydORvcI
        6h7HFjlingF7S+tnIl/iOOLmw8+hFG7eu3UgrcxANtE=;
X-AuditID: c39127d2-6d5ff70000000df6-c1-5ce7ef859429
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
        by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 2D.81.03574.58FE7EC5; Fri, 24 May 2019 15:20:05 +0200 (CEST)
Received: from augenblix2.phytec.de ([172.16.21.122])
          by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
          with ESMTP id 2019052415200491-20938 ;
          Fri, 24 May 2019 15:20:04 +0200 
From:   Teresa Remmet <t.remmet@phytec.de>
To:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Schultz <d.schultz@phytec.de>
Subject: [PATCH 6/7] ARM: dts: am335x-pcm-953: Remove eth phy delay
Date:   Fri, 24 May 2019 15:20:02 +0200
Message-Id: <1558704003-393769-7-git-send-email-t.remmet@phytec.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
References: <1558704003-393769-1-git-send-email-t.remmet@phytec.de>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:05,
        Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17, 2016) at
 24.05.2019 15:20:05
X-TNEFEvaluated: 1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOLMWRmVeSWpSXmKPExsWyRoCBS7f1/fMYg59r5C3uzP/LajH/yDlW
        i02Pr7FazF7Sz2Kx9PpFJovWvUfYLfZf8XJg91gzbw2jx7evk1g83t9oZffYtKqTzWPzknqP
        z5vkAtiiuGxSUnMyy1KL9O0SuDLm/z7HVrCXs2Lj7B7WBsYb7F2MnBwSAiYS23Z/Zuxi5OIQ
        EtjBKLH+fw87hHOBUeLprOcsIFVsAhoST1ecZupi5OAQEUiQuPVSCKSGWeAMo8Td/mVsIDXC
        As4SbdfegNksAqoSL09eBtvACxRvP38BapucxM1zncwgNqeAi8Tvw89YQWwhoJqn64+yQtQL
        Spyc+YQFZIGEwBVGif/X/zJCNAtJnF58lhnkCGYBdYn184RAwswC2hLLFr5mnsAoOAtJ+yyE
        qllIqhYwMq9iFMrNTM5OLcrM1ivIqCxJTdZLSd3ECAz+wxPVL+1g7JvjcYhRgINRiYc34fLz
        GCHWxLLiytxDjBIczEoivLH7n8UI8aYkVlalFuXHF5XmpBYfYpTmYFES593AWxImJJCeWJKa
        nZpakFoEk2Xi4JRqYDScHZWoXLPSq//ijd5XPdIfGLZcVDkkfeztTemmvyrHGlbXrZ36rcM8
        /OGJQvt1YTy1uvvn2jHnbmPRWSxrxv9J0EjQyrzg4RkJ0RWqDcINu5+tlTTs4Npw+f1FX+61
        AfI75J/x5/t/sJm59Pj5/ZL9rku+Tv/VqsR8542B7UIGnwOhj5jn1CuxFGckGmoxFxUnAgDg
        VvFIegIAAA==
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Default values fit better than these historical settings.
Hardware layout had been adapted accordingly already in
alpha stage. They did not cause problems for a long time.
Removed values now.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
 arch/arm/boot/dts/am335x-pcm-953.dtsi | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/am335x-pcm-953.dtsi b/arch/arm/boot/dts/am33=
5x-pcm-953.dtsi
index 70fb4a15cad9..dd78db76c877 100644
--- a/arch/arm/boot/dts/am335x-pcm-953.dtsi
+++ b/arch/arm/boot/dts/am335x-pcm-953.dtsi
@@ -136,22 +136,6 @@
 &davinci=5Fmdio {
 	phy1: ethernet-phy@2 {
 		reg =3D <2>;
-
-		/* Register 260 (104h) =E2=80=93 RGMII Clock and Control Pad Skew */
-		rxc-skew-ps =3D <1400>;
-		rxdv-skew-ps =3D <0>;
-		txc-skew-ps =3D <1400>;
-		txen-skew-ps =3D <0>;
-		/* Register 261 (105h) =E2=80=93 RGMII RX Data Pad Skew */
-		rxd3-skew-ps =3D <0>;
-		rxd2-skew-ps =3D <0>;
-		rxd1-skew-ps =3D <0>;
-		rxd0-skew-ps =3D <0>;
-		/* Register 262 (106h) =E2=80=93 RGMII TX Data Pad Skew */
-		txd3-skew-ps =3D <0>;
-		txd2-skew-ps =3D <0>;
-		txd1-skew-ps =3D <0>;
-		txd0-skew-ps =3D <0>;
 	};
 };
=20
--=20
2.7.4

