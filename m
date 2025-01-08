Return-Path: <linux-omap+bounces-3030-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E2011A05806
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 11:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EC051886C27
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2025 10:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F8E1F7586;
	Wed,  8 Jan 2025 10:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cZx7rsIT"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A1518B463;
	Wed,  8 Jan 2025 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736331706; cv=none; b=LME0u9DDzQPogbDltG5BZb6D6+4ZyujREN4rsq3KRwIRKbVcmoLqHbZsSS8P+tU3LboqekhWGodu2biisq67dSpVG9/D6wHjVeuzwTpnGOus77zRbJAtiixgSwgqo9dH0bhYOpWc10r3SnK+yr8EThp1bglm/mNeIkdmp/88VUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736331706; c=relaxed/simple;
	bh=BoyjgoKspc9asKiAwwvEpgqxsU4ciE3jHKS3DrOn+Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0oL/QVvRTIElz5tKhTvIIgI1/w4gwzSpSEnqEZKlbTQKyEIcQ89wh826LwL6YIblpY8difw5apUhBFwQGIs0sdHk9g9btmHhyKzy+V30u6YJVnc1bluCU8fbS4/NWuNrMMxg0G7P94QJ6wCt2P6/uocA461RG50rpdwajEfqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZx7rsIT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF4B3C4CEE1;
	Wed,  8 Jan 2025 10:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736331705;
	bh=BoyjgoKspc9asKiAwwvEpgqxsU4ciE3jHKS3DrOn+Qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cZx7rsIT5LYUMBXzeyetLfzHW0ECHvU7u8nfp8y/xUH5rUcXS1bqI8cDlpnyTGXUt
	 fw+3z+oGX8aTdaQkTErS3qD9OHyi2me/Q4zNaAg8+vhTEQtWpmzO0myxyH0sFvbR81
	 5rx48CiX5g01Hx0lU+m88Rm7s6d+n41n9fNYCM0P/wZDLXpaSB5CgoPb7Y9BQxOmiq
	 A9MPGi/APn++XY5jm14zZDGPfcWItqSBoVu/SRCUjKdwt34RkEvHWR5GA25vZpWIOa
	 W1p+3gAJuHmTvVM5FZOjyFfk1AemQ9h5I+6cCMmNDEovveUAJzqK1N1VvPt68t3IiQ
	 kTZaGhgu5GdOA==
Date: Wed, 8 Jan 2025 10:21:40 +0000
From: Simon Horman <horms@kernel.org>
To: Sudheer Kumar Doredla <s-doredla@ti.com>
Cc: s-vadapalli@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, gnault@redhat.com, linux-omap@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	t-patil@ti.com, j-keerthy@ti.com
Subject: Re: [PATCH net]
Message-ID: <20250108102140.GI2772@kernel.org>
References: <20250108081303.228653-1-s-doredla@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108081303.228653-1-s-doredla@ti.com>

On Wed, Jan 08, 2025 at 01:43:03PM +0530, Sudheer Kumar Doredla wrote:
> cpsw_ale_get_field was returning incorrect data when requesting higher
> word fields. Additionally, cpsw_ale_set_field was writing incorrect 
> data into the ALE entry while updating.
> 
> For example, while reading word2, word3 fields (62 to 64 bits), the word3
> data was shifted to an incorrect position after reading. The same issue
> occurred when setting an ALE entry.
> 
> This patch fixes the shifting of the word3 data by aligning it with the
> required fileds, ensuring the correct value is returned from
> cpsw_ale_get_field, even for higher words.
> It also ensures the correct vlaue is written into ALE entry using
> cpsw_ale_set_field.

Hi Sudheer,

It would be interesting to include some information on how this problem
manifests in practice.

And, as a fix for net this should have a fixes tag.
(Immediately above the other tags, no blank line in between.)

Perhaps this one is appropriate?

Fixes: b685f1a58956 ("net: ethernet: ti: cpsw_ale: Fix cpsw_ale_get_field()/cpsw_ale_set_field()")

> Signed-off-by: Sudheer Kumar Doredla <s-doredla@ti.com>

And, lastly, the subject for this patch seems to be missing.
Please add one:

	Subject: [PATCH v2 net] net: ethernet: ti: cpsw_ale: ...

The code changes themselves look good to me.
So with the above addressed, feel free to include.

Reviewed-by: Simon Horman <horms@kernel.org>

...

-- 
pw-bot: changes-requested

