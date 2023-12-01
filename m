Return-Path: <linux-omap+bounces-80-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC158800436
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 07:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D77C6B211EC
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 06:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4278C11716;
	Fri,  1 Dec 2023 06:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="H/lgqMkV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73589171A;
	Thu, 30 Nov 2023 22:56:43 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 6350860476;
	Fri,  1 Dec 2023 06:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701413803;
	bh=rCfSlTTMt0AuaLRhIg405pBsrNHK2Y5VgYH9Y2Qiidc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/lgqMkVXbMwcGYRzC7DRMWC2iwx0bpoILYJoeeuUrAbiQjpfPCwpELNZykmOLIgL
	 Pwfl02dwxt5Ud7Nf8Le3YOeXWwQIwOgAc8InlHvtn9jPh70yjSu9fJwPRlJ642u2Nx
	 PcT9nM1G8lgarwtxLdf6FpdEQHDnKG7W/+IprlLYC4bDpmt0iewgsW8hXwcUdia29l
	 a4rQe5dU9DbSEMz8pjNEoalD0S0FN3udCG7/XdXoWH42IhD8ZXc+kg6gj+5fK8Ya/h
	 JmSEXcSIk401izJKzStII4aZ7fw4SD3X9cjqnDW37ZJMpiHD0MU5UC8GTrryA/YQ/4
	 c46Y7onyOdyAA==
Date: Fri, 1 Dec 2023 08:56:32 +0200
From: Tony Lindgren <tony@atomide.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add omap bus drivers to OMAP2+ SUPPORT
Message-ID: <20231201065632.GH5169@atomide.com>
References: <20231115104434.25796-1-lukas.bulwahn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115104434.25796-1-lukas.bulwahn@gmail.com>

* Lukas Bulwahn <lukas.bulwahn@gmail.com> [231115 12:44]:
> While doing some code cleanup in drivers/bus/, I noticed that the files
> drivers/bus/omap*.[ch] have no maintainer.
> 
> As far as I see from the git history, important changes to those files went
> through Tony Lindgren. Further, the inclusion of those drivers depend on
> the config ARCH_OMAP2PLUS being enabled. This suggests these drivers are
> part of the section OMAP2+ SUPPORT.
> 
> Add the omap bus drivers to OMAP2+ SUPPORT.

Applying into omap-for-v6.8/maintainers thanks.

Tony

