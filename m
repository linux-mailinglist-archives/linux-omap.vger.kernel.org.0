Return-Path: <linux-omap+bounces-2344-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A05BA99502C
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 15:33:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6179D2882DB
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 13:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959BF1DF736;
	Tue,  8 Oct 2024 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="rqn93OfO";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="po7aofvJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B481DF733
	for <linux-omap@vger.kernel.org>; Tue,  8 Oct 2024 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394395; cv=pass; b=ksdQ3eE2iq2AvWSMvDcpsR92NZzgNsHKQTTwLICI65G0I7iFLtbHC68JhbsDG0+4USwXJZ0dZCeCYKluEUvGiUNSDSmMTD6i34936rstz9+l5xOLpkJ15s8wVKwUYQmcxIzFN2mXPrkWhM/0FTWUH9uyRUopTizbTlO9E9ZVnD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394395; c=relaxed/simple;
	bh=Z1wvsLydr+99qx+pkA7vhDwCBrYDHNtFzI86hgXBIts=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=rAoItbPmWBpdYTFR7Vjs76gQDiI1WGHN/AKyXzebhJJxw1CD6DhBqwH9A1CJ6NY22kqW3KFbdzMA3IUGqCIY3fdME37UmsOtXRw/iFgLMoH+ZCJVYM4mHDsaWbjkD0Wi78KnTwHOwskWfI9mKq6kfDj7jzCM2Z0UbVs1pytm4Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=rqn93OfO; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=po7aofvJ; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1728394369; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=J0JamUA1b1N1OCaOEjrkR1jtX5Po8aSwmlgwiD+BhqERQHAb4enw2dUgovdtqvgO/c
    sYZ13O9RP6mNu3C1qhhbgf5bkdRiAjOx0LBgcUjwKkMxmjt06PUxzewUdHJYa88yQeao
    eQlqH+kiCWp4Le8PBhygLTMdaqzDu8d4AOYDRYd9/K2TiAX8pz5cxSdoSyJ4MxgDHWLW
    61Pd56T0PZ/MXJB3zQgfZs/K0rmqSQWmTJ04PryBAIdbahplewyIo7MvZGRK0841D28B
    8h+fN0s0jlcek1g5qGo/UU1jSYHtN8EngOONl13lPUkYKQUFvavIWypQUGANRB+/47MF
    hVpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728394369;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AR8SYURrqnGiMjgrR8Q+FTATt9fo1cMfRQZEjjo7VzA=;
    b=CbThfIh1X4PY5+gbvfuJmSLPipknLTzwXQHOLQ5+Qul8hBsp3HIU3Q1TBlOWWxkXWH
    dDRQuBS5M82eU/1ABM6xkiNtYrZGBAiMZW1G3P9Sex5h+d5HpvtM1dmb4Zvb+Guwlz5V
    CuJsnLxC5356xtGBR/jUjjcvpSkdAcYwLgwmomSeghlu/F8soJOy8f4qh7X5T00+5O79
    Rnzq1JLwBL3MWCWkWK5dnbDQOZI03D24jazqRUCNZGlZtqD5HWBn7NgxkLHL3o2YVd7N
    E3KzKCEBaH5Vir1RDsc0lajfeyQUE4N5ClGf65SeH1tuU2w0JvDxwTVH5XI6MN4X4C7V
    nYnw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728394369;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AR8SYURrqnGiMjgrR8Q+FTATt9fo1cMfRQZEjjo7VzA=;
    b=rqn93OfOC8a8Ap41xYHIt5/X6gEYZ9OSBG2peoy9y2Bg5xRs0DsNmePfrvvQl1MOdG
    9TJMIh9/5E5X3Zy6NWX4Jqzj0STCsK9Ve2ojfr3b8LapbBWE+iRFzT/Te6A0YjoqxNeO
    Pf5H+Wmx6gjeI0SRsE4eJpL8nzMGLsJdrrFkuluOhTeTyHueJzMKSe+uWKjU7XOe6PrF
    U5UIMx0KCNEBWJxB0GjoElUW3pFWWMFoNh3EDjjgvr5r8QwTqXKcVRnYyACzKY91NGxT
    3k4bNwgywa/iHRwplFv7NAI0049fPoVbwdID1v50rXofCS8w6y208b4J5w6GC092/6kb
    Aqeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728394369;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=AR8SYURrqnGiMjgrR8Q+FTATt9fo1cMfRQZEjjo7VzA=;
    b=po7aofvJtlg9E/19UGdsmwtBo5+BJiOELcH79UFmShrVvhVaKL58308KjeMq4LopEh
    zmVlD3i924u9ZxLl9WCQ==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.7 DYNA|AUTH)
    with ESMTPSA id Qd0dc2098DWnYAU
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 8 Oct 2024 15:32:49 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] iommu/omap: Don't register ops by fwnode
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
Date: Tue, 8 Oct 2024 15:32:38 +0200
Cc: joro@8bytes.org,
 will@kernel.org,
 iommu@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
References: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Robin,

> Am 08.10.2024 um 15:17 schrieb Robin Murphy <robin.murphy@arm.com>:
>=20
> The OMAP driver still has its own traditional firmware parsing and
> instance handling in omap_iommu_probe_device(), rather than using the
> generic fwnode-based paths. However, it also passes a hwdev to
> iommu_device_register(), thus registering a fwnode for each ops
> instance, wherein __iommu_probe_device() then fails to find matching =
ops
> for a client device with no fwspec and thus a NULL iommu_fwnode.
>=20
> Since omap-iommu is not known to coexist with any other IOMMU hardware
> and shares the same ops between all instances, we can reasonably =
remove
> the hwdev/fwnode registration to put it back into "legacy" mode where
> the ops are effectively global and ->probe_device remains responsible
> for filtering individual clients.
>=20
> Reported-by: Beleswar Padhi <b-padhi@ti.com>
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Fixes: 17de3f5fdd35 ("iommu: Retire bus ops")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
> drivers/iommu/omap-iommu.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index c9528065a59a..425ae8e551dc 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1230,7 +1230,7 @@ static int omap_iommu_probe(struct =
platform_device *pdev)
> if (err)
> return err;
>=20
> - err =3D iommu_device_register(&obj->iommu, &omap_iommu_ops, =
&pdev->dev);
> + err =3D iommu_device_register(&obj->iommu, &omap_iommu_ops, NULL);

Thanks for this proposal, but this prevents my OMAP3 system completely
from booting (at least with v6.8-rc1):

## Booting kernel from Legacy Image at 82000000 ...
   Image Name:   Linux-6.8.0-rc1-letux+
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    6491520 Bytes =3D 6.2 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at 81c00000
   Booting using the fdt blob at 0x81c00000
   Loading Kernel Image ... OK
   Using Device Tree in place at 81c00000, end 81c1fe8e

Starting kernel ...

--- no further reaction --

As far as I see, all relevant devices are in the iommu_device_list but
only omap3.isp is really using iommu. So some other devices may fail by
this change.

BR,
Nikolaus


