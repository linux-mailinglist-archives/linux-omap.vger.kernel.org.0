Return-Path: <linux-omap+bounces-2651-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE1D9C37BD
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 06:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48F071F21E3C
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 05:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BF114D439;
	Mon, 11 Nov 2024 05:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Eydcq1Fs"
X-Original-To: linux-omap@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A297F48C;
	Mon, 11 Nov 2024 05:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731302562; cv=none; b=I0DfK9k0Ex4Y4Ql7+6opQXrjsgAHd7+o+rABDmiGIm3AHxjvpaPyVNBLuDGAyelc3wWfak1gtEispQs4nWCL8W+oOm/qpdyxLYcsQ0GvRwsRU8S7+GNvLzxmth7hQ48/qzAef5VKigupiTfafdt/L4Z+nZNPbPz6kd8+S6YkvlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731302562; c=relaxed/simple;
	bh=Bw9LWQlZnCFPbZnHkKyCfmD7S3zw3L7iavpKU0ULmps=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lq4k5m+flG+Dy7vwZCcJ/Na3XVABRZ3bLoqhI636TEcHmf17yBYiD5+ykbte1GLkEQ/7sOFJHrGSZL8VLz40g8YrlAGl62h1xOXLXcILEEtlIY6/Ojecfep/SVf6xfUCmRjh4Lp4m0ua+jrQevdRN9NlN4tL9xd0xyUpbCHG7cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Eydcq1Fs; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AB5MHXl107072;
	Sun, 10 Nov 2024 23:22:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731302537;
	bh=Pds8U84YLO1Rxp/CMtOtZpQB5O4H9mwiZVEmcFSOLaU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Eydcq1FsgvHGpu6zT/vhafWVwlokmaKm8Ouh0zFIJ3UypSjHcVWVsCTvMjifLCu3B
	 0DwRmZxsYGGDc0tgbx5IpPgTlYo00HTwukHlK7CZTILvUhIHaGISciSXuTjIox8rco
	 xUVCqvz0Y/RIlMe1Ad5XZOWJBRyKjNC/MH3xufNU=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AB5MH2Z030528
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 10 Nov 2024 23:22:17 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 10
 Nov 2024 23:22:17 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 10 Nov 2024 23:22:17 -0600
Received: from localhost (uda0492258.dhcp.ti.com [10.24.72.81])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AB5MGrr064822;
	Sun, 10 Nov 2024 23:22:16 -0600
Date: Mon, 11 Nov 2024 10:52:15 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Roger Quadros <rogerq@kernel.org>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        Andrew Lunn
	<andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni
	<pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        <linux-omap@vger.kernel.org>, <netdev@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <srk@ti.com>,
        Pekka Varis <p-varis@ti.com>
Subject: Re: [PATCH net-next 2/2] net: ethernet: ti: am65-cpsw: enable DSCP
 to priority map for RX
Message-ID: <cfd634a1-3cff-4edd-8db8-d979b37cc2ea@ti.com>
References: <20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org>
 <20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org>
 <8e6053ca-77fc-4f03-ae54-3f6af0addb88@ti.com>
 <7ae1ccf9-67c0-45ba-9cb9-886701adb488@kernel.org>
 <208a1472-c69b-4c20-9bb2-25158edfd7d8@ti.com>
 <73f8d7a9-59ef-4d54-a024-4cf99d60abc0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73f8d7a9-59ef-4d54-a024-4cf99d60abc0@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Sat, Nov 09, 2024 at 12:31:24PM +0200, Roger Quadros wrote:
> 
> 
> On 08/11/2024 16:42, Siddharth Vadapalli wrote:
> > On Fri, Nov 08, 2024 at 02:55:18PM +0200, Roger Quadros wrote:
> >> Hi Siddharth,
> >>
> >> On 08/11/2024 14:30, Siddharth Vadapalli wrote:
> > 
> > [...]
> > 
> >>>> +#define AM65_CPSW_PORTN_REG_CTL			0x004
> >>>
> >>> nitpick: indentation needs to be fixed here to align with the macros
> >>> below.
> >>
> >> It is fine in the code and in my editor in this reply email.
> > 
> > That's strange. But it appears the same to me as seen at:
> > https://lore.kernel.org/r/20241105-am65-cpsw-multi-rx-dscp-v1-2-38db85333c88@kernel.org/
> > where the indentation looks incorrect.
> 
> It is probably editor specific. There are in fact 3 tab spaces to align it
> with the number.
> 
> Can you please apply the patch and see if it is OK in the code?

I still see the indentation being off, but maybe it is just me seeing
this incorrectly.

Regards,
Siddharth.

