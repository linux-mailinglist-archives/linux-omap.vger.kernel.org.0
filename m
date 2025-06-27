Return-Path: <linux-omap+bounces-3990-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 917F1AEC24F
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 23:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 33941188462A
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 21:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D59B28A700;
	Fri, 27 Jun 2025 21:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="AQfIPDnO"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DA1FBCB5;
	Fri, 27 Jun 2025 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751060930; cv=none; b=N0VFn1NgllnuIOkL1I3iDw6PxEH7d7Sa33VYrddeQBQ/Vdsgak9Z+AKG4dJqXh5K7OfWcRLg2PlMyR82iDT5uFFyrlAUpN8kRpJM1gqxMeFvSkpkDOZLZKciezrAVI0oCD202mIUlCCbYDzgpSaVpBrPporH6N4Nn9OkktzifX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751060930; c=relaxed/simple;
	bh=RB25scHzcHUecT2LoPbXGgFC+nSWwtL47Zd0BDvbfR4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=frMaPVOHWrmddObZvyNzpHRCgI+IMuvYXeK7gIVOFT6dYFpVhMdg11Ohqo1VNEZRUS1EVb6RItHHcT9UlwA6G0VIgU+r8zcFQrmaSnUnv+Kw9HTws1m3eI2Pxqbxi2udSQiRDBbvy4AZ8eGxypLgdf8Y2Gt+to6R9/OgN1MxLu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=AQfIPDnO; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55RLmK8d2841413;
	Fri, 27 Jun 2025 16:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751060900;
	bh=c48FdaYUBETORNVRHnKeGAi+dO5DvZl4pZvPld9S9xs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=AQfIPDnOuERmi0XwmMIvUYTCmUpBOeKEQY7wxkcO8M7+Yxbp0ibrKJco1fhXiU8pt
	 HsPuS4sKbGLvDQ+XCNx3tS7nfSEuCL86z1TgYM/xpWrdhqAbB4oj+ISf+sPyNksGyn
	 tdgFeG+JRjjY+knEm9QNv+/eBqIryYtZmUkdckCI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55RLmKSP751364
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 27 Jun 2025 16:48:20 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 27
 Jun 2025 16:48:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 27 Jun 2025 16:48:19 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55RLmJ7J3755700;
	Fri, 27 Jun 2025 16:48:19 -0500
Message-ID: <89457440-8b3f-4e21-8352-6ee05b269398@ti.com>
Date: Fri, 27 Jun 2025 16:48:19 -0500
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
To: Kory Maincent <kory.maincent@bootlin.com>,
        Tony Lindgren
	<tony@atomide.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Aaro Koskinen
	<aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Roger Quadros <rogerq@kernel.org>,
        Russell King
	<linux@armlinux.org.uk>,
        Paul Barker <paul.barker@sancloud.com>,
        Marc Murphy
	<marc.murphy@sancloud.com>
CC: Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>,
        Bajjuri
 Praneeth <praneeth@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
        Romain Gantois
	<romain.gantois@bootlin.com>,
        Conor Dooley <conor.dooley@microchip.com>
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi Kory,

On 6/20/25 3:15 AM, Kory Maincent wrote:
> SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Green
> (BBG). It has minor differences from the BBG, such as a different PMIC,
> a different Ethernet PHY, and a larger eMMC.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>

For the series,
Tested-by: Judith Mendez <jm@ti.com>


