Return-Path: <linux-omap+bounces-2517-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 985EF9B6155
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 12:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5613A284218
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 11:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FA21E47BF;
	Wed, 30 Oct 2024 11:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="Qn5HcpE+";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="6UZADULY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15AD4D8A7;
	Wed, 30 Oct 2024 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730287262; cv=pass; b=lDI071BqCVpFXu+ckvTSxLBnJ3kOsqqe79R8iJ4+CDUOv0Buy6dlRJy0RLqcTuDhcsZeGIc9ITsmXBix5gv+QJQNfCobhlYMIkXQEPfavnXeg3bq4ohvkma/qXXGxSZupmqNTfYxUCiRp+jXlbLnNkDMnevOFcOFj3nPrqSBMU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730287262; c=relaxed/simple;
	bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=LlsZvR/CWAiBovDRtnUDDjMuga9uTFspYNBEobfxXZapzAYv2iCBGTZVd98vhrMotUbX3LEcpiWxrVBF1CXJAW5pR9sekXt0aZYy0VDgHboZZfe2aGTDyHAa7EhMC7MwrzIrr4QPc0VHMP4wcN/G+l3RiQCJC6azop1OIDt4XoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Qn5HcpE+; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=6UZADULY; arc=pass smtp.client-ip=85.215.255.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1730287242; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LmkKYPnwFayGvNkyNGGwfTRPC30WQtV7XVBUPB46vNmTh2YUIvWSJJ3KTu2oXkPWg9
    TQbPRw+CLNAPa0Z7npruX/zRsusDgjrQcxVYqaXL1tWDY0p0sPl4NanMz6fAvfJwXe0C
    KUTGNayfcIHxeQdwzQQNOgzJeYObE27j9ZsBWz+uD6Y2Y1SXVK6poG3pWVPb9UBS+Lpq
    ZY6FWCXj8CRkxAPQ0hy9izvHRDQHsAbqV0qN42ks+wvHybgBmSqh/AeZMoWYtCI9Gz6G
    1y4yrzpMopQETTqMY0Mxiz11hVl9yX1KHPVKmF5HDZjGUjVIXHIMb9XdRO9VyX2FtZiz
    t+4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1730287242;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=;
    b=NBtam4dkLBq0eRjr70Gb2zRoQxURDptQp8EQT8w2lNfmJwaBkuPlKa3n7hWODPdPbZ
    FnqxBLOVgQ3ShuH1k2YPGkCtQLYByn2RTQtK7jD4INLIv8sW2nZ/o3NeifENIlDSaMMx
    d82ZPsfucbBpQqv4zpUQ1+mdVvj5fU6bzSo8QLJDeqSabiZE5eaOXZra5VEXX/o5Kyq5
    YrYYJClbQ7ogLI90U5CJ+rv+EFiuG0n7HKNxb01XNoLtaoR3cnQmZYnsr619eMSG1xfF
    JEUXjSPkNi2sZogTYpzoSgq2vsP57WccPFgOjkVlq3suIrdqAN9M3f5uH8pgwaBH4y2v
    UJ6g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1730287242;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=;
    b=Qn5HcpE+a9FbmOVJItB3kUbL0rgA+G2bddmVOCUSfLabE3qcPoE/Gr1J9tmmmwkpXP
    v+o/GQkMBWuT8Wfq7YnXCqz4rQVVRL3f9l37pJCIvRpztlo/onzPjuxFWry40nFSRjwB
    MhWu9ocxBgpDeJumK6dRUxer6tRSKk+W7tRKKChQahmiAp5hSGZUbTxtvmcyNzFFsmZ6
    utC+bVhy3TrZDGsq6ycE56w+vq2vOQiD2DM4LuU3HQGsD71FT1ynBj5tOEnhe5UyM0K9
    3x2IYcBYfJPW5VkHrWzEHhcXtB09Px13+ndbiChmRWnbGZTGHkGYV01z+qlHnRV4sbK2
    1vyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1730287242;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=eqlPk3VbpPRo0CwoqYeA+mkYbzA2YumBxWU5LsG9F6I=;
    b=6UZADULYg4bR6wpt3xghzPOnsSR2uVqfNG6++6FbYSlefN4k43O5NvtlftKYmzEquZ
    b3Mh5+sSFIUqA5xMIgBg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrSiJpeyMiNH8TaiW2pBcBKxu1ib9gQlpMMsbZm"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id Qb7e4009UBKgS5B
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Wed, 30 Oct 2024 12:20:42 +0100 (CET)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <ZyIClriScBy4s6LX@8bytes.org>
Date: Wed, 30 Oct 2024 12:20:31 +0100
Cc: Robin Murphy <robin.murphy@arm.com>,
 will@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 mchehab@kernel.org,
 andersson@kernel.org,
 mathieu.poirier@linaro.org,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 iommu@lists.linux.dev,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-media@vger.kernel.org,
 linux-remoteproc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com>
References: <cover.1730136799.git.robin.murphy@arm.com>
 <ZyIClriScBy4s6LX@8bytes.org>
To: Joerg Roedel <joro@8bytes.org>
X-Mailer: Apple Mail (2.3776.700.51.11.1)



> Am 30.10.2024 um 10:55 schrieb Joerg Roedel <joro@8bytes.org>:
>=20
> On Mon, Oct 28, 2024 at 05:58:34PM +0000, Robin Murphy wrote:
>> It seems omap-iommu hasn't had enough mainline users to avoid =
bitrotting
>> through the more recent evolution of the IOMMU API internals. These
>> patches attempt to bring it and its consumers sufficiently up-to-date
>> to work again, in a manner that's hopefully backportable. This is
>> largely all written by inspection, but I have managed to lightly boot
>> test patch #3 on an OMAP4 Pandaboard to confirm iommu_probe_device()
>> working again.
>=20
> My initial reflex would have been to just wipe the omap drivers,

Why that? There was a discussion and everyone agreed to remove omap2,
but not omap3 and later.

> hardware is 10+ years out of production, no? So who is still using =
this
> hardware with recent kernels for other purposes than kernel testing?

There are some devices besides the PandaBoard. I am aware of these where
this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
(in production) and we are currently thinking about producing a tiny =
series
of the DM3730 based GTA04A5 with spare parts.

And of course we want to participate from the latest and greatest =
upstream changes.

>=20
>> This supersedes my previous patch[1]. Patches #1 and #2 are =
functionally
>> independent, and can be applied directly to their respective trees if
>> preferred.
>=20
> I applied patches 3 and 4 to the ti/omap branch.

Thanks,
Nikolaus


