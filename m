Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFDE220E503
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 00:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731813AbgF2Vbb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 17:31:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:60598 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728803AbgF2SlR (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 14:41:17 -0400
Received: from earth.universe (dyndsl-091-096-060-101.ewe-ip-backbone.de [91.96.60.101])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AFBE23B9B;
        Mon, 29 Jun 2020 11:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593430924;
        bh=Da5rKfu7NcQEU4hEYHAI7KlFjFOHVdyUmJ9/xzsXQOE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wr28RRfMzBCTuyoQPSS2ea58UU/qydW6onAfi9dI5ECjWngYxtjjkCMfLblAdfP20
         +HOQbwKVA4y9MVfdWHO5Gvh3z9GvCkG1Q/IhXtPoHjtNJZfzIDyEEU9+2iTrLwDcXA
         pD+tYmRgaLOh2QEQtyuZyiCEXsvTH7M6MIUOTJqk=
Received: by earth.universe (Postfix, from userid 1000)
        id 56C873C08CD; Mon, 29 Jun 2020 13:42:02 +0200 (CEST)
Date:   Mon, 29 Jun 2020 13:42:02 +0200
From:   Sebastian Reichel <sre@kernel.org>
To:     Dev Null <devnull@uvos.xyz>
Cc:     linux-omap@vger.kernel.org
Subject: Re: [bug report] Droid 4 cpcap rtc
Message-ID: <20200629114202.7e5su5ny75mhqubw@earth.universe>
References: <20200629002917.0a2045380a0fe022f852e067@uvos.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3xcadvlsseesphbu"
Content-Disposition: inline
In-Reply-To: <20200629002917.0a2045380a0fe022f852e067@uvos.xyz>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--3xcadvlsseesphbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jun 29, 2020 at 12:29:17AM +0200, Dev Null wrote:
> 1. writing to the rtc via rtc-cpcap with hwclock appears to not work at all.
> 	- see https://github.com/maemo-leste/bugtracker/issues/399
> 	- hwclock: ioctl(RTC_SET_TIME) to /dev/rtc0 to set the time failed: Numerical result out of range

Looks like a regression introduced by "rtc: cpcap: set range",
which landed in v5.7.

> 2. do you by any chance know how the RGB -> RGWRBW pentile color
> conversion happens on the droid 4? is this handled in hardware or
> in software or in firmware somewere?

The omapdrm RGB framebuffer is send to the DSI panel, which has its
own local framebuffer to support panel self refresh. The panel
controller does the format change transparently and does not offer
any configuration options as far as I know.

-- Sebastian

--3xcadvlsseesphbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl75034ACgkQ2O7X88g7
+ppr9w//cg72ArLU2Eh7eIjm15WYHlbn4gUpRac9b2ixCdtZy1aa6GKSa/K0S5ur
vXyJhmqJtaQbOJZFluKSwD6meuny+55aTcpmTN3PfGw4lEpKVG74IY0BVhe1RA/c
/m3pSKToCP6VpwSvG24ptKsLI6aRX/hZZNn69g3yJGEySQr9Yp+Mw1l9nQc5u+yk
2hMCUBK1PFrDHqnifK3G+6aXAsKsEgfYPEk/fGuiQGmf2/YCKSX8/Pf11JGrhZZv
UFaw9MFy+7b1c2HBjJykbzTjc0tfBLX8lUac5cHJ6KTg3KPZCbIR7XBIWTnohFLc
NLCTFhOVY22mCLcijMTSXYxZocvxUsXjZ8PCfJJMWvCx1EhnMQBHFVnCF4mizW6W
G4ruHmgpR+itwiMh2YyF+xFyNX9fwd4NngLRAtWESsb3lSk35yuAfFnbYY7LQ+QF
X6HMnCYlYMGskrzds0cnFHQNwfq+LAS2CxBW5OBg45sWGfl+Xm5N5eHhr7wuAuZH
13jfdZKrc+XEKd0l3+m2A8hlyFiOqQ7dRWZDX+SR5vul/aR+EVU1UjW2naepmoCO
feQ/P6gfLMr2l/b9shkrsX9/HQhW/HjLQ5LdH8b+UxcJs5AkNNST3buKKhhsFb90
65naCWXdE9EJZwOZpZCWCAZQhTF2m/Wa20NS1nGF9KVDu6eI/38=
=0cdk
-----END PGP SIGNATURE-----

--3xcadvlsseesphbu--
