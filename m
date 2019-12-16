Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 130EB12078B
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2019 14:48:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbfLPNsX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 08:48:23 -0500
Received: from mail.andi.de1.cc ([85.214.55.253]:55490 "EHLO mail.andi.de1.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727579AbfLPNsW (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Dec 2019 08:48:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Type:MIME-Version:References:
        In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=QorfTf53SPvGZ9VQFNJd+vqD+nj6jSm+GwQ9JD/nM/o=; b=G3pdXgNq+2f7fsK2Uu37jr0pJ
        q7bOvkfl+XV5qzxjRwnna5RtFdpakhFkjAA95cqb1Qpl31s5VKslR1DWVms7VSVGU7yCYS9Z4LukO
        w2zFhNpn5+4C95F8IWRhU1mEe4YJXzM4teiyYqtqwSNLTUGoednDfI5ilO+VYMapyFhX4=;
Received: from [2a02:790:ff:919:7ee9:d3ff:fe1f:a246] (helo=localhost)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igqjR-0003hl-Dk; Mon, 16 Dec 2019 14:48:18 +0100
Received: from [::1] (helo=localhost)
        by eeepc with esmtp (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1igp8F-0006kt-JN; Mon, 16 Dec 2019 13:05:47 +0100
Date:   Mon, 16 Dec 2019 13:05:36 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Adam Ford <aford173@gmail.com>,
        "Andrew F . Davis" <afd@ti.com>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCH] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20191216130536.5935a587@kemnade.info>
In-Reply-To: <20191216031637.GM35479@atomide.com>
References: <20191215173817.47918-1-tony@atomide.com>
        <20191215230331.645b9064@aktux>
        <20191216030948.GL35479@atomide.com>
        <20191216031637.GM35479@atomide.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pTDkS8g+4Evpb4NGdmMSFgI"; protocol="application/pgp-signature"
X-Spam-Score: -1.0 (-)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/pTDkS8g+4Evpb4NGdmMSFgI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sun, 15 Dec 2019 19:16:37 -0800
Tony Lindgren <tony@atomide.com> wrote:

> * Tony Lindgren <tony@atomide.com> [191216 03:10]:
> > Hi,
> >=20
> > * Andreas Kemnade <andreas@kemnade.info> [191215 22:04]: =20
> > > On Sun, 15 Dec 2019 09:38:17 -0800
> > > If I remember correctly this thing is critical to get the hwmod out of
> > > reset but I need to examine that again: =20
> >=20
> > Thanks for testing, yes that's what I thought might cause it
> > too, but nope :)
> >=20
> > We currently disable interrupts for some reason after
> > the first read. That won't play with runtime PM autosuspend
> > at all as we never enable them again until the device has
> > idled. Can you try the following additional patch on top? =20
>=20
> And we should probably do the following too to make sure
> the mode is initialized before we call runtime PM.
>=20
CM_FCLKEN1/IDLEST1_CORE seem to behave, reading also works=20

With these two additional patches this deserves a
Tested-By: Andreas Kemnade <andreas@kemnade.info> # gta04

Regards,
Andreas

--Sig_/pTDkS8g+4Evpb4NGdmMSFgI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEPIWxmAFyOaBcwCpFl4jFM1s/ye8FAl33cxEACgkQl4jFM1s/
ye+XJhAAwAP3mP015ttcaI0o1k+rWARDRYa6ZmIdenggQ1kVJC/wyz81oY+EYOhh
+cjFOKGUHHXDJ8N2HZEqlEW/WamTeTOb94eDD4blf5xcFfqO7TlqcQkZxl++8lJy
J37v+tT+I+7T9j3tA7XlGGy8j5TexKgT0BWXHE9BPryURsA5wANkhLm6jhMxNyWT
ADrM2ey0kMuReKDjCQcJsOapxRs3wfaxKxMs0t93pe7S54Onqr1Eqi6WDEjkJOPD
tClQ4WzEHKad70Whi6jiL/PozkNjB5E6MAaY+uENvHf3X1jcNeJI/63rScJfJGkq
LneGTFeBQ7Bao2bQ/BahxXV9cX6jiZCY6Wsz+ZPizOok3+UWQG5pW0O/DsJ43Rpx
3JEwjtRgyjboj3fH49jJx/5ayHYdbsqyarxoXh9oHpHpcpoU4GT4YPrCQn7QDenB
waDGzKr7DYHZF4T1tA8nGw6uc5C3eSMSIgpwecVb2iBRzdyBRUJg1dPgIuAHQb4K
KXBtkavGIu6mHcqMsCQ1yih8zvVIJnt/A1vo5/flpRY7AQjx+Bz35gZXDYFc/2iI
Xj7SpP8WXDke53CgZLKhayuBRoH08t84w9vrNLA2x7jFmVxKta7T1eu6+j1VxnpC
HdVIAu3bk5YSGE4kh4zg2Y+25hy2bSsQP/rboPD5/deCIFNP/XQ=
=504B
-----END PGP SIGNATURE-----

--Sig_/pTDkS8g+4Evpb4NGdmMSFgI--
