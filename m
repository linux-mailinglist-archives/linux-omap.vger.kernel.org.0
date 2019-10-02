Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82AC4C8C1D
	for <lists+linux-omap@lfdr.de>; Wed,  2 Oct 2019 16:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbfJBOxs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 2 Oct 2019 10:53:48 -0400
Received: from mout.gmx.net ([212.227.17.21]:59119 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725747AbfJBOxs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 2 Oct 2019 10:53:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1570027987;
        bh=51Sd29DCKYAXaUWlFEJfRj+l41UwrIs1JX74yeC2ifg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=eGO/GTXU76rDgAICREMwEX/TkRpVYd9ymRixLzDswWuw4gRFI8ZOD8rPM4E2Nigsn
         fxG3euEh8tYs4TW1BffO6iCYWm9Nqbavtww0Pgxm1c4wx4Vef0kLWePKTXmyr/cuA2
         PFQfEqFfEGwXm8yd8n/PaLbw0JR5CLAPRxRGeWqI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([109.90.233.87]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bX1-1i7bDE2xKl-010c1P; Wed, 02
 Oct 2019 16:53:07 +0200
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-omap@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: OMAP1: ams-delta FIQ: Fix a typo ("Initiaize")
Date:   Wed,  2 Oct 2019 16:53:00 +0200
Message-Id: <20191002145301.11332-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JYPZWN/GxGfD2Zob7XwPzNdaW8wOJ3rz+ji1lyCuLCH7QKVtti/
 MGFmD0gLOjy0Ua1xo7IKccQWtn7TCgXY2iEK1pX5S6lXIbBDag25F8PDyk7Wn06DJj93Xtx
 wNy4qxraBwTRLKgOsrbiRPtJ4u4DDaRRHzMFHMra1Bmsx586a60tttRt4RvoW06ohx6+Mza
 N/VLYdNh74j4vhtbcFLCQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tdTVvgG66qQ=:u6AgU0YGduHL8Z3UaiQ622
 wv/wVVVHkW3Anw1I+FJjIz7gor+YRx+7cGkhBnoZtE+5Wu8rbOvyk6/+9kWfwxRHGb+jizTnB
 dZ3RDmXWUMyZkXkyHDvLb8466ouLnWTQi67bW+j1PaGWVD00m7ymgUp0037qED+YdOOtBY11a
 p2E8CD2iyt6UI4GFoXIUYVvRO51AUr9K1XmO7E4p+uBm+PJ9uTereJMqB8IE+px2q0QRPLC7K
 HAckLZEz5pEGGJv+FsMrfYoURQmbxt1kzn07e2UFeDWOdVSRddhppZDwOPbR78Aga/7nT9RCy
 NVx5hIjWYDfkWW14tPGsL42wqQ4XX/Rvw8nHzJoHgJP3ADqk5r7Su5TKvnRQuMjcg/UlS8RnY
 +YvheJ8xVc8+/L+vj1aMeoYzkrs2YlDdssT9IICB2mvKHzTB3dd9gXNXRwTlbB8Mi6F9SP53t
 xLviBkVD+SIt79wRcfAyXbyOWjULeTA/j4KRzmiSNQS9n9144SZmCy+tEU/NPXT9ejGhTGLwG
 hJRvIw9NnLp68Sorj5GjieVrch0JNddPMRK9eGQkBxvj9oxykrrvXzC/5RvzsuQIWAHHUWJK3
 9anS6CPh7L9dRST8QtrLRnbZv5gbQUqTp0ziqe8s0LFZICgDFmRiU033AFEaFBv+pi/al5gbZ
 THAAdN7lgScO+ec2WW++1DiQbveJydqUwNXVhZ+3QG8rxt9o/aa0NyucY9ydXexvYY58KJ+wH
 QnJxlWDMvSV9QJebDe742JKoTZnMdVYCHR3/9lbh8NWu8N9vaGTjXbkXRS01Fjfq+qxhG0Xm+
 9QeFhmo5gFf4kSrzxsuss9RdgIj9afhlfiQjmfTa4bsbiAoOXIxKntnnIJQhL7Aiz/DWqP5EF
 Q9/W2oQe7c19RDJerBg8dPwgPflDjdRKsiWR1lcN/rt6kGY4VYtez3auBFRhn92YEWlCvcrY7
 xl62xYp6WugxI/eUW/Mn22Ltiy9MbIpYkrV4AaM2M8v+3k8r6X5A/M0/U89JOD4zhxBC1TfTJ
 1ztxk6kz6olpE/mbS4R2RSSOLF9RukbyNIVQRpFX4sw6nb+Q39S26Z03o0pWneTWJ7L9vzo+8
 PhQbNDnDaXW/9wxmTBrCjIM1SMnDdWrIvNjgkYaOlE7Ny1w9uH03F9RKPDG9b2e4eyg12s8O7
 wmAOm8oIE1GkBzDUWa5XwOuuq8mz60SNLNtwYbMgANe1ko31mjkZ7IFy5Z4pOf+zTeQg+gFhy
 j+/B9HvA3KQnMdPIXSQ7HmBF45JQ31LbktB61lGvtyvM73X/YO93zQcpf4jI=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 arch/arm/mach-omap1/ams-delta-fiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap1/ams-delta-fiq.c b/arch/arm/mach-omap1/ams=
-delta-fiq.c
index 0254eb9cf8c6..4eea3e39e633 100644
=2D-- a/arch/arm/mach-omap1/ams-delta-fiq.c
+++ b/arch/arm/mach-omap1/ams-delta-fiq.c
@@ -110,7 +110,7 @@ void __init ams_delta_init_fiq(struct gpio_chip *chip,

 		/*
 		 * FIQ handler takes full control over serio data and clk GPIO
-		 * pins.  Initiaize them and keep requested so nobody can
+		 * pins.  Initialize them and keep requested so nobody can
 		 * interfere.  Fail if any of those two couldn't be requested.
 		 */
 		switch (i) {
=2D-
2.20.1

