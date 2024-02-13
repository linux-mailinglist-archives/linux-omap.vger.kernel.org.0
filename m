Return-Path: <linux-omap+bounces-561-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE0A853106
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 13:58:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DBCA1F23662
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 12:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2327E43ADC;
	Tue, 13 Feb 2024 12:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="scGUBFV7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3058F42AB6;
	Tue, 13 Feb 2024 12:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829100; cv=none; b=se4STgK3TqTtbTBz2uvlZlpsaibXkE2BIyM4iy9umhjmMy0OVrlZJmXLCcy1abrNQqnPKa073sAU/fL6xZLWu4HkekkUl8sRNlZXOyNMMzOYuQKKtZd5GHJ5Z0voXx8i1K+d8iBFVtjWqeNyDRz26KOPYnS1z3dv6H3fJwGTlj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829100; c=relaxed/simple;
	bh=7zntr/m9ZqAlNJWnlXbkDJ1hh4YxQh9Mg6LQbU4U1ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNrvrjQDusZczgCKw5x5CJm07qmm+tHFYIpw+anWgViNvNZPO4jY2yzQNB+Zmp5eZrf4PK8RqXzOPGX3gx+1PUrSUcErbJ7jd+CdXQAi2ApFsFSSQnDfoe9jDkq3ZYhsqcpzDa653Myh2UxjlXkRXgOlbrAoqObsEriX9HdvYkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=scGUBFV7; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 89A2A6033F;
	Tue, 13 Feb 2024 12:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707829098;
	bh=7zntr/m9ZqAlNJWnlXbkDJ1hh4YxQh9Mg6LQbU4U1ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=scGUBFV7SHqRsA+PN3Z68LoVYD820b0fV7/BIQhEElL29jYq6F1V7WgYQ/MZ/f/jy
	 fvJbK5v3qxo/b4EVqEPr+2mV6THnIXINZ4pn04Fm+yz/WPwu05u96ink5MKg/Ow+Ak
	 JMQ3bLC5unBDgRvae5Uo30PlkYFe8t6WGfzBOfg1h85/VpA827//FBErmOwSCep/A0
	 ILM4YgJRt7Uu/ALkfkNjFudBsNnIB3HTpPlCZ8ajejeji4HCUpSB3G+a1VfFDwk5xa
	 xvy4BYE1I/BmTSOuHJKIu06+2DTb74UyIs/e6ktUvUfydz6Gm8ndk24tczgFA0oqP4
	 7N7l6FSFlvnxw==
Date: Tue, 13 Feb 2024 14:58:01 +0200
From: Tony Lindgren <tony@atomide.com>
To: Adam Ford <aford173@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>,
	Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240213125801.GH52537@atomide.com>
References: <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
 <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr>
 <20240202043601.GA5185@atomide.com>
 <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr>
 <CAHCN7xLUH7Qj_djEuMDAx2nNVqtS5WyoM_DN4zarCbmKh=te4Q@mail.gmail.com>
 <20240212072740.GC52537@atomide.com>
 <CAHCN7xJZXVXxiwBXgGKhGmBQhCAFfa4Tn=tJcGLX3N==tgvFzQ@mail.gmail.com>
 <20240213060302.GD52537@atomide.com>
 <CAHCN7x+Uswxzj3eTf1_9oqso0fpdVR5QHNQkd59zHSqx5CyeCw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7x+Uswxzj3eTf1_9oqso0fpdVR5QHNQkd59zHSqx5CyeCw@mail.gmail.com>

* Adam Ford <aford173@gmail.com> [240213 12:43]:
> On Tue, Feb 13, 2024 at 12:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > Assuming no issues and if the hs200 issue is a separate issue, maybe
> > post the patches and then let's get some Tested-by for them before we
> > put them into Linux next.
> 
> I just sent a patch against omap3.dtsi.
> I am not sure how to handle the backwards compatible device tree breakage.

Thanks, I replied to the patch on the properties for sdhci.

Regards,

Tony

