Return-Path: <linux-omap+bounces-2492-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE039B35C1
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 17:06:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFB821C21FC8
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2024 16:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D1CA1DED48;
	Mon, 28 Oct 2024 16:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="B+rmS5v0";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="8/ObOuRE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCF51DE883
	for <linux-omap@vger.kernel.org>; Mon, 28 Oct 2024 16:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730131604; cv=pass; b=BkxQI8EHwLak/c0sUWz4wlS+x3ElQsqtuZzveZkzSPQ8ehyr4iu5RrGMUCePDIsPX1UPzet3FNm73TOddUOsMRqRUmG4G5PeFXsySFAO2137OO4mvyzo5kb6UTp8NntSECxxw5yb80uyZeHNXRV6QShxiVi0lDpbGdyUJ7wK884=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730131604; c=relaxed/simple;
	bh=g5Qk0MWU1OrftTWRQgvHjAOi0KRWTYsGa4ngK/CCh6A=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DBJoGbYJPqT4sQU8LGYjRl4Tksam5VQP1QU8p0Zd1lbhlxJLil46MvxDWAkVt53PxOWCo2N08jSOO03tK3mCIQjUBaxq46kd6zsiNTIInLEdwGC6hApQ+RQQj3UbgthZVYTzQ/TuQ/AelBicXqsa2A8LQdmWsJU7NQyuv3N85qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=B+rmS5v0; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=8/ObOuRE; arc=pass smtp.client-ip=85.215.255.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1730131407; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XDb1B9JMQb7iexZAMDmUNuc5W5wl57SMwDviKy7ScHLYyEb6bzVnfesQRd5CJivTAY
    eu1tMgndjEteQmTfrsGmDdwSoFGNgUN00mZdT+WcOO/n5c4WHO5F1NI13XI+aJu0uWbs
    TxxjANFBgVasl+8ODHuXpFyreXabBdYjF5FC2lhpreo/sgxpgcQmBv1sTN94nnseXJfV
    d/B32UlOgmWqW3OjekQCN8IEDsi+MTonTNc9DTX+C1T6Usz/LXEp+vGO3KOPUseSQd0f
    L0+5CiGKH2bfD8GWGekwzG3fZfWNrbAIf53yh3XomXe1fY79N2PQL1QQTfCXIHSZaY/K
    KCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1730131407;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=g5Qk0MWU1OrftTWRQgvHjAOi0KRWTYsGa4ngK/CCh6A=;
    b=bW97H1UvhmCBy3PIPlPi6MQ7aeMWbjwQMoGXr7EyvS2oDldnBsCHMksn51sQA7NKqI
    kSgV8aX1qc6+VlNHHLLO5gVcjuqyCAn87gEFYTQM9NjVlnlLShFUcVxlMSO7qHs7bYMv
    ruhTLrlqTbrBBXcRHubqB22nfK5rD1zV05lHD+IATpetM7tjyZGO4SSZcUxwEfMjtwIr
    m1uGncgUkSUmJcoiymMfMnnbDwBhfloKmjYo7nsTsT/b8oxeg9sXo0EDsTb3jEMueS8u
    ywAP8mFRFG4J9aY0tcEt3449V5mmZi1yZPMjx1zKfNnpfx9GUekFCD0LlxNiag//iyEX
    AF9w==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1730131407;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=g5Qk0MWU1OrftTWRQgvHjAOi0KRWTYsGa4ngK/CCh6A=;
    b=B+rmS5v0Y4ugpcFXfcuFXiB8/9dW7Cpz8k//7iWvT90fq5sLlye5vLhsez52YJoJ/o
    7bz86LksKjUdmcKQ5A7mqtyqSvYUjbpKeczD9totOQRrQmI2Gpk+YeyNENnG8/eu0wfU
    Oer2j22bc6Pgqvh77vRAnRoYlpBnoLK2fElH++spuzGdACSxHCiUSsP2oV4pGzWhHFt/
    7YA3wB2Mgf1a+MdihCpgXX2MsQAnviL3du8qvvp+LrkAfLQBe9F0DIojHRD0xMVvkCQn
    heOpunwB7CtrudQXPK+BBYQJlAHBD61bRMKAPMcMLONDEA3GbuECQMyl02u6RuAKIBA1
    aL4A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1730131407;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=g5Qk0MWU1OrftTWRQgvHjAOi0KRWTYsGa4ngK/CCh6A=;
    b=8/ObOuREeRcno3HrRDTQ1ieyRgITFE+ZRjXm3wr8w8SGfgWCa9aonf4xSU6h8mX7Ye
    ry8eZ83qPEiF3l9tAGBw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrV3ZoNnMiNdxeutsfZzRfx7IXe+fc9o4UKxSY="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 AUTH)
    with ESMTPSA id Qb7e4009SG3QJ9E
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Mon, 28 Oct 2024 17:03:26 +0100 (CET)
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
In-Reply-To: <73426db8-ca40-4bd1-9e8e-aeb111e5104c@arm.com>
Date: Mon, 28 Oct 2024 17:03:15 +0100
Cc: joro@8bytes.org,
 will@kernel.org,
 iommu@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E2DAEA83-D012-4F1C-AB77-CE39E9256EB2@goldelico.com>
References: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
 <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
 <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
 <FCFEB115-846A-4577-A489-D1537AC77DEA@goldelico.com>
 <5c3ea490-f2f5-49e5-99fd-1dc239aee28d@arm.com>
 <F4A297DC-8EBD-4434-97EA-BFEEBB062042@goldelico.com>
 <1a0ff734-73b2-4d73-839b-71e2017ae3c4@arm.com>
 <C6F2F131-2295-4655-A4E2-600200FD7318@goldelico.com>
 <73426db8-ca40-4bd1-9e8e-aeb111e5104c@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)



> Am 28.10.2024 um 16:58 schrieb Robin Murphy <robin.murphy@arm.com>:
>=20
>=20
> Oh fiddle... this is getting complex...
>=20
> I was testing the of_xlate patch rather than the diff below, which =
should avoid the deferred probe timeout but otherwise achieve much the =
same effect. Trouble is, that turns out to only "fix" things back to =
another breakage due to 4720287c7bf7 ("iommu: Remove struct iommu_ops =
*iommu from arch_setup_dma_ops()"), wherein we lost the fragile =
combination of setting up the IOMMU while still causing =
arm_setup_iommu_dma_ops() to ignore it. Thus what now happens here is =
the domain from the ARM DMA ops gets in the way of the driver attaching =
its own. Looks like I missed that with the remoteproc driver since it =
only starts trying to do IOMMU API stuff upon successfully loading =
firmware, which I didn't have.
>=20
> I think the most practical answer is going to be to give the ISP and =
remoteproc drivers the same workaround for that as the various DRM =
drivers use, lemme write those up too...

Sounds good. Please let me know if you have something I can test.

Best regards and thanks,
Nikolaus


