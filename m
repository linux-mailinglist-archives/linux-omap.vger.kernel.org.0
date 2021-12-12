Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8528F471C69
	for <lists+linux-omap@lfdr.de>; Sun, 12 Dec 2021 19:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbhLLS7y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 12 Dec 2021 13:59:54 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:58812 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231902AbhLLS7x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 12 Dec 2021 13:59:53 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 8BBC81C0B7A; Sun, 12 Dec 2021 19:59:52 +0100 (CET)
Date:   Sun, 12 Dec 2021 19:59:44 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, zhangqilong3@huawei.com,
        jingxiangfeng@huawei.com, Tony Lindgren <tony@atomide.com>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: Re: Oops in ssi (through nokia-modem)
Message-ID: <20211212185944.GA9725@duo.ucw.cz>
References: <4ed95c71-2066-6b4c-ad1b-53ef02d79d53@wizzup.org>
 <20211208210706.GB12125@duo.ucw.cz>
 <5780923a-315d-d65e-6bcf-ef2a5a3002bc@wizzup.org>
 <865c5758-fc18-7abe-2fa1-cf3b16e827f8@wizzup.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Content-Disposition: inline
In-Reply-To: <865c5758-fc18-7abe-2fa1-cf3b16e827f8@wizzup.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > +       dma_set_mask_and_coherent(&ssi->device, DMA_BIT_MASK(32));
>=20
> All the other problems remain (no one cared about the irq and NULL
> pointer). Perhaps some IRQ is not set up for DMA completion (just
> guessing here?)
>=20
> However, looking at the omap3-n900.dts it looks to me that the ssi_pins
> definition suggests that it should use pio, rather than DMA.
>=20
> Does either of you recall if DMA was ever used on the N900, or does the
> offending commit just cause DMA to be used by accident?

No idea, sorry :-(.
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYbZGoAAKCRAw5/Bqldv6
8ra+AJ4hpo25i/WfHQ0bFYbc/SwXE6vdRACdGkJ4KBSUGdEBgZvfy8sXuCM2dL8=
=vUs+
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
