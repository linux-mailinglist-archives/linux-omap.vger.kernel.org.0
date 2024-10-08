Return-Path: <linux-omap+bounces-2349-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC289957E1
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 21:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0DC928230B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 19:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F9F213EF1;
	Tue,  8 Oct 2024 19:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="BtScDeoK";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="iVLNGIX2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487CC212D21
	for <linux-omap@vger.kernel.org>; Tue,  8 Oct 2024 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728417170; cv=pass; b=qSOziRgEs3aF9GDEbC5BGthy8t1U0WuLKWMVLXGS0cjuenIB9KeCmkI+mgFBsVjQz5P2Bt+MU9km/6soLQ2SzMVFTbM7rcwAnH1wDWEdsfJABahvSmFh3NGArQsN+CYJKCQaQiZV4Y/3bbElryORGU0Eg0Tq0jIt9nAWkRKboqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728417170; c=relaxed/simple;
	bh=LWLQRMuk6VLiGGjtPa/jD7fbvOT5+5xGJfOHGVME580=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=gLFmsX2DcTYu7/c+hUU/aD5EJtwZHWit+53M+ZtelLwQ2jFLe4TThpw5F/DZzHp2wt515UcnhQF6v7JND5wRt4Xztk2ZFvicugEEzkCx0Wo/2BEcVA2Oj6MA8BQgkPATSND+flT+s+WXGZZGLd2i2KOmBbUZlQFyZ+iajvovMjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=BtScDeoK; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=iVLNGIX2; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1728417144; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=n2Rdqemcd+BKy2VSrn2OclWuGQn7Z3sbb5w0+ZgJhoZDFFnRQoQopbUyHjbfN4PK7x
    Rzrvw/m5nDmxKnH0sM7J+dAM5EPtOuBgWZyRTMFXH6TK9tjMKImpyRorHPD7KwZ7JNq2
    QN6QFHeU2dEBWuQ+gt4xCN2dLbQyOXsihe1Z47i9Tz899meGzWJZASnW0DBQIWxoPF/M
    s96O6ZK9zb45T5CuDWa0/cn7oI+NeMjowsfQZaUnrDOuQp1K5voNetO/1Afgjgrejwbg
    xnsELhnx5acIq+iNNx25u+1SWW4wDAPrO01x+2ti7MqPPCTtjzWdqeNYkBJatoqEclVY
    4xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728417144;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=LWLQRMuk6VLiGGjtPa/jD7fbvOT5+5xGJfOHGVME580=;
    b=Iq2h5eylq4s0OWIsg0zkT/tK4J3HsW/l8QP2ePUx2siihvHTv8YCxP7/KRrM0fLI1j
    egdYIuFYLeEUSQS9FBHin9nCdLPH0EcqPvb59HAbzxo+2cu9sB/OkV/SIp2CJJQayNVQ
    hgLuwaxyAtZjpARyDNaSAV0qGiWcsH1IWiTO3jB3h6iiLIzCPQPAEMzym7ID1knI05Tf
    f7i04vHxyw3DBoc3PSMUUQnKGpT0yiE0o3XvJ7LUHuTtAJC3olpcAiaQC3eaFE1qkv4m
    myS4WFcZUyapLNoG6nN3J12zmGBLjnEidEC4JCztzcb4hAhLR9bJHokv+6oLNJbnHkk9
    hiGw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728417144;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=LWLQRMuk6VLiGGjtPa/jD7fbvOT5+5xGJfOHGVME580=;
    b=BtScDeoK/ji9JGNl8QUihTPGOZR9r9VLf4qrwZSl3uT/cdyM1X24+hP5dRtj8nIF9o
    LqvHwF/lpTTLcz801zUWIh+qSZFMjyaIFWWLLpn5nMYf/bUPxBxVwllUO874fuO2lnhV
    7bkmNw2zjIeJYqZzDe7ulOVYJ/Bg989fcDaAqXOr1uvtXmKCC1UOPdto9fE5UPE/E1Zt
    gXHXM4GlGHBH7jRSwR9t+B5nyO1+2CY/5oAJhOwGNgCYSq8DE8Vav9rlxiSDNauhFkl9
    hGdeScTTwPCmSuh+Mw/BMe4dh2PqHqKGIou5uSYFXVU69LhCzXwJ+t8nMZHi/3nP30OX
    RkBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728417144;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=LWLQRMuk6VLiGGjtPa/jD7fbvOT5+5xGJfOHGVME580=;
    b=iVLNGIX2Vbu2J+CMFMb/9GMMVFrkpgf72QHhS5xhGPQNu/dVsSYfjQrkLJN9C/CIGY
    TH62qmH4euEX4wRBvWAA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.7 DYNA|AUTH)
    with ESMTPSA id Qd0dc2098JqOZaR
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Tue, 8 Oct 2024 21:52:24 +0200 (CEST)
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
In-Reply-To: <5c3ea490-f2f5-49e5-99fd-1dc239aee28d@arm.com>
Date: Tue, 8 Oct 2024 21:52:13 +0200
Cc: joro@8bytes.org,
 will@kernel.org,
 iommu@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F4A297DC-8EBD-4434-97EA-BFEEBB062042@goldelico.com>
References: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
 <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
 <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
 <FCFEB115-846A-4577-A489-D1537AC77DEA@goldelico.com>
 <5c3ea490-f2f5-49e5-99fd-1dc239aee28d@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)



> Am 08.10.2024 um 20:20 schrieb Robin Murphy <robin.murphy@arm.com>:

>> The -ETIMEDOUT seems to come from of_iommu_configure().
>=20
> Oof, yeah, now we've wound up with the opposite problem that because =
it's the generic "iommus" binding, it gets as far as of_iommu_xlate() =
but now the NULL fwnode no longer matches the phandle target so that =
thinks it's waiting for an instance which hasn't registered yet :(
>=20
> OK, different track, does the diff below fare any better? (I've not =
written it up fully yet as the DRA7 special cases will need some more =
work still)
>=20
> Thanks,
> Robin.
>=20
> ----->8-----
>=20
> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
> index c9528065a59a..44e09d60e861 100644
> --- a/drivers/iommu/omap-iommu.c
> +++ b/drivers/iommu/omap-iommu.c
> @@ -1723,12 +1723,19 @@ static void omap_iommu_release_device(struct =
device *dev)
>=20
> }
>=20
> +int omap_iommu_of_xlate(struct device *dev, const struct =
of_phandle_args *args)
> +{
> + /* TODO: collect args->np to save re-parsing in probe above */
> + return 0;
> +}
> +
> static const struct iommu_ops omap_iommu_ops =3D {
> .identity_domain =3D &omap_iommu_identity_domain,
> .domain_alloc_paging =3D omap_iommu_domain_alloc_paging,
> .probe_device =3D omap_iommu_probe_device,
> .release_device =3D omap_iommu_release_device,
> .device_group =3D generic_single_device_group,
> + .of_xlate =3D omap_iommu_of_xlate,
> .pgsize_bitmap =3D OMAP_IOMMU_PGSIZES,
> .default_domain_ops =3D &(const struct iommu_domain_ops) {
> .attach_dev =3D omap_iommu_attach_dev,


Unfortunately no change :(

A very tiny issue was that the second argument can not have a const =
specifier in the
v6.8 series, but starting with v6.9 it should be there. But since 6.8 =
and 6.9 are
already EOL, there will be no back-ports anyways. And if someone does =
really
backport (like me for testing purposes) it is obvious what to do.

BR and thanks,
Nikolaus


