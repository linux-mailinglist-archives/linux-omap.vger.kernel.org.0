Return-Path: <linux-omap+bounces-3634-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81EC6AA75E7
	for <lists+linux-omap@lfdr.de>; Fri,  2 May 2025 17:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E59E3BF55D
	for <lists+linux-omap@lfdr.de>; Fri,  2 May 2025 15:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C7B2571C3;
	Fri,  2 May 2025 15:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Z1FLNkux"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D831C255F57
	for <linux-omap@vger.kernel.org>; Fri,  2 May 2025 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199438; cv=none; b=s/N5RiW5940oKglBBCMohpo2gbOpQpMw6zOZFHJ6EmIWVFtyDv1NAbYpx1GfeHduC39SOsCf451negoXV2Ts8+GYRI3N3YWWzzH6DPqWB2nGHXuYj2AOyQOx0GkMip3GfZ9o8LvmLsEU4bQ36ltYZEgGnfeWfOm+Eoo04tZFVas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199438; c=relaxed/simple;
	bh=1W/+dMhLm+AOqself6nkRFW1WTp/L98nwtpk8EvLzBg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=ZagJTEM+OQmrpF76NXm1PgQl1FJSU6SOeOT7zIIE3FsGSvFTEtVsHTOhxTos98NVYhU0//pp4ADjYLRy+MiFthzR8Ou7l85xC77SibAaIMqQ53mBRDcDREXxo4LbkvTI76kCApLg1WM/FBVyaHP3gMTfag+Lx4hcxM+2NliTgJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Z1FLNkux; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=hehHSVMDf+Rq2N/zQ6BIbWmxHyNRWPYy1YAfHITBLb4=; b=Z1FLNkuxYv6PaMoiOxVbcitNZi
	2rBxPJLqN8C/NjF/IvqwomMtirC8Z5kKcM1kIzzT7eUmCybfI3j5MJ2qOMcEdkItLfeLXHMN9dmxI
	2o4jw+BS7dAzq2aCA4nyFq3nCLA9XCjPeSN6+4zsQRFn5TshSPF0/QkQnnl6f0c/9nWck0i2woHQH
	ttNjvH2izMGGEdsSXWhzcxyM+lPc+Mlv6HLVKOB8ZAQWxaU2ZcRTJNDqN8bvvVN+ZN9KTR+tF2Ey1
	ytrPTEZK991oMx1iQ2g3a4XlmcXYFacuDAMYt4ocTrJAMe5p9gAiCRZO5HVmnlTtiCt1Ry2lldFlo
	gTQyfmnA==;
Date: Fri, 2 May 2025 17:23:52 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 devicetree@kernel.org
Subject: undocumented ti,omap4-cm compatible
Message-ID: <20250502172352.57d51f1a@akair>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

I am a bit puzzled about the ti,omap4-cm compatible.
Parts were introduced in
a5c82a09d8762 ("ARM: dts: omap4: add clkctrl nodes")

But no code nor devicetree binding is there. Am I missing something?
It is in devicetree. 
So what is going on here? Should it be simply simple-bus? Is there some
other project using it?

Regards,
Andreas

