Return-Path: <linux-omap+bounces-47-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A39E7FB658
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 10:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8BDF2826F3
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 09:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF574B5DA;
	Tue, 28 Nov 2023 09:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="ZPLyJoUe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3471FDD;
	Tue, 28 Nov 2023 01:53:34 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id BE6B660871;
	Tue, 28 Nov 2023 09:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701165213;
	bh=3mWAVOOVekZqdc5czMgJaT2BDdCCOnbTDi9BP290nz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPLyJoUey47nfn3opllr5FHKXO5SF5s0e/1URBEKp41ElaqvUCFs1sXb34DBng744
	 apL4d320h8AS/+/9UynWo/KXzEzGLpAxKa0CIsufYx6LVRnQbDYFhfOk7IV36Zh2Bz
	 Sz5lSCxUJhcX43n1VmzUgZlSdI/p0GrHWh1ISl1t0MvxifhDrcvdr0YvcXqUaj6Hy3
	 kdga5ISlA1II769s9sLJoxE4eBgwemAgjJCyh6nE3UlGCqXhaOTn/KQX0nI+X6ZvhF
	 IczQ01j3AjPRGTYD1xX8ZmLZUkKYt4ApkcbrTXyUluQDQlyvnkF/tqi/fJ9HixUp+M
	 oDqK2oqdSfDOA==
Date: Tue, 28 Nov 2023 11:53:14 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andrew Davis <afd@ti.com>
Cc: Rob Herring <robh@kernel.org>,
	=?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm: dts: omap: Apply am57xx-idk overlays to base dtbs
Message-ID: <20231128095314.GP5169@atomide.com>
References: <20231010211925.1629653-1-robh@kernel.org>
 <20231018052059.GJ34982@atomide.com>
 <edb9361c-e100-450f-a4f6-10bc9eff2fe1@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <edb9361c-e100-450f-a4f6-10bc9eff2fe1@ti.com>

* Andrew Davis <afd@ti.com> [231018 14:05]:
> On 10/18/23 12:20 AM, Tony Lindgren wrote:
> > * Rob Herring <robh@kernel.org> [231011 00:19]:
> > > DT overlays in tree need to be applied to a base DTB to validate they
> > > apply, to run schema checks on them, and to catch any errors at compile
> > > time.
> > > 
> > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > ---
> > > v2:
> > >   - Only test applying overlays when building all DTBs
> > 
> > Andrew, any comments or care to ack?
> 
> As before, this is a valid combination, but it is only one of
> many more. For now this is a reasonable start though,
> 
> Acked-by: Andrew Davis <afd@ti.com>

OK thanks applying into omap-for-v6.8/dt.

Tony

