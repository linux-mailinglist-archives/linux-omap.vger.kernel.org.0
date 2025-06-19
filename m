Return-Path: <linux-omap+bounces-3916-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5825AE0455
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 13:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B3C4188571A
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 11:52:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D155A22DFA8;
	Thu, 19 Jun 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="efaYPYPI"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA9122A4EA;
	Thu, 19 Jun 2025 11:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333902; cv=none; b=GwANFVhPG/UsPT/Ul3N/6gDf1vmnnhR6Wyh6SDMi9oyMIg/z8+gpScm4hOIk/i1Ktz5iRkktPXD5ZUFcBiZtOnDT1tUacwBq5RS0Q7qnk7CvN6/9OsD58e1nG3FyWypXzbW0kV2vOZaki3sYK1rjJhmx8SMg1xjYy3lQl19BDmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333902; c=relaxed/simple;
	bh=/xeFPIk1YZqG9Yb44PzZdK2gx7mLQTryn360QlKdwEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dFzSqWmYuc1u17P003W8MYaVcXsSSnPEZ+V2gtOj+aWDxAzD2jH09GQpRiEYGWcw2ZzaubALVwghJjz3lnXgFXaCcZjcjWTkESp3x38Q/8MTlUQl9ziA/gb6Sba6y/3aGPouZwl4Hwp5niFi+RUSt2WagEV8ndbhO559rSNAImQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=efaYPYPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F67C4CEEA;
	Thu, 19 Jun 2025 11:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333902;
	bh=/xeFPIk1YZqG9Yb44PzZdK2gx7mLQTryn360QlKdwEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efaYPYPIcR+0rCCpCgXXuc3Zb9offsicCHyLPnb0mDZ+eG64uV0oDRdG2BrlOds4n
	 6inQL7T/z5Pjn81c6lmCAinRdkYzXl6VlZ1buRzpvIiFuxvkCP5zNctF1UKxUvU7Ma
	 1ZY4flU7cC5wxaSnQqoSeIgnHgVgOthRbj93ltX81U4cLp6IOts/VM9/1SqdFCy9LN
	 vs27qbYGt3e+QcUmwpqkctPXI/lIWyI/9WNJXrXo4Z3K+hou2byZtux9G7zGEVTdWl
	 rPJoQ+4jQHNB9bhkViFrOeAely9ewjEF3Xsv4S+4dBaspB4IcdiFh+YG4EygyA9Hh1
	 wDFAOW+GqLrDQ==
Date: Thu, 19 Jun 2025 12:51:37 +0100
From: Lee Jones <lee@kernel.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl6030-irq: Remove unused twl6030_mmc_card_detect*
Message-ID: <20250619115137.GK587864@google.com>
References: <20250607202232.265344-1-linux@treblig.org>
 <20250613143757.GL897353@google.com>
 <aExDbkQBhK3ZubVo@gallifrey>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aExDbkQBhK3ZubVo@gallifrey>

On Fri, 13 Jun 2025, Dr. David Alan Gilbert wrote:

> * Lee Jones (lee@kernel.org) wrote:
> > On Sat, 07 Jun 2025, linux@treblig.org wrote:
> > 
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > twl6030_mmc_card_detect() and twl6030_mmc_card_detect_config() have
> > > been unused since 2013's
> > > commit b2ff4790612b ("ARM: OMAP2+: Remove legacy
> > > omap4_twl6030_hsmmc_init")
> > 
> > This formatting is driving the little OCD being that lives on my
> > shoulder crazy!
> 
> Thanks, which bit?  I tend to put the commit .... on it's own
> line, but then checkpatch really doesn't like long lines so I wrap
> any word that starts after col 75.

No need to put the commit on a new line.

> > I'll fix-up and apply the patch.  Bear with.
> 
> Thanks!

NP

-- 
Lee Jones [李琼斯]

