Return-Path: <linux-omap+bounces-1309-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5E8B58B5
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2024 14:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBCF11F2494A
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2024 12:37:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5877FC2C6;
	Mon, 29 Apr 2024 12:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pUdKOUAy"
X-Original-To: linux-omap@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AA8487;
	Mon, 29 Apr 2024 12:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714394220; cv=none; b=kdUYQHRKYSdy/k4Iu0pVQV3d1LukxCHVlmUCPD+zl2x2iEUOkrUEmIFsh6NcjEKiPgP/Fc1K335gaFCht1v9VHoiav7csP++hkGx8G/fwEOuf9p82/11yHyNpU/CkUxhCXmrudOA/tFksaoD+0SOVTWgdL+qx1s51w8tgsC1sEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714394220; c=relaxed/simple;
	bh=/ZVMW7S4ba1fzlJuh0IoZdyiFmNQgBjBERO39t+nbC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiPb/va/wfYtz69yEwwf1IMrxYaLjCnFF+iC8ymoEN57Hb/B7AjFHQRE2v23w1grDhwya/9P4S04Nb8sxuByVVUjzjKxGyuA3jsY+49NB1tiNaNdQo+nH7Rr8xR++PRZz0ra6kdJACWH5zNEsNl1NPQSDlZGoFTzjnKAGyTuzAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=pUdKOUAy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4rm+iSVUoeBsbsT8u7w4kcYSi0ko1/DqWhg4yghsUEk=; b=pUdKOUAygViyCfTwhA5WC5gnqS
	2OwojHiZnRmBzi4PKEJFfc+QZjzChqXM1k7aDHaKDMNEoz6DUjgzK305jZAdJe8x0+QNHfwEZfX6O
	poowUIuKnIbOXTmJfp2kv0rI4IwXlABp62jTDmwcbr20pTNovwyZgfjcFRtiUYqG6dwk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s1QFZ-00EFXi-LR; Mon, 29 Apr 2024 14:36:53 +0200
Date: Mon, 29 Apr 2024 14:36:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Andrew Halaney <ahalaney@redhat.com>, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: Beaglebone Ethernet Probe Failure In 6.8+
Message-ID: <44eaf045-3766-410f-bb2e-fb008b1513bf@lunn.ch>
References: <Zh/tyozk1n0cFv+l@euler>
 <53a70554-61e5-414a-96a0-e6edd3b6c077@lunn.ch>
 <Zicyc0pj3g7/MemK@euler>
 <c11817a2-d743-4c27-a129-dd644c23110f@lunn.ch>
 <3kpvqcg3twpifzkxkrvhqew3cjuq2imgo4d4b775oypguik55g@npe75wf7rpdr>
 <Zi7+xqp1GG6Jl/kU@colin-ia-desktop>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zi7+xqp1GG6Jl/kU@colin-ia-desktop>

> I went all in and did a 100ms delay before returning from the resets of
> 3 and 4 you mention. Sure enough, everything worked! It certainly should
> be understood and optimized. I added the linux-omap list to this thread
> (please let me know if there were others I should've CC'd on any of
> these emails).

It probably has little to do with the OMAP, it is the Microchip PHY
you need more information about.

100ms is a very long time. The data sheet says:

  Note: For the first 16us after coming out of reset, the RMII
  interface will run at 2.5 MHz. After this time, it will switch to 25
  MHz if auto-negotiation is enabled.

I did not find anything else. I would try a deassert time the same as
the asset time as a starting point. It could also be that you ask
Linux for 100us sleep, and Linux actually gives your 1ms because of
the resolution of the timers. But i doubt many application will care
about a 1ms delay.

    Andrew

