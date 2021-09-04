Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87180400B75
	for <lists+linux-omap@lfdr.de>; Sat,  4 Sep 2021 15:20:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhIDNSq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 4 Sep 2021 09:18:46 -0400
Received: from mout.gmx.net ([212.227.15.15]:35711 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230379AbhIDNSp (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 4 Sep 2021 09:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630761459;
        bh=anRpNVH27qFxp/JuNYRLaMaSlrUvcuVTQZSIBrXFAPM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=hGeA4LjSAWagwA+D3QEVGKowTQTlSwiVD6jHCasbiDtYxF/xOMIqAugRyElrcsdwo
         Rkn00cOrVvvP4dRdDfkgFc0TP8gqTvG0fbHDVmQddt8pBNJhVclqDPqJSUnXqY9Iws
         Kf2sXun9Wymc/FCizeRWdCNiqjf4abclqO3beKP0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.150.72.99]) by mail.gmx.net
 (mrgmx004 [212.227.17.184]) with ESMTPSA (Nemesis) id
 1MEUzA-1mAuxF2gNG-00FzhO; Sat, 04 Sep 2021 15:17:39 +0200
From:   Len Baker <len.baker@gmx.com>
To:     Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Len Baker <len.baker@gmx.com>, Kees Cook <keescook@chromium.org>,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: ti: composite: Prefer kcalloc over open coded arithmetic
Date:   Sat,  4 Sep 2021 15:17:14 +0200
Message-Id: <20210904131714.2312-1-len.baker@gmx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/CTvZZgUUU4aW56h57ya80evQdHSE2y2Afe+boB24hpwe914lpk
 x6nxeUz3HoNtUEfE1fnSXTLwXfieC2KH6c6TZ+oCh9X2txpFZoLwBi62uqIF4fxree+EXlm
 19hxmCeNtTHbUGTpwIR1H6xVRexeCNuRKUzceIuwCt3mfhEySYtUub3ltH4wJjOVLmRsbJ9
 /ZxJr/45nR990NCS/pdCA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tVroNg3tl+w=:PPfRbT44yh/VG/YPE/zc4S
 Hf5BJscqDVAdXhETLWnirVm9IF5zVkrlhVa76tCVJZTLSshkIVx4ck71kza5L0Jp2pmhrp5Ue
 MFIzURUtMrhYBRuaaQgpi6AzA6R6z4HypWEAkpdFEwJTMs7EUwJ1KDGifGp+5JxsQn6rLFvdy
 H3v5snz/I7tRhqCdOBgkVpqyKpTBUCXf5/2ATAdDPxyUZ48ic024WmtvbfRQBkEEATeX7DAKD
 gFZIA31OEwSgkn+XQVI846aQX0z9PYuoAzr43KHwIIK8cqr3Ku2ABCSUmJI6HrUqke2Gbf1z4
 i6JpFTHZSWhT3Q1VqNorWSE65+NIfUszWvkuDieAtCR/P/n0eDyb01jQv3vjRHbLjhJJJ3hr7
 m2C8oEsAICIBQA44xNbmiEjmuqXhIlYHtYznFyJLRTQKpwoAgxTfi6xN58KGmtmc/AMI4PjOI
 TjUK7fxDyHSUaone8+XStiGtn3xGW61IqElWkJ2JHtHY4XpMis+fYMzISlPAEfBXqRQqUpEJK
 c0Z83nIFNt8J1C0XDEgkto348schP5gU9m/Xi4LAWlkL8oGNYxLGDqBc9MI+CYws8Ems2XFZ8
 nvujerrwm767GgE4Mdy8XzXjV8i15NLYklBTEogPxEICbJ4WuMYAxWGbvPjdzESY4PhXr9LkA
 3JIUFB28t6YppK+oPUh4OHY4mmVJeFx28KvKYQTSbjx0MwjxKfRC0jDGi0Po+nQrJuHDWA51o
 MEqtdqNFp4+eb9jjaDfHOQxa2GYks/ej3KnKs+Ff9gEoAJESG3w1Zwr9OH9Cgoxjx5rqb/6zk
 je69cg4CiOrQyN3qU1mcKXohc7s0ppe4Aj+OlSsVu7NDmfDyH6pDkTIKRIHm4k0zCs9joXyvn
 bNMsJ0EpfgMwEe+KyGyDgHpj7eWu3pvwp2CHC7d03i2CFfK5t498aDPlq5gGzbY46Dp9GsS3y
 rZbk/cA9cMfoy5pPmfpK5tyOuafql1gRu4JZk6nsBG4aUPqfSG4MJAkmh4zHnbny6UwSK98qN
 2xTVgl6c7Vlc4krtIGLYfcf3hrqx9nzFsMQP2GjHuiiLCrAS3gKLXBnxrzHc99342cFQxTxh3
 je/ODOtT8sZgRzfi+Bwwd5Se+Z4TTid3yf5SbjIJimUmZd/dFvprkcn3w==
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As noted in the "Deprecated Interfaces, Language Features, Attributes,
and Conventions" documentation [1], size calculations (especially
multiplication) should not be performed in memory allocator (or similar)
function arguments due to the risk of them overflowing. This could lead
to values wrapping around and a smaller allocation being made than the
caller was expecting. Using those allocations could lead to linear
overflows of heap memory and other misbehaviors.

So, use the purpose specific kcalloc() function instead of the argument
size * count in the kzalloc() function.

[1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-cod=
ed-arithmetic-in-allocator-arguments

Signed-off-by: Len Baker <len.baker@gmx.com>
=2D--
 drivers/clk/ti/composite.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/composite.c b/drivers/clk/ti/composite.c
index eaa43575cfa5..eb5ce9735c7d 100644
=2D-- a/drivers/clk/ti/composite.c
+++ b/drivers/clk/ti/composite.c
@@ -253,7 +253,7 @@ int __init ti_clk_add_component(struct device_node *no=
de, struct clk_hw *hw,
 		return -EINVAL;
 	}

-	parent_names =3D kzalloc((sizeof(char *) * num_parents), GFP_KERNEL);
+	parent_names =3D kcalloc(num_parents, sizeof(char *), GFP_KERNEL);
 	if (!parent_names)
 		return -ENOMEM;

=2D-
2.25.1

