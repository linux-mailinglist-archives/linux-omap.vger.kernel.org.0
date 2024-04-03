Return-Path: <linux-omap+bounces-1100-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBE896722
	for <lists+linux-omap@lfdr.de>; Wed,  3 Apr 2024 09:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 619CB28B9BD
	for <lists+linux-omap@lfdr.de>; Wed,  3 Apr 2024 07:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17BEC5C8E6;
	Wed,  3 Apr 2024 07:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="E6ubJZIU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089AC219E5
	for <linux-omap@vger.kernel.org>; Wed,  3 Apr 2024 07:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712130607; cv=none; b=BzX6Kixt5FSlXotDRi4Z7fTm4ncNUDuvJ6ifDzfQq99anmiOeErC95kbz+MrtKU2V/jS2iVXjnGFGmz6k1mEVDihFyJBMudBAHOQDB+Uyor2hmrKn25eNRA3hRFlabaXELBySwqUbLGZJTs4z0pTAMwl2sW34qUF6Fcttjx7OQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712130607; c=relaxed/simple;
	bh=H4v1l5eSXlprpjIeQUo6g8zX2l3X/WtOpQH7B5ii5LM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpYJCyWpHCgxU6M6P0RVH0B6E3snjWFePF54mhh/GB/4ro2iMMIJlgSBEDU4QAsQeU8PsKdEoEOWBByLe7mVpjCy4KtL4xwPd3Lxj9VrRg2bBCKCLgDZC5OQhzhPutTEDMT8kS3WZI1bs4RR7qg9oBbb0qbgMeejTGSVkJBQl0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=E6ubJZIU; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id F15E660372;
	Wed,  3 Apr 2024 07:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1712130599;
	bh=H4v1l5eSXlprpjIeQUo6g8zX2l3X/WtOpQH7B5ii5LM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6ubJZIUILXT568O8Q4Uo5zv/xpMKd1nFTlCOLPa6aks61z13wjt9eAwm7IydE8fW
	 QLQzjLf8Rr5YTZe/hwU54YMpYDjzlQsU9tmOCQ/kiHao6NuJN0w6T8bZmTm2eVjh71
	 Cmg1GFY/JnB9dXcsMvveKXYX0qJcjKXaxiiw8eW8EXZGM+yvoExnTc0feOnyY6hGum
	 6NiaNTu6We+p4Oq+rSWFWj1pCI5q+g6EJQHFO8o9E2oFspbi5oMebmunFN5mGAZcT2
	 Rhh9qOVx2j7testjSZuGyEzIyH7jCQ8q4bOXKI2/tcmhDGYyMEIEw0EVlU+BOnxmxK
	 l6ehzqx508XyA==
Date: Wed, 3 Apr 2024 10:49:52 +0300
From: Tony Lindgren <tony@atomide.com>
To: Jeremy Mattfeld <jmmattfeld@gmail.com>
Cc: linux-omap@vger.kernel.org
Subject: Re: sdhci-omap signal contention
Message-ID: <20240403074952.GJ5132@atomide.com>
References: <CABbzQ=fqmBeq_9YLjWq_8Lf=1E1L0igMxHUKcHr6hohyYnvvkQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABbzQ=fqmBeq_9YLjWq_8Lf=1E1L0igMxHUKcHr6hohyYnvvkQ@mail.gmail.com>

* Jeremy Mattfeld <jmmattfeld@gmail.com> [240315 23:04]:
> I have no specific requirements to read/write on the eMMC while
> performing I/O on the spi but I still get sdhci errors errors while
> using the mux drivers when I want to talk to the adc's.  I am hoping
> there is some kind of software workaround for this problem.

Not sure what the issue might be, but please check if this recent fix
helps:

f9e2a5b00a35 ("mmc: sdhci-omap: re-tuning is needed after a pm transition
to support emmc HS200 mode")

Regards,

Tony

