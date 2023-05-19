Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95FBC709B07
	for <lists+linux-omap@lfdr.de>; Fri, 19 May 2023 17:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbjESPQp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 May 2023 11:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbjESPQp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 May 2023 11:16:45 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 048E3CF;
        Fri, 19 May 2023 08:16:43 -0700 (PDT)
Received: from mercury (dyndsl-091-248-213-050.ewe-ip-backbone.de [91.248.213.50])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: sre)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 74826660298C;
        Fri, 19 May 2023 16:16:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1684509402;
        bh=gG0TdTUi5TP/4YlyrfonnMyAjHXDOX3bmS2Dy34e5O0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f+XzWG3jZXvr2vEEX7lzfx+9cOzVSWywgqCvOHoNGVMRLZtbtZtRpwsuXvGSvWnr5
         b8odGKRK1MbIVBI1uowyvC3gs458wWG3oNjQ1OyazofhM5x07oY4k1a2BoDXIGhH72
         ksbmFFlPYmB2a/IJn21E85kst5QyUU80Pr8si2FzYpASCMnoD6GDjP6++UFxouL66w
         6t0QUQ157qlDwDEHjrHvl/xTk/685hTBQ1kJGm03jxfigvrpc7cGW3UCi8CYQmY3GH
         tZkNQkpJGwpOueUBDP3tS//Azc3+craNpSY7cuEgOivTfafKWwMDfO5R0gjypgHV0z
         Ms5q6Qj+0oiJA==
Received: by mercury (Postfix, from userid 1000)
        id 82E90106138C; Fri, 19 May 2023 17:16:39 +0200 (CEST)
Date:   Fri, 19 May 2023 17:16:39 +0200
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: Mystery dtb check errors with ti,x-plate-ohms with txt only
 binding
Message-ID: <20230519151639.67s2gapqplys7gva@mercury.elektranox.org>
References: <20230519071359.GW14287@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="xs5semub2dxxej74"
Content-Disposition: inline
In-Reply-To: <20230519071359.GW14287@atomide.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--xs5semub2dxxej74
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, May 19, 2023 at 10:13:59AM +0300, Tony Lindgren wrote:
> Somehow the ti,x-plate-ohms property produces errors for nodes with the
> compatible only in a txt binding that still uses /bits/ 16 value:
>=20
> ti,x-plate-ohms: size (2) error for type uint32-array
>=20
> For the yaml bindings, we have ti,xplate-ohms so far only defined in
> Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml.
>=20
> So for example, compatible =3D "ti,tsc2046" that only has a txt binding in
> Documentation/devicetree/bindings/input/touchscreen/ads7846.txt still
> produces warnings somehow based on the ti,tsc2005.yaml?
>=20
> Any ideas why this is happening?

-ohms is a standard unit suffix and thus the property gets the type
auto-assigned:

https://github.com/robherring/dt-schema/blob/master/schemas/property-units.=
yaml#L64

-- Sebastian

--xs5semub2dxxej74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmRnks8ACgkQ2O7X88g7
+podIg/9EnB+CkNHLvckxinfza4wMPOk8aisgDoJtVQC4Rwnwxr5+nBQIr+d2vIc
IXaA1R9sVyUD717OKv4FD8mWbBwW+kL0Ns93khDHL4ovQlHK3uc/vrHzrb+zZryC
Wd0BM0aC/3k4FE7QNnsAuauJy1c8xVD1WN8BMT3qeEJt6eHASX2JunT+/EWbWICy
0Aw52jIhxtkm9XjMz2gO6Fds3ePZqws/Nf2xPFl9nFQsUDSqbnllPj7SzUcKndVg
gp/ZKAWrz1UB1A+CdKGoThbk1hE4qtRDzCHeXRl/ZiLy7PRmktaBcrtbhIM4Y3YD
ieHwj0eWCWnmX2xMxa5GHiXfztgMIohkiUIGnko0POAeUyOycHzcMPoPneSWb998
DLUfYNwgqxWOERXbMuKl8HFh8x3rCaiCKSGvhw0K9FRY6xcQOu5c2iFb6uaCMYbb
H6RAFzTEZBO3Pfo1ZqRL82+sqladtk2COmNen2798yrFFKRzelBNwwLDMIDHzvil
HoQ8xAmu7/mt8C5UDKpjkwJkKLvxSpjqQbBemyOg5bHDTOnpwGoaFRzi2zSL/P0d
k8m7u+jBuA06qk2X4ouDRP7HMxY5Ld/6DYa1XLdXgxoz/U2Qoqz9xdCcSS9mdcNK
rytb6d43iNq0I+n8Np0TqEbCvuRFX6GAviUVZ8g40rjovzxfZEQ=
=QDkN
-----END PGP SIGNATURE-----

--xs5semub2dxxej74--
