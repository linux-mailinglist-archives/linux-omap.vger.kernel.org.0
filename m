Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 883FB449BE
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2019 19:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfFMRcw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Jun 2019 13:32:52 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:49864 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbfFMRcw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 13 Jun 2019 13:32:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=TJhF0E3c8kYvjflA3VkVxxaZVVwJAMblQcrgE5YFtmQ=; b=JZkSdnJwfGPx/1jqRNH4+i8jw
        DdAG3QMIXZsZYN+5fk4nKhnktoYmOf37wO4QyR3q+nBmcOi6BoHVCg56XIBpDJghFEZHIwbq/sy4w
        yOS8vudJARiTVyJYQqQKFvl7Jbu9oXSYQ8ZY1LtGbUqttU7lv1Lg6Xa0Fhr4ESopAjaXc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hbTaj-0005L2-OX; Thu, 13 Jun 2019 17:32:49 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 2E6B0440046; Thu, 13 Jun 2019 18:32:49 +0100 (BST)
Date:   Thu, 13 Jun 2019 18:32:48 +0100
From:   Mark Brown <broonie@kernel.org>
To:     keerthy <j-keerthy@ti.com>
Cc:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, t-kristo@ti.com
Subject: Re: [RESEND PATCH v2 3/3] regulator: lp87565: Add 4-phase lp87561
 regulator support
Message-ID: <20190613173248.GP5316@sirena.org.uk>
References: <20190612144620.28331-1-j-keerthy@ti.com>
 <20190613154552.GL5316@sirena.org.uk>
 <bfb19336-fbe9-06d8-25d3-f2e0b8ea6c9b@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zn4k3Q+N5puqXur4"
Content-Disposition: inline
In-Reply-To: <bfb19336-fbe9-06d8-25d3-f2e0b8ea6c9b@ti.com>
X-Cookie: Editing is a rewording activity.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--zn4k3Q+N5puqXur4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 13, 2019 at 10:32:45PM +0530, keerthy wrote:
> On 6/13/2019 9:15 PM, Mark Brown wrote:
> > On Wed, Jun 12, 2019 at 08:16:20PM +0530, Keerthy wrote:

> > > patches 1/3 2/3 are already applied to linux-next.

> > This doesn't build without those patches:

> They are already on next. Do you want me to resend them as well?

That's no good, it still breaks the build of my tree.  I can't apply
this until the code is in my tree, either through a shared branch or
through Lihus' tree.  I see I acked the patch, I'll have been expecting
the patch to be applied to Lee's tree.  If that's not possible or
there's no branch then please resend after the merge window.

--zn4k3Q+N5puqXur4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl0CiMAACgkQJNaLcl1U
h9CTIwf9Fmh40EtSogz1kbW5Y6D4/CrNI3ad/hB3hEl3kBob++f4JYXKFzSJBlTm
wcnkN150boPQ/MwZGrrcWBMJ0YzbsGEeHcftINv+AB2r3yCUfwa7Ab7zvu8epDRy
+1UTdgM/NzgOOrFFkuWfjoDm4tn4m1WrcAcdVC9Zm1SAtKgVZYDUZCiHiYRng/+F
iXZrzcnaGXN/6ZPzdf8PPAIu5ssCHh1dXG2ccqgiC6LQuxvZF0NkUOvKenRuzSGu
fTkwLLkUn6jQyNkJ5NCcfoR0rpaFgtngZUk3Tp+QrAlxbYGKFM4flKN5U/H9hq5i
JoAQYqCjLQf4GWwBTl8hszhR26LllQ==
=lSLB
-----END PGP SIGNATURE-----

--zn4k3Q+N5puqXur4--
