Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C746BE1A01
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 14:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727309AbfJWM1t (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 08:27:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:59508 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfJWM1t (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 23 Oct 2019 08:27:49 -0400
Received: from earth.universe (monacowifi.monaco.mc [82.113.13.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8EE942086D;
        Wed, 23 Oct 2019 12:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571833668;
        bh=t8T7r1ufu3VJCAxY8EdZbRggUlqydUzVwu4ytEqymNY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rEP/KHnEMJt+p5oYo2wj9P7HvDzYxvMMwbEVPFb+ct/AWVpFypiPGZHrOr4EWYoAE
         jlhMIW2NSPmc6niovedZIbrtq6DoVMMbZ2gRRS9/YcbVTFlwTJQY/yAge1392WcaYi
         MH10fJB3ITMrv12A5eyEmGMImZ8HqZj4mTiHnPro=
Received: by earth.universe (Postfix, from userid 1000)
        id A982F3C09B2; Wed, 23 Oct 2019 14:27:45 +0200 (CEST)
Date:   Wed, 23 Oct 2019 14:27:45 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Marcel Holtmann <marcel@holtmann.org>
Cc:     Tony Lindgren <tony@atomide.com>, Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCHv2 4/4] Bluetooth: btwilink: drop superseded driver
Message-ID: <20191023122745.ldh2ghnzazdhaf2x@earth.universe>
References: <20191003134147.9458-1-sre@kernel.org>
 <20191003134147.9458-5-sre@kernel.org>
 <BC1F82AC-2988-4BC6-99EA-1C9F9289E582@holtmann.org>
 <20191020205901.56bafijk7cu3rpaj@earth.universe>
 <AC376F8D-77F3-4497-94D1-FE25A5ED9337@holtmann.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="iqu4xmpkphwkun2f"
Content-Disposition: inline
In-Reply-To: <AC376F8D-77F3-4497-94D1-FE25A5ED9337@holtmann.org>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--iqu4xmpkphwkun2f
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 21, 2019 at 05:14:15PM +0200, Marcel Holtmann wrote:
> Hi Sebastian,
>=20
> >>> All users of this driver have been converted to the serdev based
> >>> hci_ll driver. The unused driver can be safely dropped now.
> >>>=20
> >>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> >>> ---
> >>> drivers/bluetooth/Kconfig    |  11 --
> >>> drivers/bluetooth/Makefile   |   1 -
> >>> drivers/bluetooth/btwilink.c | 337 -----------------------------------
> >>> 3 files changed, 349 deletions(-)
> >>> delete mode 100644 drivers/bluetooth/btwilink.c
> >>=20
> >> patch has been applied to bluetooth-next tree.
> >>=20
> >> However what I really like to see is that you re-introduce a
> >> btwilink driver that is purely serdev based and doesn=E2=80=99t rely on
> >> any hci_uart/hci_ldisc code. A clean serdev only driver is that
> >> best and easier to maintain long term.
> >=20
> > So basically move the serdev implementation from hci_ll.c into its
> > own driver and make hci_ll hci_uart based only? That effectively
> > means, that we have two implementations of the protocol. I don't
> > think this will improve maintainability, since then bugs needs to
> > be fixed in two places? Note, that we have a couple of drivers
> > with serdev+hci_uart by now:
> >=20
> > for file in $(grep -l serdev drivers/bluetooth/hci_*c) ; grep -l hci_ua=
rt_register_proto "${file}"
> > hci_bcm.c
> > hci_h5.c
> > hci_ldisc.c
> > hci_ll.c
> > hci_mrvl.c
> > hci_qca.c
>=20
> I would like to have something similar to btmtkuart.c which is a
> pure serdev driver that doesn=E2=80=99t depend on any hci_ldisc.c
> framework. If we have this, then we would just drop hci_ll.c from
> the kernel and focus on the serdev only version. As noted, there
> is no need for any other driver at that point since everything is
> probed anyway. Users will not even notice the difference.

This can be achieved by just removing the hci_uart part from
hci_ll. But AFAIK there are some non-wilink based TI HCILL
devices, which do not require any extra platform data and might
still use the hci_uart part.

-- Sebastian

--iqu4xmpkphwkun2f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2wRzoACgkQ2O7X88g7
+pogDw//Xb2ZDLcdKOs0TDYMMcP6rvRkA9S5ou7bDl8c2XgGbqsQSr7a851UVUxK
S6ya43Jt6jQFTyR1pB55sSvoNu278E/TuBS3dPVwML5LasWRte3eFnITIdI0lHZ4
ixeJ7JUUsvFLsiZ0GYTFm9ps4lAoh8qvpMFy0zrF4sdNoUq8QEUH4iAePN7Y7C+z
Tc8RKRND96YNf1oar+mOpwDjqrV9DLahcOncO5VQn5pIO6N65g28K5tBslPIG3ZV
MDoDmQTpjLnUxLpXs6oWkEbgBmBpI3Hx+ogRZfj1OF0m0qeCEGhvvcBp6STHiEkG
u0vlQUC4RvnbGVul73MdOTSqfoghGuHiqyxazDWNmHFpo81HdhaHSB6/IxCKl8e4
XJYYCbDTur4uWIMw9t5NTe7QUHrOezj2QrCNXDyikz1mNN4O4WrahKzkiLA0GSAu
V2r+gcr6Z7r0QJs5cAimiYF3Hm5xl/sPhnhCqyRfFSBX93SeraGPkqF/PvcPWDRu
J0H10QcDLI3xo3jnhUQPgcDoMeuNsKhE4w6sQvUPfbsXUme4/6d2+hrLsevQj+HE
1Ozg/BKkIAlPQ8Pbtz93lZoseLJPCFROArLqLZERiRb++iAfVj/inJZzyhewhZJD
cYzanohB9A6ZpLXiZLtuRKsQxCEoBYLX314LKlZJ2FaaUeSKIDY=
=qmL6
-----END PGP SIGNATURE-----

--iqu4xmpkphwkun2f--
