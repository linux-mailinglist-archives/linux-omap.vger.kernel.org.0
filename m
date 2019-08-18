Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B296F91651
	for <lists+linux-omap@lfdr.de>; Sun, 18 Aug 2019 13:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfHRLF0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 18 Aug 2019 07:05:26 -0400
Received: from nala.villavu.com ([188.165.243.101]:52044 "EHLO
        nala.villavu.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726073AbfHRLF0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 18 Aug 2019 07:05:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
         s=mail; h=Content-Type:MIME-Version:Date:Message-ID:Cc:Subject:From:To:
        Sender:Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=IfjVP4l3imWslMspnvhqRnKhIS8DGrVQYPMRdHhzok4=; b=frPxRRJLjy9HWST5t4dFse8zRN
        mU1gP+Fdy/dQFHdZshZmNrI2vwqFPgkAHnDvRSni2OFcIPBAbVL5RDvDnlAYvo9hwczR30kDQC+R2
        iaciW9E6KgUvGS4YzljGauEMWmT8goc6Q+7mPvwOa1fquQkuz35IVXZMz+OZyH6SPe6T97+VEOU/H
        kKk4PPzSL5wBlkJvtZzf1wfETqfrIqA9bbWfuLLbFwBh10g+dvqlbElI7ggAQr9gIq+fmHE9vCvNs
        lA0TTy56aADkSs/ff4iGydrQ7X5KJWNYdAvsSqatyFLfpcdw3RO4Rx8lanZShdqHII98UCJ9KzgHf
        cIOen6yw==;
Received: from a82-161-36-93.adsl.xs4all.nl ([82.161.36.93] helo=[0.0.0.0])
        by nala.villavu.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <merlijn@wizzup.org>)
        id 1hzIzu-0006yP-Kn; Sun, 18 Aug 2019 13:05:18 +0200
To:     linux-omap <linux-omap@vger.kernel.org>
From:   Merlijn Wajer <merlijn@wizzup.org>
Openpgp: preference=signencrypt
Subject: Charging voltage for droid4 battery
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        bencoh@notk.org
Message-ID: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
Date:   Sun, 18 Aug 2019 13:05:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.2
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GnQzlEQtVV6J64InmBdqyVkvYwZbmPhSQ"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GnQzlEQtVV6J64InmBdqyVkvYwZbmPhSQ
Content-Type: multipart/mixed; boundary="mCvDPOVLwXFqbMAntPu1MnP1OAg2UgIwp";
 protected-headers="v1"
From: Merlijn Wajer <merlijn@wizzup.org>
To: linux-omap <linux-omap@vger.kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Pavel Machek <pavel@ucw.cz>, bencoh@notk.org
Message-ID: <4a845327-348f-5e4f-ec76-4c5d1f61c270@wizzup.org>
Subject: Charging voltage for droid4 battery

--mCvDPOVLwXFqbMAntPu1MnP1OAg2UgIwp
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi,

Recently my Droid4 battery seems to be swelling up quite a bit. It could
be of old age, but bencoh (CC) suggested that he changed the driver code
in his kernel to charge until 4.2v, instead of the 4.35v that mainline
currently seems to use. (After one of his batteries started to swell up t=
oo)

I assume the 4.35v value was taken from Android?

Cheers,
Merlijn


--mCvDPOVLwXFqbMAntPu1MnP1OAg2UgIwp--

--GnQzlEQtVV6J64InmBdqyVkvYwZbmPhSQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQRM5LT7NbLF9yb6a/UGN09rynK8WgUCXVkw6wAKCRAGN09rynK8
Wj8hAQDGdoy6sUaJy9ZweBFWi5/RmWGexetutuTkBKLGz+drCQD9F7ay8A2rYrhC
9HgvhD3DTWRwc5iWkKSDO+J7hQ+JtwY=
=Y4Oh
-----END PGP SIGNATURE-----

--GnQzlEQtVV6J64InmBdqyVkvYwZbmPhSQ--
