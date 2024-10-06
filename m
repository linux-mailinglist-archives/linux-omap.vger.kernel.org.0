Return-Path: <linux-omap+bounces-2329-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42223991CFE
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2024 09:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE5911F21C65
	for <lists+linux-omap@lfdr.de>; Sun,  6 Oct 2024 07:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D556E16DC0E;
	Sun,  6 Oct 2024 07:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="kJjt34A7";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="OeYnL5VH"
X-Original-To: linux-omap@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9A12572;
	Sun,  6 Oct 2024 07:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728200606; cv=pass; b=ZpVNAjzX13cUoCp+f1/O426Q3UU94PUyhev1FUs8jNLoHRMA8jv9ZU5YdvjETu2FY8bjHhU5ss2feSrFJDOPb/mh67yU9ra+muqtuIfcXkORWai87ws5y8qZF0IbSeW6dA4TiWG3bNkL99NswrnwxgM3hwm6R87IkRSk15oEj04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728200606; c=relaxed/simple;
	bh=gaiah3wHzx659RQfayFyZWrfmxMrXgN/iNTsjt9vbRE=;
	h=From:Content-Type:Mime-Version:Date:Subject:Cc:To:Message-Id; b=MRHd3orgf47KQ58nx4YMfKPtPDnrp9OqRErNR/lluwdz8vrrLE0WxxWtI0UvWE5EYErPFmuWpXGvrPbbJ2h9fpwDfQ35wzXI0cCfpmfReCAtc8OdaGAbftZjsSGc863L3FrEZ5gv24nMH8pz2o1yq37pGpuwOw0WpFtbLjLGuek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=kJjt34A7; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=OeYnL5VH; arc=pass smtp.client-ip=85.215.255.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1728200412; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SjlNVSoLAeE7gSOTM+sDx5Y71HaJhoNQd0ifztJvUNzaIvw7d+LqGzjhjHZ8CPloQb
    Czw+I7ZTNwEw/2w6gx5/+ahfJaJesulntbPGGM9Z/fl89DTUCANMgnuS5RHoyHF3Us9E
    s1ggZOWqKZXEETny+WpNMW4qzBZ0aE2hLXnAJI9Wh2tFAPFnMRBJJFzxufKcwP9WMPUE
    oF5bAykS2ZPUY9WUtS1/+7waOSBu4F5n1IT6ULbBSvdT9y+6Pur8TVa8Whf5t6iObfua
    H0QtFkobbnvaph5n7wOmp0h6d4WOQkXo98DsfWg+cXYB5AZwgas/DBd4C7VlMfonHvKG
    pg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728200412;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=h4hR1fIkCCa2MfP47vD3dHYOoTz5dZpkEs/J7KjGdxw=;
    b=O9/xN36ftqQd3SR3mr83GrARRAMINb1mAdWrLgH5u82oblXwskxjt0K++i/CxsNfxS
    oDCNXclNYWKozi2pG2MvmLM9vQSf8zfpGmBXckO3PEvxhWT6/53HCiE+mbZY0HurIqXV
    i/6P/7G79tVQ0C93TRHnXa4wmjOba7GvNt40j2IjHy6C3aXWJT1w32bl6ENr1ngSWOMO
    2G+ozoNsJ72i5La+pn8lzQMjR2p0PuU7LQ5Aneqk3OAsSaZB4PdVkwIONiBnvQIToHXA
    IO7RknV/7GLvBXWptzkRhs7mTD17WllD7P6K397f9xu7FqsxgczStOPYyUCK4KhkMaij
    2+qw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728200412;
    s=strato-dkim-0002; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=h4hR1fIkCCa2MfP47vD3dHYOoTz5dZpkEs/J7KjGdxw=;
    b=kJjt34A7SzFX7R2iaFfF2rJ+qVxAShPArX5vEqoKGu6wFfb5jDpL+pi8BYHd/aa+uS
    4DGF3oyNIoCUvU8NyUfrrfQx3eH/9KjEEVNh6VmQmcYmQaHAFZkdHe9eOHLx/pJm0N5A
    BOserep+bAIjzcmQJARQeDv6tHlREj1/m0YKgzdwFBBxw4CkdvvHhlAu1cPfmvYNgj8X
    wsBl2dKzlSyYuNsqEYSWtjPksQMTyq0FxDCbRB+LsnCh/V8pgePz33D8IG3aXHsspxgA
    UxtE32+5hcGrPCKX2RHw+cK260bxrtfIHjlm2wHqxv6sr0vub044yZjBpVnOYuKR8L+t
    Sg+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728200412;
    s=strato-dkim-0003; d=goldelico.com;
    h=Message-Id:To:Cc:Subject:Date:From:Cc:Date:From:Subject:Sender;
    bh=h4hR1fIkCCa2MfP47vD3dHYOoTz5dZpkEs/J7KjGdxw=;
    b=OeYnL5VHrVGFHh6E74V9oGRh8GAu1EYqe9KtleWl2gn92IvkmL0xkwCboFeOn7jbRq
    1EHno3hQHHwFH5TiRVCA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.7 DYNA|AUTH)
    with ESMTPSA id Qd0dc20967eBMys
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sun, 6 Oct 2024 09:40:11 +0200 (CEST)
From: "H. Nikolaus Schaller" <hns@goldelico.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Date: Sun, 6 Oct 2024 09:40:00 +0200
Subject: BUG: "iommu: Retire bus ops" breaks omap-iommu and omap3isp
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lu Baolu <baolu.lu@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Jerry Snitselaar <jsnitsel@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <jroedel@suse.de>,
 tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-Id: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi,

I found that the camera on our OMAP3 based system (GTA04) stopped =
working with v6.8-rc1.
There was no bug in the camera driver but the OMAP3 ISP (image signal =
processor) emits

[   14.963684] omap3isp 480bc000.isp: failed to create ARM IOMMU mapping
[   15.010192] omap3isp 480bc000.isp: unable to attach to IOMMU
[   15.023376] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set =
to 24685714 Hz (div 7)
[   15.065399] omap3isp: probe of 480bc000.isp failed with error -12

Deeper analyses lead to this patch breaking operation. It is not fixed =
up to v6.12-rc1.

What seems to happen (in 6.8-rc1 code):

- omap_iommu_probe() passes &omap_iommu_ops to iommu_device_register()
- iommu_device_register() stores the ops in iommu->ops (only)
- __iommu_probe_device tries to read the ops from some fw_spec but not =
iommu->ops
- this calls iommu_ops_from_fwnode(NULL) which looks strange to me
- since it doesn't find any fw_spec or node matching a NULL fwspec it =
returns -ENODEV

So I wonder how the magic between setting the ops in omap_iommu_probe()
and finding them in __iommu_probe_device() is intended to work. Or how
the omap3isp driver should register some fw_node or fw_spec to make this
work.

What is a fix for this?

BR and thanks,
Nikolaus

Bug: 17de3f5fdd3567 ("iommu: Retire bus ops")


Note: Why did this bug not surface earlier? It appears that on OMAP3 the =
only driver
that uses iommu is omap3isp and connected cameras are not that =
widespread.
OMAP4 and 5 also use it for the DSP&IVA susbsystems which are also =
rarely used.
Hence it wasn't tested by anyone.


