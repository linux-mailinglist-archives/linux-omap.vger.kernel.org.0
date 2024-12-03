Return-Path: <linux-omap+bounces-2771-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4059E2E99
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 23:05:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81F38162431
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 22:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BC41DFE32;
	Tue,  3 Dec 2024 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="zW5PY7r4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC7D1A7270;
	Tue,  3 Dec 2024 22:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733263512; cv=none; b=Bj/mU7+Es/uG6tpgkLpxi33lCob0jaUQCK4inokaUbeYfBdk338xuiLPEv9s1WBYxSfqPKj7JqtE7qLOb8HgbuRQjMy1VC050zh3S5jp+n9AnKRT75syhtnux3Az0Yjw25oy9f3qrGRXy1tp1aoDd61FrvfNeK7fO3Ld9o/TKrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733263512; c=relaxed/simple;
	bh=bAc2oP9B4rgxmltREiEdFwBZLcwQ4F9LGSQzlJdGHpY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UGV/niBlvziqmty4fT7XtA+7savC4seNBH4bDGgYNb4XafwKgiC4oo1RR0HKmpT+alV2TdJdKOZaNdCqtEbAhk9f6/GjUTNVmtuw+qljRDYbbLjEwqPjjA1l7zLoYmPdNAL0Ilp3Jw2xNh4903HKyc+7dVQBn1q5cmNL/s9GDes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=zW5PY7r4; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=0/L6VXGAlKb7mq+RJNJyJiLpYSOLdt7nLJfN1dgJNnU=; b=zW5PY7r47JHfG3w+uv4dCtuH36
	o+CFHHM9ALeZLThfF9KosbA4bYdvKeIGMiffFMT5PSA3owyzLCLAqg8sWutPcYaDKXaNd6RZ7KW47
	FfeiFrTm9WrHOdHjFexGtq33g89wQkttJdVyMXf0FqWHML9k6Tq4coGyYcxd9E8DDfZ7Z2LJu2+/R
	5TWeNy6Osixf58WSTh3xTvSsNTF+zcDtOq9tP+z1fb1c/XkONlS1JPXQd1b2MKf7akQjsLUx/7EsY
	vt1Rn/+t04iV5TMtog2rQv70wzX/xefV9nsgeH+7BWHNUXZVJ1JaXsFF5lwmzn4XTnMuuHo+VsRO9
	oIWDm41A==;
Date: Tue, 3 Dec 2024 23:04:53 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Dhruv Menon <dhruvmenon1104@gmail.com>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, "Raghavendra, Vignesh" <vigneshr@ti.com>,
 andi.shyti@kernel.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, tony
 Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] i2c: omap: Cleaned up coding style and parameters
Message-ID: <20241203230453.1280ed4a@akair>
In-Reply-To: <Z07QLveHUQlvDfIt@melbuntu>
References: <Z04CA8fGCC-nyZIY@melbuntu>
	<Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi>
	<Z06zxM3pREgrOvQA@melbuntu>
	<7B167CB3-EC8E-41C6-8A91-123167579475@goldelico.com>
	<Z07QLveHUQlvDfIt@melbuntu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Tue, 3 Dec 2024 15:02:30 +0530
schrieb Dhruv Menon <dhruvmenon1104@gmail.com>:

> This patch has been splitted into two parts,
> 
>         1. [PATCH v2 1/2] i2c: omap: Clean up coding style
>         2. [PATCH v2 2/2] i2c: omap: Removed unused parameter
> 
> The patchset also removed the changes regarding msleep as the 
> adjustment was relatively minor which was added earlier. The 
> change was initially considered based on "Timer's howto" 
> documentation which recommends to change any msleep(x) < 10ms
> to usleep_range(x*1000, x*2000) for better precision.
> 
> Thank you for the time and review. I look forward to your feedback
> 
send the output inline, see
Documentation/process/submitting-patches.rst:
No MIME, no links, no compression, no attachments.  Just plain text

Also we want imperative mood in the patches.
There is also a lot of automated processing of these patch emails.

Regards,
Andreas

