Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EE4D20B288
	for <lists+linux-omap@lfdr.de>; Fri, 26 Jun 2020 15:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgFZNdH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Jun 2020 09:33:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:37158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727845AbgFZNdH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 26 Jun 2020 09:33:07 -0400
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FF6120679;
        Fri, 26 Jun 2020 13:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593178387;
        bh=NmsoXRgCssSYs4IUhkGQnFo/FnSkjhGhZ5xT0o/o4oU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WPL7Q5abEi1z5J0y3JMV3lT4gYPjPxIw1x38FdN8vWnc7OGwPJ9K+siHB3q7N5kSE
         fSF21zITGdt7hRL1l+Agh7N5APMWnBpIVCRee/7+D5tjU5cauTtde6rI1UEIRN0Yyq
         EzJJor08cnbf+Q9kO3lXjZWfGRMccq1vwU48woF4=
Date:   Fri, 26 Jun 2020 14:33:04 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     lgirdwood@gmail.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Russ Dill <Russ.Dill@ti.com>,
        Keerthy <j-keerthy@ti.com>, AnilKumar Ch <anilkumar@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 6/9] regulator: tps65217-regulator: Use the returned
 value of tps65217_reg_read()
Message-ID: <20200626133304.GB5289@sirena.org.uk>
References: <20200626065738.93412-1-lee.jones@linaro.org>
 <20200626065738.93412-7-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline
In-Reply-To: <20200626065738.93412-7-lee.jones@linaro.org>
X-Cookie: You can't get there from here.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 26, 2020 at 07:57:35AM +0100, Lee Jones wrote:

> Until now the aforementioned return value has been ignored.

This is only aforementioned in the subject.

>  		/* Store default strobe info */
>  		ret = tps65217_reg_read(tps, regulators[i].bypass_reg, &val);
> +		if (ret)
> +			return ret;
> +

We should really be logging an error there rather than just returning,
that way it's a bit more apparent to someone debugging things what went
wrong if there is actually a problem.

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl71+Q8ACgkQJNaLcl1U
h9Cv/Qf/cbpYSJEN3jQQV+GzYVRgKls1QC+R6WOmUqdD1mxNB8EKYK+8Bs0aZpYu
TPOF18P4n5abjmA+kGQI3GMs3CtH3necUWYX+OQa/Fwm7jTEeeknggKxPAVkSkgv
KivMKlw1QwmPrqjMkSBa4ureSmHNxTunw3UR6wcPyD/qW3LZOyqzqgfPa9hh81N/
cFkARnxTTraSFxGT1rEr99aQ1Bo/weYJJiFLrX2D/w9UG1R+SE5Xy6Qb/XYQoXKo
MyaOPHu8CrC7QgrTiCxuhO4WugOVp3+yGo6QfUgQaikdOJxj1XMM03XazMyDuIBw
x9MJmWAaFVaM3nQhTEfznSH1haFGjw==
=0sq/
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
