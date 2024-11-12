Return-Path: <linux-omap+bounces-2667-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1489C5C56
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 16:51:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF543B2DC87
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 14:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D4D1FC7D0;
	Tue, 12 Nov 2024 14:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AVQemKQ6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DF11C9DD8;
	Tue, 12 Nov 2024 14:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731420519; cv=none; b=CkibdWOLSZ2/VH/CWHH1azBCcC1NQv1unb9Ntlb6QU5My34Ui08v8C+wbTae2NNrEWBLKA7tE1LiRoI2Zd4ZMkjltdHmyMFXHZgyyzea5vuBdVigVCVQ18WXa9vvJW3s+XraURdLfMkp28Z1AxyuDWecORe5TQytXKrroMDM4Nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731420519; c=relaxed/simple;
	bh=9joemwZkqpzeBkWPCSrmAPNT+hE2z//dlJTmeWjE6XI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGUu0fsPbqQrzgWdj7jTRVXpk+MdrkWZs7NRbH2cyYVHbj/fwSISsuC3e2CmMJc/gpuG25EEOBKNFOqRuvJThkm0t2eaVR17YRNQ1H/soOLYJzPwuBkjF7lccWdvVMTyEE+afEiOikzF1KXlTmTCeDOyKTl+nnHdJ1OM+VslzOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AVQemKQ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0A4C4CECD;
	Tue, 12 Nov 2024 14:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731420518;
	bh=9joemwZkqpzeBkWPCSrmAPNT+hE2z//dlJTmeWjE6XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVQemKQ6f/7A5T5OzhyTmdooh488laP0i8AGOIyzQagrYTmgLWNWlaL+9stcMblRR
	 9+ygn5vyOlGmABoc4yZPz/YJKq+cgMbPIWv6qNRu5o07fmGhpYi0IQ5E2/hCptqj9V
	 x0W/R7Uc7lIJR5Cj3gsVbr8K8/jty83K4wRV2IvI7Y+8uXNv0vHCCrNwLpwrx3zPrL
	 uEybP9xehTdq+Vt0OJwKA9g65/w/SFOOgcGGhs/O1sBhdgmJNNV79jDQ7B2IlHxwPy
	 4riGdkf6vS7llrVYmBm2/Iu9bn6y6cUauT7xHVpZufMAps0eDfN3gZQXYyLghDIA7r
	 GjmNAUb2yb6Kg==
Date: Tue, 12 Nov 2024 14:08:33 +0000
From: Simon Horman <horms@kernel.org>
To: Roger Quadros <rogerq@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-omap@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, srk@ti.com,
	Pekka Varis <p-varis@ti.com>, Ido Schimmel <idosch@idosch.org>,
	Guillaume Nault <gnault@redhat.com>
Subject: Re: [PATCH net-next v3 0/2] net: ethernet: ti: am65-cpsw: enable
 DSCP to priority map for RX
Message-ID: <20241112140833.GP4507@kernel.org>
References: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-am65-cpsw-multi-rx-dscp-v3-0-1cfb76928490@kernel.org>

+ Ido and Guilliame

On Sat, Nov 09, 2024 at 01:00:06PM +0200, Roger Quadros wrote:
> Configure DSCP to Priority mapping registers so that IP precedence
> field (top 3 bits of DSCP) map it to one of the 8 priority queues
> for RX traffic.
>     
> Also update Priority to Thread maping to be compliant with
> IEEE802.1Q-2014. Priority Code Point (PCP) 2 is higher priority than
> PCP 0 (Best Effort). PCP 1 (Background) is lower priority than
> PCP 0 (Best Effort).
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>

Hi Ido and Guilliame,

I am wondering if you could find time to review this series.

> ---
> Changes in v3:
> - Added Reviewed-by tag to patch 1
> - Added macros for DSCP PRI field size and DSCP PRI per register
> - Drop unnecessary readl() in am65_cpsw_port_set_dscp_map()
> - Link to v2: https://lore.kernel.org/r/20241107-am65-cpsw-multi-rx-dscp-v2-0-9e9cd1920035@kernel.org
> 
> Changes in v2:
> - Updated references to more recent standard IEEE802.1Q-2014.
> - Dropped reference to web link which might change in the future.
> - Typo fix in commit log.
> - Link to v1: https://lore.kernel.org/r/20241105-am65-cpsw-multi-rx-dscp-v1-0-38db85333c88@kernel.org
> 
> ---
> Roger Quadros (2):
>       net: ethernet: ti: am65-cpsw: update pri_thread_map as per IEEE802.1Q-2014
>       net: ethernet: ti: am65-cpsw: enable DSCP to priority map for RX
> 
>  drivers/net/ethernet/ti/am65-cpsw-nuss.c | 54 ++++++++++++++++++++++++++++++++
>  drivers/net/ethernet/ti/cpsw_ale.c       | 36 ++++++++++++---------
>  2 files changed, 76 insertions(+), 14 deletions(-)
> ---
> base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
> change-id: 20241101-am65-cpsw-multi-rx-dscp-000b2c4af6d0
> 
> Best regards,
> -- 
> Roger Quadros <rogerq@kernel.org>
> 

