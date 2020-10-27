Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B15129A5F9
	for <lists+linux-omap@lfdr.de>; Tue, 27 Oct 2020 08:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2508510AbgJ0H7V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Oct 2020 03:59:21 -0400
Received: from letterbox.kde.org ([46.43.1.242]:39436 "EHLO letterbox.kde.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2508508AbgJ0H7V (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Oct 2020 03:59:21 -0400
Received: from archbox.localdomain (unknown [123.201.39.96])
        (Authenticated sender: bshah)
        by letterbox.kde.org (Postfix) with ESMTPSA id 70BD3280236;
        Tue, 27 Oct 2020 07:59:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
        t=1603785559; bh=qqNnN1zHqyrA6g7HYzXjFml1LcG0O/EY7RinlacnDJg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HYTjd6oqpPsliQdScswrIKxHoTqPmqbdDmP9ir1TTI9CTA3pk41hZ0uaddleAa1oh
         fuQrHvzwqu64gqoxWAlhi/lK546ptYTxJJ+1g3q/zJ27PcbxiAGFrd/2W3apZapnp4
         d2YDjihpcQDOjNLH534x52kpqlOjv0NmyYaMF5FFAxnbgcOJLcD+wmW8pl2Rt8yqpO
         k63Bf/quET1kXDP34KKAqy2/muQYsACQLNAHKOcdjIhB8ig95HnsyIYdqfIAhVtiVr
         MR9udeNoLQ1fHL8dt6e8Sbf+SvNlpnkdt89SZabO/AAqr6SQdrWLVvO1H33odixpMs
         BXtt0xWOVbrOA==
Date:   Tue, 27 Oct 2020 13:29:15 +0530
From:   Bhushan Shah <bshah@kde.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, clayton@craftyguy.net
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20201027075915.GA1064075@aquila.localdomain>
References: <20191126034151.38154-1-tony@atomide.com>
 <20201027045519.GA947883@aquila.localdomain>
 <20201027061741.GD5639@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
In-Reply-To: <20201027061741.GD5639@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello!

On Tue, Oct 27, 2020 at 08:17:41AM +0200, Tony Lindgren wrote:
> Hmm maybe we're just missing the check for suspend here. Maybe
> give the following untested patch a try?
>=20
> I'll give it a try here too but it might be few days.

Thanks for quick patch! I tested this on my device and I can confirm
that it fixes issue for me.

So from my side,

Tested-by: Bhushan Shah <bshah@kde.org>

Thanks!

> Seems like we might be able to eventually simplify the suspend and
> quirk check stuff, but let's fix the $subject issue first.
>=20
> Regards,
>=20
> Tony
>=20
> 8< ----------------------
> diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
> --- a/drivers/usb/musb/musb_core.c
> +++ b/drivers/usb/musb/musb_core.c
> @@ -2005,10 +2005,14 @@ static void musb_pm_runtime_check_session(struct =
musb *musb)
>  		MUSB_DEVCTL_HR;
>  	switch (devctl & ~s) {
>  	case MUSB_QUIRK_B_DISCONNECT_99:
> -		musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
> -		schedule_delayed_work(&musb->irq_work,
> -				      msecs_to_jiffies(1000));
> -		break;
> +		if (musb->quirk_retries && !musb->flush_irq_work) {
> +			musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
> +			schedule_delayed_work(&musb->irq_work,
> +					      msecs_to_jiffies(1000));
> +			musb->quirk_retries--;
> +			break;
> +		}
> +		/* fall through */
>  	case MUSB_QUIRK_B_INVALID_VBUS_91:
>  		if (musb->quirk_retries && !musb->flush_irq_work) {
>  			musb_dbg(musb,

--=20
Bhushan Shah
http://blog.bshah.in
IRC Nick : bshah on Freenode
GPG key fingerprint : 0AAC 775B B643 7A8D 9AF7 A3AC FE07 8411 7FBC E11D

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEs8s2ZVJUC+Bu6a2XEZaMRJKMrvwFAl+X01IACgkQEZaMRJKM
rvyK8wgAtq9zXUC6b/0FUga1BglvrLHcdaBQa6Xjx0NaQUEKpZYwG6Au19n1JxvS
BkhX/Xzj1zSTBNrN71OCo4cDQmQ8Wqkk2X5YYF0ylDdKgOeEe/k5jOEerZoFQJK9
V60qk5AYxJ66FocPTfndzBXpkm9r1eYN43ee3ZHZaE3ag/MaPdDu2vA0qjycUaBI
rs8Gz/0MoUxxQXKLS/1ZYa6SG8S1gsb2/H8ar8hW8wyg/RA/8mKLBvwxZiF3T546
QCCHmsgGcGbmhA1iQzZaJSrtT5LIJl1WItpEY4G27nSyCGIyyRIXtFYohItuI2I7
W83YKtH11FO8luoDy7ezVRz6wgPNRQ==
=EeCo
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
