Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84864170BD0
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 23:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727832AbgBZWqq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 17:46:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:42936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727763AbgBZWqq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 17:46:46 -0500
Received: from earth.universe (unknown [185.62.205.105])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B26AE20658;
        Wed, 26 Feb 2020 22:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582757205;
        bh=hn0fNkl1nXOT3pQ9CcXKD2lYKQMQSsc/M0u3GuDeBQA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hmjzozx2FPOdh2922m9L2YgP2hCRlD9wWbhiPcFIJ/lZRl/qVuFvDMWP4s6/gZTCl
         9S5N3CAmnqI9Sjg2V1ABHVshSWfZtThjEM0tELD/DESFbqdg5KgrXn1NVtka4WlfsF
         G4AqwXribAleXv6RVo76WSBddCTD2OZPEsLUx8dA=
Received: by earth.universe (Postfix, from userid 1000)
        id 458593C0C83; Wed, 26 Feb 2020 23:46:43 +0100 (CET)
Date:   Wed, 26 Feb 2020 23:46:43 +0100
From:   Sebastian Reichel <sre@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Rob Herring <robh@kernel.org>, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCHv2 11/56] drm/omap: dsi: simplify write function
Message-ID: <20200226224643.f7gy3maaai7d2hdc@earth.universe>
References: <20200224232126.3385250-1-sebastian.reichel@collabora.com>
 <20200224232126.3385250-12-sebastian.reichel@collabora.com>
 <20200225153105.GJ4764@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zbojz4tnnvf67nro"
Content-Disposition: inline
In-Reply-To: <20200225153105.GJ4764@pendragon.ideasonboard.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--zbojz4tnnvf67nro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Feb 25, 2020 at 05:31:05PM +0200, Laurent Pinchart wrote:
> > +	if (mipi_dsi_packet_format_is_short(msg->type)) {
> > +		u16 data =3D packet.header[1] | (packet.header[2] << 8);
> > +		r =3D dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);
>=20
> You use the packet for this case only, I think you could simply write
>=20
> 		u16 data =3D ((msg->tx_len > 0) ? tx[0] : 0)
> 			 | (((msg->tx_len > 1) ? tx[1] : 0) << 8);
> 		r =3D dsi_vc_send_short(dsi, msg->channel, msg->type, data, 0);

That probably works with 's/tx[/((u8*) msg->tx_buf)[', which looks
really ugly :) This code is further simplified by a further patch,
which forwards the complete message into dsi_vc_send_short().

> >  	} else {
> > -		r =3D dsi_vc_send_long(dsi, channel,
> > -				type =3D=3D DSS_DSI_CONTENT_GENERIC ?
> > -				MIPI_DSI_GENERIC_LONG_WRITE :
> > -				MIPI_DSI_DCS_LONG_WRITE, data, len, 0);
> > +		r =3D dsi_vc_send_long(dsi, msg->channel, msg->type,
> > +						   msg->tx_buf, msg->tx_len, 0);
>=20
> Indentation.

Ok.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Are you fine with keeping the mipi_dsi_packet, since it will be
removed in a further patch?

> >  	}
> > =20
> > -	return r;
> > -}
> > -
> > -static int dsi_vc_dcs_write_nosync(struct omap_dss_device *dssdev, int=
 channel,
> > -		const u8 *data, int len)
> > -{
> > -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> > -
> > -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> > -			DSS_DSI_CONTENT_DCS);
> > -}
> > -
> > -static int dsi_vc_generic_write_nosync(struct omap_dss_device *dssdev,=
 int channel,
> > -		const u8 *data, int len)
> > -{
> > -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> > -
> > -	return dsi_vc_write_nosync_common(dsi, channel, data, len,
> > -			DSS_DSI_CONTENT_GENERIC);
> > -}
> > -
> > -static int dsi_vc_write_common(struct omap_dss_device *dssdev,
> > -			       int channel, const u8 *data, int len,
> > -			       enum dss_dsi_content_type type)
> > -{
> > -	struct dsi_data *dsi =3D to_dsi_data(dssdev);
> > -	int r;
> > +	if (r < 0)
> > +		return r;
> > =20
> > -	r =3D dsi_vc_write_nosync_common(dsi, channel, data, len, type);
> > -	if (r)
> > -		goto err;
> > +	/*
> > +	 * we do not always have to do the BTA sync, for example we can
> > +	 * improve performance by setting the update window information
> > +	 * without sending BTA sync between the commands. In that case
> > +	 * we can return earily.
>=20
> s/earily/early/
>=20
> Do I understand correctly that this isn't implemented yet ? You should
> make it clear in the comment that it's a candidate for a future
> optimization.

Yes. I forgot the TODO keyword for some reason. Has been quite some
time since I wrote this patch :) I fixed the earily and prefixed the
message with TODO.

-- Sebastian

--zbojz4tnnvf67nro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl5W9VAACgkQ2O7X88g7
+powbhAAqE6U0boKN3FgKDc+Dtx3u3Rx0A9Pj3vUgq6D0KwgABB8+cY/asK8Tfw/
B3AwncBEAyblX5IUgHmCr/qftd21U8cuv07ddpBtHsGSTmM13U/+c9/DI6Rf2t4I
yTaAfmgs5bCfEk3R2BetC/tkp1iRGMU1z1cmwblasQmvqEEuAPKw3qSKmelNxBvf
pgh8ALr52vs0mzVKH4ea3kcwT2df+8G1of+E5U0r7po97FOdFuKsJoqKjsFwiQ3z
09oYjB1Z6eA+/NbptoBPnOGNCHE8cx2y5IJTOmAPO8iVoo8PsqiyqLjJ0jJ1mqLE
4Bl1/R2AH5WG0LDShR3t2RczcxY9tWGWiNxNAAXcg2V5H17aRy85BSDoa4Qjbotd
IWF0e23VmyIoy7XFGJEB6d/phk80+bxDccfo6aN/mgmoNLijIijSnPU8DCNeaU/n
f41bs4UTE95E6zPVK+xEB4rNFHvQTwXNfYOukZEZAoU4OFmD++as+IhfP5fXx7cQ
nvpuQSGD6cgMZIE2kyH/iLHhl7b225lmuMimy/MR84nNllGYIRLXQ+IO2h5lGHP9
TSX1GiR0z2L73dfW3ulRwEI9sk3s/rCPCypDhCifDLJMYjRVO5tty/UHc/PKeAgX
RZODlAicIAeUe7dm++sQYl6YZGsTz3D7t4UWqAEVQO5BFIP6g0o=
=rCrY
-----END PGP SIGNATURE-----

--zbojz4tnnvf67nro--
