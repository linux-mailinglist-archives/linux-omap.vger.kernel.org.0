Return-Path: <linux-omap+bounces-3081-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C8DA08D98
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 11:13:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866BA18892E1
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 10:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9502420B7FD;
	Fri, 10 Jan 2025 10:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7asyes6"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3334520B7E8;
	Fri, 10 Jan 2025 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736503832; cv=none; b=PNsBngNYtCgQE72gI0oRGBqsHSM8HG4K8PQD7deltW3VPH+fJI0r78lW/4ycDJoZQfbAQ2AuaL2mjGxRzcev+YxoI4DGXPeVq8lo5zOVFTk9FJdEAfKPzecru/GOc7DEq8AEqHn7L2dKWdhHcKaYEdIX71Dt2JecaD3tYwseSgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736503832; c=relaxed/simple;
	bh=J/xsSaGxMXbAvaZ24ePphJGQ2fXLL0ryxvFiDvkAmDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+wMZIB2zoUVG0pgXJvAa3F39GsY28Ekut5uJ85WXNXBqMhbvR1lIacyQaCImRmuNkgZVyVL+60WGS3wBf2sf/V2PAUy1KbV0VFJByjqZklxnYUGgRQNuBuyCVentSNYMtDTxisqoxi6dkS3KrlBns3LjatZnMm8dSKLyquk9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7asyes6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831E0C4CEE3;
	Fri, 10 Jan 2025 10:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736503830;
	bh=J/xsSaGxMXbAvaZ24ePphJGQ2fXLL0ryxvFiDvkAmDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c7asyes6bGWLQ+ciITWqmQWgqXYe7EjVS2Cz3asVGPn5WbiLttT01qt7mBAfiL4GZ
	 xDHlMEKJRwvhn7P016NPdSwn1cMqcNXq4IxYwY5a8JT/1tSUyx5GM7DdtTbRAhdan8
	 0hL5L/GJM670yGhfgvxtM7mOxfRoUOhTK1x+TC8C2TD08cp9BpQAj3l/zE3efx/ak+
	 ROCnfCapWbVtZb5xQ42k/6F0jf1AbwOI1s8/Slw0IxbHTyKFO6b8BNe1HGMnV+D4XI
	 CTpqzeHEW2kisdpJcYNKs0KYfQAcUebamClKxYhu+u9BunXTT8An1STLN7pu9r4yfI
	 Q9QZtgdSpGO8g==
Date: Fri, 10 Jan 2025 10:10:26 +0000
From: Simon Horman <horms@kernel.org>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Mugunthan V N <mugunthanvnm@ti.com>, netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>, Chintan Vankar <c-vankar@ti.com>,
	Sinthu Raja <sinthu.raja@ti.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next] net: ethernet: ti: cpsw: fix the comment
 regarding VLAN-aware ALE
Message-ID: <20250110101026.GU7706@kernel.org>
References: <20250109214219.123767-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109214219.123767-1-alexander.sverdlin@siemens.com>

On Thu, Jan 09, 2025 at 10:42:13PM +0100, A. Sverdlin wrote:
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> In all 3 cases (cpsw, cpsw-new, am65-cpsw) ALE is being configured in
> VLAN-aware mode, while the comment states the opposite. Seems to be a typo
> copy-pasted from one driver to another. Fix the commend which has been
> puzzling some people (including me) for at least a decade.
> 
> Link: https://lore.kernel.org/linux-arm-kernel/4699400.vD3TdgH1nR@localhost/
> Link: https://lore.kernel.org/netdev/0106ce78-c83f-4552-a234-1bf7a33f1ed1@kernel.org/
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Reviewed-by: Simon Horman <horms@kernel.org>

