Return-Path: <linux-omap+bounces-4638-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7052AB56CDF
	for <lists+linux-omap@lfdr.de>; Mon, 15 Sep 2025 00:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1CB224E0752
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 22:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7EC2E7646;
	Sun, 14 Sep 2025 22:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHdSqdj5"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7057C1A83F7;
	Sun, 14 Sep 2025 22:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757888629; cv=none; b=WAGcwmGBHO3ehNhXIci2/0OkyD/k9EoEGc3xBdQKF/PmDUBRwTlq8R9aB2OEqSWErtarLWWtmEDJmRJilAeCy9MqRlftH0pzczNkDAX+hw3o951IcdgGyR2ri/Vis3qGKua1O5RVqoAjqmIPJ6/paY3mpiNsmiN2yhVneNj/9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757888629; c=relaxed/simple;
	bh=/LlF4E7qkI3Bjwu07Und525pRRyaR1UAgcj7QilxBYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=srFcR7LtlAPHScQZj77PiJNtaOv7o8hEm5MmF4yTPpyqqHt3kq8J0rvSXTSGCLPhz0AEAxX0K0ZaNHbX4Y5s802VXQ5jjFi80Tg73DMPAdHFWPi3lCuVerjGsNYpHZmp+JChZauoASJioXfO1v98xEZD6CLggrbZvheLAMU+WKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHdSqdj5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F1CC4CEF0;
	Sun, 14 Sep 2025 22:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757888629;
	bh=/LlF4E7qkI3Bjwu07Und525pRRyaR1UAgcj7QilxBYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SHdSqdj53/+GOcO6JK2I7FRKp0YvvkzbdIUdGq2aqqlpahr91Gn/H4EvsZsSpuIJv
	 DKJZek42e5D6pBHxDamtY0zKHMv4AjIvbjm3aEdL9WL+RPi+6grMTv5ja5ZHLOhBo7
	 ZDva4QF8glxeapa9FANKQAQvuvuJCMF/sL9mMZSW9ZJVQCUEz+SD1yXm6KsKSMgLN3
	 Yg5TZ7IX2t+9ro68WFvWAyoJTYEFJRW/1XTs6IPdH+hCdOUA26BPnObzRDEzKXeMhF
	 ZT6mnMMFqob75UN2Ln1vbhWiVVEBq5CsXjCUNTmXF4FuTqsBGuHgtjzvdnf96ODlO1
	 /IEqbrBUN7gRw==
Date: Sun, 14 Sep 2025 17:23:48 -0500
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Barker <paul.barker@sancloud.com>,
	Marc Murphy <marc.murphy@sancloud.com>,
	Tony Lindgren <tony@atomide.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm: dts: ti: omap: Drop unnecessary or unused
 properties
Message-ID: <20250914222348.GA2080538-robh@kernel.org>
References: <20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com>
 <20250908-ti-sdhci-omap-v2-1-72927890482f@gmail.com>
 <20250909-uptight-fluorescent-markhor-4639db@kuoka>
 <501a4e0a-2d6e-4a57-9006-91413bd2ebb4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <501a4e0a-2d6e-4a57-9006-91413bd2ebb4@gmail.com>

On Sun, Sep 14, 2025 at 12:19:15AM +0530, Charan Pedumuru wrote:
> 
> 
> On 09-09-2025 12:50, Krzysztof Kozlowski wrote:
> > On Mon, Sep 08, 2025 at 04:17:12PM +0000, Charan Pedumuru wrote:
> >> Remove unnecessary properties like ti,needs-special-reset,
> >> ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the DTS
> >> files as there is no user of them.
> > 
> > No user? That's not true:
> > 
> > git grep ti,needs-special-reset
> 
> Should I remove ti,needs-special-reset property for the compatibles 
> "ti,am335-sdhci" and "ti,am437-sdhci" instead of removing for all mmc 
> nodes? ti,needs-special-hs-handling and cap-mmc-dual-data-rate were 
> defined for board specific, so these two properties should be defined 
> in the YAML file to resolve dtb_check errors or can I remove those 
> properties for those boards too?

If those 2 compatibles don't use the omap_hsmmc driver then, yes I think 
you can remove the properties from those nodes. Otherwise, shrug. Ask 
the TI folks if you can't figure it out.

Rob

