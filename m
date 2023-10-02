Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22D0C7B519F
	for <lists+linux-omap@lfdr.de>; Mon,  2 Oct 2023 13:45:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236789AbjJBLpf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 2 Oct 2023 07:45:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236802AbjJBLpe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 2 Oct 2023 07:45:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FD3AF9
        for <linux-omap@vger.kernel.org>; Mon,  2 Oct 2023 04:45:30 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C067FC433C7;
        Mon,  2 Oct 2023 11:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696247130;
        bh=bMrSRUgpXJH0CVNYlsj0cGsTOKkjL1dKbLRqtS4uC0A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TEARdE7MMq0KRwF93d6lYooyL23xE9xprPr8ge729FaO3B7vrJhcI1Y1M6XrV/qP5
         360f32q1g2wrqZCiIHys8sn+AMi5G85h+rAW6XYtO319lKeXWMeTeYP4lPdtQGZhPv
         L3b0di1KwkBwk4wxTJpWXB58c7/NMvdK9z3ZajIIOlBl9RlhLhR1NL5HiVv/3wkGg4
         IdmvHv0hEXiB+rYpDOBNxjpiu5NJWCwRPAay1LTYJXjGqzHOuujz0h2SbzupTGP5GP
         rSYX9UbzjIy4dIGhk2751CTGsa7dlkUr40XFXlrp9R6kMJRze7U2kaW7NylGVsbJcy
         Jdn92M4So/rRw==
Date:   Mon, 2 Oct 2023 12:45:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH 0/5] GPIO descriptors for TI ASoC codecs
Message-ID: <5d855200-13fa-4c17-80f3-bd10f3507c2d@sirena.org.uk>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
 <4eb93a15-6e6b-4b81-aa3e-d78d7ef9476c@bitmer.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="j5T0cNrsIFAwur+z"
Content-Disposition: inline
In-Reply-To: <4eb93a15-6e6b-4b81-aa3e-d78d7ef9476c@bitmer.com>
X-Cookie: Postage will be paid by addressee.
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--j5T0cNrsIFAwur+z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Oct 01, 2023 at 08:49:12PM +0300, Jarkko Nikula wrote:

> And to 2/5:
> Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

Sending this on the cover letter in addition to the patch itself (which
you also did) confuses tooling since it can't read the words you wrote
and think the tag applies to all the patches.

--j5T0cNrsIFAwur+z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUarVIACgkQJNaLcl1U
h9C0Fwf/f6xhpQACSpxT+gE/sGNodFDyoSXDOLievp3xxMP80KDAhaO7bPKL6LbA
nxqJ/kyYuEIHvucMlbTGjnNw5DD7/1WvLItcsu2DWPb/Hb+wVv82EX3mZOPJotWH
+w+q5AOBTkkJPLdxUVT1g+cGzrNv7q15PpokqM3NwLzIPEsyamU0uWsFFX5qpdm1
N57fJKXS/yvaBJwmBejs7tmTd2qBgHHk+nN4912n+f9fPvBn/WYBKMC9RlmoSumi
OtHAU4GIsJtTPkPyeKF0aoRzk8yw4sOd8+2yYMXFXMeBlSwI1RTddrsL9ZpyjTx+
PCpZAOSkeHUcEQ0W9Rx+ZXc+AbQKqQ==
=dTGt
-----END PGP SIGNATURE-----

--j5T0cNrsIFAwur+z--
