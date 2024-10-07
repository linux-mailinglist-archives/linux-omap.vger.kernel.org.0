Return-Path: <linux-omap+bounces-2331-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE6992BC2
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 14:30:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9DFF282936
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 12:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4E551D2708;
	Mon,  7 Oct 2024 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="WjaDVqs7";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="/ppHk7zE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6031D14FA;
	Mon,  7 Oct 2024 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728304241; cv=pass; b=Jb4Rj4KBFB6qU5yvaFldwiRP601a9nRht8unvKgeDMEMWktRrIgfuSYb2pze5ddmLVhQIx3snJHX6KMwHfRHkTQTojlbsrtchByVAwK5HkkZMK72y7cfDfDQxF6Vz7HBrZg5EVyTnFeB6r9DYDmxnpYVZ19GPJpoCCcbzYgCKa8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728304241; c=relaxed/simple;
	bh=1PWo9tctrQWE2WTrs2JbpKaiILAYSvQ0hceshNyq6uo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=N7C3skGVOlTgIh2s4qTur9tnPeO3niB0+aXQcqHi3ZrvX0fVwbo8crGg9c/bKKmAeAp5pnfB1lTRPkG2rmRHwxK4rdYS/EyHSTH+YzvA3Jzj4/Zqtbyd3D9WhxXDeSFdg6gG5lRnLrj9lpQ66//j7XMLlUpKBbgm+o4Gp/3lMLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=WjaDVqs7; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=/ppHk7zE; arc=pass smtp.client-ip=81.169.146.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1728304217; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SsluR/XVS90n1+sgIHlpTwq1c4ITLtEEyw0KaZXVXHAfT4Avtgnoqexj7FPsqKdOz1
    YR+GES4tsvOkdYn0Ev0DWqVGYfKumvvUaM83q6GJ36VIXtpLG6hyLoT+eYH7PHTc2gOc
    r/73p6FvtfJQatHpQ4tS4RCHOcm0foccscEUarTsUmu7klr8lUrfDP0Ik2WBRNpriiS7
    jocV7VCnqxLqM86FiCOcLrUi2hGRpphtPGWB9TdzqKSEEr35haD1Plwi1JhKiuosZzqs
    DPI5pWD8EMRyDFKnzTmd1Gl2V/i2VgIcYlyEtoWWoztTs5ivKV7xlImhUi2pjAqFxTOy
    srgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728304217;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=375XtLOU9mHCVgSPS3tKHJvslztan0SSxd6+J7FYLms=;
    b=q3Zn5aRTDhKPAtUZcdN/y9sgDazo3YK5iAfqYu/NEeOlWSv3ILYmr5ct0/s0utOzsP
    y7FymXBQHRJkCdihcSh1JK88MtpzhFvqxb1p5jbtFGKyqsbUr1gCR0j+uNl6fztaQY7S
    BX7eSDzs+nbVTHAkE0AT4j1DLx86KBCdZx5YAFjSHCAJ9Z86+OOa9AgiZ6dVWb5Qab6s
    kbjppR7t16kLKG/sDvZ/b67oWs4SoHlQcd+DFWexfz+iEmbsS/9s0Ez/1QE2ySXlMr3P
    NyuSjER7kajmENGZb4XViRIeQ4i/Dw3CkpL6LbU+Idjb+uTy4cOG8I3HKtDlWLitnMqH
    v3Og==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728304217;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=375XtLOU9mHCVgSPS3tKHJvslztan0SSxd6+J7FYLms=;
    b=WjaDVqs7d/GM6ldq11sgTU4xUjT1SUoM9zhDZ+2JS5SEs+IFYBMEhcLrJ6xeVAhLbb
    28GBjOiRQvtVXSgtWRnXaoRUNB2OaDXWmm65jtyyY+7lOgsfTwliyOCvyelSa91Yxenh
    JMUbNv0usLtqYjeFfm+34s13i64YDtRRWcDbh4fvz1yPz+BY3Os/kljvqIXLZPhUkLiN
    SSNXC3lmM+0Bt8VfaY4ftze0qU81QF34JQiEMDqoW02PYZFekr4Xc0XgZvZ6gYf8gC4Z
    QKGlj/FZ0+l38dvStkOdQOVIy1w2Z4O2I1pQERwiDPRfqbzMw0FqwXXmsOcndqx9Q0ww
    h6zg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728304217;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=375XtLOU9mHCVgSPS3tKHJvslztan0SSxd6+J7FYLms=;
    b=/ppHk7zEgJnCv2CZU6B81xPTNUqL86pXmWBUB06308ksbtt+K2xbf3ZTmLy0YRrTpl
    Hd4C3CAUOhmYRd7YBsCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeTgZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.7 DYNA|AUTH)
    with ESMTPSA id Qd0dc2097CUGSMB
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 7 Oct 2024 14:30:16 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: BUG: "iommu: Retire bus ops" breaks omap-iommu and omap3isp
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20241007121543.GM1365916@nvidia.com>
Date: Mon, 7 Oct 2024 14:30:06 +0200
Cc: Robin Murphy <robin.murphy@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 Joerg Roedel <jroedel@suse.de>,
 tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <ED01709A-1A43-480F-A951-7367DA9748AE@goldelico.com>
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
 <20241007121543.GM1365916@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Jason,

> Am 07.10.2024 um 14:15 schrieb Jason Gunthorpe <jgg@nvidia.com>:
>=20
> On Sun, Oct 06, 2024 at 09:40:00AM +0200, H. Nikolaus Schaller wrote:
>> Hi,
>>=20
>> I found that the camera on our OMAP3 based system (GTA04) stopped =
working with v6.8-rc1.
>> There was no bug in the camera driver but the OMAP3 ISP (image signal =
processor) emits
>>=20
>> [   14.963684] omap3isp 480bc000.isp: failed to create ARM IOMMU =
mapping
>> [   15.010192] omap3isp 480bc000.isp: unable to attach to IOMMU
>> [   15.023376] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka =
set to 24685714 Hz (div 7)
>> [   15.065399] omap3isp: probe of 480bc000.isp failed with error -12
>>=20
>> Deeper analyses lead to this patch breaking operation. It is not =
fixed up to v6.12-rc1.
>>=20
>> What seems to happen (in 6.8-rc1 code):
>>=20
>> - omap_iommu_probe() passes &omap_iommu_ops to =
iommu_device_register()
>> - iommu_device_register() stores the ops in iommu->ops (only)
>> - __iommu_probe_device tries to read the ops from some fw_spec but =
not iommu->ops
>=20
> Maybe like this?
>=20
> @@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct =
platform_device *pdev)
>                err =3D iommu_device_register(&obj->iommu, =
&omap_iommu_ops, &pdev->dev);
>                if (err)
>                        goto out_sysfs;
> +               /*
> +                * omap has a DT reprensetation but can't use the =
common DT
> +                * code. Setting fwnode to NULL causes probe to be =
called for
> +                * every device.
> +                */
> +               obj->iommu.fwnode =3D NULL;
>                obj->has_iommu_driver =3D true;
>        }

I'll give it a try asap and report back.

BR and thanks,
Nikolaus


