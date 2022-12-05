Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67743642F77
	for <lists+linux-omap@lfdr.de>; Mon,  5 Dec 2022 18:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232536AbiLERvq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Dec 2022 12:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232887AbiLERv0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Dec 2022 12:51:26 -0500
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD497248C5;
        Mon,  5 Dec 2022 09:49:01 -0800 (PST)
Received: from mercury (dyndsl-091-096-035-193.ewe-ip-backbone.de [91.96.35.193])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 77A5F66015BC;
        Mon,  5 Dec 2022 17:49:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1670262540;
        bh=EN7vOdDtU16zR3wMYmUnijJWLV25CQBQa2ccyrarwdE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CqVMgRXUS7CTXTDs/OiPG5jDPIbk5lygaQxdeVMGp5HWmnhehMXrAU4KzPoxxw4kc
         P7VehkucF+Xw5co/WorTU9CmK4QBKlqMo9R5b2nP3+ohRgtHr81ztQlg33up3lo7iA
         vCZRx5XvQ6KbkGITZ2TTaxc7klBz2rdUM805JGjwWt5ai0PpGkUkDSINA9Yo+WeC2c
         ZBhCSTgyj1g5rvIPTOSBfb7btgxfLCAevaSDZoV+kvIMp3pfW3jwkuAAA8i+eTFU2b
         KR7LBBjepsDos7Aspy+1baTFFYlM2LQIX1EY4DA3c1N46DQ8qbYLp4D3n6BBjP0SbA
         CEzgo87wshIsg==
Received: by mercury (Postfix, from userid 1000)
        id AA6451060F2F; Mon,  5 Dec 2022 18:48:57 +0100 (CET)
Date:   Mon, 5 Dec 2022 18:48:57 +0100
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     linux-omap@vger.kernel.org, tony@atomide.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] leds: cpcap: make leds-cpcap an independent platform
 device to allow varying led setups
Message-ID: <20221205174857.asf6uant7ve7k5pe@mercury.elektranox.org>
References: <20221204104313.17478-1-philipp@uvos.xyz>
 <20221204104313.17478-2-philipp@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="em3uei6ijrssfsui"
Content-Disposition: inline
In-Reply-To: <20221204104313.17478-2-philipp@uvos.xyz>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--em3uei6ijrssfsui
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Dec 04, 2022 at 11:43:11AM +0100, Carl Philipp Klemm wrote:
> Previously led-cpcap devices where defined statically in mfd_cell
> of the parent mdf device. This causes issues for devices like
> xt875 that have less and different leds than xt894. Splitting the
> device like this is posssible, as in reality the cpcap led ip block
> is totaly independent from the mdf device and cpcap core.
>=20
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>

I don't follow. Can't you just use 'status =3D "disabled;"' for the
unavailable nodes?

-- Sebastian

--em3uei6ijrssfsui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmOOLwkACgkQ2O7X88g7
+prbqg//acIuGRi5cNFsSNfLCR5nrlaBI+WG/Kq3YFWw54nXI+L5wTNGT3iwFoeq
OBUvz/fWrFRBHVuzOf/BJP3rP3+QLYBBlNxgtIpw3eCXK0GwXs4cslkdsqVmhh1x
TZ1i+o4Do3MSEZWOIgNbBwBgtW+YOb96702hSy9OczP/siV9LE7jQVH2LRzOoSlx
MlIQ+j2ufrh1J5rvLCGEwVWQVBIfxk/addOpbzkdKWvipnS5Ra/S7GfDX5ZWgWIR
2OnByICmJZhpsH5B8fj18u/Q9kKpjoqwJp8ZzC+262eGs1HEAoibwy7eNyoTnXIg
zPSeVN5jOYx0HIdbETcO6ltS/h1zydJJ9vlKCejXFmsmyjAdm4pRfvaNPJJ13K7j
5k6sxokju9Gg6UY74uzpTZGXmFJ0z0EULEAtOdSgw9qFlyQx24ag73agvq/g7CTu
5+fKa/mq8ckqv0F5vv+PKCJ6aNgYFFc6xPJb0Ba/8xEuPRXZ9s2kcPKcHLd+A9rm
kJgfLC6VkYvW36tN/WGvsY4ApJuShtpo8TKEGUmGutPEqtaKo2hTzI27Xh8YpgwZ
3MVlhDVtRRgapqf9fDCgNQU1HyENxrygK8XSumcPSLnM0HaAxgxxAF80c6Y6q88c
QHbN2+XjmpUyaLDwxjfpAIbU+pXLljqa+Ebp6UxyQpJTPX71fUQ=
=AqBd
-----END PGP SIGNATURE-----

--em3uei6ijrssfsui--
