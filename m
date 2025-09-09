Return-Path: <linux-omap+bounces-4614-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F4B4A35B
	for <lists+linux-omap@lfdr.de>; Tue,  9 Sep 2025 09:20:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E65A717BFD8
	for <lists+linux-omap@lfdr.de>; Tue,  9 Sep 2025 07:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E4B0303A03;
	Tue,  9 Sep 2025 07:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzUfhKoG"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB9256C76;
	Tue,  9 Sep 2025 07:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757402423; cv=none; b=goXW+6INyLN+YdzgP4+IYTC0alhvuOFqdIAfz58/wksdEEsJ+6VlrF2TEKO6QFuIav86GdXY+W93264qD6FCgFHSfnQJuFP+m47+LgESg/gKYnQBZSuKrECZSi029E4H/uMXlcJG88vameiWUuQYgsmqSxVhIFTTO0qFPHiD/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757402423; c=relaxed/simple;
	bh=rJIPYrjDUWAPVFJhg8IR2N2TLTeJ2YBveAY2HJgHK2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heBicDI5JB6U5aJxh95yog8QO4/MSsNOCtm+FeAruorCoGwLsUTVvV59rCAHPjTAU74pA3J7Iy5zBWyFe/K38xqHPRjP4vr/yD7hogv9pSAqKQbAcCI0114Gt/FE5RQq5aOPeCCp9iJVNG6VJBbHvtUu8kRcpMKDBYb49w867Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzUfhKoG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9D7C4CEF4;
	Tue,  9 Sep 2025 07:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757402423;
	bh=rJIPYrjDUWAPVFJhg8IR2N2TLTeJ2YBveAY2HJgHK2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hzUfhKoGT4E9fhtttkXp5Hvw7tj1Tqw/kd1F/8YMnrMGlrvc8QXk2VUnTO/KLs/NJ
	 0iXPFD/Tg4N7+1wGSfxRS5dfRAwhs9BNNvCqTqT/wA0w03K9+nYqcqwm8baOSoZ9AQ
	 kPfyXSWoyAVUtivlpwliyUsVwjP3EKiRLXJkz56crQkvmqRAgc1BfnwmyQjb3/N8EZ
	 70pMzrvBztg2nx5cyxydIhXVZ1sgy6BKUxxvJwt3S+gT6aGOoesMrmzSIfIkpd5XLi
	 Oe2CIq1ZNFxWYY1iL+P1ldbqWhi4Lr+vXR2Y3CQO23CopN9Vxlgarn1EqTxN4ot0Nv
	 99wsNtQQceTNw==
Date: Tue, 9 Sep 2025 09:20:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Barker <paul.barker@sancloud.com>, Marc Murphy <marc.murphy@sancloud.com>, 
	Tony Lindgren <tony@atomide.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm: dts: ti: omap: Drop unnecessary or unused
 properties
Message-ID: <20250909-uptight-fluorescent-markhor-4639db@kuoka>
References: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
 <20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>

On Mon, Sep 08, 2025 at 04:17:12PM +0000, Charan Pedumuru wrote:
> Remove unnecessary properties like ti,needs-special-reset,
> ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the DTS
> files as there is no user of them.

No user? That's not true:

git grep ti,needs-special-reset

Best regards,
Krzysztof


