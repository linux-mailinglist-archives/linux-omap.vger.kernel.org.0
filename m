Return-Path: <linux-omap+bounces-2487-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D75A79B090B
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 18:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C5671F24307
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 16:01:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A07F414A4C3;
	Fri, 25 Oct 2024 16:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="svLii+X4";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="few+zdEU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3980502BE
	for <linux-omap@vger.kernel.org>; Fri, 25 Oct 2024 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729872077; cv=pass; b=lFN+lUZ+NEZEPLVeKpO2gDoP87Bd4wZoCZuP8/FHp/LU6NXph1v+Btdzr0IIGTASu7BdFU/fZzW2jMjFemoU/FLvxBSR1bpW2z2oGR8ThvJfoVqIEdQb1dbho9Zr2OxI6gOe/WCOpgDnsK0+IReyXvgc8E8g9xT8VzfThlDIdm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729872077; c=relaxed/simple;
	bh=OdMxEjoRgaOSzfpXyUwvbjS1SpFJYxXeMgYD1njoUBk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=a47kV25Rx8y88iXBYpxDm8O43LxJvaaGogsI1XPK9LNHC+t7Hd/VYX+LlnrghNxkvj1MkdlfD3zO0lvyjkdbfFRfwta6Ch9i/RjnYcUIZ+V2OI2ApmAZ6ReOHgf2qg3C0akO1GfAKCvpyP+/8xeUwfgKWhSQ4RomoekMRfl66UA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=svLii+X4; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=few+zdEU; arc=pass smtp.client-ip=81.169.146.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1729871338; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UE3686DZ+QtCaZ7g3fOcSGYWxcgUT48AWbHVZCNb9GeVgbVd1ZUHPRq9HjgCmtFHz5
    gRJ37mUPHvzkRWqLhP8Ll0eJt90npSDGxzRh+H/FV2hdSfRr4xRZscl6+yh3gN+xW6YM
    9nvsw67dt8WwJsfWfYK7BVi+Cobg7Szen8H0JoOMpzWalC/4rJzNRPotJNuvt0CpzE2x
    SgyvJZXyRcfHsz9X6CfE43qHXCdNgnt1GSdkxb+zadw7s/KJ5rQoUds0lQn2hnzS4OkQ
    FBIFhKhwV1NWh1Aa2XIHxO9joM/qGQUHIIWyCEhLuYm4vnfE/aWggCc6IWTtJK7jPp9E
    TbQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1729871338;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Fl4DLKG2qje0LjvoGUJ5q13NO4RVnzpmuUKVa94nfcw=;
    b=dsYLWT7ClQPMzsIazgxjQhHsoGjGkN9Ec3jEQG7pUtm2zTtewtNcN2KeLi3JfVb+P2
    LQnaShFqfm99KLB9xvtjJXspnq4rJ/m5wGdFcNg8e4AOBh+WE6m0xEvPJ7TtahS/oL8B
    D5h+oI70QFum3wuysZm53Xl62x7Sw1OJduQTOyTNXUCaPcd6EVSbVevMXVV0H4G8v74h
    F5JrHAx9bZMtcU0nEna1+RR8sBAS7kUkyQ/gjS4ghDiWr4Ykv5SpHHEM/AbDdKrZwx9s
    zm/GVyiKhglzQmpmDGCfAWSrF2bAyArtdPYQnTjyBjTWY/kgOx+GzMtjrNEzfWejf/UB
    c4HA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1729871338;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Fl4DLKG2qje0LjvoGUJ5q13NO4RVnzpmuUKVa94nfcw=;
    b=svLii+X4rdKp8eGSskTrPp2cGUTd1HH2zodr1sq9IFLOn6AuG/MRXJ6NMRjIpVlSu9
    Syy1RD4+ckfq9N2OZ9N+LK7cm6ulvHsKfNUo5zHYf5y2iODB8VGHx+FfNJu+f8kVQgSO
    pdZAm54EjTeyHkS6EacFOLCEK3t/UUljpzWHuUhabFrdVXSehc9/jOFpVrGIfxQPJGRU
    rr/KfTCbevQtLKnKa1COWlnNKm8xstSKGgwoaFJe0rwn9Yw3XPZbcyded/iRrK1pybVh
    SE7U2Ph09eZdOBn6Wimvav0DU+bL5WdL1cfxt1BDyuRClpme32i2Tbl/Ae+hwlcOUsJt
    tAgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1729871338;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=Fl4DLKG2qje0LjvoGUJ5q13NO4RVnzpmuUKVa94nfcw=;
    b=few+zdEUD4WFc7CXDKiL35xBm9ljNtlfHoFlMiC3RO4cdKv0+I8AGcoPdYEyq7K63V
    L9bKsVazkMHFb5GfA9Cw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDAZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.11 DYNA|AUTH)
    with ESMTPSA id Qb7e4009PFmw873
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 25 Oct 2024 17:48:58 +0200 (CEST)
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
In-Reply-To: <1a0ff734-73b2-4d73-839b-71e2017ae3c4@arm.com>
Date: Fri, 25 Oct 2024 17:48:47 +0200
Cc: joro@8bytes.org,
 will@kernel.org,
 iommu@lists.linux.dev,
 Jason Gunthorpe <jgg@nvidia.com>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Beleswar Padhi <b-padhi@ti.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <29B298AD-43E8-4A18-9E12-B3D59A270E79@goldelico.com>
