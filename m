Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0BD8DE06B
	for <lists+linux-omap@lfdr.de>; Sun, 20 Oct 2019 22:34:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfJTUd4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 20 Oct 2019 16:33:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:52382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725941AbfJTUdz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 20 Oct 2019 16:33:55 -0400
Received: from earth.universe (cust-west-pareq2-46-193-15-226.wb.wifirst.net [46.193.15.226])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2AAE321928;
        Sun, 20 Oct 2019 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571603635;
        bh=VKo6tnVqdhqTowY1VnS1hBJGvtyol6K5bDgkYDXR64Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nefM2rBeS7MO0nW8qLsuoMl/A6qamPKWt68X8Cm3qyFFQIRkI5iOYSw9OqkEvIpnv
         350SJawfCGWveKacCRkVfnQljtNRe6kQ5mv5mvb9fQQywUbab6v8UK4VeaSoxv/2lC
         BckYSV6oc4i1JAiLOPk5detrPTAY+zzY5vlHS2AA=
Received: by earth.universe (Postfix, from userid 1000)
        id 000B13C0CA0; Sun, 20 Oct 2019 22:33:52 +0200 (CEST)
Date:   Sun, 20 Oct 2019 22:33:52 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Marcel Holtmann <marcel@holtmann.org>,
        Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv2 0/4] Convert all btwilink users to hci_ll and drop
 btwilink
Message-ID: <20191020203352.rh3n6qpagiyift7d@earth.universe>
References: <20191003134147.9458-1-sre@kernel.org>
 <20191008143116.GF5610@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="sm5ahi5a3wy7vwrr"
Content-Disposition: inline
In-Reply-To: <20191008143116.GF5610@atomide.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--sm5ahi5a3wy7vwrr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Tony,

On Tue, Oct 08, 2019 at 07:31:16AM -0700, Tony Lindgren wrote:
> * Sebastian Reichel <sre@kernel.org> [191003 06:42]:
> > This moves the remaining users of btwilink to the "new" serdev based hc=
i_ll
> > driver and drops the btwilink driver afterwards. The patches were only =
compile
> > tested by me, but Enric tested the IGEP platform and Adam will test the=
 LogicPD
> > platform.
> >=20
> > I kept the TI_ST driver for now, since I plan to send a second patchset=
 for the
> > FM radio driver. Once the FM driver has been converted to also use hci_=
ll, we
> > can remove TI_ST completly.
> >=20
> > My suggestion is for the patch handling is, that everything simply goes=
 through
> > Tony's tree.
>=20
> Sounds good to me, good to see kim gone with patch 3/4 :)
>=20
> Marcel, care to ack the old driver removal patch?

Looks like Marcel missed the extra messages and merged the 4th
patch, so I guess you can just merge patches 1-3. Technically that
might lead to temporarily missing BT support on those two devices
when the BT tree is merged before ARM tree during the merge window.
Not a big issue I guess.

-- Sebastian

--sm5ahi5a3wy7vwrr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2sxK0ACgkQ2O7X88g7
+prIog//SHiTMzn4T99dMKj3MWuzk7SikJRKPSRc4rnLfbXHvx0WAXEADzr/fabi
8Ek3V2rGN7RUAQmXvkqI2+cUVs/9+EwGjW2NfVvDECrhaitscUuX9IJ7+lQ3Mw4j
eptrRQkRQtdmlP1ppPL5m8zBqomcGSMZnOwmYMuUA/Sh8968iQkECsqvUKsC5A08
QpBNlLw+ZQgA8/C7/87ZiBnyQNr/EG+KSQCoKxVg8mt390DA3gMLCwLrbzqznDVB
Q7ZZpxcRovyuVxDPHqzvHLcCKPWCbPIQ1mToXIGWaAkkzbRBON28UhRed8nvXT5Y
ctZffUovpG3iXfpg7WmxMqZIf7X7wAHVbDakDIrrqgxn+WCOAUqKQ/kzFwi1P8fE
sY4TwCTxZDpvGuTVNov+Rt1RMgEesNWT/wCVaLIA3xDSGzbz2hY9xImVrZ7WfFaA
NelFzGcuNsdok3witPD+pf/kyULA0FE3bjS4yP1vrxqvB4TFkjAayPaTsZmteevA
DZTKOEToREcx23/D6eXQtL5u+Y0tYlWAqXxGKSqj5NeDnykaRvXHEpyAjENCSza4
mCAMNGeBLy+EAYhRztWADLKbxqogKNMnvYFmuiXO/GNwHKGOnAW8Dt7njbkipXrx
k//UTEB3wKEz3zlrnbbfNg01YQP+9DiaBqXsOq1YgMLtVo4A354=
=xq8e
-----END PGP SIGNATURE-----

--sm5ahi5a3wy7vwrr--
