Return-Path: <linux-omap+bounces-2484-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8A09AFD29
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 10:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4E3E283558
	for <lists+linux-omap@lfdr.de>; Fri, 25 Oct 2024 08:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9AC1D2708;
	Fri, 25 Oct 2024 08:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bj82IVY0"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A171D26EA;
	Fri, 25 Oct 2024 08:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846232; cv=none; b=f1HtVf/+QPnIV9XprVHtJz/IqX0me9N5JX7E/MpgeC2yKaT6MiZvV/HYsxHu8CP+lOnMo6ccuqrZ731iNc5qy0ZHsqtwyIFdTxQcKSSm8WyrKt7J22e/NP99ZZ/g/4iY3oAziUZswjpmvbscbbtD26gA6Send+sRpGcbYZYFFM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846232; c=relaxed/simple;
	bh=EiFzBiJNO+gug/df+x/geO73pUGdEZjeyi1bo22cFB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IxvJaNTdkhq+DhJuTVnVSTUAdi+Fmk0pry1VglLhutc1IWFLgwv1/PlKd+49uUMz7hC9B24gyoNbf35Dle8jL8FdOC2/e63wxloYKsxZMepem48IbXdE/wen0skr9EokkJo8A9zHhosbtqxB/iJyvNHNjMXcvdJC0EES8DxXWAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bj82IVY0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28AC6C4CEC3;
	Fri, 25 Oct 2024 08:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729846231;
	bh=EiFzBiJNO+gug/df+x/geO73pUGdEZjeyi1bo22cFB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bj82IVY0Tz95HIoaqBj6H8GLrOxsXCZ6QVy7P0SaXmqNI6gaezGwT1rUHJVlB+3ld
	 Ofn4MvR+5cS5RcCCh4cYfqscDU68aJw4BYPH03tI136fDg7zOjfz42gTaKqfatd2CO
	 rSR8mDyiE8Od1n2kznhb8janeQ2S9H7jcqWEIYBpn2qWhkqeh7ryRM+I54cXsDtw7a
	 3K6ZjncHZu7Srw+nIh4dvbC7YdC3/uxJNHqkIrJA3h5HzsJ7u/Kf69xTm1OD4YElTw
	 EVHik21SZvbCjGhg6KRLkYi093xVRYzQJS3A9HOS3LC+MDo7IYLc8g6+JkA8s0L4OG
	 6+K1SKFfg6f2g==
Date: Fri, 25 Oct 2024 09:50:26 +0100
From: Lee Jones <lee@kernel.org>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	Roger Quadros <rogerq@kernel.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: (subset) [PATCH v5 1/3] mfd: twl-core: Add a clock subdevice for
 the TWL6030
Message-ID: <20241025085026.GA10824@google.com>
References: <20241014161109.2222-1-andreas@kemnade.info>
 <20241014161109.2222-2-andreas@kemnade.info>
 <172898119013.384451.4986094816910935104.b4-ty@kernel.org>
 <20241023120432.59cedd0b@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023120432.59cedd0b@akair>

On Wed, 23 Oct 2024, Andreas Kemnade wrote:

> Am Tue, 15 Oct 2024 09:33:10 +0100
> schrieb Lee Jones <lee@kernel.org>:
> 
> > On Mon, 14 Oct 2024 18:11:07 +0200, Andreas Kemnade wrote:
> > > Also the TWL6030 has some clocks, so add a subdevice for that.
> > > 
> > >   
> > 
> > Applied, thanks!
> > 
> > [1/3] mfd: twl-core: Add a clock subdevice for the TWL6030
> >       commit: 5ebc60259a0fdd13aef077726b1773f1ae091efc
> > 
> hmm, this does not appear in linux-next. Did anything went wrong?

Looks like a clerical error on my part.

Thanks for noticing.  Re-applied and pushed.

-- 
Lee Jones [李琼斯]

