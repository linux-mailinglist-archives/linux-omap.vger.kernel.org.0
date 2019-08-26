Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFCB79D20A
	for <lists+linux-omap@lfdr.de>; Mon, 26 Aug 2019 16:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732732AbfHZO4x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 26 Aug 2019 10:56:53 -0400
Received: from mail-yb1-f196.google.com ([209.85.219.196]:33747 "EHLO
        mail-yb1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731617AbfHZO4x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 26 Aug 2019 10:56:53 -0400
Received: by mail-yb1-f196.google.com with SMTP id a17so5106165ybc.0
        for <linux-omap@vger.kernel.org>; Mon, 26 Aug 2019 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6hfyKYd0YEvdNqhrZ/llU1wywYkV4yJHpi9kLL0jI6Y=;
        b=ayxpSvCkWljK/+/DURP2rguC6LkD6ofMxmzPEI2L40GI0w0UnEWNJsv/ccOnGO3bls
         frWrFojnl6EHpbDZN62u2QVueoYWTbkr9dZG4eIyfiKjwx23JClFn/tQdRFWywekfcfW
         /gqsXjxKCXnFHJrytfIWejKc7Gh3/YPd+HUlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6hfyKYd0YEvdNqhrZ/llU1wywYkV4yJHpi9kLL0jI6Y=;
        b=A9q3Hlc130c+5U3QExYAbslwhNtbhHcqgWEnBUIoGZ2lw1IaY1S2XCKceQtR8hDaNQ
         eZoUpxQVSWD1W36Lr38dYhdg1AiPQCQI6WjCtLITjVeUz28/oCeoltBChbwyJbbCHNpU
         yZaD3D69gCIQsakB1gxFO2AAYUEBGcRImdqOajYMxIKU6wY5mOE9Nd2ucqXxgESop1ZA
         i2PSZk99tKUtcyqaiTYtLFHn8OCNWtJvNOSNizEtvx1z+rN5UAl7fThMLJHIGN2bzxse
         bW5cgltpiOObL4emDk+GOQL6VyMyE7DKbXppC8syWo8dD5pwmh+Nnw2ZEQPxNth/jeLD
         poPQ==
X-Gm-Message-State: APjAAAW2BGvbXD87k/HFVIo6o+z3U2DHCzvlEI+7dKIuNoCgzyfUqqMs
        uYU4dV4RPlaWmmpu4NeKAGP4sA==
X-Google-Smtp-Source: APXvYqwUoyvsI31r417e+6n5wZA+XgTtSpbR5v0gfrhZ5ku0EotPLvfxncg1So1Mf00YbihVNhmhzA==
X-Received: by 2002:a25:ca56:: with SMTP id a83mr12706181ybg.517.1566831412151;
        Mon, 26 Aug 2019 07:56:52 -0700 (PDT)
Received: from bill-the-cat (cpe-2606-A000-1401-82DE-DCDD-18D5-1426-3ED9.dyn6.twc.com. [2606:a000:1401:82de:dcdd:18d5:1426:3ed9])
        by smtp.gmail.com with ESMTPSA id j70sm2559173ywj.94.2019.08.26.07.56.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 07:56:51 -0700 (PDT)
Date:   Mon, 26 Aug 2019 10:56:38 -0400
From:   Tom Rini <trini@konsulko.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        Stefano Babic <sbabic@denx.de>
Subject: Re: [PATCH] ARM: dts: logicpd-som-lv: Fix i2c2 and i2c3 Pin mux
Message-ID: <20190826145638.GW26850@bill-the-cat>
References: <20190820121727.3883-1-aford173@gmail.com>
 <CAHCN7xKBjHP7rHFHk2HfFa9gkmegHLB1qGgLfdJfUZ6PnytPOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="0zDq8CFkxn2hi9iJ"
Content-Disposition: inline
In-Reply-To: <CAHCN7xKBjHP7rHFHk2HfFa9gkmegHLB1qGgLfdJfUZ6PnytPOA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--0zDq8CFkxn2hi9iJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2019 at 02:14:36PM -0500, Adam Ford wrote:
> On Tue, Aug 20, 2019 at 7:17 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > When the pinmux configuration was added, it was accidentally placed into
> > the omap3_pmx_wkup node  when it should have been placed into the
> > omap3_pmx_core.  This error was accidentally propagated to stable by
> > me when I blindly requested the pull after seeing I2C issues without
> > actually reviewing the content of the pinout.  Since the bootloader
> > previously muxed these correctly in the past, was a hidden error.
> >
> > This patch moves the i2c2_pins and i2c3_pins to the correct node
> > which should eliminate i2c bus errors and timeouts due to the fact
> > the bootloader uses the save device tree that no longer properly
> > assigns these pins.
> >
> > Fixes: 5fe3c0fa0d54 ("ARM: dts: Add pinmuxing for i2c2 and i2c3
> > for LogicPD SOM-LV") #4.9+
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
> >
>=20
> Tom,
> i noticed this was assigned to Stefano.  I don't know if it matters,
> but this board is an omap3 board, and I think he does NXP stuff, so I
> am not sure if he's the right custodian.

Ah, oops, thanks!

--=20
Tom

--0zDq8CFkxn2hi9iJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJdY/MmAAoJEIf59jXTHXZSA2IP/iI2MTzmeXZU+4drK0PeSX+D
cDn4r+ll1EXZ77dW7NeYDVjHg/8W6f7UcbIBLW3++zDuGSwX+84Dey843titykQ+
li70a0T/wHyKTzUzD3NPt993004H7zo/u6jfvqXHgMBIL1t1Q+v72Tja9aX8Mdo0
5mYDo5YGD5IzLavpJByF2h1dsYFANcAG0Wp8akhYd2pddUS+aoivO67UOXI9qqkE
UOV8rjELJLxU9iQXTXfNOtB7UbjQtpHRWJAA84PO2NsJtIXirp1qYNP/N9FfWbib
qqm3J7oLxMRORjBxrtzuK3ft6iBE3AfBBa8VpfVVE6vF6ir1SEHw5OXkbhPIDIyy
2WJNIcbJeN0DA8I4p0iu6Kjzlea7bUCoz9VURVsevRgJroZyBfP7y7aIR4RiACb2
zLQtSYBpayvlr0SYJE5wQWbWZTm+QVECEaGJsrBSc/6yCJf9h2hgsV7ZilbnyBlD
EcORsLdGO4ncFA6ZQJDmS/cYjR83GSfBnQ4GHyJUasZ2VLbZcwP7vdoznEkyl7Nh
2Q1nRDCjnXabKlO8MW1VHt158fMENk3D6lTi1N7kF20byNBYluiqM59UvBVHPWM7
swQYcO3hOge340u5JEWj7O901B+rue7tFrTKY8sZdPdfzDfit1FL1873rfx5qGfQ
Pw9JpU1mlJgvVnEG/oG5
=39PO
-----END PGP SIGNATURE-----

--0zDq8CFkxn2hi9iJ--
