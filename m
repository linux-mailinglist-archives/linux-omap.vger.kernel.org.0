Return-Path: <linux-omap+bounces-3913-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 683E1AE041B
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 13:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DDA416219D
	for <lists+linux-omap@lfdr.de>; Thu, 19 Jun 2025 11:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B1D2264DD;
	Thu, 19 Jun 2025 11:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4fSoDCr"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF16A28682;
	Thu, 19 Jun 2025 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333328; cv=none; b=EY9Qi3ln9OicwlFyNExytOSnC+m+x1+lY86/8wHeGNqjEgHNURsdQSrUXwrUOrhMPonJ/0TFXYC9ra1ULdO99sa524Ub5R8JilQCLbXVYSZPBZfWIZd9j4jqjCURi54gVPw5S21h58f9AE3WxkjFOjpQch01n1/d7LFUfTgj09Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333328; c=relaxed/simple;
	bh=s4rk5t55aedWa4Ayqj1Ui8bnNj/t5ndVnr03YjnVDZM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkgL8GTvET7iha2PCj+kazoPpKh33BpNyqLmWRU4MawWNCib0bpN534JI9IDaHU6baMDGP4FY6oYW2rrCVVy5fBti4nrWKFySl0BVW7Th3II7MHT+WFoNkRGTg4AZI3ynvz49qNPJ3ggfVjvoTeCNJDmJlsHE4PVon8tm2ry3lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4fSoDCr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69014C4CEEA;
	Thu, 19 Jun 2025 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750333328;
	bh=s4rk5t55aedWa4Ayqj1Ui8bnNj/t5ndVnr03YjnVDZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u4fSoDCrZe5zFYaMwncWdayU49hCFd4asVorMKMOMmuUovFTf7uRJ6Ayr5CpIx6Ny
	 XKj5bQaJ3WlCde4n4cZxSoup16YFLSIzWzEEomwegA5gPxJWmEbdtwa25VtBWIyFAN
	 R/ItViL6PxHnNBOTPJU3HehFvsU6fbtesYOS4UEB48xAvt7Vc3QdE/LQKIoWh31ls8
	 rtPq0ZWJO0bLmdOPcP3J7DfO1tPaG8uvbSDyU7jbWl3kWAxCSZERycn23cKLCpxIem
	 FOkSF0GmeM4aNprWXpjL7H9WY0vJjPvvDoteh+IUvtiJEXmA0289ARrv+lp09WW2lz
	 dBJFsE7m3TB6Q==
Date: Thu, 19 Jun 2025 12:42:03 +0100
From: Lee Jones <lee@kernel.org>
To: linux-omap@vger.kernel.org, avinashlalotra <abinashlalotra@gmail.com>
Cc: linux-kernel@vger.kernel.org, aaro.koskinen@iki.fi,
	andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, avinashlalotra <abinashsinghlalotra@gmail.com>
Subject: Re: (subset) [RFC PATCH] mfd: twl4030-irq: remove redundant 'node'
 variable
Message-ID: <20250619114203.GF587864@google.com>
References: <20250613122251.1033078-1-abinashsinghlalotra@gmail.com>
 <175033318908.710815.6342115650499994401.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <175033318908.710815.6342115650499994401.b4-ty@kernel.org>

On Thu, 19 Jun 2025, Lee Jones wrote:

> On Fri, 13 Jun 2025 17:52:51 +0530, avinashlalotra wrote:
> > The local variable 'node' was used only once to retrieve dev->of_node
> > in a call to irq_domain_create_legacy(). This patch inlines the usage
> > and removes the redundant variable, improving code clarity.
> > 
> > No functional change intended.
> > 
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/1] mfd: twl4030-irq: remove redundant 'node' variable
>       commit: 29be779ed76e7bac378be9edd213b0ddc2f20e0f

Sorry, ignore this.  I removed it.

Your sign-off and author should contain your real name.

-- 
Lee Jones [李琼斯]

