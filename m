Return-Path: <linux-omap+bounces-2759-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED429E14FB
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 09:03:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 423E91646EB
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 08:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A521C1DED6D;
	Tue,  3 Dec 2024 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkGRDXoJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8B1AB6CC;
	Tue,  3 Dec 2024 07:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733212753; cv=none; b=OfQm8rRpwHlSmEuWKXIdqopdnzanwxmFwhlX6hLbCrvy+oDvRG94IWpEq/mBoQMK36ghgVp/YdA5iqKHKpPS7ekLSW+1kXxqWc5IQOVkW/L7UNbGiMXofemYZt7um3pMHE+C2iRGq4XPLbb7zrXu7luomV7JlsDpbskyF+Vo7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733212753; c=relaxed/simple;
	bh=clpkBCGLDVMVR5pZCRShuH5wToaBnPfTlcc+xdY8wzA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kluN/Vvyp5G2vIorhpygCt+0GeEsqMBeJ1r5MYiSSLvGOylbbkHdes5YGIEg6XrPtIfmMgQkcO11PFDsj1WZycoiUjJTvVT9UCeNtvI5L36yhvBNdQurL9jaKaIlCPIhcEgJFlbXNLGHnTHr4BOQWHWNyd291/GpIc2XQP8Ed90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkGRDXoJ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215513ea198so24850725ad.1;
        Mon, 02 Dec 2024 23:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733212751; x=1733817551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUE0Vq+/WDIwmmUNrcZovJ+MHEgUVuI1n1+DEZCijos=;
        b=JkGRDXoJhiaCQYrTONCpvUpWSySyPnJ0/yfmr4kQ22ZMV8Mn49fPDq2H7wgbzsGUnl
         q9bl2Wo5acpCZ4HWdE9y2OdDvPPln+vAlrxhG/2+cA5dF22ZiCshg7yOZAMN8tJJuOB2
         emDHf1+0WDsXaV2T1eyFScdD4VT/DS3kGw6/n3T1lg10JNTYG7/suwGLMhD+FPAhiRGG
         NSpLQkVIe57hScZv7vo6Cf3p8kJpGXrmyT7s8tsNYi3y+riY5fmsqnuMMBOf4nNjaPcl
         8u1YcrcNgizEPynCuliBA2YMptFsT00zvnVj1exJy6Oc6N/zxhFMUJC/LRcSOha8WnYP
         HTMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733212751; x=1733817551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUE0Vq+/WDIwmmUNrcZovJ+MHEgUVuI1n1+DEZCijos=;
        b=LP2SzQ1+z3+fuU+1jpQcXOFDafEoy8zzyXj3Dj35mp7a+NXPIX1Me9SfNI4Oe7iY/B
         YROoxCwyZvP/S9MyMWyBCOSD/7Ni93KFqNvxslRqX4biQDMFEVRD6NZAkMKbE8eTbyHz
         kjo4PCmZP7raQxB76OTx50I42x0D1itiEBiMNxnVGRe/4+DqsOe+922m3Xaf5Pog5bG4
         0o0g1O0P4VMq9pdJlL5JvWse1BuO4MG13n/CaQkR1JBzAGMXC7ljoGnQPimhFEbFx1jc
         CkfwoSunuQCJuYUf1BANArJyGw4+R2PSI8E9dfH9hUnhMfxB/4W0Q9V8Ym1fOQBEBjmu
         lRyg==
X-Forwarded-Encrypted: i=1; AJvYcCVsw0BuL+xUIUd+RreKAOiYWBWbsvRPAvrXZrfd6rBfHkpdVy4pd2qMkE53eM314gn1jtlw/H0vbBhvVg==@vger.kernel.org, AJvYcCW1JJf1xi7V/+KNZThMfBoU6CKXX+CBFKh5aoBwjIogYVpl57OJwzcdaZYpNGMVENXo35flF/8uCaXux4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzFYFn00Nde3mRGMQIu/JVjXGU04YhjnZ5GDBR2U2MucU1dnF7
	u/H6n9QudY9+5G5IUNwBjz6LA16ACIbyexB6RNKpMLTzeQOD3b7Y9JZiTyB6V6U=
