Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AAB6CEA93
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2019 19:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728185AbfJGR1s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 7 Oct 2019 13:27:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:48288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727801AbfJGR1s (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 7 Oct 2019 13:27:48 -0400
Received: from earth.universe (dyndsl-037-138-090-170.ewe-ip-backbone.de [37.138.90.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 443372133F;
        Mon,  7 Oct 2019 17:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570469267;
        bh=ADw94PRMffDcSy7CEAv64e3rw87jHsCySzGRg20pcQE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r6zyno1esSBXGw5ZGv5usX7wTuhMw11rjdkUi6HARYgQDdaQF7NeVi2MDUg7QGz+K
         Il1M9hXoL+wnonE7z64MSbtsDFZY6FNHzViBrxLrrvYzYcJzKLwEO0s/qXHtCtTRO2
         bhhCwlHIrsCn7Uiz+VC8v6n9wA7IToOrJmcl0W0g=
Received: by earth.universe (Postfix, from userid 1000)
        id 3E4FA3C0CA1; Mon,  7 Oct 2019 19:27:45 +0200 (CEST)
Date:   Mon, 7 Oct 2019 19:27:45 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        thierry.reding@gmail.com, sam@ravnborg.org,
        letux-kernel@openphoenux.org, Tony Lindgren <tony@atomide.com>,
        Jyri Sarha <jsarha@ti.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/5] Fix SPI module alias for panels used by omapdrm
Message-ID: <20191007172745.e7obunwprgdiclwk@earth.universe>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="6l3anbcfnqxbanzz"
Content-Disposition: inline
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
User-Agent: NeoMutt/20180716
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--6l3anbcfnqxbanzz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Oct 07, 2019 at 08:07:56PM +0300, Laurent Pinchart wrote:
> This patch series fixes a module alias issue with the five recently
> added panel drivers used by omapdrm.

For the whole series:

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--6l3anbcfnqxbanzz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl2bdY0ACgkQ2O7X88g7
+ppcMw//R+no2w6dsdlDSaOCK/KGfl9/Zag/UlNED/KhLLbD4m9KCs5kfUR2e11S
BLfqv7I5m0hPIW2/t57YC58pMiZJHR+VwVAgpUwyFRaPzBYh+WLjuGDu/ZhKHwSD
mreHbqJGFo3lxWKmSRXL9/qsAxdgyt+0Ge4GmqnLEy4mI0UmZBl/C2lOQzJJeJqs
mbUSBgXeK5MBgsUGX9d4sAEmgCM+SE/tD57cxmNFShA8WJw8+IBDKMvCzXUWOv0Y
gL5udj/ZiZ124g5iZkcsfuMIl2fzr5xwCJ3VUdxRlYYmJd8+XUlKoI2QAM34+qgs
GGhqxmh+g2crHHuzJXNN7exwS0v8f+jF61Evo+whanNXOVE531iqMO+EOySxs6HF
Szuap7KNTrzouANBOiTwqeZBx9jePxyJCCu23pAEP1yoAgSMe2Aj+YmWcMqCjMWU
zmRvZuF9Nh3jPa+v5VCFKS0ywCEhZME2iOd0ua1A50i/XKRJ35L6e62BUh8yW60l
CxU58A9YUO2x+nzG3QlvnroBdQIEpjLp3tnhsBC0E7cMicrQ2RncRxgpqw63P201
+uaIX7j8PXQ4SUwA587026IRWCdXzZepD1Y+nsXUboOtFY6BhZMpRGJf0payP3bT
Hd9KikLDwiC9rWTJpnVdq7q1M2KBd2EdLIy22X0maaWLY7RKm9Y=
=WZC1
-----END PGP SIGNATURE-----

--6l3anbcfnqxbanzz--
