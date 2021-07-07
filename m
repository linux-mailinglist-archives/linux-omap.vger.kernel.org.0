Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E3083BED20
	for <lists+linux-omap@lfdr.de>; Wed,  7 Jul 2021 19:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhGGRf6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 7 Jul 2021 13:35:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:44726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230019AbhGGRf6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 7 Jul 2021 13:35:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34AD161CC8;
        Wed,  7 Jul 2021 17:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625679197;
        bh=6x2K/8dtQPD7TfuQmLGsF4RjEQpumNrlnKWiFjh0lZg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kfz05N/piVj8WvcFIarSCF5Mj7hfDttircIx7N7RVv0NJkUc5F8LKR4r9XFBoraFu
         ihZnG/Ec142GAnEVZ2vsheAUs33i1AWkv8y9a7fgGqdcnA9IKDQ9EAYaX8gIzECfjF
         nZ0at52LqNeL9KY+kWZl39BnIHG///0KvEU8H2E8oy5VGegYCFtfhLgZkw9MQ9gS8c
         3Atzyp1CPWzAXHNxS8KOKEalI7xbbJk4znDK84HhMmlp6kJoQgPUDprnENtZ6X7UIO
         rCNFDfX/p4ahRdBTf62J8UPHXhUkO2G87Q4ejNL0e8+bcKVhwRGGvv5a+FAQs2m4gH
         u4UGQLMnF9qHA==
Date:   Wed, 7 Jul 2021 18:32:45 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc:     tony@atomide.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
        linux-omap@vger.kernel.org, hns@goldelico.com
Subject: Re: [PATCH v2 0/5] ASoC: ti: davinci-mcasp: Fix the DIT mode and
 OMAP4 support
Message-ID: <20210707173245.GK4394@sirena.org.uk>
References: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UUBKWyapWpFAak7q"
Content-Disposition: inline
In-Reply-To: <20210705194249.2385-1-peter.ujfalusi@gmail.com>
X-Cookie: I will never lie to you.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--UUBKWyapWpFAak7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 05, 2021 at 10:42:44PM +0300, Peter Ujfalusi wrote:

> Mark, Tony:
> The ASoC and dts patches can go via separate tree I felt that it is better if
> they are together, at least initially.

I'm happy to take both through ASoC?  The patches look fine to me.

--UUBKWyapWpFAak7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDl5T0ACgkQJNaLcl1U
h9AbPQf9G9VBpfX/XZMST84thd5Q01UVglI7YPXJPFBONmTR4yiIMZdU/FYDutSd
tkyL1QA6VVLZ5zN33dDuPBX2o0qSFqEqWimOqakg0y771o+I5gQ20qiivP4pH1Kg
8VR9w5POi86u+NoiTq6YSWngf96j1LBzMwikwgkW3ouK/nb3nwd5tsIB4wDtFaJu
2/szMqtzxLvuI21UBFY6WI3tI5aX8vfjfnU6Hb6X7Ci1/XRzl8us4u/lLZgbOpvQ
veag2SanI0nh7aDWoQZgspq2Ljfh7KAoeqKkSFdHkpCfAfgbUJtVul7Ij6nMZK4w
Az+dg2VbFyGLs4J+ZQMyieJJFdNwsQ==
=pR27
-----END PGP SIGNATURE-----

--UUBKWyapWpFAak7q--