X-Gm-Gg: ASbGncuEg4nJdZiTjhR+AFCqyA/eZOgerhgiqHOGAdCxMaUn12X54/HWvYQJCU/6Ua9
	KNY/88qMIkphngdLIFQiidUCDTvR/mWm0vh1PDcS8JBBDWZrk5rIJdYFE4s1MIobqesIOLJg6yc
	S+nyA5sPSShX738T0kEf3gdArxvYzb0fJKSo4JibTbOtf7s9prRVKFweglsmLtiqa9GtqUWwu5L
	UT8KJZtWTIaak0qE4qPpeA6vMKOSpqCKf+rhixfLNBqVlkwJJ5BIJU=
X-Google-Smtp-Source: AGHT+IG6upqXMJff71Rg4NKM6z78ZKwnFw+H2kH/5Wpva0oCYSKoZ/+9hj0T4GifRUnQmN+l88ai3A==
X-Received: by 2002:a17:902:e845:b0:215:9c06:272a with SMTP id d9443c01a7336-2159c062adbmr100923315ad.24.1733212751208;
        Mon, 02 Dec 2024 23:59:11 -0800 (PST)
Received: from melbuntu ([2401:4900:1cb9:6d90:4398:1b59:5c22:1aa8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72541849453sm10120310b3a.183.2024.12.02.23.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 23:59:10 -0800 (PST)
Date: Tue, 3 Dec 2024 13:29:04 +0530
From: Dhruv Menon <dhruvmenon1104@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, vigneshr@ti.com,
	andi.shyti@kernel.org, jmkrzyszt@gmail.com, tony@atomide.com,
	khilman@baylibre.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Cleaned up coding style and parameters
Message-ID: <Z066SMd4XjNLd_Wt@melbuntu>
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

> > Not sure if that is correct as sleeps can be now shorter? I wouldn't
> > touch them unless you can show some real benefit (checkpatch.pl warning
> > isn't one for old driver code).
> > 
> The sleeps are not shorter, instead possibly longer. I do not think
> that is an issue, AFAIK the idea with sleep range is to bundle wakeups
> and reduce power consumption.
> 
As per timer,how-to docs present, using ms_sleep(1) will 
lead longer sleep time (about 20ms in HZ=100)

> > Maybe also changes should be split into separate patches for easier
> > review.
> > 
> I would leave out omap_i2c_*data() parameter stuff until the i2c irq
> regressions are fixed, maybe that parameter is needed.
> 
Using git blame, the only usage of it has been for error logging.

On Tue, Dec 03, 2024 at 08:35:47AM +0100, Andreas Kemnade wrote:
> Am Mon, 2 Dec 2024 22:58:17 +0200
> schrieb Aaro Koskinen <aaro.koskinen@iki.fi>:
> 
> > On Tue, Dec 03, 2024 at 12:22:51AM +0530, Dhruv Menon wrote:
> > > This commit addresses the coding style issues present in i2c-omap.c,
> > > identified by checkpatch.pl and removes unused parameters present in
> > > two functions.
> > > 
> > > 1. Coding style issues includes Macro Utilization, alignnment
> > >    correction, updating ms_sleep() < 20 to usleep_range().
> > > 2. Removed unused parameters from omap_i2c_receive_data()
> > >    and omap_i2c_transmit_data().
> > > 
> > > No functional changes have been introduced in this commit.  
> > 
> > Not sure if that is correct as sleeps can be now shorter? I wouldn't
> > touch them unless you can show some real benefit (checkpatch.pl warning
> > isn't one for old driver code).
> > 
> The sleeps are not shorter, instead possibly longer. I do not think
> that is an issue, AFAIK the idea with sleep range is to bundle wakeups
> and reduce power consumption.
> 
> > Maybe also changes should be split into separate patches for easier
> > review.
> > 
> I would leave out omap_i2c_*data() parameter stuff until the i2c irq
> regressions are fixed, maybe that parameter is needed.
> 
> Regards,
> Andreas

