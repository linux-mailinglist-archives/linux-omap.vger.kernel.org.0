Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D26E15FDBD
	for <lists+linux-omap@lfdr.de>; Sat, 15 Feb 2020 10:02:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgBOJCW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 15 Feb 2020 04:02:22 -0500
Received: from a80-127-99-228.adsl.xs4all.nl ([80.127.99.228]:41144 "EHLO
        hetgrotebos.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725882AbgBOJCV (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 15 Feb 2020 04:02:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:
        References:Cc:To:Subject:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
        :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
        Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
        :List-Post:List-Owner:List-Archive;
        bh=hAsL6SNdm8O6Wf8bw2uGccXIuUdRAn5/VLXjgsiQZcY=; b=jGBAf09MeINeNkrIYi/egg7iYD
        /57wo8VP+V3DpBomageCHyAh2Dmi02whN47iIJmdp7S0V/KBZFSrWd6GAr8ZqYVgsGAjYgFTuErc3
        5c1OgfxdvsfQdik25C3vzp2yA6pq8LKDgBuFcFNOzig2C59lMuPr91h3Yj3oHS/BtepfU089QO5Ed
        sINPDm6ueY7FdvbSiqwSa5J7uxNdZz/+vCpLZXHVhUxXy0lovhobRwG7pVeKpda6NwlfBd0Bhhs6c
        IJqosy+xfVUMuJyW+s/iHiAbdNBetSYhxpk+lwsTReZ2IhY3KxG9TIxMHW4TOoGePlSPynAXrBmVK
        tihfY9WA==;
Received: from deepwater.fritz.box ([192.168.178.25] helo=[0.0.0.0])
        by hetgrotebos.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <merlijn@wizzup.org>)
        id 1j2tL8-00030P-W8; Sat, 15 Feb 2020 09:02:19 +0000
Subject: Re: [RFC PATCH 1/2] Input: add `SW_MACHINE_COVER`
To:     Ladislav Michl <ladis@linux-mips.org>
Cc:     =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mattias Jacobsson <2pi@mok.nu>,
        "Darren Hart (VMware)" <dvhart@infradead.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
References: <20200214130249.6845-1-merlijn@wizzup.org>
 <20200214130249.6845-2-merlijn@wizzup.org> <20200214191634.GA6251@lenoch>
From:   Merlijn Wajer <merlijn@wizzup.org>
Autocrypt: addr=merlijn@wizzup.org; prefer-encrypt=mutual; keydata=
 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
 /XslHw==
Message-ID: <7520b2d8-d960-e7de-0974-dfc7b708ed6b@wizzup.org>
Date:   Sat, 15 Feb 2020 10:03:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200214191634.GA6251@lenoch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Ae0i3vRij5spopHGE2YcH6eNbPk3uWGI0"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Ae0i3vRij5spopHGE2YcH6eNbPk3uWGI0
Content-Type: multipart/mixed; boundary="wW4AXA8pvVtlPFhsBqWB26rdmBD8K43HY"

--wW4AXA8pvVtlPFhsBqWB26rdmBD8K43HY
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Ladislav,

On 14/02/2020 20:16, Ladislav Michl wrote:
> Hi Merlijn,
>=20
>> +#define SW_MACHINE_COVER	 0x10 /* set =3D cover closed */
>=20
> There is an extra space above ^

Thanks, will fix.

Cheers,
Merlijn


--wW4AXA8pvVtlPFhsBqWB26rdmBD8K43HY--

--Ae0i3vRij5spopHGE2YcH6eNbPk3uWGI0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXkez4gAKCRAGN09rynK8
WtvgAPwOGefaWPi00Kuon7vC8PvgfT0C+olrfTsAjoze1buOLgD/UP6J/5yAqZxF
GHt+4fKqEThSlioyKHaXr0+hIyAZEAI=
=u1Yj
-----END PGP SIGNATURE-----

--Ae0i3vRij5spopHGE2YcH6eNbPk3uWGI0--
