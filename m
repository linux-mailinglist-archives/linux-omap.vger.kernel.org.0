Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A27526707
	for <lists+linux-omap@lfdr.de>; Wed, 22 May 2019 17:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729475AbfEVPfg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 May 2019 11:35:36 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:36228 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729472AbfEVPfg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 May 2019 11:35:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=zh8hGcmZTNKAIQnav7doHJn1oBv4am+LNeGlrek06I0=; b=N68q3uVaZYlhhRFEQ+rt7Hith
        rhH9zNy58U1wb4zvS8Ynz1+uoLwV1bLpwC1gXZwsGnmgYQoEVpgO6+iqfuwjMUVlFUuWi1JENXCG/
        yW0rfEE4XRnDhJYR544V5Ah5C95uwU/LhZVkdjfIJ91/Rd/je8grUmdMB0g6r/+qgCSr0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=debutante.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hTTH9-0004dA-TL; Wed, 22 May 2019 15:35:31 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
        id 7144011226BC; Wed, 22 May 2019 16:35:28 +0100 (BST)
Date:   Wed, 22 May 2019 16:35:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Keerthy <j-keerthy@ti.com>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561 regulator
 support
Message-ID: <20190522153528.GG8582@sirena.org.uk>
References: <20190516043218.8222-1-j-keerthy@ti.com>
 <20190516043218.8222-4-j-keerthy@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="p7qwJlK53pWzbayA"
Content-Disposition: inline
In-Reply-To: <20190516043218.8222-4-j-keerthy@ti.com>
X-Cookie: Does the name Pavlov ring a bell?
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--p7qwJlK53pWzbayA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 10:02:18AM +0530, Keerthy wrote:
> The LP8756x family has a single output 4-phase regulator
> configuration. Add support for the same. The control
> lies in the master buck which is buck0 for 4-phase
> configuration. Enable/disable/voltage set happen via
> buck0 registers.

Acked-by: Mark Brown <broonie@kernel.org>

--p7qwJlK53pWzbayA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzlbD8ACgkQJNaLcl1U
h9Alygf9F5WNeDtw1PhBSqAc0Si59+B44/gYO/ffBTyuP2A3hzVd3VvhrYSk1+gO
gGPdCGdyRMIcs83ijz02XKwWIDhrazQcDQhyVCd0QpbPAB6CpgJnj43DQMgFzAHS
2i5le6Ossnsc/aPGDgumb26OIL2v6H/mgmTSGEUynKl+0Z3M5MgQHgWmzTNMytLH
at5abgsiKSt8MCEXReN3AY83M6IdCew01AtsRUAklTLEkC8ggDXrTT8kAYn5mvb+
a0VpR9W2JNJ8Dxc3i82UY3vrQ35UnIP5/SnUH+apbWcVIcbO46RtXAkHC4yo8tZz
vBpiIoYfUBSL6hPKnfzob+ryXb8EFA==
=k1Kg
-----END PGP SIGNATURE-----

--p7qwJlK53pWzbayA--
