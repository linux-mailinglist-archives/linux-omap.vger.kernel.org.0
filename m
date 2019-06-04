Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E27B34CBD
	for <lists+linux-omap@lfdr.de>; Tue,  4 Jun 2019 18:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbfFDQAX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 12:00:23 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:38506 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbfFDQAX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 12:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=uBZ3QnhWu98kJQiat9L0PeoNpIYCmdNp7OssQ/cTY7E=; b=a3QI9+OphW/f0GNMiWE5jZbJ4
        AkPfWmPn+TgoAapbIU4UPv+HVxXg9GjNLaT+QyIWT8SscxEBJM+O3tzvdOgQxnBOeqnJuqtwyl3t6
        Q+WpmlwQbKTGnNghWgerxVOcQ4Vxy4Aj8GtY51jgPRtZHdnZeaWhCm5TCYbHKPKJQ7ddo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hYBrH-0006MC-8B; Tue, 04 Jun 2019 16:00:19 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id 58E5B440046; Tue,  4 Jun 2019 17:00:18 +0100 (BST)
Date:   Tue, 4 Jun 2019 17:00:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-next@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: next/master boot: 257 boots: 11 failed, 229 passed with 16
 offline, 1 conflict (next-20190604)
Message-ID: <20190604160018.GI2456@sirena.org.uk>
References: <5cf685d0.1c69fb81.e3d89.43ae@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="boT9Oj39GmgPxYhu"
Content-Disposition: inline
In-Reply-To: <5cf685d0.1c69fb81.e3d89.43ae@mx.google.com>
X-Cookie: The other line moves faster.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--boT9Oj39GmgPxYhu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 04, 2019 at 07:53:04AM -0700, kernelci.org bot wrote:

Today's -next fails to boot omap2plus_defconfig on Beagle XM:

>     omap2plus_defconfig:
>         gcc-8:
>           omap3-beagle-xm:
>               lab-baylibre: failing since 1 day (last pass: next-20190531 - first fail: next-20190603)

The boot fails silently with no output after the bootloader:

    https://kernelci.org/boot/id/5cf655fc59b5149acad51504/

which isn't much to go on, it does seem to have been OK in
multi_v7_defconfig though.

--boT9Oj39GmgPxYhu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlz2lZEACgkQJNaLcl1U
h9BmWQf6AoY5VMMkCTmC1WC0Xuomm1kiC7szNoyymcavNs7I8BPlfTssjnJMZTQP
JOCRjldsXBmPY8PF4YTpuBK6ANNTWE1n0WgbNgZEuOPWt2nCOT1QRvfHagOE31Eb
OAvG19faDLlh3ivrj32ACTXd/bbBudESyYXsKBC/P2JJ7KyYmSf99cPw1bqeDm49
7FAHWdODlE86i3VxYGjFseO2WLatjOf55opyVmUhsL65dX8vyssf1kWmq4iDGCgs
p4a6btnaVbHdYUBmSMuhlevIHRJAubRAaxG70XP+cnNsvTO1hUM5ITNVHemNUIPB
gAs7N1rUmpjROjkN+QGwRNN1wECBSg==
=3tvl
-----END PGP SIGNATURE-----

--boT9Oj39GmgPxYhu--
