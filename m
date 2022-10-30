Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E750612D45
	for <lists+linux-omap@lfdr.de>; Sun, 30 Oct 2022 23:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiJ3WO7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Oct 2022 18:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbiJ3WO6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Oct 2022 18:14:58 -0400
X-Greylist: delayed 346 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 30 Oct 2022 15:14:56 PDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B38996252;
        Sun, 30 Oct 2022 15:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1667167733;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=5GKqb3fJ85fHPjXJt80eik+WVjp9pR4mDfmF41kXhHg=;
    b=s9uXJgSv+HC6ad9c+vpI+b+5GQtBF3WGF5L3kMRqk4/84LDwPJYHlnbWGjyfkKLEY1
    e4eyOa+uDhSejmmXQ/PtQp8GdzO28hUoDvmwiCBo3digVXneWO0TZkamgWXfyXLQpCpl
    F34XK/YHqL3iMHQI2m3qAU4PoDx1LF+VWhMExFVYBPMa/KtBAkbeHry1vRrCXLb4i/Ii
    WxoWm3pS3rlYGNhqBM8vOcZpcJzYPYL5RDgJe7vks/8GN8oXz7WD3FrM4cvmsjo2x0Tu
    Svc/SaebelINoiSqbgw8+qzlsa/c94YLMuoMQQnY4l01Pi/8fQsei8/dxdGkXZQANEYU
    CAaw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj5Apz9PSN6LgsXcGeqXQ="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
    by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
    with ESMTPSA id v55d69y9UM8rLaY
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
    Sun, 30 Oct 2022 23:08:53 +0100 (CET)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
Date:   Sun, 30 Oct 2022 23:08:52 +0100
Cc:     tomba@kernel.org, airlied@linux.ie, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, merlijn@wizzup.org, tony@atomide.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B3F8E50-3472-4AED-9A77-3E265DF8C928@goldelico.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
To:     Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Ivaylo,

it took a while until I found time to test newer kernels (mainline + =
Letux additions)
on the OMAP5 Pyra but unfortunately I did not get screen display for =
v6.1. Even worse,
the console was flooded by

[   39.419846] WARNING: CPU: 0 PID: 3673 at =
drivers/bus/omap_l3_noc.c:139 l3_interrupt_handler+0x23c/0x330
[   39.429914] 44000000.l3-noc:L3 Custom Error: MASTER MPU TARGET GPMC =
(Idle): Data Access in Supervisor mode during Functional access
...

making the system unuseable.

After doing some manual bisect by installing different kernel versions =
on the boot SD card,
I was able to identify that it crept in between v5.18 and v5.19-rc1. A =
git bisect on this
range (adding Letux patches on top of each bisect base) did reveal this =
patch as the first bad one.

After reverting it seems as if I can use any v5.19 .. v6.1-rc2 kernel =
without issues.

Now I wonder why this patch breaks my system?

BR and thanks,
Nikolaus


> Am 19.01.2022 um 11:23 schrieb Ivaylo Dimitrov =
<ivo.g.dimitrov.75@gmail.com>:
>=20
> On devices with DMM, all allocations are done through either DMM or =
TILER.
> DMM/TILER being a limited resource means that such allocations will =
start
> to fail before actual free memory is exhausted. What is even worse is =
that
> with time DMM/TILER space gets fragmented to the point that even if we =
have
> enough free DMM/TILER space and free memory, allocation fails because =
there
> is no big enough free block in DMM/TILER space.
>=20
> Such failures can be easily observed with OMAP xorg DDX, for example -
> starting few GUI applications (so buffers for their windows are =
allocated)
> and then rotating landscape<->portrait while closing and opening new
> windows soon results in allocation failures.
>=20
> Fix that by mapping buffers through DMM/TILER only when really needed,
> like, for scanout buffers.
>=20
> Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
> ---
> drivers/gpu/drm/omapdrm/omap_gem.c | 12 ++++++++----
> 1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c =
b/drivers/gpu/drm/omapdrm/omap_gem.c
> index 41c1a6d..cf57179 100644
> --- a/drivers/gpu/drm/omapdrm/omap_gem.c
> +++ b/drivers/gpu/drm/omapdrm/omap_gem.c
> @@ -821,10 +821,12 @@ int omap_gem_pin(struct drm_gem_object *obj, =
dma_addr_t *dma_addr)
> 			if (ret)
> 				goto fail;
>=20
> -			if (priv->has_dmm) {
> -				ret =3D omap_gem_pin_tiler(obj);
> -				if (ret)
> -					goto fail;
> +			if (omap_obj->flags & OMAP_BO_SCANOUT) {
> +				if (priv->has_dmm) {
> +					ret =3D omap_gem_pin_tiler(obj);
> +					if (ret)
> +						goto fail;
> +				}
> 			}
> 		} else {
> 			refcount_inc(&omap_obj->pin_cnt);
> @@ -861,6 +863,8 @@ static void omap_gem_unpin_locked(struct =
drm_gem_object *obj)
> 			kfree(omap_obj->sgt);
> 			omap_obj->sgt =3D NULL;
> 		}
> +		if (!(omap_obj->flags & OMAP_BO_SCANOUT))
> +			return;
> 		if (priv->has_dmm) {
> 			ret =3D tiler_unpin(omap_obj->block);
> 			if (ret) {
> --=20
> 1.9.1
>=20

