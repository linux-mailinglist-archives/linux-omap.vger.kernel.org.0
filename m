Return-Path: <linux-omap+bounces-4212-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B452B24B2E
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 15:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 013261883A95
	for <lists+linux-omap@lfdr.de>; Wed, 13 Aug 2025 13:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A499D212560;
	Wed, 13 Aug 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmXszElT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400592EB5CD;
	Wed, 13 Aug 2025 13:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092973; cv=none; b=nM7WeubdOvJNHs4MPD3WZ8Qd0YcBQuX2BrNpRp+FLVISyvwPNsBDHW+ATTkz9xbFyvVSCrIeWjbgUq7gOl9tGnB0L6RsXbTyWbimghqMVo40zGgEUcvPQ4Hwp/83Q9fQZQXaKlJYI8wr26to7KfCBrQZulJ/H2YDY2Rk1R2Tx7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092973; c=relaxed/simple;
	bh=olxcyq3RDbovnXfIfD6NCYHtJTFx0WilAU8Drh9OdZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ArSHqL0ZOYWK3+lZCD07EPhr9eKK0ysBZoqYKxP0ZWHM9mrs+OMQdimizZtjCngQi+4RXrVreXCJpJkabj/yN62Vtr5tG1VAELQQ6SA9R/wrh6DfjEL7Y9Xd2lzGn2GlI0gL1rmHOyfBTFlflP8K7NcTEqXwXTkdUoedtRHn2N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmXszElT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1516AC4CEEF;
	Wed, 13 Aug 2025 13:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755092972;
	bh=olxcyq3RDbovnXfIfD6NCYHtJTFx0WilAU8Drh9OdZg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bmXszElTXraCzTa9Thri84qE6olfl7BXmuBQJJRxqfq/vnMYqTxVZ0XokuqLk6KzR
	 Kfv/qJn7SgEw1HIjBZS1RqcBvZqT9JM20DIggF8dCdMG8lalB/GBMFKQohDipRr+qq
	 K8YDSQPoGMUsnPJso8KO2jqhG9IjI52ASUtltLNiixxgs4Lh0RaW646uW8BnahlG92
	 cnewSEcHyZepu0aZhWXhIcIfxEbZrOHTuWucQYSujHlf6fbSL2bRQAgAqBOGrkFw7f
	 meC+ORzGO2+ea+H+33909e0sDLxX4FA4ucPf5fK1cK6jxEj1RDavBvkJ4RHkKTMJ9y
	 9V5ZlMCszuo4Q==
Message-ID: <d787ca03-a54e-46ae-828b-68fbd7b0b3a8@kernel.org>
Date: Wed, 13 Aug 2025 16:49:27 +0300
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 8/9] net: ethernet: ti: am65-cpsw: add network
 flow classification support
To: Jakub Kicinski <kuba@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 danishanwar@ti.com, srk@ti.com, linux-omap@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250514-am65-cpsw-rx-class-v4-0-5202d8119241@kernel.org>
 <20250514-am65-cpsw-rx-class-v4-8-5202d8119241@kernel.org>
 <20250516182902.5a5bfd98@kernel.org>
Content-Language: en-US
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20250516182902.5a5bfd98@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/05/2025 04:29, Jakub Kicinski wrote:
> On Wed, 14 May 2025 15:04:28 +0300 Roger Quadros wrote:
>> The TRM doesn't mention anything about order of evaluation of the
>> classifier rules however it does mention in [1]
>> "if multiple classifier matches occur, the highest match
>> with thread enable bit set will be used."
> 
> So we're not sure how to maintain the user requested ordering?

Currently we are using the user/ethtool provided location as is.

> Am I reading this correctly? If so then ..
> 
>> +	if (fs->location == RX_CLS_LOC_ANY ||
> 
> .. why are we rejecting LOC_ANY? 

Because driver doesn't have logic to decide the location and relies on ethtool to
decide it if user doesn't supply it.

> 
> I'd think that, in fact, LOC_ANY should be the only loc we can support.
> Note that ethtool hides the location logic on the CLI, if user doesn't
> request a location and driver reports RX_CLS_LOC_SPECIAL ethtool will
> set the location to LOC_ANY.
> 
>> +	    fs->location >= port->rxnfc_max)
>> +		return -EINVAL;

-- 
cheers,
-roger


