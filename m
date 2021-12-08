Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6829E46DD6C
	for <lists+linux-omap@lfdr.de>; Wed,  8 Dec 2021 22:07:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237018AbhLHVKl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Dec 2021 16:10:41 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:35298 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbhLHVKl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Dec 2021 16:10:41 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 167B51C0BA2; Wed,  8 Dec 2021 22:07:08 +0100 (CET)
Date:   Wed, 8 Dec 2021 22:07:06 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, zhangqilong3@huawei.com,
        jingxiangfeng@huawei.com, Tony Lindgren <tony@atomide.com>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: Oops in ssi (through nokia-modem)
Message-ID: <20211208210706.GB12125@duo.ucw.cz>
References: <4ed95c71-2066-6b4c-ad1b-53ef02d79d53@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline
In-Reply-To: <4ed95c71-2066-6b4c-ad1b-53ef02d79d53@wizzup.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> As soon as nokia-modem on my Nokia N900 gets used, I get the following
> warning, followed by an oops [1]. I believe the nokia-modem module is
> probed with the "pm=3D1" argument, but that doesn't seem particularly
> important given the trace, I think.

Actually, it seems two warnings and an oops.

> > [  165.467529] IPv6: ADDRCONF(NETDEV_CHANGE): phonet0: link becomes rea=
dy
> > [  165.498687] ------------[ cut here ]------------
> > [  165.503417] WARNING: CPU: 0 PID: 662 at kernel/dma/mapping.c:188 __d=
ma_map_sg_attrs+0xd8/0x100

This one should be easy. __dma_map_sg_attrs

        if (WARN_ON_ONCE(!dev->dma_mask))
		return 0;

someone forgot to set the mask. ssi_start_dma() has some dev_dbgs,
could you make sure they end up in the logs?

Maybe it is as simple as adding dma_set_mask() somehwere?
dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32)); ?


> > [  165.787841] ---[ end trace a3f2b689bab17aa5 ]---
> > [  166.436523] irq 26: nobody cared (try booting with the "irqpoll" opt=
ion)
> > [  166.443298] CPU: 0 PID: 662 Comm: irq/83-SSI PORT Tainted: G        =
W         5.15.2-218696-g31e48a7f0946-dirty #1
> > [  166.453704] Hardware name: Nokia RX-51 board

Second warning here. We don't have handler for irq 26.=20

> > [  166.593566] 8<--- cut here ---
> > [  166.600799] Unable to handle kernel NULL pointer dereference at virt=
ual address 00000000
> > [  166.608978] pgd =3D 34df813c
> > [  166.611724] [00000000] *pgd=3D00000000

And now the oops...

Best regards,
							Pavel
--=20
http://www.livejournal.com/~pavelmachek

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYbEeegAKCRAw5/Bqldv6
8kUsAJwIK9nT8xbkhSs0qpZdsNMwOi/DegCffJu9ruA2KmceSrakQJTjIAzrR5A=
=CZwR
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
