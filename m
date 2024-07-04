Return-Path: <linux-omap+bounces-1696-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A83CA927231
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 10:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E89C1F217E0
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 08:54:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055EF1AAE01;
	Thu,  4 Jul 2024 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JPRgLzY4"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C018FC7F;
	Thu,  4 Jul 2024 08:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720083270; cv=none; b=NMzib0Ds5UP1nwp8Wvw4cr6pWXDBg7JJ06+Ul5+K35h7erp/mdG06YZM/el63nTKO74HZEBjFqebuCqto+/dom4TH/f1JK0XllrkGbfTvHQOHYxqAh5uEfzU4f27uUrxOqcvQo7/StYhZeH6yRhAAbcZ0NZRtCid7NtC3R29fTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720083270; c=relaxed/simple;
	bh=B5XkSxtVAaKkyDtfhvxyqYqYJy2njHQjOE1vv5LcTMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdumAYqsLUM6+1h31IUDuOayfns39MhJmtxLsXG4QoH4ekVtwQ/NAssdCC/TAFNxdaSYgpFa4aGvNKULFkVsKjqi939IhtzDrUfzdegXTUNM5ThdfueETDKoke+tS81yx+d7fePhpBsPDMkeG+0dv6cdBMP+b+ufu//CygnSoPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JPRgLzY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AF0EC32786;
	Thu,  4 Jul 2024 08:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720083270;
	bh=B5XkSxtVAaKkyDtfhvxyqYqYJy2njHQjOE1vv5LcTMw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JPRgLzY4IeGQ6MmoMrZ9jPiBa2UdbzZn4Of9QN8Pi1mWSlB7BX/+9R2Vo4KW9lJ0e
	 kb3OMzGjwIHvvz8sBeu4Ag84sVP+T0c5dHB+FPZh2HmSu9E+3hLmss9YfjeRri1sOQ
	 RUl675Rt0ManOm6yZ+zGWIe3K8SCL5kw6oC8e6Fd/5cuu+ELnqyZbhkwBGdR0n0tEy
	 Yi5ICmZtF+QuSVBngtx7BugEjrmeYvYFzxl0Oa74gFQk8khAFMvL0CYAkmj3IKKxVN
	 E8cNQi+yFMsjRzSC0NKCK5rXNEpCIo/sG8wFOXQjIE8R9J9CjSbejLTLfO2iNKwIST
	 UGLqzCD9LMV+g==
Date: Thu, 4 Jul 2024 09:54:25 +0100
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Julien Panis <jpanis@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
	srk@ti.com, vigneshr@ti.com, danishanwar@ti.com,
	pekka Varis <p-varis@ti.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next v3 5/6] net: ethernet: ti: cpsw_ale: add
 policer/classifier helpers and setup defaults
Message-ID: <20240704085425.GY598357@kernel.org>
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
 <20240703-am65-cpsw-multi-rx-v3-5-f11cd860fd72@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-5-f11cd860fd72@kernel.org>

On Wed, Jul 03, 2024 at 04:51:36PM +0300, Roger Quadros wrote:
> The Policer registers in the ALE register space are just shadow registers
> and use an index field in the policer table control register to read/write
> to the actual Polier registers.
> Add helper functions to Read and Write to Policer registers.
> 
> Also add a helper function to set the thread value to classifier/policer
> mapping. Any packet that first matches the classifier will be sent to the
> thread (flow) that is set in the classifier to thread mapping table.
> If not set then it goes to the default flow.
> 
> Default behaviour is to have 8 classifiers to map 8 DSCP/PCP
> priorities to N receive threads (flows). N depends on number of
> RX channels enabled for the port.
> As per the standard [1] User prioritie 1 (Background) and 2 (Spare) have
> lower priority than the user priority 0 (default). User priority 1 being
> of the lowest priority.
> 
> [1] IEEE802.1D-2004, IEEE Standard for Local and metropolitan area networks
> Table G-2 - Traffic type acronyms
> Table G-3 - Defining traffic types
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
> Changelog:
> v3:
> - squashed 2 patches into 1
> - added comment explaining the default thread to priority mapping table
> - typo fix "classifer"->"classifier"

Thanks for the updates,

Reviewed-by: Simon Horman <horms@kernel.org>

