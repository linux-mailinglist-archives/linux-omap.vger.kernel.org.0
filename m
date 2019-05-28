Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 634DB2C7C5
	for <lists+linux-omap@lfdr.de>; Tue, 28 May 2019 15:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727228AbfE1N2A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 May 2019 09:28:00 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:45710 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbfE1N2A (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 May 2019 09:28:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=P4lui+xiNwVV1Z7TDo9Tlsuu/c7MHjXNDwR14n4l2F0=; b=Nb0cI38Eue22o1hau9CwnWbep
        Q7Yi85f0Vq6E0YQV9J1Eqxr0Bwu/y3oC6PZrCxjaLCewoA5iB7hLHMahis8ptNB36uJfK3xP9GRgy
        3t/9XMyDnnef2ait4JTxLdWb+Jqa49eyKmKRt+ZoE3aHHtmQinY18wRRVCVQY+lFGDgVs=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hVc8x-0002Vb-S8; Tue, 28 May 2019 13:27:55 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 20D03440046; Tue, 28 May 2019 14:27:55 +0100 (BST)
Date:   Tue, 28 May 2019 14:27:55 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Keerthy <j-keerthy@ti.com>
Cc:     lee.jones@linaro.org, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561 regulator
 support
Message-ID: <20190528132755.GK2456@sirena.org.uk>
References: <20190516043218.8222-1-j-keerthy@ti.com>
 <20190516043218.8222-4-j-keerthy@ti.com>
 <20190522153528.GG8582@sirena.org.uk>
 <1712197d-7d43-38a8-efde-11b99537eae9@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Qo8f1a4rgWw9S/zY"
Content-Disposition: inline
In-Reply-To: <1712197d-7d43-38a8-efde-11b99537eae9@ti.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--Qo8f1a4rgWw9S/zY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 28, 2019 at 03:23:41PM +0530, Keerthy wrote:
> On 22/05/19 9:05 PM, Mark Brown wrote:
> > On Thu, May 16, 2019 at 10:02:18AM +0530, Keerthy wrote:

> > Acked-by: Mark Brown <broonie@kernel.org>

> This patch will come via the mfd branch?

I'd expect so, IIRC it had a build dependency on the earlier patches in
the series so if that doesn't happen I'll need to merge the relevant MFD
commits.

--Qo8f1a4rgWw9S/zY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlztN1oACgkQJNaLcl1U
h9C2aQf+K2lJtpmwLAD/ngSjYbhqPveAgOfRyzbKExRgY1UGxOjnCEmz0RopEc9H
MDAIkTPSzZm1UHJfNWw4VogZMCSBFipIb3uqrCdpFWWe8E7b1CYgMNUHM55OWOl8
iVdMV0mC5bCMDTfBOBfvh5TTJLVwMECyA7uKJnoSfhTLj72NXSdw9D7fIbBg6f79
fCflkIu16x4HNljMdLfgP5InnoVtONnd++RakYnE9npierZTvrkXfUCEX8Bo91Dd
we7V9kel0jIcyW+Br90IB/g5Brvi+CMhPhff5enXfj+i09vm1GiBHYsvHnE/YmCA
rCGqDaSqWVPPAQ2cxojb8TYnJhpzPQ==
=i2ZR
-----END PGP SIGNATURE-----

--Qo8f1a4rgWw9S/zY--
