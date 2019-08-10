Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5EE7588EC8
	for <lists+linux-omap@lfdr.de>; Sun, 11 Aug 2019 01:14:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726014AbfHJXOH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 10 Aug 2019 19:14:07 -0400
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51443 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfHJXOH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 10 Aug 2019 19:14:07 -0400
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id BA1B38030F; Sun, 11 Aug 2019 01:13:52 +0200 (CEST)
Date:   Sun, 11 Aug 2019 01:14:04 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     ofono@ofono.org, kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org
Subject: Motorola Droid 4 SMS sending
Message-ID: <20190810231404.GA26417@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Motorola Droid 4 runs packet protocol over serial... and its kernel
driver requires explicit "write()" boundaries at places where packet
boundaries should be.

So I can send SMS using low level g_at... functions (that are not
normally accessible), but not using g_at_chat_send().

If anyone has good idea for clean (or clean enough) solution, let me
know.

Best regards,
									Pavel

   snprintf(buf, sizeof(buf), "AT+GCMGS=3D\r");
   encode_hex_own_buf(pdu, pdu_len, 0, buf_pdu);

#if WANT_IT_BROKEN
        strcat(buf, buf_pdu+2);
        g_at_chat_send(data->send_chat, buf, none_prefix, NULL, data, NULL);
#else
        g_at_io_write(data->send_chat->parent->io, buf, strlen(buf));
 	g_at_io_write(data->send_chat->parent->io, buf_pdu, strlen(buf_pdu));
	g_io_channel_flush(data->send_chat->parent->io->channel, NULL);
#endif
		=09
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl1PT7wACgkQMOfwapXb+vLHKQCbB1FXu15H78z7H1X+NaG1Y/pJ
UfsAn1FJ/Qlz2GsssMPxTbGJBNgwHcZZ
=YHx4
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
