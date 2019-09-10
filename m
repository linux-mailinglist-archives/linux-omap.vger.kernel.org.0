Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673D0AEFB8
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 18:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436807AbfIJQjL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 12:39:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33101 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2436774AbfIJQjK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 12:39:10 -0400
Received: by mail-wm1-f66.google.com with SMTP id r17so182683wme.0;
        Tue, 10 Sep 2019 09:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9rKDGY0MFRZdaZnKSd/lS4UFdLIc/jP8nB7azl11tUI=;
        b=HEbLn3aBGyeecdNNQoeWj1L/XGqtVDfOU6G40udwnVXtfE77N+9FiOx6GFPmrarF23
         uG86Bu6HC3lbUTmj4o4UzYM/gWF6OPUKCeVbpknYQRGnl2pjf8f43WR3X4kP2eLfaZDo
         +poowPimf25Itf9lw/jXbWbDJKrNNKdyJ6iJOuueCCB/TYFEgxn2ujlTosLmOxJ7EPt2
         pkv3r98dWM4mDIg/RYxK0b+eBReztnhW/MH9vPLmp6sADnOxlCAovYJQBFZJM3uSO+8Z
         8wntJURcOMWawG2co7C3/v2WiW/CFH5PRvEfAYj1/Q1VNYxYv0jzRpbhnArMv1RauHSN
         cGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9rKDGY0MFRZdaZnKSd/lS4UFdLIc/jP8nB7azl11tUI=;
        b=jA+9yOTU+lwpBHiEbbqDGn/x+gVB3W1b9mODxMrlvVUqzyCa6SamctO1+xVI49zPuU
         v8u4mPACq2BqRG/ZCneQO91K+bDahwZaxYk8eOAB8WXuB6X6G2JkL9EvLc9ECh0tfYie
         RD/pqPBTljWyuXiFCUh5ZSAoY/En63c3iMWsVxiJaDEnJxbl1PfHxlVcfFhT0k5tAobW
         foZDm0YKsA9Gw4jySYC4jzuW6xjJVAutWGkHuF7RqIPOpaRJ9GrXtmVrr0v3jDcMFqXN
         1PeguHtbGrlqUBL4Dr4eyNYmy881NUXgKdmaLsmQMGiyH+GhdjmHWnO1fjm9pHcAGFZj
         aWKQ==
X-Gm-Message-State: APjAAAVu9kj28tcY5e65e8SwhB1fHRsVpPdidS3fz4gqsxYPh14cNvfy
        xWmQAYABjH7pZCnGmCQihq4=
X-Google-Smtp-Source: APXvYqw8ebDZH4F2c2uP5ThFXATEfOpH3jYOedzlB19JXj1slg+OSeGXmoaNfo72UIw0B5JqjcJGZg==
X-Received: by 2002:a7b:c447:: with SMTP id l7mr306535wmi.33.1568133548709;
        Tue, 10 Sep 2019 09:39:08 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id r65sm293647wmr.9.2019.09.10.09.39.06
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Sep 2019 09:39:07 -0700 (PDT)
Date:   Tue, 10 Sep 2019 18:39:06 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <adam.ford@logicpd.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
Message-ID: <20190910163906.ypyeaido6h4nurvv@pali>
References: <20190828150037.2640-1-aford173@gmail.com>
 <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
 <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
 <20190909134033.s26eiurpat3iekse@pali>
 <20190909163543.GQ52127@atomide.com>
 <CAHCN7x+t-OVRE7pVM4V87_YMWpgO+_Vashfn1s5msoqC5eiwTg@mail.gmail.com>
 <CAHCN7xLaGQMM67VC-2_G8XC7UuG4c+TbbYb4z=ibJwZsQF4YVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="v7pe77r44rvnt7o5"
Content-Disposition: inline
In-Reply-To: <CAHCN7xLaGQMM67VC-2_G8XC7UuG4c+TbbYb4z=ibJwZsQF4YVw@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--v7pe77r44rvnt7o5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tuesday 10 September 2019 11:21:34 Adam Ford wrote:
> According to a note in omap_hwmod_3xxx_data.c,
>=20
> /*
>  * Apparently the SHA/MD5 and AES accelerator IP blocks are
>  * only present on some AM35xx chips, and no one knows which
>  * ones.  See
>  * http://www.spinics.net/lists/arm-kernel/msg215466.html So
>  * if you need these IP blocks on an AM35xx, try uncommenting
>  * the following lines.
>  */
>=20
> I decided to uncomment the hwmod entries, and I got the following:
>=20
> [    0.263222] omap_hwmod: sham: _wait_target_ready failed: -16
> [    0.263248] omap_hwmod: sham: cannot be enabled for reset (3)
> [    0.265837] omap_hwmod: aes: _wait_target_ready failed: -16
> [    0.265851] omap_hwmod: aes: cannot be enabled for reset (3)
> [    6.208866] omap_hwmod: sham: _wait_target_ready failed: -16
> [    6.287732] omap_hwmod: aes: _wait_target_ready failed: -16

Hi! Same errors I got in qemu-n900, but not on real N900. So I guess
those errors means that IP blocks are not present.

> Based on this, I wonder if the sham and aes modules are not present.
> If this is the case, it might explain why I cannot use the rng either.

Probably this is the reason, you do not have crypto/rng HW engine.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--v7pe77r44rvnt7o5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQS4VrIQdKium2krgIWL8Mk9A+RDUgUCXXfRqAAKCRCL8Mk9A+RD
UvMwAKC5PytcObjM5hlbkUO3+dfjWZwPBQCffPh8UWUkmuzDbXQs1ybxGZqap80=
=Gd7N
-----END PGP SIGNATURE-----

--v7pe77r44rvnt7o5--
