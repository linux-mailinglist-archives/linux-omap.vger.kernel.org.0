Return-Path: <linux-omap+bounces-2760-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2D39E154D
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 09:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D500D284929
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 08:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF40E1B85CB;
	Tue,  3 Dec 2024 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="K5YyeeAy"
X-Original-To: linux-omap@vger.kernel.org
Received: from meesny.iki.fi (meesny.iki.fi [195.140.195.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D65F1632FE;
	Tue,  3 Dec 2024 08:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=195.140.195.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733213399; cv=pass; b=Kodt/9W6Hoe5V29m78RGM06jjlwIbTvbKKLpgUky+2UFCucHbkwE+K4xxBHLjAZnu9789Bt9pvBgQ0KJJknMKc5R7Q57vHZI1kJDQvU32Sf3FNufVMX2j8ePhXrbNk0clanQUb2rOmwH7m0nfcf+eMhTEj/zAHIh73gKyTCTWS8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733213399; c=relaxed/simple;
	bh=DqkQcXIa7CXPIpQFolD1hrzptjYpiMABnmYZJK7Gfx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SNnG2pushmG/a+E17e4fvc9T5sBTAx7H7R0k0FBhVv3BYVQ8fyn/QZTpun7gto1UKfH68LituRNAEaYZdC1NmGs35ZSeoZdLNooALGLRudr8Xr1WW6jLZ9fayhj6fB1MABU5orXODrvbH3vU8pP2w9tXRZMpF2f96uFfUN9+fH0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=K5YyeeAy; arc=pass smtp.client-ip=195.140.195.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-149-70-nat.elisa-mobile.fi [85.76.149.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Y2YGn2dVKzyRk;
	Tue,  3 Dec 2024 10:09:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1733213394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rqVDFM2O006ZYC6PWmi9IrmLm2dQFH87048l6QJ9w9U=;
	b=K5YyeeAyc5ASvEJclR/MTGUdWTXzerookicimuROHha89XRgMIuFCyQFhofD+P2y03F948
	ocqxOK9rFIWhiknUOpJZyOZfyOyOvkZq6xt9rocLr8zGrk3lI2MNrZvk1CIpM8UgurBEAk
	dYLHEH5TDUY4F1YJwSLYd+ZmXsC2Lt4=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1733213394; a=rsa-sha256; cv=none;
	b=WxNUlLtHbJFbsHMUm+3BoLKmsAtmVO0KDnXCGdVlZOkIcnUEGSQlER6Jee+5gCi4HZnP1k
	d3lWImFiQAXhm9NAw5DZT4uO0eszDfeJKIbcjuaoUHOYN0DSqgPYVpSEU8aYnkarlJ8Ceg
	cF2iVCKYaxpwzlt6qZ6111kRFyQIY2g=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1733213394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rqVDFM2O006ZYC6PWmi9IrmLm2dQFH87048l6QJ9w9U=;
	b=BH/6DksjDJgWQo4cHrnE0VxktWovK2DR6bctnqnJyKLx3EgQ6/2FvtGumvYNmpBCzkv6ov
	3eE0e+MmOeb3LGFhGtM2dipuQ75f3TcmKEh/n+722duDevgtw4U+skPs+roaaXTQ0T015V
	HW1NkFebQwSilYVOhqxqSRKS1oFEal0=
Date: Tue, 3 Dec 2024 10:09:51 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Dhruv Menon <dhruvmenon1104@gmail.com>, vigneshr@ti.com,
	andi.shyti@kernel.org, jmkrzyszt@gmail.com, tony@atomide.com,
	khilman@baylibre.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Cleaned up coding style and parameters
Message-ID: <Z068zzkafs-xJPt4@darkstar.musicnaut.iki.fi>
References: <Z04CA8fGCC-nyZIY@melbuntu>
 <Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi>
 <20241203083547.0213c054@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203083547.0213c054@akair>

Hi,

On Tue, Dec 03, 2024 at 08:35:47AM +0100, Andreas Kemnade wrote:
> The sleeps are not shorter, instead possibly longer. I do not think
> that is an issue, AFAIK the idea with sleep range is to bundle wakeups
> and reduce power consumption.

msleep(1) is jiffie-based and can take up to 20 ms. If you replace
it with more precise usleep then polling is more frequent (more
wakeups) 

A.

