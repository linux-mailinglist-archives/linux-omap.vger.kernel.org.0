Return-Path: <linux-omap+bounces-915-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6268856D0
	for <lists+linux-omap@lfdr.de>; Thu, 21 Mar 2024 10:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EC921F2221E
	for <lists+linux-omap@lfdr.de>; Thu, 21 Mar 2024 09:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3842454F9D;
	Thu, 21 Mar 2024 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="DQ1uMfeL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369135474D;
	Thu, 21 Mar 2024 09:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711014536; cv=none; b=Cbd31IjZw5aW7ilPBrUrwBJlvx1Zrw1g1Jd36l672pgMNhdk02ufr2kko7nvGK+GH78PHzIFKSDZl6s83y6YCQL58QNDc82DxE1bpqM1c0KqXpRg7iFGJk3QlYvxuKqw4F1Up56DPwLWDWP1U9lCu9QgOLAGjbkBwTCJYn28eqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711014536; c=relaxed/simple;
	bh=uXCrHgvu6kxch73OUlnNIheTbPG+h/tjuSLZx+cB0Ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hnow2XDn0uFstxhG2GeWghnGUjmdG1kEMcXZ+ZSZ53IuHEOiviFtde0EoAc6tLOLhBgjrgpL7vjGyiEPwYYQ7hSn0mh+DDWKDboULTTGwLNLr8BuWh1Jl5jXQObQ8OCAEH0H1uwS8yq9A3kiXdN/XVMgun1GTIZPIhSrzzuzQE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=DQ1uMfeL; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 6EC7B6087F;
	Thu, 21 Mar 2024 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1711014534;
	bh=uXCrHgvu6kxch73OUlnNIheTbPG+h/tjuSLZx+cB0Ss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQ1uMfeL1Xs0YY9Z3raJhXECetBj8A718zqSlWQkcoqLXUyTcSFqXiCNwEkHcgz6H
	 hyHk0YywfmsPQ6imy+6sMKGzrlXGmWYQvs9rDUfyRPirNQpemHdu05ukUdsOyJQgNI
	 UTwu9wjvoNwpxgCFSLtnpFDLSpvdUj3hpnvSdDr2zus3ehzXZX+a9hDhJ4N6iGDPfI
	 NwH3auPTiMtLI8OPGm13YinLfJeoTF94Gruy4tc+0XzmUyhk9WsEfkI3mR5wxITRFe
	 p9iI+JXEEgmnABFkXD/r27Dd07dMLgD+NR3fat0RjVB89s3WHWGo73ixt50JpFLYXF
	 dk+117shsuMsA==
Date: Thu, 21 Mar 2024 11:48:39 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240321094839.GB5179@atomide.com>
References: <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
 <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr>
 <20240202043601.GA5185@atomide.com>
 <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr>
 <3093e021-e240-4cbd-8fb6-aa59d188434b@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3093e021-e240-4cbd-8fb6-aa59d188434b@smile.fr>

* Romain Naour <romain.naour@smile.fr> [240315 23:49]:
> I finally had some time to rework on this issue and it seems I found something :)
> 
> https://lore.kernel.org/linux-omap/20240315234444.816978-1-romain.naour@smile.fr/T/#u

Great good to hear you got it sorted out :)

Tony

