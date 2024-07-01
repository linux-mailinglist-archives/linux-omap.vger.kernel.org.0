Return-Path: <linux-omap+bounces-1624-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8F691D90C
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 09:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E58D1C2171B
	for <lists+linux-omap@lfdr.de>; Mon,  1 Jul 2024 07:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267B67E58D;
	Mon,  1 Jul 2024 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaomfM/v"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B027710E;
	Mon,  1 Jul 2024 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719819355; cv=none; b=gTeS6namhWW/t+G3S/EGc4PbTgBwr6bg2gDY33qPiTi8TD4Nq0Cl6/go8CMpxi9xcN4pClK1f5ljtkkS+S5wj8Yq2Ki5X/6PibFpT90nUYVWMJzMI8iqqM5l3hrYHCQcbHrnXfG4+D1W1VJ/naCCYnasaB9DbTurwIkWCQNwLKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719819355; c=relaxed/simple;
	bh=4qdQjJyCdhOsxd6+da9VjUrIuzcNub/RyHfPEssMYYM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTR1Ba0NvHwszzTGAW8xK8e2By5rETh4XiLQz5Dy9iUDeWHGzPdTWN1zgha2/+N/7PFKZEnD4uVhb1JGYQQEKlTcZ5/hjxQT2epaJOGgNqr8bX+Ofx5oM6TO+HTfGwGv0EuwCtKi2eIbjZT8a1zKm4S59P71Otkqr+/RLbkTZfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaomfM/v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7FEC116B1;
	Mon,  1 Jul 2024 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719819355;
	bh=4qdQjJyCdhOsxd6+da9VjUrIuzcNub/RyHfPEssMYYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BaomfM/vjPm7fm7PSfyddJhCuCtBFdXt7Kw2XptywqTLm88nh+2tJuNNYvd7urwps
	 nxbGd7rTlxGZgu1ToQTbZytnZH1d+xi57saq9sJ4C6WEOm2RRraDr80RmpBwAJqUsP
	 rH81z8oOfOaxa2bF1DVZSBZ2jwfmx+HFCgNl08nIFmreKZ9Qy/yhMc42t7blyk5RQE
	 mZJXUphnbLi3isG/nWtjGWPHxDBt7YOQwYA3v1ti235HczhFpyWuI2Z7W25bGASOwH
	 NS2zMaB8WrLRuJB7rwYomjNFb+GAqQvqc0fbyOlWkAXQBMH+a5Qvp9GpFGFFL5sgx9
	 DkvECx27pYwMA==
Date: Mon, 1 Jul 2024 08:35:50 +0100
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
Subject: Re: [PATCH net-next v2 5/7] net: ethernet: ti: cpsw_ale: add
 policer/classifier helpers
Message-ID: <20240701073550.GK17134@kernel.org>
References: <20240628-am65-cpsw-multi-rx-v2-0-c399cb77db56@kernel.org>
 <20240628-am65-cpsw-multi-rx-v2-5-c399cb77db56@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240628-am65-cpsw-multi-rx-v2-5-c399cb77db56@kernel.org>

On Fri, Jun 28, 2024 at 03:01:54PM +0300, Roger Quadros wrote:
> The Policer registers in the ALE register space are just shadow registers
> and use an index field in the policer table control register to read/write
> to the actual Polier registers.
> Add helper functions to Read and Write to Policer registers.
> 
> Also add a helper function to set the thread value to classifier/policer
> mapping. Any packet that first matches the classifier will be sent to the
> thread (flow) that is set in the classifer to thread mapping table.

nit: classifier

     Flagged by checkpatch.pl --codespell

> If not set then it goes to the default flow.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
>  drivers/net/ethernet/ti/cpsw_ale.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index 7bd0dc20f894..75a17184d34c 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -1626,3 +1626,27 @@ u32 cpsw_ale_get_num_entries(struct cpsw_ale *ale)
>  {
>  	return ale ? ale->params.ale_entries : 0;
>  }
> +
> +/* Reads the specified policer index into ALE POLICER registers */
> +static void cpsw_ale_policer_read_idx(struct cpsw_ale *ale, u32 idx)
> +{
> +	idx &= ALE_POLICER_TBL_INDEX_MASK;
> +	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
> +}
> +
> +/* Writes the ALE POLICER registers into the specified policer index */
> +static void cpsw_ale_policer_write_idx(struct cpsw_ale *ale, u32 idx)
> +{
> +	idx &= ALE_POLICER_TBL_INDEX_MASK;
> +	idx |= ALE_POLICER_TBL_WRITE_ENABLE;
> +	writel_relaxed(idx, ale->params.ale_regs + ALE_POLICER_TBL_CTL);
> +}
> +
> +/* enables/disables the custom thread value for the specified policer index */
> +static void cpsw_ale_policer_thread_idx_enable(struct cpsw_ale *ale, u32 idx,
> +					       u32 thread_id, bool enable)
> +{
> +	regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
> +	regmap_field_write(ale->fields[ALE_THREAD_VALUE], thread_id);
> +	regmap_field_write(ale->fields[ALE_THREAD_ENABLE], enable ? 1 : 0);
> +}
> 

I like that this patch-set is broken out into nice discrete patches,
including this one. So I'm in two minds about the comment I'm about to
make, but here goes.

As these helpers are unused this raises Warnings with W=1 builds on
gcc-13 and clang-18, which is generally undesirable for networking patches.

I can think of a few options here;
* Ignore the warnings
* Squash this patch into the following one
* Add some annotations, e.g. __maybe_unused or __always_unused.
  Likely dropped in the next patch.

I think I lean towards the last option.
But I won't push the point any further regardless.

