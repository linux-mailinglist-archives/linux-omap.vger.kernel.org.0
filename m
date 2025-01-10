Return-Path: <linux-omap+bounces-3084-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 34019A096F3
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 17:17:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14495188E110
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jan 2025 16:17:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E03CC212D93;
	Fri, 10 Jan 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJ5VFsCF"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EC7211715;
	Fri, 10 Jan 2025 16:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736525815; cv=none; b=IDjdslbPM0VbKHPnFDrb/lbEDzsE7gCmrdejVCPmRLIyG9moLeUIm/D6PAtu1147MexqEGzMQk0pPfJ36LFr/xh4oU0oPllOX+dWrKs/40Fo09nDuFxHVzE+dkeWftVSx+EnpmZGcmdHyzB2dFBbMFu0YKohzP45HnsR8dOBdzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736525815; c=relaxed/simple;
	bh=Hsn94PEo0R3i4HiXq7uSmEFjvZqlsAwK3g2CFIlPugY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAirVrp5hr9/cheW8hZIPJf8XT0AfyjbL6eNuIZJCWvxjykrzCQSC8flXangn9oET8mVeWmN6eFKpQ8fMkzgGhrXf6n/8SMzWJjD35IQOR946piWo8dXqAfVGETGj+UYkvDy9Z6ZsNMQ85MnOviKwgmkAd7ej5AXWskkGrZsy4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJ5VFsCF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF37EC4CED6;
	Fri, 10 Jan 2025 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736525815;
	bh=Hsn94PEo0R3i4HiXq7uSmEFjvZqlsAwK3g2CFIlPugY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pJ5VFsCF8PWsvnTs+MCd82moyZ3DnqsQutPsuIXUmYMoZThrdfA/99NXkarcZt6lz
	 8z9+6O6/zAuNe4Jb/QOImshE8rpgxAsSJdpArbHYWwaaW/eHGRG7TWId4NVCQyH5nR
	 yVwG3Vo7UjxqdBiB1aACuEfxvKgdv5aLDdrZ4diY/BTwHI5+d0YXo3eQAPB8IcGsGI
	 /qgJ/kSj5wIZWpu0MmbskGDRL7hjeDCeKi8sE6BfwdCyhvjXNF1SuYtj/5GIwRhdlD
	 nt7gKUd/ImVzG56+9Q2W3Gfgd373GEmDSwZEkkiNqcZmP/irORmpAw9w7X4JwUVBhX
	 5Qxzthhd4IlWQ==
Date: Fri, 10 Jan 2025 10:16:54 -0600
From: Rob Herring <robh@kernel.org>
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	nm@ti.com, ssantosh@kernel.org, tony@atomide.com,
	richardcochran@gmail.com, parvathi@couthit.com,
	schnelle@linux.ibm.com, rdunlap@infradead.org,
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org,
	jacob.e.keller@intel.com, m-malladi@ti.com,
	javier.carrasco.cruz@gmail.com, afd@ti.com, s-anna@ti.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, pratheesh@ti.com, prajith@ti.com,
	vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Subject: Re: [RFC PATCH 01/10] dt-bindings: net: ti: Adds device tree binding
 for DUAL-EMAC mode support on PRU-ICSS2 for AM57xx SOCs
Message-ID: <20250110161654.GB2966768-robh@kernel.org>
References: <20250109105600.41297-1-basharath@couthit.com>
 <20250109105600.41297-2-basharath@couthit.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109105600.41297-2-basharath@couthit.com>

On Thu, Jan 09, 2025 at 04:25:51PM +0530, Basharath Hussain Khaja wrote:
> From: Parvathi Pudi <parvathi@couthit.com>

Also, drop 'device tree binding for ' in the subject. 'dt-bindings' 
already says that and subject space is precious.

Rob

