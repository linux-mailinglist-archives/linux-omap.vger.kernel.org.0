Return-Path: <linux-omap+bounces-3522-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEA0A7732C
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 06:02:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F3AD3AD59B
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 04:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC051C8610;
	Tue,  1 Apr 2025 04:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="j88BjEpY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E89D187550;
	Tue,  1 Apr 2025 04:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743480157; cv=none; b=k+gAEfR04fc643ZAIR2pAGiHZj5X7WUcAX18njk57pfsP72f8X0mvFg3mc0lXtdZUOaeOzEmR0Wgs6clbG8s7GHkmqDdBsG9hSZYyIzqS7ATlZKE4rcaNVZaoXmbG3VLJupbg/LpqD1dSKNIfo+6RmLZbPpa+ZMB32F8pDy18Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743480157; c=relaxed/simple;
	bh=COGoUV2LNCT7BAByBN+90DSwtl7nzPfe94IaM5eu25A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnGladCdq+cg/L3pOfTmaZLwIgMMQ5zDauISitKoOwnZ2EDolx7ODGAeDW0Gi7MoMp64uNeJwZ7HrVIKER5eals47R3aSo6qSzL6wQh7bxhQAMsjO7XE3PNp07V/DcGEkYewsvOOFdGGg3UfyQLECc2kO/ojIPt16HcH5ZyJKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=j88BjEpY; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 91DD26040B;
	Tue,  1 Apr 2025 03:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1743479666;
	bh=COGoUV2LNCT7BAByBN+90DSwtl7nzPfe94IaM5eu25A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j88BjEpYJbGHDIbrbQgnoxpXCjz6IezOyCvVyNwLauDr3s0CUHlhkktyM3q/Sg4DP
	 KIju37voGdqjHrK6cRQHhbeirbEHelkezjqNwh4Cb9r8FiSuMOu4o3WScv/Vt3fsrk
	 P+I1rtsv2D35AViLzbRwAnVHD7hyYutQvQLyRoo8unI5RdtN8RkQ8psUmgE5HMtWa/
	 0ZutpaCEQw90RtyFCvRuySo3K4tXEHeUHy/FJLglhm/hJ2hpEqQIuje64/gL8Z1ICz
	 8Rw+o7+zeSY4uBC/+on3fkT3c5KNlAZ58zcjOTeZuCyFdf708m2GG9WVHEpP+SEywS
	 I/YMrqTnbktvw==
Date: Tue, 1 Apr 2025 06:54:03 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: khilman@kernel.org, aaro.koskinen@iki.fi, rogerq@kernel.org,
	linux@armlinux.org.uk, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	sre@kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: omap: pmic-cpcap: do not mess around without CPCAP
 or OMAP4
Message-ID: <20250401035403.GF4957@atomide.com>
References: <20250331144439.769697-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331144439.769697-1-andreas@kemnade.info>

* Andreas Kemnade <andreas@kemnade.info> [250331 14:45]:
> The late init call just writes to omap4 registers as soon as
> CONFIG_MFD_CPCAP is enabled without checking whether the
> cpcap driver is actually there or the SoC is indeed an
> OMAP4.
> Rather do these things only with the right device combination.
> 
> Fixes booting the BT200 with said configuration enabled and non-factory
> X-Loader and probably also some surprising behavior on other devices.

Nice catch:

Reivewed-by: Tony Lindgren <tony@atomide.com>

