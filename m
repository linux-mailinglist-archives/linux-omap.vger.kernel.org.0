Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A272E296AD9
	for <lists+linux-omap@lfdr.de>; Fri, 23 Oct 2020 10:01:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S371525AbgJWIBJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Oct 2020 04:01:09 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:37150 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S370556AbgJWIBI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Oct 2020 04:01:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id AE2791C0B77; Fri, 23 Oct 2020 10:01:05 +0200 (CEST)
Date:   Fri, 23 Oct 2020 10:01:05 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch 00/12] UBS: Cleanup in_interupt/in_irq/in_atomic() usage
Message-ID: <20201023080105.GA21737@duo.ucw.cz>
References: <20201014145215.518912759@linutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="LQksG6bCIzRHxTLp"
Content-Disposition: inline
In-Reply-To: <20201014145215.518912759@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--LQksG6bCIzRHxTLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> The usage of such constructs in USB is rather limited. Most of it is in
> debug code and (misleading) comments. But of course there are also a few
> few bugs including one unfixable.

The "UBS" typo in the subject got me confused for a while.

Best regards,
									Pavel

--=20
http://www.livejournal.com/~pavelmachek

--LQksG6bCIzRHxTLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCX5KNwQAKCRAw5/Bqldv6
8g6WAJ0RsWU890W8aKyhaM0u5+J+pgoQDACdFG70EftfltJu1+ltFuMJ8UnKttM=
=Xauw
-----END PGP SIGNATURE-----

--LQksG6bCIzRHxTLp--
