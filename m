Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 767238B6D5
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 13:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbfHMLaO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 07:30:14 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:32970 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfHMLaN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 13 Aug 2019 07:30:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Zq++AH36LcJV8AEMAUwSGNdy/skc7edYjMJDAHmF7M8=; b=ZwZWUKiUxBj9FOa8Z3s5c7GoJ
        gxwgBVHVPGQ1V7ib3cLwm9AnJDH7Q8QWguLFsVEuAm+7DWkAaoeLwvHz63FLLjr8UUVAkcDi7PQR1
        C/oixVlRFcRW+k+7Hl6NEAaolSkzzgHYlUYl3tz7AgQm7Rzmg4KyjeJWVRlb3CGAvxwIc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hxUzR-0007lv-EK; Tue, 13 Aug 2019 11:29:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 983992742B44; Tue, 13 Aug 2019 12:29:20 +0100 (BST)
Date:   Tue, 13 Aug 2019 12:29:20 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Takashi Iwai <tiwai@suse.de>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [alsa-devel] Regression in next with codec unload and
 snd_soc_component_get/put
Message-ID: <20190813112920.GC5093@sirena.co.uk>
References: <20190809070003.GA52127@atomide.com>
 <s5hwofmhkbs.wl-tiwai@suse.de>
 <20190809074643.GB52127@atomide.com>
 <s5hv9v6hhm9.wl-tiwai@suse.de>
 <20190813102451.GJ52127@atomide.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline
In-Reply-To: <20190813102451.GJ52127@atomide.com>
X-Cookie: Poverty begins at home.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 13, 2019 at 03:24:51AM -0700, Tony Lindgren wrote:
> * Takashi Iwai <tiwai@suse.de> [190809 08:24]:

> > ... and it was already fixed in the later commit 0e36f36b04e7
> > "ASoC: soc-core: fix module_put() warning in soc_cleanup_component".

> Mark, looks like this commit is still not in Linux next, forgot
> to push out something?

There's a build failure the Intel guys haven't fixed.

--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1Snw8ACgkQJNaLcl1U
h9DF/Qf/WDdJEsNmRPfcsZFd9wcH/l/YYYCUVgA62rjOVqjdmJimIzjWXlc+W4xw
CZk3JtYhXgKz31j0/toBAkOS8bbArTQtWi5+40EuzExrZKV/MYBA2dlSSYKazuQO
bDQBxTg5kKAafEyViBEVMxCey+ubNGO4Ms69de/KW1lmZeEqtfSHPzOjWgrEI+H9
1xjLx4KVTDk2o3TaSc0iKj7MNCKJy0nBW/VnW8RxJiOnKu+kO2G4lBpCu+/0afjm
f+oufYCVjGXJKKv5SBsfB30/c11H+PindiU1ECSY5mn0YytmPY+cC2d00aE20GXY
v3jxVVy7d8M5zo4qooHjGF84oeCX7w==
=XIoR
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
