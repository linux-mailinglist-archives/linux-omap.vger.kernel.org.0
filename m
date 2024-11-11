Return-Path: <linux-omap+bounces-2655-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC169C41B7
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 16:19:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA25BB21519
	for <lists+linux-omap@lfdr.de>; Mon, 11 Nov 2024 15:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F94F13C3D3;
	Mon, 11 Nov 2024 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="TQCyxVlN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F31BC58;
	Mon, 11 Nov 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731338375; cv=none; b=dOdbVpvovXx1bZC291rIq/VMQp6+A+zuJwIHp6reNXJiDVEDFfByudHAUkNCoh280jmiaPGOyw38MuU9tJt9NNpG6DPEOVt38JsxqFqwJrRrPYnuh9DscO6YlGJFyScrIsKRG/MijmCl9TquoWZ7mQze77eIz3uM36JVCV7fBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731338375; c=relaxed/simple;
	bh=ouHKreVCAASVnyqoZVthFsptyazNbdMX7z8KShh2ol8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nbeKoAdtb41wBIFD3CvFF4X+RGpmHtpOg2Ar1XTS2aTIuRH/m6V3ta60s1hvmgllHXK5hxOf8WP/h/Nt9t4wcQDI+PoIKqCJfEHyXq8Iylx0/jPYsp4jkPJ9U0W/VRYO5uO7cF50wVGQVwG6ZuOVbcXp0B3NL+Jpmf1lyzsmrfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=TQCyxVlN; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 1EF4D6084E;
	Mon, 11 Nov 2024 15:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1731337820;
	bh=ouHKreVCAASVnyqoZVthFsptyazNbdMX7z8KShh2ol8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQCyxVlNepxRuyUW6tOsADLtvaxBFtc3XkPQQfbHwWr81VCiGrQ8uaFiWnT5m5JJ7
	 pn7XCib9XigdZw6F0/ogd45MpLIm3d12JjuuhATnPomZ5Op73upOdhZMKEykwlWtvv
	 9flqVL3bnd5xmY/roOHjaxfvf84sJwinLEpIt9gEXa9SrWCVebVcEgPcG6HrlUB0O0
	 cAKXG/dSncEJK2Tp2yKKVSdxS7BIPvaJMrdB9lxtAxe1mLsmYdYd/j21UjBW5+DBji
	 I7k9EL+5G4zzwuKX+PfrCA2tXYkyC6CC9txqlyq/Dq8g0ezM4t5w4Wnr3TbCzTEWXi
	 Up79x7a9HcC+Q==
Date: Mon, 11 Nov 2024 17:09:53 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Roger Quadros <rogerq@kernel.org>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi, khilman@baylibre.com, stable@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: ti/omap: gta04: fix pm issues caused by spi
 module
Message-ID: <20241111150953.GA23206@atomide.com>
References: <20241107225100.1803943-1-andreas@kemnade.info>
 <b26c1fa8-b3b7-4aa9-bc78-793ddfa3bc6b@kernel.org>
 <20241108184118.5ee8114c@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108184118.5ee8114c@akair>

* Andreas Kemnade <andreas@kemnade.info> [241108 17:41]:
> They are not used, if they are just disabled, kernel does not touch
> them, so if it is there, the kernel can handle
> pm. At least as long as it is not under ti,sysc.
> 
> There are probably cleaner solutions for this, but for a CC: stable I
> would prefer something less invasive.

For unused devices, it's best to configure things to use ti-sysc, and
then set status disabled (or reserved) for the child devices only. This
way the parent interconnect target module is PM runtime managed by
Linux, and it's power domain gets properly idled for the unused devices
too.

> I can try a ti-sysc based fix in parallel.

Yeah that should be trivial hopefully :)

Regards,

Tony

