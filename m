Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DE1434855B
	for <lists+linux-omap@lfdr.de>; Thu, 25 Mar 2021 00:36:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234193AbhCXXfr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 19:35:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:36222 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231386AbhCXXfa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 19:35:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BC29561962;
        Wed, 24 Mar 2021 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616628929;
        bh=ffEX2jF8yikBiJK1Or5nM6+CCATa+j1nRlUYPlnzhAc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iLU6+H8cJwedFtjmab8Eidwa2OV/i4C7vGkaHaC7Ud55oR0+BCk3KOiQAz2i5/Ncv
         gLYBZnxvX+20IMizc4h4yHSTUASV/G7gxPwEXXIiJb1TtrOxsgw/8r2FHshnvI3Yi0
         aGv21x/0YGVXuMCX2UfowgMQ1UgqoCEY6hKcI++UAFvH1TXADIeOdvBD+YqPJ9lERp
         LCQhA4jcdvTpG4zPRXkjdJDEpYTf9F9RtRk1SqCW4KeQioRODwhpkfJHwEJ7onlIWf
         zwMm2hsCHmb5ySHFccBnSW9Z3/05b6hng/YLakjDMj1mPlnhjWqY9Zm/E7eUS39WNX
         /SsbvHu9mSYlA==
Received: by earth.universe (Postfix, from userid 1000)
        id B4A0E3C0C96; Thu, 25 Mar 2021 00:35:27 +0100 (CET)
Date:   Thu, 25 Mar 2021 00:35:27 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     carl@uvos.xyz
Cc:     Pavel Machek <pavel@ucw.cz>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        devicetree@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: add battery phandle to cpcap_charger
Message-ID: <20210324233527.3kb7misyckzwbf4o@earth.universe>
References: <17864ff0d6d.6fcdc75d-1677305881.-8147809712278605057@zoho.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4r2bnwfzqoytdwri"
Content-Disposition: inline
In-Reply-To: <17864ff0d6d.6fcdc75d-1677305881.-8147809712278605057@zoho.eu>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--4r2bnwfzqoytdwri
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 24, 2021 at 05:08:58PM +0100, carl@uvos.xyz wrote:
> > I think the patch is also wrong, since the information is already=20
> > described in DT - just the other way around: The battery references=20
> > the charger. This provides all required information to the kernel=20
> > for a 1:1 link.=20
>=20
> I added this so that cpcap_charger may become aware of the battery
> insertion state by querying the battery driver.

> Would you thus recommend that instead of adding this phandle i
> should amend the series such that cpcap_charger walks the tree
> looking for a cpcap_battery compatible node and then determines if
> the charger phandle points to itself? Is there some recommended
> way performing this reverse search?

I was thinking of creating a new core function to loop over all
supplied batteries of a power_supply (using psy->supplied_from),
but in this specific case it might be enough to just use
power_supply_get_by_name(). As I said, I have not yet properly
reviewed the full patchset.

-- Sebastian

--4r2bnwfzqoytdwri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmBbzLoACgkQ2O7X88g7
+poPKw/5ARbxyRPIjhsMO4FoW/i1aNj/UGBb1BT+KAkUOwW3oVWWzNYLNy2zvTb+
AkWfyKybFvJKhbYiw0AtGGDPbMGS/nUE+rrdvz5n6QX19dZNxsy9RKif/GV1wFef
wGtEEa8vUUOhmWpAvoy+Fa0KYSYSFwkt1cQBPP64cRrjM5Tlu/9F6Es0DCBn/57R
MA7O/He3rcPjvi3zrMOGkKWt/qWuikAkoaoZWoGOKckh3Qc8uo+bcOMJA9YDHvnq
UFDk4WfOaWGXHK7rp5EowajHJ23+UE1IxrHPM1/R3wp2tzcpNOgoOulCoyY21qOr
VfHMV4KPNZaTqFKBKWp2R7XISHCcKvmR4gFxaQl+vbat3vkBkFGIvzYcH8051aEC
4WxfUR5GMfA8IhvJbmlzHPP/CofWYI4NYm6mkpm0ilJm3AqsKVcuKS9pfR831mi/
em3htYf8IJUMmiazy4W0fgStU3xBi9BXCAHz0EA0js8rnaly/k8iSLyNbop+KpDy
nlps3lY5HO6zCN39yUve5HFk3KZIFgmOzX5X1zlRFfJY90j035CzNSAXF1/IM3Y6
UnC7s//zcAAnVImvUPCSjy4KDIXMgvyhoj+pDU1/tYRJ5HGI25K/1dxzaKyH91hJ
ZJ8TitWsVR/BPEffai3AQhH6l3JQcTGK+EYDU8m4N1wNgiwjKn8=
=DPKS
-----END PGP SIGNATURE-----

--4r2bnwfzqoytdwri--
