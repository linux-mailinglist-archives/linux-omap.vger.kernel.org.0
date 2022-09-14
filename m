Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EA295B84F8
	for <lists+linux-omap@lfdr.de>; Wed, 14 Sep 2022 11:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbiINJ3w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Sep 2022 05:29:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiINJ3c (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Sep 2022 05:29:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E124389804;
        Wed, 14 Sep 2022 02:18:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3A7D61A88;
        Wed, 14 Sep 2022 09:18:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72907C433D6;
        Wed, 14 Sep 2022 09:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663147088;
        bh=UHQJoSkLYmXYza4glAH1ozt2TZVXVau7q0IPkofdgoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u2Y7MMFuI342ZmPmtE+Xo03E+MrtfhFYlhl2SviNtwsHfnhr3obWyd44/uY4TvYpR
         Bc4lMagIoEPLocq+ECsXNYcns7mNBjfOpGdDoJnkOHZO9YbsH6ULFsiWTVaf5Z9OVw
         TSplM15Y02O7f11GPwn2OhOJo+OR2c5i57+RI0uhrqrMQao3Onz3Ke7CZMkvQCEWlT
         f3SxREaoaB9ds5x0Yx7kMjqDdfSkYz25GMmqZ84Ik+4m8zi1ti/cgJHnKoZPjQnx1k
         cHQhtyZcrwaGYUUm2Uz//VSGq5ILHStzPOjkHy7mYUgWb9vkzPsRmLEaNCVl8x7QFz
         fE5e0OwJBi/Hw==
Date:   Wed, 14 Sep 2022 10:18:03 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>
Cc:     rostedt@goodmis.org, mingo@redhat.com, linux@armlinux.org.uk,
        tony@atomide.com, bcousson@baylibre.com, paul@pwsan.com,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        stefan@agner.ch, rmk+kernel@armlinux.org.uk,
        linus.walleij@linaro.org, sebastian.reichel@collabora.co.uk,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] ARM: s3c: remove orphan declarations from
 arch/arm/mach-s3c/devs.h
Message-ID: <YyGcS+SX67rjQSk4@sirena.org.uk>
References: <20220914034615.1240860-1-cuigaosheng1@huawei.com>
 <20220914034615.1240860-3-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Z3UFEgAeoGv2ULf4"
Content-Disposition: inline
In-Reply-To: <20220914034615.1240860-3-cuigaosheng1@huawei.com>
X-Cookie: One FISHWICH coming up!!
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--Z3UFEgAeoGv2ULf4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 14, 2022 at 11:46:14AM +0800, Gaosheng Cui wrote:
> s3c64xx_device_spi1 and s3c64xx_device_spi2 were removed by
> commit f1ba938e4f98 ("spi: s3c64xx: Delete unused boardfile
> helpers"), so remove the declaration, too.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Z3UFEgAeoGv2ULf4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmMhnEoACgkQJNaLcl1U
h9An1wf9GnRFeDEorlrW4PsHe24zynUBiEXNF5FZxlFsiEiklvE26GGQH2Y4WA8p
/f26CiJeaQ4bskOWw6zVGJytKs5oUyOKAuFV1op7h0JDJ0SkCUExhqBT0AeCF5xY
sQ9uLLwLMhVGs7ZtQGhKLd834MKTSr/lnCA2wR9I4DETBOTvmi2dUp9KELhfSDlE
GGIw9V3HZwMPAmPgCUV36WgOP1xWJRCg4b3m0mklhAFYqpKOyHsSPc8E/lXbjCLk
kT+mXwiTB8kAKYpurqvzlz3ueqzoP7Bb5qM4Xvj3s4np6a4ajHUITAHASJrRrbq2
TcgJd8b1Eeoc/ygXBILaewFfGF3e9g==
=HvVZ
-----END PGP SIGNATURE-----

--Z3UFEgAeoGv2ULf4--
