Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 662D91F2D2
	for <lists+linux-omap@lfdr.de>; Wed, 15 May 2019 14:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727799AbfEOMIE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 May 2019 08:08:04 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38396 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729172AbfEOLI5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 May 2019 07:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=ToVh8Upo0GLQhDEVaV9MC0FbfEVVYTO7nwOGlhyfbKM=; b=FKKAFpRcA4vfKWW+aLFvmH42Q
        UC5vKw4w7g5FDQP75Xxz2BoSkqC++3N5akLiOMlKsVDSd5ChPubvwsv9OrOIi2ksD5rOtN3FXWcR1
        2+JsIq+JpZtLIc6uv7B7IzqB8Uorrvze2xNwCE4fbtCXY10Jzyg1uZFFX0aYHB9uU3hq4=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hQrmF-0003av-Qk; Wed, 15 May 2019 11:08:51 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 320B91126D6A; Wed, 15 May 2019 12:08:51 +0100 (BST)
Date:   Wed, 15 May 2019 12:08:51 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Keerthy <j-keerthy@ti.com>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH 3/3] regulator: lp87565: Add 4-phase lp87561 regulator
 support
Message-ID: <20190515110851.GD5613@sirena.org.uk>
References: <20190515100848.19560-1-j-keerthy@ti.com>
 <20190515100848.19560-4-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="q9KOos5vDmpwPx9o"
Content-Disposition: inline
In-Reply-To: <20190515100848.19560-4-j-keerthy@ti.com>
X-Cookie: You will lose an important tape file.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--q9KOos5vDmpwPx9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2019 at 03:38:48PM +0530, Keerthy wrote:

> @@ -172,6 +178,9 @@ static int lp87565_regulator_probe(struct platform_device *pdev)
>  	if (lp87565->dev_type == LP87565_DEVICE_TYPE_LP87565_Q1) {
>  		min_idx = LP87565_BUCK_10;
>  		max_idx = LP87565_BUCK_23;
> +	} else if (lp87565->dev_type == LP87565_DEVICE_TYPE_LP87561_Q1) {
> +		min_idx = LP87565_BUCK_3210;
> +		max_idx = LP87565_BUCK_3210;

This if/else chain should be a switch statement.

--q9KOos5vDmpwPx9o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzb80IACgkQJNaLcl1U
h9A6lAf/e30hsZKGBDMeaM6cCqdg269DLgcFARjKCZ3zp0sp3UYHDCU7I7eBAscT
wMqHKpBrhHVyS6swCG7Lbsy2xywm6b77fSxxvZiWPnsdgpDHjLrzbqu2nZvA8UpD
8eXgfB8yOY1Pqw0Z9zJ55C26c+sjROltuBsJ1fGLo2HcAlSAPZtFu+zehJYKRUVq
lrDGdgNGnXlxnZMVNnnAWNFCFZONW+rwZOVI9tdV8VqDX8g096T4/ZhFxVdTW3jU
yMTcqq/1o12IRB26NToSf262mMa0g5ppI0k/Gq9SOFwhsi4ssXsHik2yceV0jOcA
KadxC1Bmn6nfUWoNpZx2mjgylXOV8g==
=dLEO
-----END PGP SIGNATURE-----

--q9KOos5vDmpwPx9o--
