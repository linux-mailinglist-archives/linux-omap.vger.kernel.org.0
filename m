Return-Path: <linux-omap+bounces-606-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E8855F25
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 11:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B77D283A13
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 10:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D557469300;
	Thu, 15 Feb 2024 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gRW8qAj3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cqTT/FKX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gRW8qAj3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cqTT/FKX"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411867E97
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 10:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707992910; cv=none; b=taenvzs6UUFAu4LSkn4PeQ+UeI2DB/c0RsNi40nPVGNBjK1+bYWU2WgOVXvo6nyZPIdVL/QpZztjL/fpZn2gqwa/U21FUis7dLRUt0BIPwqG9EyEXPLm+oUiBY70MOwPWAsZ5Xm9mfN/msWPY1RPXvhZJgmb/hB7Bs5YFGuF2H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707992910; c=relaxed/simple;
	bh=IWGtQN3o+8yGE/lqzOEpET9KMgvOxbcdTvs0UGPNWlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H6F52Pbv8gx9XH1Yd6AK1DK6t0PC2e8fnOjwiSYpg6RvtUtXuIJCZX+V32vG87JlvfL12AhHyNlKcK001plm7tAoHkh97i3flhohw5hDcfosCtAfFUtQ47be4NbOQJn6ktCMWeisQB8wmSSIW0YaHr9/Ocy/SNpaFy2RsV80mg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gRW8qAj3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cqTT/FKX; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gRW8qAj3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cqTT/FKX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out1.suse.de (Postfix) with ESMTP id 70FB821D9A;
	Thu, 15 Feb 2024 10:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707992907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKKW7UFhlhPdogcyNp83HsYSJa5cH3/SIQawY+8tphY=;
	b=gRW8qAj3AudbZgyFTDv4dLSzQkJ7EdDvwnCcctyBZ79D9v+kMYRKCJ9sPOsFHReeyjxye4
	SlCkNl6qWF37qWCEzbqpZ67M0ovxyoKLvDfhC5/sVzW3SEdGrexrfz4Sv6zqF+xbpGiInN
	s7C264wHYdEXw8qByRarjwv/vv8NN8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707992907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKKW7UFhlhPdogcyNp83HsYSJa5cH3/SIQawY+8tphY=;
	b=cqTT/FKXp5RXj/Qmgn/Z/KaK/ySsbZlSWuNoD/J7PlMt0WFsedZjINLHQLbq0/lcvkLkoZ
	FQV/oW3BX0qMiKCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1707992907; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKKW7UFhlhPdogcyNp83HsYSJa5cH3/SIQawY+8tphY=;
	b=gRW8qAj3AudbZgyFTDv4dLSzQkJ7EdDvwnCcctyBZ79D9v+kMYRKCJ9sPOsFHReeyjxye4
	SlCkNl6qWF37qWCEzbqpZ67M0ovxyoKLvDfhC5/sVzW3SEdGrexrfz4Sv6zqF+xbpGiInN
	s7C264wHYdEXw8qByRarjwv/vv8NN8E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1707992907;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MKKW7UFhlhPdogcyNp83HsYSJa5cH3/SIQawY+8tphY=;
	b=cqTT/FKXp5RXj/Qmgn/Z/KaK/ySsbZlSWuNoD/J7PlMt0WFsedZjINLHQLbq0/lcvkLkoZ
	FQV/oW3BX0qMiKCA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 5FA7F4A04EC; Thu, 15 Feb 2024 11:28:27 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Tony Lindgren <tony@atomide.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
  linux-arm-kernel@lists.infradead.org,  Aaro Koskinen
 <aaro.koskinen@iki.fi>,  Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
In-Reply-To: <20240215094640.GS52537@atomide.com> (Tony Lindgren's message of
	"Thu, 15 Feb 2024 11:46:40 +0200")
References: <mvmcyt13idm.fsf@suse.de>
	<c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>
	<20240215094640.GS52537@atomide.com>
X-Yow: My haircut is totally traditional!
Date: Thu, 15 Feb 2024 11:28:27 +0100
Message-ID: <mvmeddeyqb8.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-1.37 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-1.27)[89.77%]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -1.37

On Feb 15 2024, Tony Lindgren wrote:

> There was a regression recently with the PMIC which would cause NFSroot
> on devices to keep working but may have affected MMC. Please check that
> commit 7a29fa05aeca ("mfd: twl6030-irq: Revert to use of_match_device()")
> is applied.

That commit hasn't hit stable yet.  Maybe it's because it references a
non-existant commit id (1e0c866887f4 instead of 830fafce06e6).

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

