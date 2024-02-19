Return-Path: <linux-omap+bounces-673-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21611859F6A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Feb 2024 10:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 543061C21249
	for <lists+linux-omap@lfdr.de>; Mon, 19 Feb 2024 09:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A792261B;
	Mon, 19 Feb 2024 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Of/+DtGE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rT8W7urx";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Of/+DtGE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rT8W7urx"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F18222EFD
	for <linux-omap@vger.kernel.org>; Mon, 19 Feb 2024 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708334225; cv=none; b=EfRzhW3ObvxvBvlMsar5AaVhDWJdn5R8QtGfrczCAYOIO0W8Yg0b1cN6xfVaeMzQ9P/Js5RsLmIkIQWqvDgRIdUSLdXWJrK3ukIawMfh6Q62sfCucnEblLECTolHyYaoE3F7EAU22DWwDwbBtNgw25rVGwXzUy62hGKOvuLggXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708334225; c=relaxed/simple;
	bh=GyYzt6VUoYJe//8zMfEv0hCqm1pVm48XUV9bEywIehg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jbKa3NqJr7r5lznKHx0Badxb1Yr0Dg9tS5kpO4Y+G0mrEmjDpGkczHHkhaQVTy58sr2BhCf4E/EoWhT0v5cn1fsV0GuXfb2IE6XCoq8YMVwrc89uBnq4f70YagKsiJtDtIjZ2enuCZJpDn6Tio3kbyX9OUbNi+lZumDLZfEqdA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Of/+DtGE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rT8W7urx; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Of/+DtGE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rT8W7urx; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from hawking.nue2.suse.org (unknown [10.168.4.11])
	by smtp-out2.suse.de (Postfix) with ESMTP id 489351F7E6;
	Mon, 19 Feb 2024 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708334222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=87Zm0NzmVvoqxBduW7U8fwevwRdq6z0bA0dQYevcYVE=;
	b=Of/+DtGEXtsjf9J2gYoRKg/w1Usa0Ymyl7ToKdwLKxZZyDHxIPxZYmBvy4HwrSzf/TSPA7
	3ybrFZ9plx+GIqEEZDxmvp2zdXQgEu+Cd7sCJi8SH+Z2GObz7z+sO5xTm4vDyJWkoVydwO
	mk2Pq+4SZmEEiPDFW7wi6Tvd/dR8f80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708334222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=87Zm0NzmVvoqxBduW7U8fwevwRdq6z0bA0dQYevcYVE=;
	b=rT8W7urxouwGsGUVEmKQNGe2QiaEBUM/lKvCvRbD7pfO/IaCY1a0taqjtCrF5g+yVv5GC0
	S1QYkN7wquEQK9AA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708334222; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=87Zm0NzmVvoqxBduW7U8fwevwRdq6z0bA0dQYevcYVE=;
	b=Of/+DtGEXtsjf9J2gYoRKg/w1Usa0Ymyl7ToKdwLKxZZyDHxIPxZYmBvy4HwrSzf/TSPA7
	3ybrFZ9plx+GIqEEZDxmvp2zdXQgEu+Cd7sCJi8SH+Z2GObz7z+sO5xTm4vDyJWkoVydwO
	mk2Pq+4SZmEEiPDFW7wi6Tvd/dR8f80=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708334222;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=87Zm0NzmVvoqxBduW7U8fwevwRdq6z0bA0dQYevcYVE=;
	b=rT8W7urxouwGsGUVEmKQNGe2QiaEBUM/lKvCvRbD7pfO/IaCY1a0taqjtCrF5g+yVv5GC0
	S1QYkN7wquEQK9AA==
Received: by hawking.nue2.suse.org (Postfix, from userid 17005)
	id 38EE24A051A; Mon, 19 Feb 2024 10:17:02 +0100 (CET)
From: Andreas Schwab <schwab@suse.de>
To: Tony Lindgren <tony@atomide.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,  Linux regressions mailing list
 <regressions@lists.linux.dev>,  linux-arm-kernel@lists.infradead.org,
  Aaro Koskinen <aaro.koskinen@iki.fi>,  Linux-OMAP
 <linux-omap@vger.kernel.org>
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
In-Reply-To: <20240216120833.GT52537@atomide.com> (Tony Lindgren's message of
	"Fri, 16 Feb 2024 14:08:33 +0200")
References: <mvmcyt13idm.fsf@suse.de>
	<c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>
	<20240215094640.GS52537@atomide.com> <mvmeddeyqb8.fsf@suse.de>
	<2024021516-stricken-bubble-bf8d@gregkh>
	<20240216120833.GT52537@atomide.com>
X-Yow: Why are these athletic shoe salesmen following me??
Date: Mon, 19 Feb 2024 10:17:02 +0100
Message-ID: <mvmy1bgyfsh.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -3.89
X-Spamd-Result: default: False [-3.89 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[6];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.17)[-0.846];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_MATCH_FROM(0.00)[];
	 BAYES_HAM(-2.62)[98.31%]
X-Spam-Flag: NO

On Feb 16 2024, Tony Lindgren wrote:

> Andreas, did commit 7a29fa05aeca solve the issue?

Yes, it does.  Thanks.

-- 
Andreas Schwab, SUSE Labs, schwab@suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

