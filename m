Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D634D2729
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2019 12:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726869AbfJJK2F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Oct 2019 06:28:05 -0400
Received: from mail.andi.de1.cc ([85.214.55.253]:56694 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725601AbfJJK2E (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 10 Oct 2019 06:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=sOQUv+9i40QZHWyHeG0HLDmykEtAPA1EbXs7LAn8Tis=; b=fBYaHSwyyx5YEbrmp3azRgZ7L
        fuRMzw41YEUaaY1ZvwlRHiAGZgPmMlo5UEvN7LVSAGgZIVTilOrgeHCIYTelEXOgOu3uWsg4aKhyz
        IFBX67ZIl0KFSANsLaKtO2//+0WKtcPyRZSaL2ThbWdQPEHEzk7T9kShVGGo7xDBNqoAM=;
Received: from leintor.e.ffh.zone ([81.3.6.94] helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iIVfm-0001Mc-Ht; Thu, 10 Oct 2019 12:27:57 +0200
Received: from [::1] (helo=localhost)
        by localhost with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1iIVfh-0006GK-E4; Thu, 10 Oct 2019 12:27:49 +0200
Date:   Thu, 10 Oct 2019 12:25:01 +0200
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        =?ISO-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        DTML <devicetree@vger.kernel.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        Eyal Reizer <eyalr@ti.com>, Guy Mishol <guym@ti.com>,
        John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] ARM: dts: Use level interrupt for omap4 & 5 wlcore
Message-ID: <20191010122501.750d0485@kemnade.info>
In-Reply-To: <CAPDyKFqUL1Cso1H-sNcWFngWiLHLD76Uk9PtN2TkKS_Kd6TKJw@mail.gmail.com>
References: <20191009164344.41093-1-tony@atomide.com>
        <CAPDyKFqUL1Cso1H-sNcWFngWiLHLD76Uk9PtN2TkKS_Kd6TKJw@mail.gmail.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vB1u7WO2oI=w1jDvqt9C2Fh"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/vB1u7WO2oI=w1jDvqt9C2Fh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Oct 2019 09:29:45 +0200
Ulf Hansson <ulf.hansson@linaro.org> wrote:

> On Wed, 9 Oct 2019 at 18:43, Tony Lindgren <tony@atomide.com> wrote:
> >
> > Commit 572cf7d7b07d ("ARM: dts: Improve omap l4per idling with wlcore e=
dge
> > sensitive interrupt") changed wlcore interrupts to use edge interrupt b=
ased
> > on what's specified in the wl1835mod.pdf data sheet.
> >
> > However, there are still cases where we can have lost interrupts as
> > described in omap_gpio_unidle(). And using a level interrupt instead of=
 edge
> > interrupt helps as we avoid the check for untriggered GPIO interrupts in
> > omap_gpio_unidle().
> >
> > And with commit e6818d29ea15 ("gpio: gpio-omap: configure edge detection
> > for level IRQs for idle wakeup") GPIOs idle just fine with level interr=
upts.
> >
> > Let's change omap4 and 5 wlcore users back to using level interrupt
> > instead of edge interrupt. Let's not change the others as I've only seen
> > this on omap4 and 5, probably because the other SoCs don't have l4per i=
dle
> > independent of the CPUs. =20
>=20
> I assume this relates to the implementation for support of SDIO IRQs
> (and wakeups) in the omap_hsmmc driver?
>=20
> In any case, just wanted to share some experience in the field, feel
> free to do whatever you want with the below information. :-)
>=20
> So, while I was working for ST-Ericsson on ux500, we had a very
> similar approach to re-route the SDIO bus DAT1 line to a GPIO IRQ as a
> remote/system wakeup (vendor hack in the mmci driver). In other words,
> while runtime suspending the mmc host controller, we configured a GPIO
> IRQ, via an always on logic, to capture the IRQ instead. The point is,
> I believe we may have ended up looking at similar problems as you have
> been facing on OMAP.
>=20
> In hindsight, I realized that we actually violated the SDIO spec by
> using this approach. More precisely, during runtime suspend we do
> clock gating and then re-routes the IRQ. However, clock gating isn't
> allowed before the SDIO bus width have been changed back from 4-bit
> into 1-bit. This last piece of action, would be an interesting change
> to see if it could affect the behaviour, but unfortunately I have
> never been able to check this.
>=20
> The tricky part, is that we can't issue a command to change the bus to
> 1-bit in omap_hsmmc ->runtime_suspend() callback (this needs to be
> managed by the core in some way). However, we can make a simple test,
> by simply always limit the bus width to 1-bit, as that should mean we
> should conform to the SDIO spec.
>=20

somehow matches that with my experiences with libertas + omap3.
SDIO irq seems to work only with runtime force-enabled in omap_hsmmc
or using 1bit mode.
And yes, I tried switching mode to 1bit in runtime_suspend() but as
you said, that cannot easily done.

Regards,
Andreas

--Sig_/vB1u7WO2oI=w1jDvqt9C2Fh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl2fBv0ACgkQl4jFM1s/
ye9O6A//VlTPsnB/dywzw2PxbTL+qdPHRvN6KVpZQl02DumTowmz745M1jl8KkkW
Z+6BdzNwQONwc+IuO/aTuImt9/+E3b2fLaOnbIcIDc8X0AHZvyWFU5dSCPcHzeLI
WZUgAR3VTetf1YOAUaUinBFHXY9r9MMcJ9YUC9IkUvkTf5eoeHJ+My33SKWbJRTM
U0227vam43JppT6xGIKmEK8R78r3qC8q12MZ4PXLdC93hpSrdGm5QhTz4gYFSkpu
1lFubFJVeoV/vnCR1vlIKCY7J2bmFSFVqt734hZrJSIakYwjdjjek4FtCjWfmxux
9aOR91CbOYw8am+YOWz/4txN/Bu9IC3BY6J0TkHbbf/kSrOrRGbNE81Ai2WFO40d
kKR9rFL+PNPEhQNxotrYd8WTCgONvMI0I1sndfA8Q5byO+dIi/j1eNGglRRjXEaw
t3GpmYDhHd4PapF2rEiAXTNsgKamwgUG2K7KnBVzDMxjqBPMv5FXgP8dv1uh3hJ9
rZXih6LHZNT74nJiFPD1tlsA0R5rZOyIfRzop3H/AfEbUlWvzfJUL+lcjyKe/euy
Lw76b2S1NS16KDoG22/XKFuRsMIqstO4+GBkbycSseHxP6CLQ4tD3aIwT7A1wVvv
Doet2Uxewz4al/93OVO+/+5Z1oqX0ZRRwM7MQILJZKvFtiMsqLc=
=SurR
-----END PGP SIGNATURE-----

--Sig_/vB1u7WO2oI=w1jDvqt9C2Fh--
