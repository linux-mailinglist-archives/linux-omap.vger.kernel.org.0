Return-Path: <linux-omap+bounces-916-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E788856E2
	for <lists+linux-omap@lfdr.de>; Thu, 21 Mar 2024 10:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 784631C21958
	for <lists+linux-omap@lfdr.de>; Thu, 21 Mar 2024 09:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AA355E75;
	Thu, 21 Mar 2024 09:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="Gvx0gSPX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE2B54F86;
	Thu, 21 Mar 2024 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711014971; cv=none; b=SURQSUJaAj27zpfS6x7Uj8d06vhA5+pZmboSF51w3QVisrfhKEU6JCwG5LexKHzxqgC3SXzDVbSyqCaZN3DIkAAdAZqxRwND/X8qSfaeYDMizeGxuLuMGNmPiOg5Yx3d6T2OqRS8lB/yxnX7VV4gbojkRGBBNINSiRgYGu+2XhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711014971; c=relaxed/simple;
	bh=pSvdU/MZ9saRVEk8w8k5hDIPM1MJRChCwgl6CLKm1G8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiHTYrK4pesOPJ/lzwmV1kqxWLF2ewgONsfHpKqPhwBxF9UaX219Q4hLqNraFUpLI7tUNLb/dtWQEWamIP3voeidqyPFxV4YPqjcDnyChtRF6xkcc9mQwQTeLpujLdsM1fDBPGmVLKD2F22ze+ZELLvfgUqF2X1fa/mVNDroYJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=Gvx0gSPX; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id D2FE76087C;
	Thu, 21 Mar 2024 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711014477;
	bh=pSvdU/MZ9saRVEk8w8k5hDIPM1MJRChCwgl6CLKm1G8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gvx0gSPXA2JAMF2dCwiApkhctqozF/J1U2351bqGgCvg9UwXFBL6jXZc7t6abWAot
	 bi1c39Hkpj81nlTFDmRR/m89XJM4N9wC92YY2LwsBqRp7DM1Jtvt7kkHMtgAvcACoX
	 xv1PVGVz59CDWF7+6QCaJ2O7fIt8Fk8IG+Lk/BMLurfPM1MTUmIjTVtaWu/Y4+meZW
	 yZ4BSmTo1Yw1IbJ+xAqg6BdxgLnCBpDUSmkNS690atTJ/drN4K66Y2xuffIIxd26Yz
	 jcxk29sgQMiWdUiGDka4dsk1s0Yn59F+Bnpb9YimfM7FosyJHXdq5ASaEQgbnweCDA
	 Vim3mH+MsEXwA==
Date: Thu, 21 Mar 2024 11:47:41 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: linux-omap@vger.kernel.org, vigneshr@ti.com, adrian.hunter@intel.com,
	ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
	Romain Naour <romain.naour@skf.com>
Subject: Re: [PATCH] mmc: sdhci-omap: re-tuning is needed after a pm
 transition to support emmc HS200 mode
Message-ID: <20240321094741.GA5179@atomide.com>
References: <20240315234444.816978-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240315234444.816978-1-romain.naour@smile.fr>

* Romain Naour <romain.naour@smile.fr> [240316 01:44]:
> From: Romain Naour <romain.naour@skf.com>
> 
> "PM runtime functions" has been added in sdhci-omap driver in 5.16
> f433e8aac6b9 ("mmc: sdhci-omap: Implement PM runtime functions") along
> with "card power off and enable aggressive PM" 3edf588e7fe0
> ("mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM").
> 
> Since then, the sdhci-omap driver doesn't work using mmc-hs200 mode
> due to the tuning values being lost during a pm transition.
> See the report on the linux-omap mailing list [1].

Looks good to me, sorry for the delay in replying. I though I already
replied but had some issues with a bad sata ssd for a few days.

Anyways:

Reviewed-by: Tony Lindgren <tony@atomide.com>

