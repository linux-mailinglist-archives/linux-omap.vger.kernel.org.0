Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE1BB2B4C
	for <lists+linux-omap@lfdr.de>; Sat, 14 Sep 2019 15:00:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388503AbfINNAc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 14 Sep 2019 09:00:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:56804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387448AbfINNAc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 14 Sep 2019 09:00:32 -0400
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E51B620830;
        Sat, 14 Sep 2019 13:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568466031;
        bh=fnfSGrk8a8UH1ZH/X/H6HhV2yMjSqFE6ewed4hbxMQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UPWIlSX6kZ73vbU2eakauAPRpE82rRgQEYfzg0yohHdjzxojE77MOX6guOGhV8ZbL
         p/IMfBWFnkJ9ZojKcZoUeD3AILshuwI//NAqhpYO4An9MM9dMYf7XJjqRsH/KTYAAS
         Qmx05x1J+MfX/nuNJG4IEiVSdYXsNOvAh5xzfESI=
Received: by earth.universe (Postfix, from userid 1000)
        id 37F0C3C0CA2; Sat, 14 Sep 2019 14:54:27 +0200 (CEST)
Date:   Sat, 14 Sep 2019 14:54:27 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-crypto@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <aford173@gmail.com>,
        Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] hwrng: omap3-rom - Call clk_prepare() on init and
 exit only
Message-ID: <20190914125427.nvbrxoubvll43b3j@earth.universe>
References: <20190913220922.29501-1-tony@atomide.com>
 <20190913220922.29501-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="g7gc3vmijk7ssgbr"
Content-Disposition: inline
In-Reply-To: <20190913220922.29501-4-tony@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--g7gc3vmijk7ssgbr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Sep 13, 2019 at 03:09:19PM -0700, Tony Lindgren wrote:
> Also, we should not call prepare and unprepare except during init, and
> only call enable and disable during use.

Why? Usually clk_(un)prepare() is the part saving most power, so I
would expect the runtime resume handlers to call clk_prepare_enable
and vice versa in the suspend handler.

-- Sebastian

--g7gc3vmijk7ssgbr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl184v8ACgkQ2O7X88g7
+przwRAApx3Dbs6XroHfe+gpVT73gb6Yc5/uExIITkplTaKX/ZIp+4hT0rAj8hzE
ctOOflg1pVF4LsEoF3O8wFbJMeSN9kwxQlP64ckgabIOWHhFRUSR9RHeqBWqUxvY
/KBDidv/6s8qFj26OdczLqUZYbwrE6XXk5aS/rxn+llaftWPLocxUg6PlcQqbhW2
jC9MKKyGN3/3a0AF6fU3nIlTpP5RQr+cxtbrNJ6qbRoKP6n6yMe5xCCERR2CG7d1
ROUdgSTIhDFtCWcfAREKmPJyXUA5XvjUthEzABnC43T6QsSqXARIzJoIt0xT9h/5
kRyxoGElflW65vvzy3JHP3uEkxsTqVZIMS4DKHRuZy6Xa9tN2u0O1c6TdqqAutq+
LglWMiaiUWSsKlN3nLkTO0YdEgnTB3Ygt5hrDDOFn8cgENCpjGEnLd1CbpsE3jIV
o7F1WQxBKoryScoOyaELPwBIUQ2HKxF35nZcpgWJrMFm57Ha5i5Num3cqitH9m1n
WCZM2/bMnJSvJ47tsezdfb0XYM0+01kyJhdytQbFtJzRBQw0bOJT72+AlYp4jIJO
j4JKXOVWPhtxoMpT3RpbNhS6hZ/AK1sxljNaX4O+IqMYhX8l5oY1ct+XDj3/V/fP
UO2+cjB34jZThu+9JByuf4suzcGJXooIFqm8PhTQCwp8w5ONFqc=
=/fji
-----END PGP SIGNATURE-----

--g7gc3vmijk7ssgbr--
