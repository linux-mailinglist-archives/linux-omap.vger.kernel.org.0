Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78D65F1D6C
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2019 19:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfKFSWM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Nov 2019 13:22:12 -0500
Received: from mout.web.de ([217.72.192.78]:36235 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfKFSWM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Nov 2019 13:22:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1573064526;
        bh=mMQ2016K+R5+2QdsMUR5IG6pPz60hhH6vO7nm9V00OA=;
        h=X-UI-Sender-Class:To:Cc:From:Subject:Date;
        b=PGexWA68pJTGELiXF0eXygZcctybCrYMJqdSskmvz6141lsVLDPKh+3DfJQ3g6SZ3
         NEWjTo0159rg3Um9VEawc2e6z7r4eg0QtSABu5QqjiCSwsERFPiPTEXdJHxoZuQFOY
         Rlay5qD6LCzvPpGwAx+EWSuENUrda52JmuaaJ8VQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.91.235]) by smtp.web.de (mrweb103
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Le4Tw-1i9ta61Uke-00pxJn; Wed, 06
 Nov 2019 19:22:06 +0100
To:     linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Tero Kristo <t-kristo@ti.com>
From:   Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] bus: ti-sysc: Adjust exception handling in
 sysc_child_add_named_clock()
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <8874d0c5-856a-809f-cba6-1b970df68d13@web.de>
Date:   Wed, 6 Nov 2019 19:22:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Cjn8WAKhN2uTY9q/RUh2BseuahLN0E/VYACDChErEYTxbWa/aXc
 fMUoSBZYd/RpDn/HUv6LXqvJGR0njLxjBeatqafJIfHrSA0b/tPrT2J0mbqzEABUsS+35u/
 956A/Mt+MFckxmNoNl6230nHyO0lzkxnLStGH1ytb+eM4z/x86tmnac8a69pFpadU8WqVZz
 44taJ6ou9Acue4M1ZweLQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F6IVgOFi/c4=:I7kMihVPo5dTgYafwl5r1w
 1zl2MYW+m39uFdnt5tsC20I+EtBikHPBBV9grqBYY7RGU8b3j8orNyczQmDmYXjvwQ4ubJnxe
 IECcgRIY0GUK59EX2O7yyynDLtcFFx/ggVxnhEmI4d1yBgjsGcOQmE58BPxxul9OcnQ6IvyuL
 zXesWeCvsOO9T1aagdOiDV2JYTmva0UaKMK5l8QNRiltMdjxdFD7ZLT/5LtNJp9lt/E3bhEqO
 GRFEJJOslkZKAGhP6pkWn373xNrHNs32WZhZFjmxHOu+ma6y2Wfkk/jG8+WgaCKrzJxZWFBZh
 OCscAgGO72Kb+mpLhEIgNFp4VHg3GjJ3fionQCUJNVnF6i+BIjhW0rMqnUxts9MghuhIpfnME
 OjjL4YKVHPYPTzVfG+aIXaCqff5FmNBmsc1js7AXE1HLBAYotRGIQ10p73TZzK0edIPZBxvfI
 659hIiXqAp+K+ohC2rSscdR5vS4wenHs3FLpBGmmckm6Q1Fbbfxvxc8ir1mVPyIwl6obInavR
 G223QKQnODmeq35bXAfiio2wzuDP9n4rjnd29p799lH9Sa+24oTIZTEgOe+bWIv7yijdYWbD0
 iNV4IPlWLDl4Wa2DW1FP4VfMwUl9cTT4SyjnSFVCWMGvwoQ0D6L/BMoryFT0t0kcDHEIMeihU
 B+aXlP5ZhAlOwqneabYq1sD4igGJ5X5ISU+0oHcLK2XWrimJfQJfEsL8w9BFbzF7v6NhLtXn5
 B4M10KAvwz7hj40Yb9s53tdYSa0StpmnxwlWhkPq0PEb9DWPSbS5vmQD5IkjPc6bTA/9hqZnh
 XQvhjeROfwKnI8VmfZXoayV0vRYlnRgB2T4hMAIt16o/KcZ2WBKuBIAqUNhot1dFnikhJ++Sv
 OKnyuP5VwhcDUwfQC9/u38GjsPhVQ036i0WA/dnQrE1KZ2r5XKXiA1R1gGTHCmJO3PPLVbt6A
 Wv7FqxU06ZLGIbsFvwf365pKeajso1KIOJQFKVWEX73a97QIAMG3eAiEsOLtzUOnb6j9yXX63
 8Z8UQfh2SrJnSsYBqaF/CzYLsvKaS8zwbhYx/jn4QZxe2zaRYNke4k/H0jIPgHeTex2B+H3uQ
 7ATrXEvbAVEJKy/yJGQxAjj56F6Paqb/9wDH1i2OZqU9b8/7ZJt5JMRZtCaI4qmlYSrdyVRWh
 uB8TNz6yYx1TynlRlaReYIJxmo4WkZYSiZgQ4ycskLm49d07yqotOARxgbeRiW1knXh5UMgMq
 fOhG5i4DaJkGtfbMftcscVvNu+k1tzGOp0sSGnKmj7ULIIMkNEOaZ5Chh0Ys=
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 6 Nov 2019 19:12:30 +0100

Add a jump target so that a call of the function =E2=80=9Cclk_put=E2=80=9D
can be better reused at the end of this function.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/bus/ti-sysc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 97b85493aa43..2042f6e45163 100644
=2D-- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -1766,9 +1766,8 @@ static int sysc_child_add_named_clock(struct sysc *d=
data,

 	clk =3D clk_get(child, name);
 	if (!IS_ERR(clk)) {
-		clk_put(clk);
-
-		return -EEXIST;
+		error =3D -EEXIST;
+		goto put_clk;
 	}

 	clk =3D clk_get(ddata->dev, name);
@@ -1778,7 +1777,7 @@ static int sysc_child_add_named_clock(struct sysc *d=
data,
 	l =3D clkdev_create(clk, name, dev_name(child));
 	if (!l)
 		error =3D -ENOMEM;
-
+put_clk:
 	clk_put(clk);

 	return error;
=2D-
2.24.0

