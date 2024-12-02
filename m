Return-Path: <linux-omap+bounces-2752-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C045F9E0AD5
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 19:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 44B14B6489E
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 15:46:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A703BBC9;
	Mon,  2 Dec 2024 15:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="jFnqVkxO"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDEBBA53;
	Mon,  2 Dec 2024 15:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733154356; cv=none; b=gBj80ZQOm/rhYzQ3tD9CgCRuDTgLRySi6uMghfSae0S5k/Nn6ElauVX8l5ZjyeO8Mxj9IXfqy5w5ISBK/z03Dr95AvHJIbGWV5gXmZ23eVB0bzfVCSPHhA/VAj/8i39ANu0k9jisuAl/RIOSzSXnQqlS0b5NXoLUXEommsiAhNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733154356; c=relaxed/simple;
	bh=4I9QHeroahVRAcECbMKflPvnEDVlzZlkgByl3OFeVto=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugP1Z0m9YI5KoRoSI/6aEGCBnr+7G6BOScRLUO5f93KhTVTVg4sX6PmJ1/vJbEFvJMYkPnb59Fc8bXUNedQMbM082fidhM2m6ZIxX7oaWe8tsH+eQHtgYLsc0l76N3RADPKQ0dRPZLzbSa4MYR771frTWC+cH//MC1YRR36ShSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=jFnqVkxO; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B2FjjrN114294;
	Mon, 2 Dec 2024 09:45:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733154345;
	bh=wANpDU65LhU/8X4F+bXK7+FUgsbERBICABWmsZeuQxA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jFnqVkxOIUyPOkGVaCVEyrgdzttAInlmUGz4K49J1QYGbRX3VbQ3/AaZiDZXls69J
	 sRj6A3T2hq5s6b27di1Uut3P1QDu+UJ1S31GYwueGCc1gbWo0jfrA5x/n7pbFTE0I6
	 DD5GMW2bDD0MDxEwp8a+YDExQw6lkTcWfj7Zm1og=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2FjjZr018855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 09:45:45 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 09:45:44 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 09:45:44 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Fjh03025124;
	Mon, 2 Dec 2024 09:45:44 -0600
Date: Mon, 2 Dec 2024 21:15:43 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Romain Naour
	<romain.naour@smile.fr>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>, <nm@ti.com>,
        Romain Naour
	<romain.naour@skf.com>
Subject: Re: [PATCHv2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable
 ACSPCIE output for PCIe1
Message-ID: <rjecpmr4bsedbfhu74sdlzmdz2mh2shsr5myawb3qveooawa3j@i2ysnnyf7hio>
References: <20241202101140.48778-1-romain.naour@smile.fr>
 <dabbad2b-f8a6-4ed7-86da-ec696cf67461@kernel.org>
 <k7udgqugqseweckb7hjniz3aops4kn35ttju2ju7f2pcbmndrg@dau5nr4leish>
 <abeb632b-9efc-48e5-a28a-a9d7c02e0a6e@kernel.org>
 <cndc3fopwhwkotfikul2jtzfczpdpwlrs5uhuqq76ck36ndtfs@gvxavxt5tgd5>
 <f332947a-d7b5-4f68-84d8-3ecce118c24c@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <f332947a-d7b5-4f68-84d8-3ecce118c24c@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Mon, Dec 02, 2024 at 04:09:51PM +0100, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:53, Siddharth Vadapalli wrote:
> > On Mon, Dec 02, 2024 at 12:07:17PM +0100, Krzysztof Kozlowski wrote:
> > 
> > Hello Krzysztof,
> > 
> >> On 02/12/2024 11:58, Siddharth Vadapalli wrote:
> >>> On Mon, Dec 02, 2024 at 11:14:46AM +0100, Krzysztof Kozlowski wrote:
> >>>
> >>> Hello Krzysztof,
> >>>
> >>>> On 02/12/2024 11:11, Romain Naour wrote:
> >>>>> From: Romain Naour <romain.naour@skf.com>
> >>>>>
> >>>>> Unlike the SK-TDA4VM (k3-j721e-sk) board, there is no clock generator
> >>>>> (CDCI6214RGET) on the BeagleBone AI-64 (k3-j721e-beagleboneai64) to
> >>>>> provide PCIe refclk signal to PCIe Endponts. So the ACSPCIE module must
> >>>>> provide refclk through PCIe_REFCLK pins.
> >>>>>
> >>>>> Use the new "ti,syscon-acspcie-proxy-ctrl" property to enable ACSPCIE
> >>>>> module's PAD IO Buffers.
> >>>>>
> >>>>> Reuse the compatible "ti,j784s4-acspcie-proxy-ctrl" since the ACSPCIE
> >>>>> buffer and its functionality is the same across all K3 SoCs.
> >>>>>
> >>>>> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> >>>>> Signed-off-by: Romain Naour <romain.naour@skf.com>
> >>>>> ---
> >>>>> With this patch, we can remove "HACK: Sierra: Drive clock out" patch
> >>>>> applied on vendor kernel for BeagleBone AI-64:
> >>>>> https://openbeagle.org/beagleboard/linux/-/commit/ad65d7ef675966cdbc5d75f2bd545fad1914ba9b
> >>>>>
> >>>>> v2:
> >>>>>  - use generic style comments
> >>>>>  - use "syscon" as generic node name for "acspcie0_proxy_ctrl" node
> >>>>>  - Keep the compatible "ti,j784s4-acspcie-proxy-ctrl" since the
> >>>>>    ACSPCIE buffer and its functionality is the same across all K3 SoCs.
> >>>>>    (Siddharth Vadapalli)
> >>>>>
> >>>>>    "The compatible "ti,j784s4-acspcie-pcie-ctrl" should be reused for
> >>>>>    J721E and all other K3 SoCs.
> >>>>
> >>>> No, it shouldn't and you got comment on this. You always need specific
> >>>> compatible, see writing bindings doc.
> >>>
> >>> Could you please clarify in which cases reusing the compatible is
> >>> permissible? The list of compatibles at:
> >>
> >> Never? You always need specific compatible. Did you read the writing
> >> bindings document?
> > 
> > I went through the bindings document again at:
> > https://www.kernel.org/doc/Documentation/devicetree/bindings/writing-bindings.rst
> > It mentions:
> > - DON'T use 'syscon' alone without a specific compatible string. A 'syscon'
> >   hardware block should have a compatible string unique enough to infer the
> >   register layout of the entire block (at a minimum).
> > 
> > The ACSCPCIE Block as well as its integration across all of TI's K3 SoCs
> > is the same i.e. same Hardware/IP. The register bits corresponding to
> 
> 
> And first rule for compatible property? DT bindings maintainers keep
> repeating it over and over - specific means soc as front compatible.
> 
> > the feature to be enabled/disabled via the ACSPCIE block are the same as
> > well i.e. "register layout can be inferred". The same goes for the
> > compatibles listed below in my previous reply i.e. they aren't bugs.
> > Same IP and integration across SoCs and hence reused in the sense of
> > Hardware and not Software. I hope this clarifies the rationale for the
> > "reuse".
> 
> 
> You mix re-use with fallback. These are almost never the same blocks,
> which you imply here.

I know that the IP is the same, the bits are the same and those bits enable
the same functionality of the IP across the SoCs. If you still insist that
they are not same, I don't know what to say anymore.

Regards,
Siddharth.

