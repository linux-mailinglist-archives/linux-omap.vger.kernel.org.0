Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73F691C0A63
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 00:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbgD3W0I (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Apr 2020 18:26:08 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:38806 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgD3W0I (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 30 Apr 2020 18:26:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 97FEC1C0208; Fri,  1 May 2020 00:26:05 +0200 (CEST)
Date:   Fri, 1 May 2020 00:26:05 +0200
From:   Pavel Machek <pavel@denx.de>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCHv6 0/6] n_gsm serdev support and GNSS driver for droid4
Message-ID: <20200430222605.GA10922@duo.ucw.cz>
References: <20200430174615.41185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> My guess is that at least with the pending ofono patches, we just
> want to use the raw interface for /dev/gsmtty* interface and stop
> pretending we have a modem that is AT compatible.

I tried to get it to work... it was not fun and I did not get far.

I pushed my results...

user@devuan:/my/ofono$ git push
Counting objects: 10, done.
Delta compression using up to 2 threads.
Compressing objects: 100% (10/10), done.
Writing objects: 100% (10/10), 1.17 KiB | 0 bytes/s, done.
Total 10 (delta 8), reused 0 (delta 0)
remote: Resolving deltas: 100% (8/8), completed with 8 local objects.
To github.com:pavelmachek/ofono.git
   fd34ca20..9042014b  mux-v1.29-1 -> mux-v1.29-1

Best regards,
								Pavel

ofonod[12922]: drivers/atmodem/network-registration.c:at_netreg_probe() Pro=
bing creg
Have command of length 9 (AT+CREG=3D?)
 or ^z=20
ofonod[12922]: Voice: > U0000AT+FOO\r
ofonod[12922]: InSMS: > U0000AT+FOO\r
ofonod[12922]: OutSMS: > U0000AT+FOO\r
ofonod[12922]: Voice: < U0000+FOO:ERROR=3D9\n
new bytes 18
Have line: U0000+FOO:ERROR=3D9
Last character is 13
command response: U0000+FOO:ERROR=3D9
ofonod[12922]: plugins/motmdm.c:foo_cb()=20
handle command response
ofonod[12922]: Voice: > U0000AT+SCRN=3D0\r
ofonod[12922]: OutSMS: < U0000+FOO:ERROR=3D9\n
new bytes 18
Have line: U0000+FOO:ERROR=3D9
Last character is 13
command response: U0000+FOO:ERROR=3D9
ofonod[12922]: plugins/motmdm.c:foo_cb()=20
handle command response
ofonod[12922]: InSMS: < U0000+FOO:ERROR=3D9\n
new bytes 18
Have line: U0000+FOO:ERROR=3D9
Last character is 13
command response: U0000+FOO:ERROR=3D9
ofonod[12922]: plugins/motmdm.c:foo_cb()=20
ofonod[12922]: plugins/motmdm.c:foo_cb() All channels working
handle command response
ofonod[12922]: Voice: < U0000+SCRN:OK\n
new bytes 14
Have line: U0000+SCRN:OK
Last character is 13
command response: U0000+SCRN:OK
ofonod[12922]: plugins/motmdm.c:scrn_cb()=20
handle command response
ofonod[12922]: Voice: > U0000AT+CFUN=3D1\r
ofonod[12922]: Voice: < U0000+CFUN:OK\n
new bytes 14
Have line: U0000+CFUN:OK
Last character is 13
command response: U0000+CFUN:OK
ofonod[12922]: plugins/motmdm.c:cfun_cb()=20
handle command response
ofonod[12922]: Voice: > U0000AT+CLIP=3D1\r
ofonod[12922]: Voice: < U0000+CLIP:OK\n
new bytes 14
Have line: U0000+CLIP:OK
Last character is 13
command response: U0000+CLIP:OK
handle command response
ofonod[12922]: Voice: > U0000AT+CCWA=3D1\r
ofonod[12922]: Voice: < U0000+CCWA:OK\n
new bytes 14
Have line: U0000+CCWA:OK
Last character is 13
command response: U0000+CCWA:OK
ofonod[12922]: drivers/motorolamodem/voicecall.c:motorola_voicecall_initial=
ized() voicecall_init: registering to notifications



--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--9jxsPFA5p3P2qPhR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXqtQfQAKCRAw5/Bqldv6
8l9jAJ9KvU0iNyw/Yt+4+ZYHCB1gEmP9+gCfReEBIYsa33Y8sy9hW9AUNr8xq7M=
=MkB7
-----END PGP SIGNATURE-----

--9jxsPFA5p3P2qPhR--
