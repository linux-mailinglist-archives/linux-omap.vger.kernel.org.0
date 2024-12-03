Return-Path: <linux-omap+bounces-2758-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E43229E145D
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 08:36:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA5D7282A59
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 07:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5B1199948;
	Tue,  3 Dec 2024 07:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="kdOWa0vj"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6978518BC0F;
	Tue,  3 Dec 2024 07:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211365; cv=none; b=nJ5UJRtXHHCVXAm8qWew0yHg23uQjBLS/1/gpvdr/4fIEb15O5NdVesMQbZkskx14ItKUmU6gUNVC55TyXSmU/Pb5MJcKABJTmSzlnk4C6BfBXatV1a9ky4+6Ia4Um18a/5ZOg+MBjLivYQQ+OtlBjbP/HSz1D75H1PDfZMDaUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211365; c=relaxed/simple;
	bh=06O9/zZRYttR11kZy2/cRV8/acnRe2eTNvTWILeYkZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Gly1awlisbgL31kvSKCaXiq2XVkrYyX6ygeIPlQtGc2Z9qHYLiOkYOBXZWNcGVReZFDlg+ltLlOdrD5GssxTdKIgyGxmoKEzaufl3itz0hsPafeYjhgTxmeQYmyD7HOBkFEDykgYm6YnWSazA0F7ByVvTqkrnbko0KRTin6L6mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=kdOWa0vj; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=+Ez4NGr47887lNpGpj5/BuTnIxrkZh4EALx8t+V3VYk=; b=kdOWa0vjAYRf7EghvfzFTA4pEc
	v3ChYnt4diE9jo+gG/rGlYGmJAGalUwetgyibmrk7CW2iTQNGjRxPfhKXbJI4NxKPXWtZfiK8BkRU
	6XkVSxIZyh7wsHtPVK/DZS6HO2pSMcHGTnlqKCQ2Nx/tulyvf9EBX4oCH6KW3q1R6zutgxQKp2gUI
	6VCnTBtD9GXmZBzQml5Sr07VBK/YZpGe0t96cWGg3Fpxypv1BQCnE3sBwHx5RdhK0lGQ8tgqPDjWN
	2UH2mmws96F+2AIyLOTsQaVYFvdjDLGWW/CIU5szxpH/yBYSln1IzRxT+aUHwDwQymG0bhAuhXKUZ
	pb9JyI6w==;
Date: Tue, 3 Dec 2024 08:35:47 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Dhruv Menon <dhruvmenon1104@gmail.com>, vigneshr@ti.com,
 andi.shyti@kernel.org, jmkrzyszt@gmail.com, tony@atomide.com,
 khilman@baylibre.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Cleaned up coding style and parameters
Message-ID: <20241203083547.0213c054@akair>
In-Reply-To: <Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi>
References: <Z04CA8fGCC-nyZIY@melbuntu>
	<Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Mon, 2 Dec 2024 22:58:17 +0200
schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:

> On Tue, Dec 03, 2024 at 12:22:51AM +0530, Dhruv Menon wrote:
> > This commit addresses the coding style issues present in i2c-omap.c,
> > identified by checkpatch.pl and removes unused parameters present in
> > two functions.
> > 
> > 1. Coding style issues includes Macro Utilization, alignnment
> >    correction, updating ms_sleep() < 20 to usleep_range().
> > 2. Removed unused parameters from omap_i2c_receive_data()
> >    and omap_i2c_transmit_data().
> > 
> > No functional changes have been introduced in this commit.  
> 
> Not sure if that is correct as sleeps can be now shorter? I wouldn't
> touch them unless you can show some real benefit (checkpatch.pl warning
> isn't one for old driver code).
> 
The sleeps are not shorter, instead possibly longer. I do not think
that is an issue, AFAIK the idea with sleep range is to bundle wakeups
and reduce power consumption.

> Maybe also changes should be split into separate patches for easier
> review.
> 
I would leave out omap_i2c_*data() parameter stuff until the i2c irq
regressions are fixed, maybe that parameter is needed.

Regards,
Andreas

