Return-Path: <linux-omap+bounces-3468-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DE87AA69A19
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 21:18:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ECEA3BA6FC
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 20:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 616D42144A4;
	Wed, 19 Mar 2025 20:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Yqh4IiZF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF091F0999;
	Wed, 19 Mar 2025 20:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742415487; cv=none; b=fLEpshqMF6Cqkcm7DCWJnBqQHZVFex7rKXR4MQwCkhJwdTn4tHxLxD0yKeGnCA4sBbP0YwCh+Y347iDy61TCoVM7UfWSwvSjqJUnh1cAGNRQtPb/6JCZIYLCYwBIMyQsBsjqql1vQW1YXzC9dnuDM3uv7p9S3lcXV9ghMb53LZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742415487; c=relaxed/simple;
	bh=mNVFzLFCZO+LindRIXlFtYUnl7dKbTHxTEEcFwYbbT0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=peRKVjxFq/QFZU0ZvN2GCBRev4DGZGrt9uiT38NraDROyWBnROuSi49NzqlGk+Tc+EGv/9zU/ja1l/k5FuDV6VoZGP4/HDqGZNTVKmLYDBApTlmhNtEVRiEmARg4VOxM5LBdklOzGxVIxY4FDRjhy+9khIUZ3EXml3Xv3Kpy1n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Yqh4IiZF; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=QhAbZjyYe5+Do9OpkJozjJc8vIQcPn15XrJ01BavAFE=; b=Yqh4IiZFW2QDoPa/e97Jt/07WZ
	U/uTwzuiXLl+55Nai8uUiteU4ju/BZfWisUcIQ0u59LCp7kxfSrNNoPNVUZl+uVwhah0mWz6MJTbG
	SamEtWbXCJtkJETsYu9ifvms0w9nMiEQx+wwC3EKEv5xU3yqpnm/CRyhL9F7gj0nECI1JppkWbvQl
	mYcHO9j6Kk8TScvZbi994brmiCFTOoAgKB61QjXpG/JuOBDJnDUc7xs23+bYVo13oibTQAoiFmo5y
	MJhmdzliMm4jjMn4sP9prrNESV+CHgBkfXBrHf2FjPPqu8/cnaBaH1BmbW0Q9Uz8aDuwyyQbdXprP
	kRkputXg==;
Date: Wed, 19 Mar 2025 21:17:57 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: David Heidelberg <david@ixit.cz>
Cc: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Pali =?UTF-8?B?Um9o?=
 =?UTF-8?B?w6Fy?= <pali@kernel.org>, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: nokia n900: remove useless io-channel-cells
 property
Message-ID: <20250319211757.268cd493@akair>
In-Reply-To: <20250213203208.93316-1-david@ixit.cz>
References: <20250213203208.93316-1-david@ixit.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 13 Feb 2025 21:32:03 +0100
schrieb David Heidelberg <david@ixit.cz>:

> This property is irrelevant for the ad5820 DAC,
> the driver nor the hardware indicate use of channel cells.
> 
> Fixes: d510d12f26f4 ("ARM: dts: nokia n900: update dts with camera support")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 --
>  1 file changed, 2 deletions(-)
> 
Reviewed-by: Andreas Kemnade <andreas@kemnade.info>


