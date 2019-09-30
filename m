Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 990AFC2854
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 23:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732630AbfI3VKy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 17:10:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732026AbfI3VKy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Sep 2019 17:10:54 -0400
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02107224F2;
        Mon, 30 Sep 2019 19:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569873255;
        bh=ccheOSz51UqxJvuRdxmp6qw7s/FNYHaSUL1+7YXLnog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RKiIVLEPC0a2zI4KabwvxwYN9cSNu7uYN7b9aQa56Pj7WcF2a8tVeiH6caIZFVlk6
         qeFfq6thHf1+I1xmGJd4vUAgigkGsfFm397inlJf/526k7x8+DEigcHsUIRNr77neD
         qiZdQGIN3cnVz3J+rLA1Bk/Ee/9ZhmTSfHzulaKw=
Received: by earth.universe (Postfix, from userid 1000)
        id 91DC23C0CA1; Mon, 30 Sep 2019 21:54:11 +0200 (CEST)
Date:   Mon, 30 Sep 2019 21:54:11 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Yegor Yefremov <yegorslists@googlemail.com>,
        linux-omap@vger.kernel.org, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when
 connected to musb directly
Message-ID: <20190930195411.6porqtm7tlokgel3@earth.universe>
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
 <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
 <20190927151935.GD5610@atomide.com>
 <20190927155738.GF5610@atomide.com>
 <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
 <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com>
 <20190930152330.GH5610@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2iwmtye3bbov3zwz"
Content-Disposition: inline
In-Reply-To: <20190930152330.GH5610@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--2iwmtye3bbov3zwz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 30, 2019 at 08:23:30AM -0700, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [190930 14:57]:
> > * Yegor Yefremov <yegorslists@googlemail.com> [190930 08:20]:
> > > On Mon, Sep 30, 2019 at 8:59 AM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > >
> > > > On Sat, Sep 28, 2019 at 6:09 PM Yegor Yefremov
> > > > <yegorslists@googlemail.com> wrote:
> > > > >
> > > > > On Fri, Sep 27, 2019 at 5:57 PM Tony Lindgren <tony@atomide.com> =
wrote:
> > > > > > Looks like I'm unable to reproduce this with bbb and FT232R
> > > > > > USB UART.
> > > > > >
> > > > > > I tried v5.3 with omap2plus_defconfig, then boot, load musb
> > > > > > and ftdi-sio modules, then connect ftdi directly to bbb,
> > > > > > and then run "minicom -D /dev/ttyUSB0" on bbb and it works
> > > > > > just fine for me.
> > > > > >
> > > > > > I tried also rebooting the device inbetween in case it only
> > > > > > happens on the first connect after boot but still no luck
> > > > > > reproducing.
> > > > >
> > > > > Strange. I've used a loopback to check whether the characters wil=
l be echoed.
> > > > > FTDI cable was connected all the time so that I could check RX ri=
ght after boot.
> > > > > Both Buildroot and OpenWrt rootfs's showed this behaviour.
> > > > >
> > > > > > Maybe try adding some debug prints to cppi41_runtime_suspend()
> > > > > > and cppi41_runtime_resume() to see if gets runtime suspended
> > > > > > too early?
> > > > >
> > > > > Will do on Mo.
> > > >
> > > > I've added the printks to both routines and the result is quite
> > > > interesting. On the system with a directly attached FTDI both routi=
nes
> > > > will be always invoked before (resume) and after (suspend) the
> > > > test/minicom i.e. during the USB initialization.
> > > >
> > > > On the systems with a USB hub, these routines will be invoked only
> > > > during the USB initialization and the last invocation is resume.
> > > > During the test, there are no invocations.
> >=20
> > Hmm OK thanks. Hard to say still based on that what might be missing.
> >=20
> > I just tried also musb and phy built-in with FTDI connected on
> > boot, but still no luck reproducing the issue here.
> >=20
> > > Removing PM routines workarounds the issue. Quick and dirty.
> > >=20
> > >  static struct platform_driver cpp41_dma_driver =3D {
> > >           .probe  =3D cppi41_dma_probe,
> > >           .remove =3D cppi41_dma_remove,
> > >           .driver =3D {
> > >                   .name =3D "cppi41-dma-engine",
> > >                   /*.pm =3D &cppi41_pm_ops,*/
> > >                   .of_match_table =3D of_match_ptr(cppi41_dma_ids),
> > >           },
> > >   };
> >=20
> > Well doing something like this to disable autosuspend might
> > be less intrusive until this one is fixed:
> >=20
> > # echo on > /sys/bus/platform/drivers/musb-hdrc/musb-hdrc.1/power/contr=
ol
> >=20
> > But before that, maybe try with control set to auto, and increase the
> > autosuspend_delay_ms from 500 ms to let's say 2500 ms:
> >=20
> > # echo 2500 > /sys/bus/platform/drivers/musb-hdrc/musb-hdrc.1/power/aut=
osuspend_delay_ms
> >=20
> > That is assuming the musb instance is 1 on your board, replace
> > with musb-hdrc.0 if a different interface from bbb.
>=20
> Actually playing with the cppi41 timeout might be more suitable here,
> they use the same module clock from what I remember though. So
> maybe increase the cppi41 autosuspend_timeout from 100 ms to 500 ms
> or higher:
>=20
> # echo 500 > /sys/bus/platform/drivers/cppi41-dma-engine/47400000.dma-con=
troller/power/autosuspend_delay_ms
>=20
> If changing the autosuspend_timeout_ms value does not help, then
> try setting control to on there.

I did not check the details, but from the cover-letter this might be
woth looking into:

https://lore.kernel.org/lkml/20190930161205.18803-1-johan@kernel.org/

-- Sebastian

--2iwmtye3bbov3zwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2SXWAACgkQ2O7X88g7
+pq2Hg/+Pc1ul/UA9RCDisFmo+tCc0aDzstHfYXbXpA4QFmFsgdVRFzQ6j2IaA9X
AJ9h2vsorJFlSs16eSrzO+3luGW6CDACuApVzhdneDz3gvFZo8iYHl8Pr+RQ2IaM
x6rxellq30ldOnE81iOJnYKkNA8r5CbiCitddShhr8Rl+ucAe0soQIkNJdd//de/
EgKpzTrwa9BP2FD0y4RnXfbO6ak6w0ECUghfND3NRxF2MczzLpIYBzqHY6ZLjpoI
Ut406J1APIYalXgsRL8ceAdolv34g9I2tcA4jpg7MSmqKea1l/O/9+O6LNCkGudy
rqF601OJIxKAZy/8yXSR77E/M6EiwAWDN9k+8rccZYfYrYZ5yGGjsBX4/Z96N/0f
BFVSfty7/MuFUxTiUyj4hJaZW4RGDqTGwLwl014UCQuZ6DJGjviyHY7B5AMBpM7B
La0Cg5QSsO2MdktdICTIHnboNKB9B9qGfTfTi3oQiZNRSwlGUkfGxs6jVXATv2fv
s4/EWsnqxDL9nWm9K/ARpYnyljuOvTwP2vEwQPN6+6VAtvOJa6Emawcn3bksr3he
/IePdt5haPGjCY/yxz369OsdfOptDKxZSSXdGEp85+5NOpI4LfGX2r9dTzr+hfs4
I5GYWQb5YUZ5I81b487H0ASwdeeOqR0cIqEKlqqnALuae2cvsQk=
=qsZR
-----END PGP SIGNATURE-----

--2iwmtye3bbov3zwz--