References: <c44545c6d07c65d89daa297298c27bb0f15c8b84.1728393458.git.robin.murphy@arm.com>
 <2863ACA9-2836-49F6-9D85-749CE480804D@goldelico.com>
 <10d3a86c-d7a8-4ac5-8ad3-010a91c0a25f@arm.com>
 <FCFEB115-846A-4577-A489-D1537AC77DEA@goldelico.com>
 <5c3ea490-f2f5-49e5-99fd-1dc239aee28d@arm.com>
 <F4A297DC-8EBD-4434-97EA-BFEEBB062042@goldelico.com>
 <1a0ff734-73b2-4d73-839b-71e2017ae3c4@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi Robin,

> Am 25.10.2024 um 16:27 schrieb Robin Murphy <robin.murphy@arm.com>:
>=20
> On 08/10/2024 8:52 pm, H. Nikolaus Schaller wrote:
>>> Am 08.10.2024 um 20:20 schrieb Robin Murphy <robin.murphy@arm.com>:
>>>> The -ETIMEDOUT seems to come from of_iommu_configure().
>>>=20
>>> Oof, yeah, now we've wound up with the opposite problem that because =
it's the generic "iommus" binding, it gets as far as of_iommu_xlate() =
but now the NULL fwnode no longer matches the phandle target so that =
thinks it's waiting for an instance which hasn't registered yet :(
>>>=20
>>> OK, different track, does the diff below fare any better? (I've not =
written it up fully yet as the DRA7 special cases will need some more =
work still)
>>>=20
>>> Thanks,
>>> Robin.
>>>=20
>>> ----->8-----
>>>=20
>>> diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
>>> index c9528065a59a..44e09d60e861 100644
>>> --- a/drivers/iommu/omap-iommu.c
>>> +++ b/drivers/iommu/omap-iommu.c
>>> @@ -1723,12 +1723,19 @@ static void omap_iommu_release_device(struct =
device *dev)
>>>=20
>>> }
>>>=20
>>> +int omap_iommu_of_xlate(struct device *dev, const struct =
of_phandle_args *args)
>>> +{
>>> + /* TODO: collect args->np to save re-parsing in probe above */
>>> + return 0;
>>> +}
>>> +
>>> static const struct iommu_ops omap_iommu_ops =3D {
>>> .identity_domain =3D &omap_iommu_identity_domain,
>>> .domain_alloc_paging =3D omap_iommu_domain_alloc_paging,
>>> .probe_device =3D omap_iommu_probe_device,
>>> .release_device =3D omap_iommu_release_device,
>>> .device_group =3D generic_single_device_group,
>>> + .of_xlate =3D omap_iommu_of_xlate,
>>> .pgsize_bitmap =3D OMAP_IOMMU_PGSIZES,
>>> .default_domain_ops =3D &(const struct iommu_domain_ops) {
>>> .attach_dev =3D omap_iommu_attach_dev,
>> Unfortunately no change :(
>=20
> Hmm, I dug around and found a Pandaboard in the cupboard, and =
ostensibly this seems to work as expected there:

Oh, fine! I did not yet think about cross-checking with my PandaES =
(because I have no camera connected).

>=20
> 6:12-rc3:
> chu-chu-rocket:~ # dmesg | grep -i iommu
> [    0.628601] iommu: Default domain type: Translated
> [    0.633575] iommu: DMA domain TLB invalidation policy: strict mode
> [    1.636047] omap-iommu 4a066000.mmu: 4a066000.mmu registered
> [    3.265869] omap-iommu 55082000.mmu: 55082000.mmu registered
>=20
> 6.12-rc3 + of_xlate:
> chu-chu-rocket:~ # dmesg | grep -i iommu
> [    0.629577] iommu: Default domain type: Translated
> [    0.634582] iommu: DMA domain TLB invalidation policy: strict mode
> [    1.622802] omap-iommu 4a066000.mmu: 4a066000.mmu registered
> [    3.316009] omap-iommu 55082000.mmu: 55082000.mmu registered
> [    3.329040] omap-rproc ocp:dsp: Adding to iommu group 0
> [    3.335083] omap-iommu 4a066000.mmu: 4a066000.mmu: version 2.0
> [    3.356506] omap-rproc 55020000.ipu: Adding to iommu group 1
> [    3.362396] omap-iommu 55082000.mmu: 55082000.mmu: version 2.1
>=20
> Guess I'm going to have to dig further for an OMAP3 to figure out what =
additional shenanigans that ISP driver is up to... :/

I don't have much time for this issue at the moment but will try to get =
new insights.

BR,
Nikolaus



