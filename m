Return-Path: <linux-omap+bounces-3520-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B2A7731B
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 05:58:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E01A188E930
	for <lists+linux-omap@lfdr.de>; Tue,  1 Apr 2025 03:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F302C1552FA;
	Tue,  1 Apr 2025 03:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="DmoOT0ky"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944C12E3398;
	Tue,  1 Apr 2025 03:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743479884; cv=none; b=YPNkWfsBDeWtYPtGOoxtJsJuFu2un5n87lhsd0uAk5QFS1BHyCasLnviCLQSWMSshzFq5+Iw+lp5AgWfrhXaA+Ho1v+CI45Fz/Q/EElNgwi9xZqk7lnleq51cw4YEtYrQ2CWxnLHweQhq44nqGMvySMQwLNJOspq1LNPAnRxdOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743479884; c=relaxed/simple;
	bh=N4flpkYP/Za3/civSejaZvQGaHmDOPJeQQV2Y68IlpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RrEy54F2mgQ0JTZGT2E8m4yuaOrZ+gQdTXw1Q6bBYQsixiXgQSutVl0f5999UDYWLwUkOSaCHrL9YDuJowbcFzdHod6bzy9Vfy6Z7QbFFJpkcKXgCTHQAuthuF9e3MoiicdaIFowfVHow++AzRZfxCh+dzmPqczpKeeH9ytihh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=DmoOT0ky; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id C5750604F7;
	Tue,  1 Apr 2025 03:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1743479881;
	bh=N4flpkYP/Za3/civSejaZvQGaHmDOPJeQQV2Y68IlpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DmoOT0ky1u9eyvTg1YhrribKaumYt8CKzHuuyKegEXX+HPaaqELpzW/DXTm5FYdWg
	 3OYXsZYKWCq11s3Tshhp5npT6O6V9U77vKSYSwl93yN4fSftOakPJDO1C7X0rSBpkO
	 c35rAv/8AoePcjw8s+4yBmjFUTj+qBbXKLg84HNl/LxH9pRJLJ4wAC+Z5W9huBNnPF
	 jloplKJkYtDQ3f2LqVppq7lgbLDoi8CLv44QPlCewqXG2SuaODNpAfVdVZZEDi1VaF
	 ti6OfyYyu/T40qjIxlqq6n7LOQNUtJMFuZ1/l+NAlUcj0/sver1mIoegjAT20iqfUf
	 28kOmtKhVXLBw==
Date: Tue, 1 Apr 2025 06:57:45 +0300
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: "A. Sverdlin" <alexander.sverdlin@siemens.com>,
	linux-omap@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-ID: <20250401035745.GG4957@atomide.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
 <20250331110017.2b0aa9ae@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331110017.2b0aa9ae@akair>

* Andreas Kemnade <andreas@kemnade.info> [250331 09:00]:
> Am Thu, 13 Mar 2025 10:47:06 +0100
> schrieb "A. Sverdlin" <alexander.sverdlin@siemens.com>:
> 
> > From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> > 
> > This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> > 
> > It brakes target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
> > when minimally-configured system tries to network-boot:
> > 
> > [    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
> > [   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
> > [   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
> > [   26.878471] Waiting up to 100 more seconds for network.
> > 
> > Arbitrary 10 deferrals is really not a solution to any problem.
> > Stable mmc enumeration can be achiever by filling /aliases node properly
> > (4700a00755fb commit's rationale).

Would be nice to update the description to make it clear it breaks in all
cases if there are not enough devices.

> > After revert:
> > 
> > [    9.006816] IP-Config: Complete:
> > [    9.010058]      device=lan0, ...
> > 
> > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> No regressions seen on GTA04, Pandaboard and BT200.
> So
> 
> Tested-by: Andreas Kemnade <andreas@kemnade.info> # GTA04, Panda, BT200

Good to hear, best that you or Kevin pick this up:

Reviewed-by: Tony Lindgren <tony@atomide.com>

