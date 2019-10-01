Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5A06C2E88
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 10:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbfJAIDf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 04:03:35 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:42735 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfJAIDe (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 04:03:34 -0400
Received: by mail-lf1-f67.google.com with SMTP id c195so9110891lfg.9;
        Tue, 01 Oct 2019 01:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=phwrmQv3WwVi3axl8RFNHHUxwBXKpIYVAs/RyvL7K3M=;
        b=NoQHVMErN++xOeDNiRyW0wqEm9IxgWERvdCNJKoqS02tbrP6DHc7yyBvCYVBdOV3qI
         27poackoPRMH3YiMuTSeti6fSGkm9wLKTfs+7qPoP9rj7oy6+7BvWjaNl5bNyg3YJWvM
         1h72GJDZ5z5HL6vC2zuNb+rppkGmTjXSgPpxYSNObxICl8ukARcWl+neY2wTjZpX6+F1
         ZKo/F+H4W7TO0Vk8K5cofGIs5D4+rzBtBCrvKzmzQmaaPvPWGrQydPe4pejAMmbUSNe7
         HvO0lOlYNn1AEVmzEF7lM2PmIFD4EKKRRqUm7iNNae3KHxUrNnjdcpHBhody7R3sGTA/
         abmA==
X-Gm-Message-State: APjAAAXjIrvqhpMtqKkJowKKvqGEZZ3ZR4oaoet7dWW3AfV/rXBDOTNp
        RIFVrIQgwTLqrnDbzQhO2oQ=
X-Google-Smtp-Source: APXvYqws4d1Xmv/GKKc/rQTtlW/8USznaOLbdNbNQsOXKMeP9IJWN/zrTnD4rYlPmYv0Zp+X7W1GHg==
X-Received: by 2002:a19:7605:: with SMTP id c5mr14912654lff.114.1569917012586;
        Tue, 01 Oct 2019 01:03:32 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se. [85.224.241.81])
        by smtp.gmail.com with ESMTPSA id s7sm3848568ljs.16.2019.10.01.01.03.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 01:03:31 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
        (envelope-from <johan@kernel.org>)
        id 1iFD8F-0008OW-Eh; Tue, 01 Oct 2019 10:03:39 +0200
Date:   Tue, 1 Oct 2019 10:03:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Yegor Yefremov <yegorslists@googlemail.com>,
        linux-omap@vger.kernel.org, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when
 connected to musb directly
Message-ID: <20191001080339.GF13531@localhost>
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
 <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
 <20190927151935.GD5610@atomide.com>
 <20190927155738.GF5610@atomide.com>
 <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
 <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com>
 <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Content-Disposition: inline
In-Reply-To: <20190930195411.6porqtm7tlokgel3@earth.universe>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2019 at 09:54:11PM +0200, Sebastian Reichel wrote:
> Hi,
>=20
> On Mon, Sep 30, 2019 at 08:23:30AM -0700, Tony Lindgren wrote:

> > Actually playing with the cppi41 timeout might be more suitable here,
> > they use the same module clock from what I remember though. So
> > maybe increase the cppi41 autosuspend_timeout from 100 ms to 500 ms
> > or higher:
> >=20
> > # echo 500 > /sys/bus/platform/drivers/cppi41-dma-engine/47400000.dma-c=
ontroller/power/autosuspend_delay_ms
> >=20
> > If changing the autosuspend_timeout_ms value does not help, then
> > try setting control to on there.
>=20
> I did not check the details, but from the cover-letter this might be
> woth looking into:
>=20
> https://lore.kernel.org/lkml/20190930161205.18803-1-johan@kernel.org/

No, that one should be unrelated as it would only prevent later suspends af=
ter
a driver has been unbound (and rebound).

Johan

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCXZMIWAAKCRALxc3C7H1l
CGT5AQDIHV+XzTRbXywIry2DPN8FKYG1EWxrlad41pMXQnZaSgD+KXt/l3w0CN3Q
3YmvyZsCjR/8IQk1PFHNAo5SKF0bmQM=
=yh8c
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
