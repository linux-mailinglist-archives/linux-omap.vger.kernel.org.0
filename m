Return-Path: <linux-omap+bounces-3033-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8035A060BC
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 16:52:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 197B73AB13E
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30B4B1FECB9;
	Wed,  8 Jan 2025 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="eP8P8W/N"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1A661F949;
	Wed,  8 Jan 2025 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736351190; cv=none; b=QxTbxZiZzrfWEsBUIMmax7PNGaegdj/ZBclvT7pA39i+JwsCksCwqbe/acylLUXDV9aBQ1GLuGtEdGXza27G1IbunM+3CaMS7wSQ/F/R9FxFgrll1scR+tR2nqqTuUWgdPIqK/BEfNnRoP0u0cwnMdyiYQyWiQCwMzaHRcomWJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736351190; c=relaxed/simple;
	bh=G77Y0I4A7jJfb4q/9tbn9uE81MU1urLunbTDRyBooCU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYVY/AIilNcXL6Y0XuGTQIUas5ejbO2hqD7mjUkuqRpQ+pNshYWwgkLi18J0ydYpbh/8srxB47mkRqnPAPf1gEI5Sa8xC0rk1XDh/F/6Qf3WX318KcCE8/QMeWiYqqfGgR2NeOe+3pIgxMg2/z2DE5QAl+mZqWdbADdLdywDAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=eP8P8W/N; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 508FkFxI004464;
	Wed, 8 Jan 2025 09:46:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736351175;
	bh=yjeBkPMQqyR7BlVmHv45XiZ11hoiUcvKXfiavZCHrmk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=eP8P8W/Nn7cQREinI07bmmXbKiT0mWO9ZlPbh1GW6bBXa3nNUjggp8XXMZbSkdoFY
	 Nb4UP6Bg3A33yyhJxvpyHtI+i6OfmNgxdYZ415QuNy+cS6pkNZaNgMdaWgwuKJY/yD
	 OtzGchb2qkd46p8aoiEn/bSold/ZCJrH6ptoh+So=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 508FkFef012739
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2025 09:46:15 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Jan 2025 09:46:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Jan 2025 09:46:15 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.104])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 508FkE9v082617;
	Wed, 8 Jan 2025 09:46:14 -0600
Date: Wed, 8 Jan 2025 21:16:13 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Nishanth Menon <nm@ti.com>, Kevin Hilman <khilman@baylibre.com>,
        <devicetree@vger.kernel.org>, Romain Naour <romain.naour@smile.fr>,
        <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>,
        <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <kristo@kernel.org>, <vigneshr@ti.com>,
        Romain Naour <romain.naour@skf.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCHv3 1/2] dt-bindings: mfd: syscon: Add
 ti,j721e-acspcie-proxy-ctrl compatible
Message-ID: <ikfjvrqi7jbqmeyjejuhpe4iw7uzaqeuqc3ijf4t6wjqgvextt@j4w5cift7ev3>
References: <20241202143331.126800-1-romain.naour@smile.fr>
 <173344002250.407600.8303166891165540615.b4-ty@baylibre.com>
 <20250103212528.enq4ur5afxhwzh7n@outdoors>
 <7hr05eb5st.fsf@baylibre.com>
 <20250108131139.dygei6ejamh5zaij@segment>
 <1251db38-5009-4e93-9603-3ae02f276e5b@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1251db38-5009-4e93-9603-3ae02f276e5b@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Wed, Jan 08, 2025 at 09:09:37AM -0600, Andrew Davis wrote:

Hello Andrew,

> On 1/8/25 7:11 AM, Nishanth Menon wrote:
> > On 14:46-20250107, Kevin Hilman wrote:
> > > Nishanth Menon <nm@ti.com> writes:
> > > 
> > > > On 15:07-20241205, Kevin Hilman wrote:
> > > > > 
> > > > > On Mon, 02 Dec 2024 15:33:30 +0100, Romain Naour wrote:
> > > > > > The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
> > > > > > SoC are used to drive the reference clock to the PCIe Endpoint device via
> > > > > > the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
> > > > > > obtain the regmap for the ACSPCIE_CTRL register within the System
> > > > > > Controller device-tree node in order to enable the PAD IO Buffers.
> > > > > > 
> > > > > > The Technical Reference Manual for J721e SoC with details of the
> > > > > > ASCPCIE_CTRL registers is available at:
> > > > > > https://www.ti.com/lit/zip/spruil1
> > > > > > 
> > > > > > [...]
> > > > > 
> > > > > Applied, thanks!
> > > > > 
> > > > > [1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
> > > > >        commit: d8efc0b428856137608ffcbb6994da6041c9fe2a
> > > > > [2/2] arm64: dts: ti: k3-j721e-beagleboneai64: Enable ACSPCIE output for PCIe1
> > > > >        commit: 1d5e14a20dc60b440c60bec8489acfd45cdf7508
> > > > > 
> > > > > Best regards,
> > > > > -- 
> > > > > Kevin Hilman <khilman@baylibre.com>
> > > > > 
> > > > This will need a bit of fixup - See along the lines of the following.
> > > > Additionally, we should be a bit careful about the dependency of dts
> > > > mix up from two trees.
> > > 
> > > sorry, these should be going through your tree in the first place.  They
> > > are now dropped from my tree, please go ahead and take them along with
> > > Andrews fixup.  Sorry for complicating things.
> > 
> > 
> > Romain,
> > 
> > There is additional fixups needed, unfortunately as well: syscon yaml
> > has two lists based on which dt-schema version you use.. your patch
> > fixed one list, but missed the other as well. Could you integrate the
> > fixes and resubmit, please?
> > 
> > 
> 
> Or since we already have 'ti,j784s4-acspcie-proxy-ctrl' for the same
> reason, you could drop the first patch and re-use this compatible.

I had suggested this in the past since the ACSPCIE IP on J784S4 and J721E
is the same, but Krzysztof insists that there will be hardware differences
in the ACSPCIE block across J784S4 and J721E irrespective of what the
datasheet says, as mentioned by Krzysztof at:
https://lore.kernel.org/r/1bfdf1f1-7542-4149-a85d-2ac4b659b26b@kernel.org/
Therefore Romain had to introduce a new compatible for J721E.

Regards,
Siddharth.

